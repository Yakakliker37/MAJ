#!/usr/bin/expect

set timeout 20

set ip [lindex $argv 0]

set user [lindex $argv 1]

set password [lindex $argv 2]



spawn ssh -o "StrictHostKeyChecking no" "$user\@$ip"
expect "password:"

send "$password\r";
expect "# "

send "apt-get update\r"
expect "# "

send "apt-get upgrade -y && exit\r"
expect "# "

send "ls\r"
expect "# "

send -- "\r"

send "exit\r"
expect "# "

send "exit\r"


interact
#expect eof
