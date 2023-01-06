FROM golang:1.17

WORKDIR /app

COPY go.mod ./
COPY main.go ./

RUN go get github.com/labstack/echo/v4
RUN go build -o golang-template

EXPOSE 3000

CMD ["/app/golang-template"]