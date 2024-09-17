FROM  golang:1.23-alpine as go
WORKDIR /usr/src/app
COPY go.mod ./
RUN go mod download && go mod verify
COPY . .
RUN go build -v -o /usr/local/bin/app ./...



FROM scratch
WORKDIR /usr/src/app
COPY --from=go  /usr/src/app .
CMD ["app"]