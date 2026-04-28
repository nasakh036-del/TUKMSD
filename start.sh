#!/bin/sh
echo "Starting MasterDNSVPN on Railway..."
exec /usr/local/bin/masterdnsvpn -c config.toml
