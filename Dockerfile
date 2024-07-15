FROM golang:1.19-alpine AS build

WORKDIR /app

COPY go.mod ./
COPY *.go ./

RUN go build -o /hello-world

FROM alpine:latest

WORKDIR /root/

COPY --from=build /hello-world ./

EXPOSE 8080

CMD ["./hello-world"]
