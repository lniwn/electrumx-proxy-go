FROM docker.io/golang:1.21 AS build

WORKDIR /build

RUN git clone https://github.com/lniwn/electrumx-proxy-go.git .
RUN CGO_ENABLED=0 GOOS=linux go build -o electrumx-proxy-go

# --------------------------------------

FROM scratch AS prod

WORKDIR /app

COPY --from=0 /build/electrumx-proxy-go ./
ENTRYPOINT ["./electrumx-proxy-go"]