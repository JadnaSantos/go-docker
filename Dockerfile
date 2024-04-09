FROM golang:1.19 AS build

WORKDIR /app

COPY . /app 

RUN CGO_ENABLED=0 GOOS=linux go build -o main main.go

FROM scratch

COPY --from=build /app/main ./

CMD ["./main"]
