#!/bin/bash
set -e

# first arg is `-f` or `--some-option`
# or there are no args
if [ "$#" -eq 0 ] || [ "${1#-}" != "$1" ]; then
	set -- sh mqbroker -c $ROCKETMQ_HOME/conf/$PROPERTIES_FILE "$@"
fi


_ip_address() {
	# scrape the first non-localhost IP address of the container
	# in Swarm Mode, we often get two IPs -- the container IP, and the (shared) VIP, and the container IP should always be first
	ip address | awk '
		$1 == "inet" && $NF != "lo" {
			gsub(/\/.+$/, "", $2)
			print $2
			exit
		}
	'
}
echo "brokerIP1=$BROKER_IP1" >> $ROCKETMQ_HOME/conf/$PROPERTIES_FILE \
    && echo "listenPort=$LISTEN_PORT" >> $ROCKETMQ_HOME/conf/$PROPERTIES_FILE \
    && echo "autoCreateTopicEnable=true" >> $ROCKETMQ_HOME/conf/$PROPERTIES_FILE \
    && echo "autoCreateSubscriptionGroup=true" >> $ROCKETMQ_HOME/conf/$PROPERTIES_FILE

if [ "$2" = 'mqbroker' ]; then
	for yaml in \
		brokerName \
		brokerIP1 \
		brokerId \
		brokerClusterName \
		fileReservedTime \
		brokerRole \
		flushDiskType \
	; do
		var="${yaml}"
		val="${!var}"
		if [ "$val" ]; then
			sed -ri 's/^(# )?('"$yaml"'=).*/\2 '"$val"'/'  "${ROCKETMQ_HOME}/conf/$PROPERTIES_FILE"
		fi
	done
fi

exec "$@"
