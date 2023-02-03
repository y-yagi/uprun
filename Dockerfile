FROM golang:1.19-alpine as builder

WORKDIR /go/src/app
ADD . /go/src/app

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /go/bin/uprun -ldflags '-s -w'

FROM alpine
COPY --from=builder /go/bin/uprun /
CMD /uprun
