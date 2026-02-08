easy-rsa

ubuntu@ip-172-31-21-53:~$ man make-cadir
ubuntu@ip-172-31-21-53:~$ sudo make-cadir /etc/openvpn/easy-rsa
ubuntu@ip-172-31-21-53:~$ ls -lrth /etc/openvpn/easy-rsa
ls: cannot open directory '/etc/openvpn/easy-rsa': Permission denied
ubuntu@ip-172-31-21-53:~$ sudo ls -lrth /etc/openvpn/easy-rsa
total 20K
lrwxrwxrwx 1 root root   27 Feb  8 22:55 easyrsa -> /usr/share/easy-rsa/easyrsa
lrwxrwxrwx 1 root root   30 Feb  8 22:55 x509-types -> /usr/share/easy-rsa/x509-types
-rw-r--r-- 1 root root 5.1K Feb  8 22:55 openssl-easyrsa.cnf
-rw-r--r-- 1 root root 8.9K Feb  8 22:55 vars
ubuntu@ip-172-31-21-53:~$ sudo find /etc/openvpn/easy-rsa
/etc/openvpn/easy-rsa
/etc/openvpn/easy-rsa/easyrsa
/etc/openvpn/easy-rsa/openssl-easyrsa.cnf
/etc/openvpn/easy-rsa/vars
/etc/openvpn/easy-rsa/x509-types
ubuntu@ip-172-31-21-53:~$

ubuntu@ip-172-31-21-53:~$ sudo su
root@ip-172-31-21-53:/home/ubuntu# cd /etc/openvpn/easy-rsa/
root@ip-172-31-21-53:/etc/openvpn/easy-rsa# ls -lrth
total 20K
lrwxrwxrwx 1 root root   27 Feb  8 22:55 easyrsa -> /usr/share/easy-rsa/easyrsa
lrwxrwxrwx 1 root root   30 Feb  8 22:55 x509-types -> /usr/share/easy-rsa/x509-types
-rw-r--r-- 1 root root 5.1K Feb  8 22:55 openssl-easyrsa.cnf
-rw-r--r-- 1 root root 8.9K Feb  8 22:55 vars
root@ip-172-31-21-53:/etc/openvpn/easy-rsa# ./easyrsa init-pki

Notice
------
'init-pki' complete; you may now create a CA or requests.

Your newly created PKI dir is:
* /etc/openvpn/easy-rsa/pki

Using Easy-RSA configuration:
* /etc/openvpn/easy-rsa/vars

root@ip-172-31-21-53:/etc/openvpn/easy-rsa# find .
.
./easyrsa
./pki
./pki/private
./pki/reqs
./pki/openssl-easyrsa.cnf
./pki/inline
./openssl-easyrsa.cnf
./vars
./x509-types
root@ip-172-31-21-53:/etc/openvpn/easy-rsa# ls -lrth
total 24K
lrwxrwxrwx 1 root root   27 Feb  8 22:55 easyrsa -> /usr/share/easy-rsa/easyrsa
lrwxrwxrwx 1 root root   30 Feb  8 22:55 x509-types -> /usr/share/easy-rsa/x509-types
-rw-r--r-- 1 root root 5.1K Feb  8 22:55 openssl-easyrsa.cnf
-rw-r--r-- 1 root root 8.9K Feb  8 22:55 vars
drwx------ 5 root root 4.0K Feb  8 22:56 pki
root@ip-172-31-21-53:/etc/openvpn/easy-rsa#



root@ip-172-31-21-53:/etc/openvpn/easy-rsa# ./easyrsa  build-ca
Using Easy-RSA 'vars' configuration:
* /etc/openvpn/easy-rsa/vars

Using SSL:
* openssl OpenSSL 3.0.13 30 Jan 2024 (Library: OpenSSL 3.0.13 30 Jan 2024)

Enter New CA Key Passphrase:

Confirm New CA Key Passphrase:
.+..............+.+.....+......+......+....+.....+...+......+.+.....+......+.......+......+..+....+........+......+.+...+...+.....+....+........+.+.....+.......+..+.+.....+.......+..+......+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*....+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*..+............+...+.....+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
.........+.........+....+...+...+......+...+.....+.+............+..+.+.........+.....+............+.+.................+.+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*.......+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*..+.......+...+..+......+.............+.........+..+..........+.....+......+.......+..+...+...+...+.+......+....................+.........+.........+.+......+........+.+...+..+.+..+.+............+..+.............+.....+....+.........+...............+..+............+.+..+....+.........+..............+......+................+......+........+....+..+.+........+....+...+...+........................+.....+.+............+..+.+...........+......+...............+.........+....+.....+....+..+...+...+....+.........+.........+......+...........+....+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-----
You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Common Name (eg: your user, host, or server name) [Easy-RSA CA]:openvpn-ca

Notice
------
CA creation complete. Your new CA certificate is at:
* /etc/openvpn/easy-rsa/pki/ca.crt

root@ip-172-31-21-53:/etc/openvpn/easy-rsa#

root@ip-172-31-21-53:/etc/openvpn/easy-rsa# ls -lrth ./pki/
total 44K
drwx------ 2 root root 4.0K Feb  8 22:56 reqs
drwx------ 2 root root 4.0K Feb  8 22:56 inline
-rw------- 1 root root 5.1K Feb  8 22:56 openssl-easyrsa.cnf
drwx------ 2 root root 4.0K Feb  8 22:58 issued
drwx------ 2 root root 4.0K Feb  8 22:58 certs_by_serial
-rw------- 1 root root    3 Feb  8 22:58 serial
drwx------ 5 root root 4.0K Feb  8 22:58 revoked
-rw------- 1 root root   20 Feb  8 22:58 index.txt.attr
-rw------- 1 root root    0 Feb  8 22:58 index.txt
-rw------- 1 root root 1.2K Feb  8 22:58 ca.crt
drwx------ 2 root root 4.0K Feb  8 22:58 private
root@ip-172-31-21-53:/etc/openvpn/easy-rsa# ls -lrth ./pki/ca.crt
-rw------- 1 root root 1.2K Feb  8 22:58 ./pki/ca.crt
root@ip-172-31-21-53:/etc/openvpn/easy-rsa#


# Generate Diffie-hellman parameters

root@ip-172-31-21-53:/etc/openvpn/easy-rsa# ls -lrth ./pki/ca.crt
-rw------- 1 root root 1.2K Feb  8 22:58 ./pki/ca.crt
root@ip-172-31-21-53:/etc/openvpn/easy-rsa# ./easyrsa  gen-dh
Using Easy-RSA 'vars' configuration:
* /etc/openvpn/easy-rsa/vars

Using SSL:
* openssl OpenSSL 3.0.13 30 Jan 2024 (Library: OpenSSL 3.0.13 30 Jan 2024)
Generating DH parameters, 2048 bit long safe prime
...............................................................................................................................................................................................................................................................+...................+..................+...................................................................................................................................................................................................................+.....................+......+..+.............+....+.............................................................................................................................................................................................................................+............................................................................................................................................+......................................................+.........................................................................................................................................................................................................................................................................................................................................................................................................................................+.............+.................................................................................................................................................................+..................................................................+....+...............................................................................+........................................................+.........................................................................................................................................................................................................................................................+..........................................................+................................................+...........................................................................................................................................................................................................+..+.........................................................................................+...................................................................................................................................................................................................+...+..............................+................+.......................................+.............................................................+.....................................................................................................................+.......................................................+.................................................................................................................................+.........................................................................+.............................................................................................................................................................+......................................................+..........................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................+.............................................................................................................................................................................................................................................................................................................................................................................................................................+...............................................+.+......................+.............................+..........................................................................................................................................+......................................................+..............+.....................................+.....................................+.................................................+..+.................+...+.....+..................................................+................................................................................................+.............................................................................................................................................................................................................................................................................+........................+............................+............................................................................................................+.................................................................................................................+............................+.............................................................................................................................................+...............+...........................................+.....................................................................................................................+...............................................................................................................................+..................................++*++*++*++*++*++*++*++*++*++*++*++*++*++*++*++*++*++*++*++*++*++*++*++*++*++*++*++*++*++*++*++*++*++*++*++*++*++*++*++*++*++*++*++*++*++*++*++*++*++*++*++*++*++*++*++*++*++*++*++*++*++*++*++*
DH parameters appear to be ok.

Notice
------

DH parameters of size 2048 created at:
* /etc/openvpn/easy-rsa/pki/dh.pem

root@ip-172-31-21-53:/etc/openvpn/easy-rsa#



root@ip-172-31-21-53:/etc/openvpn/easy-rsa# ./easyrsa gen-req vpnserver nopass
Using Easy-RSA 'vars' configuration:
* /etc/openvpn/easy-rsa/vars

Using SSL:
* openssl OpenSSL 3.0.13 30 Jan 2024 (Library: OpenSSL 3.0.13 30 Jan 2024)
...........+.....+.+.....+...+......+.+.........+...+.....+......+.........+...+...+.+......+...+...........+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*....+......+.............+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*..+.....................+......+.......+...+.........+.....+.............+...+...+...........+....+.....+.+......+..+.+..+.........+.........+..........+.........+.....+.+...........+......+....+......+...+.....+....+...+..+......+.......+........+....+...+..+...+.......+.................+...+.......+.....+....+......+...+......+.........+......+.....+......+.+........+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
.....+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*...+....+...........+.........+.+........+...+...+.+.....................+.....+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*............+.+......+..............+.+..............+......+.+.................+......+.+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-----
You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Common Name (eg: your user, host, or server name) [vpnserver]:vpnserver

Notice
------
Private-Key and Public-Certificate-Request files created.
Your files are:
* req: /etc/openvpn/easy-rsa/pki/reqs/vpnserver.req
* key: /etc/openvpn/easy-rsa/pki/private/vpnserver.key

root@ip-172-31-21-53:/etc/openvpn/easy-rsa#



root@ip-172-31-21-53:/etc/openvpn/easy-rsa# ls -lrth /etc/openvpn/easy-rsa/pki/reqs/vpnserver.req
-rw------- 1 root root 891 Feb  8 23:08 /etc/openvpn/easy-rsa/pki/reqs/vpnserver.req
root@ip-172-31-21-53:/etc/openvpn/easy-rsa# ls -lrth /etc/openvpn/easy-rsa/pki/private/vpnserver.key
-rw------- 1 root root 1.7K Feb  8 23:08 /etc/openvpn/easy-rsa/pki/private/vpnserver.key
root@ip-172-31-21-53:/etc/openvpn/easy-rsa#
root@ip-172-31-21-53:/etc/openvpn/easy-rsa#



root@ip-172-31-21-53:/etc/openvpn/easy-rsa# ./easyrsa gen-req vpnclient nopass
Using Easy-RSA 'vars' configuration:
* /etc/openvpn/easy-rsa/vars

Using SSL:
* openssl OpenSSL 3.0.13 30 Jan 2024 (Library: OpenSSL 3.0.13 30 Jan 2024)
.+....+...........+...+...+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*..........+.....+.+...........+.........+.........+...............+....+...+..+..........+..+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*...+.+..+....+...+...+...............+........+.+........+.+.....+.+...+..+..........+...+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
....+......+....................+..........+...+..+.+..............+...+..........+.....+.+..+.......+...........+....+...........+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*...+.+..+.......+.....+.+.....+.........+.+.....+.+.....+..........+......+..+......+.+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*...........+....+.....+.+..+.......+.....+.+.........+.....+......+.+...+...........+.+.....+.........+.+......+.....+....+......+.....+.............+......+...+........+....+........+.+..+....+..............+.+.........+..+...+....+...........+.+.....+.+........+.......+..+.+...........+...+...+..........+...+.....+....+...+.................+.+.........+........+.........+....+...............+.........+..+....+..+.......+...+...+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-----
You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Common Name (eg: your user, host, or server name) [vpnclient]:

Notice
------
Private-Key and Public-Certificate-Request files created.
Your files are:
* req: /etc/openvpn/easy-rsa/pki/reqs/vpnclient.req
* key: /etc/openvpn/easy-rsa/pki/private/vpnclient.key

root@ip-172-31-21-53:/etc/openvpn/easy-rsa# ls -lrth /etc/openvpn/easy-rsa/pki/reqs/vpnclient.req
-rw------- 1 root root 891 Feb  8 23:12 /etc/openvpn/easy-rsa/pki/reqs/vpnclient.req
root@ip-172-31-21-53:/etc/openvpn/easy-rsa# ls -lrth /etc/openvpn/easy-rsa/pki/private/vpnclient.key
-rw------- 1 root root 1.7K Feb  8 23:12 /etc/openvpn/easy-rsa/pki/private/vpnclient.key
root@ip-172-31-21-53:/etc/openvpn/easy-rsa#
root@ip-172-31-21-53:/etc/openvpn/easy-rsa#

# Now sign the certs using easyrsa for both vpnserver and vpnclient

root@ip-172-31-21-53:/etc/openvpn/easy-rsa#
root@ip-172-31-21-53:/etc/openvpn/easy-rsa# ./easyrsa sign-req server vpnserver
Using Easy-RSA 'vars' configuration:
* /etc/openvpn/easy-rsa/vars

Using SSL:
* openssl OpenSSL 3.0.13 30 Jan 2024 (Library: OpenSSL 3.0.13 30 Jan 2024)
You are about to sign the following certificate:
Please check over the details shown below for accuracy. Note that this request
has not been cryptographically verified. Please be sure it came from a trusted
source or that you have verified the request checksum with the sender.
Request subject, to be signed as a server certificate
for '825' days:

subject=
    commonName                = vpnserver

Type the word 'yes' to continue, or any other input to abort.
  Confirm request details: yes

Using configuration from /etc/openvpn/easy-rsa/pki/openssl-easyrsa.cnf
Enter pass phrase for /etc/openvpn/easy-rsa/pki/private/ca.key:
Check that the request matches the signature
Signature ok
The Subjects Distinguished Name is as follows
commonName            :ASN.1 12:'vpnserver'
Certificate is to be certified until May 13 23:21:59 2028 GMT (825 days)

Write out database with 1 new entries
Database updated

Notice
------
Certificate created at:
* /etc/openvpn/easy-rsa/pki/issued/vpnserver.crt

root@ip-172-31-21-53:/etc/openvpn/easy-rsa#
root@ip-172-31-21-53:/etc/openvpn/easy-rsa#


root@ip-172-31-21-53:/etc/openvpn/easy-rsa# ./easyrsa sign-req client vpnclient
Using Easy-RSA 'vars' configuration:
* /etc/openvpn/easy-rsa/vars

Using SSL:
* openssl OpenSSL 3.0.13 30 Jan 2024 (Library: OpenSSL 3.0.13 30 Jan 2024)
You are about to sign the following certificate:
Please check over the details shown below for accuracy. Note that this request
has not been cryptographically verified. Please be sure it came from a trusted
source or that you have verified the request checksum with the sender.
Request subject, to be signed as a client certificate
for '825' days:

subject=
    commonName                = vpnclient

Type the word 'yes' to continue, or any other input to abort.
  Confirm request details: yes

Using configuration from /etc/openvpn/easy-rsa/pki/openssl-easyrsa.cnf
Enter pass phrase for /etc/openvpn/easy-rsa/pki/private/ca.key:
Check that the request matches the signature
Signature ok
The Subjects Distinguished Name is as follows
commonName            :ASN.1 12:'vpnclient'
Certificate is to be certified until May 13 23:23:01 2028 GMT (825 days)

Write out database with 1 new entries
Database updated

Notice
------
Certificate created at:
* /etc/openvpn/easy-rsa/pki/issued/vpnclient.crt

root@ip-172-31-21-53:/etc/openvpn/easy-rsa#



root@ip-172-31-21-53:/etc/openvpn/easy-rsa# cp pki/dh.pem pki/ca.crt pki/issued/vpnserver.crt pki/private/vpnserver.key /etc/openvpn/
root@ip-172-31-21-53:/etc/openvpn/easy-rsa# ls -lrth /etc/openvpn/
total 36K
-rwxr-xr-x 1 root root 1.5K Nov 24 22:32 update-resolv-conf
drwxr-xr-x 2 root root 4.0K Nov 24 22:32 server
drwxr-xr-x 2 root root 4.0K Nov 24 22:32 client
drwx------ 3 root root 4.0K Feb  8 22:56 easy-rsa
-rw------- 1 root root  424 Feb  8 23:25 dh.pem
-rw------- 1 root root 1.2K Feb  8 23:25 ca.crt
-rw------- 1 root root 4.6K Feb  8 23:25 vpnserver.crt
-rw------- 1 root root 1.7K Feb  8 23:25 vpnserver.key
root@ip-172-31-21-53:/etc/openvpn/easy-rsa#



root@ip-172-31-21-53:/etc/openvpn/easy-rsa# scp -i ./test.pem pki/ca.crt pki/issued/vpnclient.crt pki/private/vpnclient.key ubuntu@172.31.24.241:/home/ubuntu
The authenticity of host '172.31.24.241 (172.31.24.241)' cant be established.
ED25519 key fingerprint is SHA256:/Rnvbo3azkyUhH7etaNV1DcnkCqTBN4D7sAsIRXHwQI.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '172.31.24.241' (ED25519) to the list of known hosts.
ca.crt                                                                                                                                                                                        100% 1200     2.4MB/s   00:00
vpnclient.crt                                                                                                                                                                                 100% 4494     8.3MB/s   00:00
vpnclient.key                                                                                                                                                                                 100% 1704     3.6MB/s   00:00
root@ip-172-31-21-53:/etc/openvpn/easy-rsa#

root@ip-172-31-21-53:/etc/openvpn/easy-rsa# ls -rlh
total 28K
lrwxrwxrwx 1 root root   30 Feb  8 22:55 x509-types -> /usr/share/easy-rsa/x509-types
-rw-r--r-- 1 root root 8.9K Feb  8 22:55 vars
-r-------- 1 root root 1.7K Feb  8 23:28 test.pem
drwx------ 8 root root 4.0K Feb  8 23:23 pki
-rw-r--r-- 1 root root 5.1K Feb  8 22:55 openssl-easyrsa.cnf
lrwxrwxrwx 1 root root   27 Feb  8 22:55 easyrsa -> /usr/share/easy-rsa/easyrsa
root@ip-172-31-21-53:/etc/openvpn/easy-rsa# ls -lrth /usr/share/doc/openvpn/examples/sample-config-files/server.conf
-rw-r--r-- 1 root root 11K Nov 24 22:32 /usr/share/doc/openvpn/examples/sample-config-files/server.conf
root@ip-172-31-21-53:/etc/openvpn/easy-rsa#
root@ip-172-31-21-53:/etc/openvpn/easy-rsa#
root@ip-172-31-21-53:/etc/openvpn/easy-rsa# cp /usr/share/doc/openvpn/examples/sample-config-files/server.conf /etc/openvpn/vpnserver.conf
root@ip-172-31-21-53:/etc/openvpn/easy-rsa# vim /etc/openvpn/vpnserver.conf
root@ip-172-31-21-53:/etc/openvpn/easy-rsa# ls -lrth
total 28K
lrwxrwxrwx 1 root root   27 Feb  8 22:55 easyrsa -> /usr/share/easy-rsa/easyrsa
lrwxrwxrwx 1 root root   30 Feb  8 22:55 x509-types -> /usr/share/easy-rsa/x509-types
-rw-r--r-- 1 root root 5.1K Feb  8 22:55 openssl-easyrsa.cnf
-rw-r--r-- 1 root root 8.9K Feb  8 22:55 vars
drwx------ 8 root root 4.0K Feb  8 23:23 pki
-r-------- 1 root root 1.7K Feb  8 23:28 test.pem
root@ip-172-31-21-53:/etc/openvpn/easy-rsa# cd ..
root@ip-172-31-21-53:/etc/openvpn# ls -lrth
total 48K
-rwxr-xr-x 1 root root 1.5K Nov 24 22:32 update-resolv-conf
drwxr-xr-x 2 root root 4.0K Nov 24 22:32 server
drwxr-xr-x 2 root root 4.0K Nov 24 22:32 client
-rw------- 1 root root  424 Feb  8 23:25 dh.pem
-rw------- 1 root root 1.2K Feb  8 23:25 ca.crt
-rw------- 1 root root 4.6K Feb  8 23:25 vpnserver.crt
-rw------- 1 root root 1.7K Feb  8 23:25 vpnserver.key
drwx------ 3 root root 4.0K Feb  8 23:28 easy-rsa
-rw-r--r-- 1 root root  11K Feb  8 23:35 vpnserver.conf
root@ip-172-31-21-53:/etc/openvpn# vim vpnserver.conf
root@ip-172-31-21-53:/etc/openvpn# vim vpnserver.conf
root@ip-172-31-21-53:/etc/openvpn#

root@ip-172-31-21-53:/etc/openvpn# openvpn --genkey --secret ta.key
2026-02-08 23:38:35 DEPRECATED OPTION: The option --secret is deprecated.
2026-02-08 23:38:35 WARNING: Using --genkey --secret filename is DEPRECATED.  Use --genkey secret filename instead.
root@ip-172-31-21-53:/etc/openvpn# ls -lrth
total 52K
-rwxr-xr-x 1 root root 1.5K Nov 24 22:32 update-resolv-conf
drwxr-xr-x 2 root root 4.0K Nov 24 22:32 server
drwxr-xr-x 2 root root 4.0K Nov 24 22:32 client
-rw------- 1 root root  424 Feb  8 23:25 dh.pem
-rw------- 1 root root 1.2K Feb  8 23:25 ca.crt
-rw------- 1 root root 4.6K Feb  8 23:25 vpnserver.crt
-rw------- 1 root root 1.7K Feb  8 23:25 vpnserver.key
drwx------ 3 root root 4.0K Feb  8 23:28 easy-rsa
-rw-r--r-- 1 root root  11K Feb  8 23:37 vpnserver.conf
-rw------- 1 root root  636 Feb  8 23:38 ta.key
root@ip-172-31-21-53:/etc/openvpn# cat ta.key
#
# 2048 bit OpenVPN static key
#
-----BEGIN OpenVPN Static key V1-----
1366322ee3d29a96b720bba6d2433c7e
16125b4d005e5de363d4a9d247b1c934
0e9001c90aae7dc064bb3cbd04974db7
0f4d3b80718c109cf5623093d0fac517
28cc510e049ec36a793b39387568f54c
2a6faf79973ed294957879266cdb4cf6
4430d85676cef0722ce0beabcbd5f129
1c34d024f15c4933e286606017044575
7243e3ae737f0d3c67c4fa70e5c443a7
af2c07b6973640f0174cb32056a1a9e2
ecf73200a137ab42ec57e12ad3f7d65e
c58a67fe9b8334143758d6042fa4090d
270e041b04d4017b39dcbeb2f81dfd34
d276a45e0638f3e940b166b48fda3b3c
4edecd94559725183e58edda1e765095
17d0bb68823cde9b7c484c2ea6fd377b
-----END OpenVPN Static key V1-----
root@ip-172-31-21-53:/etc/openvpn#

# enable ip_forwarding

root@ip-172-31-21-53:/etc/openvpn# sudo sysctl -a | grep ip_forward
net.ipv4.ip_forward = 0
net.ipv4.ip_forward_update_priority = 1
net.ipv4.ip_forward_use_pmtu = 0
root@ip-172-31-21-53:/etc/openvpn#

root@ip-172-31-21-53:/etc/openvpn# sudo sysctl -w net.ipv4.ip_forward=1
net.ipv4.ip_forward = 1
root@ip-172-31-21-53:/etc/openvpn# sudo sysctl -a | grep ip_forward
net.ipv4.ip_forward = 1
net.ipv4.ip_forward_update_priority = 1
net.ipv4.ip_forward_use_pmtu = 0
root@ip-172-31-21-53:/etc/openvpn#

root@ip-172-31-21-53:/etc/openvpn# systemctl enable openvpn@vpnserver --now
Created symlink /etc/systemd/system/multi-user.target.wants/openvpn@vpnserver.service → /usr/lib/systemd/system/openvpn@.service.
root@ip-172-31-21-53:/etc/openvpn#

root@ip-172-31-21-53:/etc/openvpn# systemctl status openvpn@vpnserver
● openvpn@vpnserver.service - OpenVPN connection to vpnserver
     Loaded: loaded (/usr/lib/systemd/system/openvpn@.service; enabled; preset: enabled)
     Active: active (running) since Sun 2026-02-08 23:45:36 UTC; 48s ago
       Docs: man:openvpn(8)
             https://community.openvpn.net/openvpn/wiki/Openvpn24ManPage
             https://community.openvpn.net/openvpn/wiki/HOWTO
   Main PID: 2390 (openvpn)
     Status: "Initialization Sequence Completed"
      Tasks: 1 (limit: 10)
     Memory: 1.4M (peak: 1.6M)
        CPU: 19ms
     CGroup: /system.slice/system-openvpn.slice/openvpn@vpnserver.service
             └─2390 /usr/sbin/openvpn --daemon ovpn-vpnserver --status /run/openvpn/vpnserver.status 10 --cd /etc/openvpn --script-security 2 --config /etc/openvpn/vpnserver.conf --writepid /run/openvpn/vpnserver.pid

Feb 08 23:45:36 ip-172-31-21-53 ovpn-vpnserver[2390]: net_iface_up: set tun0 up
Feb 08 23:45:36 ip-172-31-21-53 ovpn-vpnserver[2390]: net_addr_v4_add: 10.8.0.1/24 dev tun0
Feb 08 23:45:36 ip-172-31-21-53 ovpn-vpnserver[2390]: Could not determine IPv4/IPv6 protocol. Using AF_INET
Feb 08 23:45:36 ip-172-31-21-53 ovpn-vpnserver[2390]: Socket Buffers: R=[212992->212992] S=[212992->212992]
Feb 08 23:45:36 ip-172-31-21-53 ovpn-vpnserver[2390]: UDPv4 link local (bound): [AF_INET][undef]:1194
Feb 08 23:45:36 ip-172-31-21-53 ovpn-vpnserver[2390]: UDPv4 link remote: [AF_UNSPEC]
Feb 08 23:45:36 ip-172-31-21-53 ovpn-vpnserver[2390]: MULTI: multi_init called, r=256 v=256
Feb 08 23:45:36 ip-172-31-21-53 ovpn-vpnserver[2390]: IFCONFIG POOL IPv4: base=10.8.0.2 size=253
Feb 08 23:45:36 ip-172-31-21-53 ovpn-vpnserver[2390]: IFCONFIG POOL LIST
Feb 08 23:45:36 ip-172-31-21-53 ovpn-vpnserver[2390]: Initialization Sequence Completed
root@ip-172-31-21-53:/etc/openvpn#


root@ip-172-31-21-53:/etc/openvpn# ip addr
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host noprefixroute
       valid_lft forever preferred_lft forever
2: enX0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 9001 qdisc fq_codel state UP group default qlen 1000
    link/ether 02:0b:c0:77:58:37 brd ff:ff:ff:ff:ff:ff
    inet 172.31.21.53/20 metric 100 brd 172.31.31.255 scope global dynamic enX0
       valid_lft 2770sec preferred_lft 2770sec
    inet6 fe80::b:c0ff:fe77:5837/64 scope link
       valid_lft forever preferred_lft forever
3: tun0: <POINTOPOINT,MULTICAST,NOARP,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UNKNOWN group default qlen 500
    link/none
    inet 10.8.0.1/24 scope global tun0
       valid_lft forever preferred_lft forever
    inet6 fe80::94a8:a769:6286:a962/64 scope link stable-privacy
       valid_lft forever preferred_lft forever
root@ip-172-31-21-53:/etc/openvpn#

root@ip-172-31-21-53:/etc/openvpn# ls -lrth
total 52K
-rwxr-xr-x 1 root root 1.5K Nov 24 22:32 update-resolv-conf
drwxr-xr-x 2 root root 4.0K Nov 24 22:32 server
drwxr-xr-x 2 root root 4.0K Nov 24 22:32 client
-rw------- 1 root root  424 Feb  8 23:25 dh.pem
-rw------- 1 root root 1.2K Feb  8 23:25 ca.crt
-rw------- 1 root root 4.6K Feb  8 23:25 vpnserver.crt
-rw------- 1 root root 1.7K Feb  8 23:25 vpnserver.key
drwx------ 3 root root 4.0K Feb  8 23:28 easy-rsa
-rw-r--r-- 1 root root  11K Feb  8 23:37 vpnserver.conf
-rw------- 1 root root  636 Feb  8 23:38 ta.key
root@ip-172-31-21-53:/etc/openvpn#  cp easy-rsa/test.pem .
root@ip-172-31-21-53:/etc/openvpn# scp -i ./test.pem ./ta.key ubuntu@172.31.24.241:/home/ubuntu
ta.key                                                                                                                                                                                        100%  636     1.1MB/s   00:00
root@ip-172-31-21-53:/etc/openvpn#


############################################################## On the VPN client Machine  ####################################

ubuntu@ip-172-31-24-241:~$ pwd
/home/ubuntu
ubuntu@ip-172-31-24-241:~$ ls -lrth
total 16K
-rw------- 1 ubuntu ubuntu 1.2K Feb  8 23:29 ca.crt
-rw------- 1 ubuntu ubuntu 4.4K Feb  8 23:29 vpnclient.crt
-rw------- 1 ubuntu ubuntu 1.7K Feb  8 23:29 vpnclient.key
ubuntu@ip-172-31-24-241:~$

ubuntu@ip-172-31-24-241:~$ pwd
/home/ubuntu
ubuntu@ip-172-31-24-241:~$ ls -lrth
total 20K
-rw------- 1 ubuntu ubuntu 1.2K Feb  8 23:29 ca.crt
-rw------- 1 ubuntu ubuntu 4.4K Feb  8 23:29 vpnclient.crt
-rw------- 1 ubuntu ubuntu 1.7K Feb  8 23:29 vpnclient.key
-rw------- 1 ubuntu ubuntu  636 Feb  8 23:51 ta.key
ubuntu@ip-172-31-24-241:~$









