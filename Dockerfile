FROM golang:1.25-alpine AS builder

WORKDIR /docker-final-main

COPY go.mod go.sum ./
RUN go mod download

COPY . .

RUN go build -o my-docker-project .

FROM alpine:latest

WORKDIR /docker-final-main

COPY --from=builder /docker-final-main/my-docker-project .
COPY --from=builder /docker-final-main/tracker.db .

EXPOSE 8080

CMD ["./my-docker-project"]