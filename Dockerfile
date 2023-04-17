FROM golang:latest AS builder
WORKDIR /app
COPY message.go .
RUN go mod init print && \
  go build

FROM scratch
WORKDIR /app
COPY --from=builder /app/print .
ENTRYPOINT ["/app/print"]