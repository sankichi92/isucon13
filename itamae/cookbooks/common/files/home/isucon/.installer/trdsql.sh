set -eux
wget https://github.com/noborus/trdsql/releases/download/v0.12.1/trdsql_v0.12.1_linux_amd64.zip
unzip trdsql_v0.12.1_linux_amd64.zip
mv trdsql_v0.12.1_linux_amd64/trdsql /usr/local/bin
rm -r trdsql_v0.12.1_linux_amd64.zip trdsql_v0.12.1_linux_amd64
