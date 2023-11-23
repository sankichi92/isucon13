set -eux

curl -O https://downloads.percona.com/downloads/percona-toolkit/3.5.5/binary/debian/jammy/x86_64/percona-toolkit_3.5.5-1.jammy_amd64.deb
apt install -y ./percona-toolkit_3.5.5-1.jammy_amd64.deb
