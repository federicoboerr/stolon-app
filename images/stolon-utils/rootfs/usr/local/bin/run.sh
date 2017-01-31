#!/usr/bin/env bash

# setup and start telegraf
echo "  address = \"host=stolon-postgres.${STOLON_KUBERNETES_NAMESPACE}.svc user=${STOLON_USERNAME} password=$(cat $STOLON_PASSWORDFILE) sslmode=disable dbname=postgres\"" \
	 >> /etc/telegraf/telegraf.conf
/usr/bin/telegraf --quiet --config /etc/telegraf/telegraf.conf
