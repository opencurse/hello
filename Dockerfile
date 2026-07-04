FROM swift:5.9 as builder
WORKDIR /app
COPY . .
RUN swift build -c release --disable-sandbox
FROM ubuntu:22.04

WORKDIR /app
COPY --from=builder /app/.build/release/Run /app/Run
EXPOSE 8080
CMD ["/app/Run", "serve", "--env", "production", "--hostname", "0.0.0.0", "--port", "8080"]
