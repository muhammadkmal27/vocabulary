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

async fn check_answer(Json(payload): Json<AnswerPayload>) -> Json<AnswerResponse> {
    let normalized_user = clean_punctuation(&payload.user_answer);
    let normalized_correct = clean_punctuation(&payload.correct_answer);
    
    let is_correct = normalized_user == normalized_correct;
    
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
}

