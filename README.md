nagios-status-ws
================

Webservice endpoint for Nagios


Install dependencies
====================
cpanm --installdeps .


How to run
==========

- Running stand-alone
   perl bin/app.pl

- Running on Perl webservers with plackup (install Plack module to use plackup command)
  plackup -s Starman --workers=10 -p 5001 -a bin/app.pl


Test endpoint
=============

curl -v http://<domain>:<port>/<hostname>/<service>


curl -v http://localhost:5001/localhost/http

* About to connect() to localhost port 5001 (#0)
*   Trying 127.0.0.1...
* Connected to localhost (127.0.0.1) port 5001 (#0)
> GET /localhost/http HTTP/1.1
> User-Agent: curl/7.29.0
> Host: localhost:5001
> Accept: */*
>
< HTTP/1.1 200 OK
< Server: Perl Dancer2 0.06
< Content-Length: 187
< Content-Type: application/json
< Date: Thu, 01 Aug 2013 10:06:22 GMT
< Connection: keep-alive
<
* Connection #0 to host localhost left intact
{"status":"OK","last_check":"1375351482","performance":"time=0.001005s;;;0.000000 size=446B;;;0","status_information":"HTTP OK: HTTP/1.1 200 OK - 446 bytes in 0.001 second response time"}
