FROM golang as builder
WORKDIR /src
copy src .
RUN CGO_ENABLED=0 go build -o app

FROM scratch
ADD ./html /html
COPY --from=builder /src/app .
ENTRYPOINT [ "/app" ]
EXPOSE 8080