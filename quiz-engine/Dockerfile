# Stage 1: Build stage
FROM rust:1.78-slim AS builder

WORKDIR /usr/src/quiz-engine
COPY . .

RUN cargo build --release

# Stage 2: Runtime stage
FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y ca-certificates && rm -rf /var/lib/apt/lists/*

COPY --from=builder /usr/src/quiz-engine/target/release/quiz-engine /usr/local/bin/quiz-engine

EXPOSE 8080

CMD ["quiz-engine"]
