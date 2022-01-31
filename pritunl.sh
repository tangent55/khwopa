#!/sbin/openrc-run
# Manually created service to run Pritunl VPN service.
#
name="Pritunl"
description="Pritunl VPN service"
command="/usr/bin/pritunl"
command_background="true"
pidfile="/var/run/${RC_SVCNAME}.pid"
depend() {
	need mongodb
}
