set hosts {
{4.2.2.1}
{8.8.8.8}
{8.8.4.4}
{193.2.1.66}
{193.2.1.72}
{84.255.209.79}
{84.255.210.79}
}

set counter 0
set sucess_counter 0
set failed_hosts ""


foreach ip $hosts {
incr counter 1
set result [exec ping $ip]
puts $result
if {[regexp {!!!} $result]} {
incr sucess_counter 1
} else {
puts $ip
set failed_hosts "$failed_hosts  $ip"
}
}

set msg_output "Success rate $sucess_counter/$counter. Failed hosts: $failed_hosts"

[ios_config "event manager environment syslog_msg_output $msg_output"]

