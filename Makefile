init:
	pip3 install -r requirements.txt

install: init
	test -d /usr/lib/ablocker || mkdir -p /usr/lib/ablocker
	cp -r ablocker/* /usr/lib/ablocker/
	test -d /etc/aminer/ || mkdir /etc/aminer/
	test -e /etc/aminer/ablocker.conf || cp etc/ablocker.conf /etc/aminer/ablocker.conf
	test -e /etc/aminer/block.sh || cp etc/block.sh /etc/aminer/block.sh
	test -d /etc/systemd/system && cp etc/ablockerd.service /etc/systemd/system/ablockerd.service
	test -d /var/lib/ablocker || mkdir /var/lib/ablocker
	cp bin/ablockerd.py /usr/lib/ablocker/ablockerd.py
	chmod 755 /usr/lib/ablocker/ablockerd.py
	test -e /usr/local/bin/ablockerd.py || ln -s /usr/lib/ablocker/ablockerd.py /usr/local/bin/ablockerd.py

uninstall:
	rm -rf /usr/lib/ablocker
	unlink /usr/local/bin/ablockerd.py

