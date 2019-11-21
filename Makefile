default: 

check_directories:
	sh -c "tripwire --check | grep Filename > no-directory.txt"
	cat no-directory.txt

%: %.txt
	cp ./$@.txt /etc/tripwire/twpol.txt
	twadmin -m P /etc/tripwire/twpol.txt

init:
	tripwire --init

check:
	tripwire --check
