FROM caddy:2.6.2-builder-alpine AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/namecheap \
    --with github.com/greenpau/caddy-security@v1.1.16

FROM caddy:2.6.2-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
