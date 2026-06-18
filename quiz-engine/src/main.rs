use axum::{
    routing::post,
    Json, Router,
};
use serde::{Deserialize, Serialize};
use std::net::SocketAddr;
use regex::Regex;
use tower_http::cors::CorsLayer;

#[derive(Deserialize)]
struct AnswerPayload {
    user_answer: String,
    correct_answer: String,
}

#[derive(Serialize)]
struct AnswerResponse {
    is_correct: bool,
}

// Fungsi normalisasi teks versi Rust (membuang semua tanda baca bukan alfanumerik & jarak)
fn clean_punctuation(text: &str) -> String {
    // Tukar semua variasi apostrof kepada apostrof standard
    let cleaned_quotes = text
        .replace('’', "'")
        .replace('‘', "'")
        .replace('ʼ', "'")
        .replace('`', "'")
        .replace('´', "'")
        .replace('՚', "'")
        .replace('＇', "'");

    // 1. Buang semua aksara bukan alfanumerik (bukan huruf/nombor)
    let re_punct = Regex::new(r"[^\w\s]").unwrap();
    let no_punct = re_punct.replace_all(&cleaned_quotes, "");
    
    // 2. Buang semua jenis jarak (spaces)
    let re_space = Regex::new(r"\s+").unwrap();
    let cleaned = re_space.replace_all(&no_punct, "");
    
    cleaned.trim().to_lowercase()
}

// Menjana semua kemungkinan variasi ayat berdasarkan sintaks [opsi1/opsi2]
fn generate_permutations(text: &str) -> Vec<String> {
    let re = Regex::new(r"\[([^\]]+)\]").unwrap();
    let mut parts: Vec<Vec<String>> = Vec::new();
    let mut last_end = 0;

    for cap in re.captures_iter(text) {
        let m = cap.get(0).unwrap();
        if m.start() > last_end {
            parts.push(vec![text[last_end..m.start()].to_string()]);
        }
        let inner = cap.get(1).unwrap().as_str();
        parts.push(inner.split('/').map(|s| s.to_string()).collect());
        last_end = m.end();
    }
    if last_end < text.len() {
        parts.push(vec![text[last_end..].to_string()]);
    }

    if parts.is_empty() {
        return vec![text.to_string()];
    }

    let mut results = vec![String::new()];
    for part_options in parts {
        let mut new_results = Vec::new();
        for res in &results {
            for opt in &part_options {
                new_results.push(format!("{}{}", res, opt));
            }
        }
        results = new_results;
    }

    results
}

async fn check_answer(Json(payload): Json<AnswerPayload>) -> Json<AnswerResponse> {
    let normalized_user = clean_punctuation(&payload.user_answer);
    
    let permutations = generate_permutations(&payload.correct_answer);
    let mut is_correct = false;
    
    for perm in permutations {
        if normalized_user == clean_punctuation(&perm) {
            is_correct = true;
            break;
        }
    }
    
    Json(AnswerResponse { is_correct })
}

#[tokio::main]
async fn main() {
    // Memulakan logger
    tracing_subscriber::fmt::init();

    // Mengkonfigurasi CORS layer agar boleh dipanggil dari pelbagai host jika perlu
    let cors = CorsLayer::permissive();

    // Membina Router Axum
    let app = Router::new()
        .route("/check-answer", post(check_answer))
        .layer(cors);

    // Menjalankan pelayan Axum pada port 8080
    let addr = SocketAddr::from(([0, 0, 0, 0], 8080));
    println!("Quiz Engine berjalan pada http://{}", addr);
    
    let listener = tokio::net::TcpListener::bind(addr).await.unwrap();
    axum::serve(listener, app).await.unwrap();
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_clean_punctuation() {
        assert_eq!(clean_punctuation("I don't understand."), "idontunderstand");
        assert_eq!(clean_punctuation("I don’t understand."), "idontunderstand");
        assert_eq!(clean_punctuation("don't"), "dont");
        assert_eq!(clean_punctuation("don’t"), "dont");
        assert_eq!(clean_punctuation("donʼt"), "dont");
    }

    #[test]
    fn test_generate_permutations() {
        let text = "Excuse me, I [want to/wanna] buy this.";
        let perms = generate_permutations(text);
        assert_eq!(perms.len(), 2);
        assert!(perms.contains(&"Excuse me, I want to buy this.".to_string()));
        assert!(perms.contains(&"Excuse me, I wanna buy this.".to_string()));

        let text2 = "I [am going to/gonna] [buy/get] it.";
        let perms2 = generate_permutations(text2);
        assert_eq!(perms2.len(), 4);
    }
}

