FROM alpine:latest

RUN apk add --no-cache ca-certificates wget

# دانلود MasterDNSVPN
RUN wget https://github.com/masterking32/MasterDNSVPN/releases/latest/download/masterdnsvpn-linux-amd64 -O /usr/local/bin/masterdnsvpn && \
    chmod +x /usr/local/bin/masterdnsvpn

WORKDIR /app

COPY config.toml .
COPY encrypt_key.txt .
COPY start.sh .

RUN chmod +x start.sh

EXPOSE 53/udp
EXPOSE 18000

CMD ["./start.sh"]
