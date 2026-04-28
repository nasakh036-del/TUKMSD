FROM alpine:latest

RUN apk add --no-cache ca-certificates wget

# دانلود MasterDNSVPN
RUN wget https://github.com/masterking32/MasterDNSVPN/releases/latest/download/masterdnsvpn-linux-amd64 -O /usr/local/bin/masterdnsvpn && \
    chmod +x /usr/local/bin/masterdnsvpn

WORKDIR /app

COPY server_config.toml .
COPY encrypt_key.txt .

EXPOSE 53/udp
EXPOSE 18000

CMD ["/usr/local/bin/masterdnsvpn", "-c", "server_config.toml"]
