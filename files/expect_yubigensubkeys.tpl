#!/usr/bin/expect -f
#
# This Expect script was generated by autoexpect on Sun Mar 13 17:42:55 2016
# Expect and autoexpect were both written by Don Libes, NIST.
#
# Note that autoexpect does not guarantee a working script.  It
# necessarily has to guess about certain things.  Two reasons a script
# might fail are:
#
# 1) timing - A surprising number of programs (rn, ksh, zsh, telnet,
# etc.) and devices discard or ignore keystrokes that arrive "too
# quickly" after prompts.  If you find your new script hanging up at
# one spot, try adding a short sleep just before the previous send.
# Setting "force_conservative" to 1 (see below) makes Expect do this
# automatically - pausing briefly before sending each character.  This
# pacifies every program I know of.  The -c flag makes the script do
# this in the first place.  The -C flag allows you to define a
# character to toggle this mode off and on.

set force_conservative 0  ;# set to 1 to force conservative mode even if
			  ;# script wasn't run conservatively originally
if {$force_conservative} {
	set send_slow {1 .1}
	proc send {ignore arg} {
		sleep .1
		exp_send -s -- $arg
	}
}

#
# 2) differing output - Some programs produce different output each time
# they run.  The "date" command is an obvious example.  Another is
# ftp, if it produces throughput statistics at the end of a file
# transfer.  If this causes a problem, delete these patterns or replace
# them with wildcards.  An alternative is to use the -p flag (for
# "prompt") which makes Expect only look for the last line of output
# (i.e., the prompt).  The -P flag allows you to define a character to
# toggle this mode off and on.
#
# Read the man page for more info.
#
# -Don


set timeout -1
spawn $env(SHELL)
match_max 100000
expect  "\$"
send -- "gpg2 --edit-key MASTER"
expect  "gpg2 --edit-key MASTER"
send -- "\r"
expect  "gpg> "
send -- "addcardkey\r"
expect  ""
send -- "1\r"

# Prompt for Admin PIN
expect  "Cancel"
sleep 0.25
send -- "ADMINPIN\r"

# Prompt for User PIN
expect  "Cancel"
sleep 0.25
send -- "USERPIN\r"
expect  "What keysize do you want for the Signature key? (2048) "
send -- "SIGNLENGTH\r"
expect  "Key is valid for? (0) "
send -- "SIGNEXPIRE\r"
expect  "Is this correct? (y/N) "
send -- "y\r"
expect  "Really create? (y/N) "
send -- "y\r"
expect  "gpg> "
send -- "addcardkey\r"
expect  "Your selection? "
send -- "2\r"
expect  "What keysize do you want for the Encryption key? (2048) "
send -- "ENCLENGTH\r"
expect  "Key is valid for? (0) "
send -- "ENCEXPIRE\r"
expect  "Is this correct? (y/N) "
send -- "y\r"
expect  "Really create? (y/N) "
send -- "y\r"
expect  "gpg> "
send -- "addcardkey\r"
expect  "Your selection? "
send -- "3\r"
expect  "What keysize do you want for the Authentication key? (2048) "
send -- "AUTHLENGTH\r"
expect  "Key is valid for? (0) "
send -- "AUTHEXPIRE\r"
expect  "Is this correct? (y/N) "
send -- "y\r"
expect  "Really create? (y/N) "
send -- "y\r"
expect  "gpg> "
send -- "save\r"
expect  ""
send -- ""
expect eof
