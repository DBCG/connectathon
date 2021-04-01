FROM golang:1.12-alpine AS builder
ARG WORKDIR
RUN apk add --update --no-cache ca-certificates git bash
WORKDIR $GOPATH/src/github.com/fhir-bulk-proxy
ENV GO111MODULE=on
COPY go.mod .
COPY go.sum .
RUN go mod download

COPY . .
RUN go get -d -v
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -installsuffix cgo -o /go/bin/goapp
FROM alpine:latest
RUN apk add --update --no-cache ca-certificates
COPY --from=builder /go/bin/goapp /go/bin/goapp
WORKDIR /$GOPATH/src/github.com/fhir-bulk-proxy
COPY . .
ENTRYPOINT ["/go/bin/goapp"]
