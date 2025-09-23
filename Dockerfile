FROM golang:1.25.1

WORKDIR /final-CI-CD

COPY . .

RUN go mod tidy

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /main .

CMD ["/main"]