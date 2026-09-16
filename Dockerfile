FROM golang:1.22-bookworm AS builder
WORKDIR /app
COPY go.mod ./
COPY main.go ./
RUN CGO_ENABLED=0 go build -o /go-hello .

FROM debian:bookworm-slim
RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY --from=builder /go-hello /app/go-hello
ENV PORT=8080
EXPOSE 8080
CMD ["/app/go-hello"]
