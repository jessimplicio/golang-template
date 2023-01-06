FROM golang:1.17 as build

WORKDIR /app

COPY go.mod ./
COPY main.go ./

RUN go get github.com/labstack/echo/v4
RUN go build -o golang-template

FROM gcr.io/distroless/base-debian11

WORKDIR /

COPY --from=build /app/golang-template /golang-template

EXPOSE 3000

USER nonroot:nonroot

ENTRYPOINT [ "/golang-template" ]
