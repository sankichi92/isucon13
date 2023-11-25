service 'isupipe-rust' do
  user 'root'
  action :nothing
end

execute 'systemctl daemon-reload' do
  user 'root'
  action :nothing
end

directory '/home/isucon/webapp/rust/target/x86_64-unknown-linux-gnu/release' do
  user 'isucon'
end

remote_file '/home/isucon/webapp/sql/init.sh' do
  user 'root'
  mode '755'
  source '../../../webapp/sql/init.sh'
  notifies :restart, 'service[isupipe-rust]'
end

remote_file '/home/isucon/webapp/sql/init.sh' do
  user 'root'
  mode '755'
  source '../../../webapp/sql/init.sh'
  notifies :restart, 'service[isupipe-rust]'
end

remote_file '/home/isucon/webapp/rust/target/x86_64-unknown-linux-gnu/release/isupipe' do
  user 'root'
  mode '755'
  source '../../../webapp/rust/target/x86_64-unknown-linux-gnu/release/isupipe'
  notifies :restart, 'service[isupipe-rust]'
end

remote_file '/etc/systemd/system/isupipe-rust.service' do
  user 'root'
  mode '644'
  notifies :run, 'execute[systemctl daemon-reload]'
  notifies :restart, 'service[isupipe-rust]'
end

directory '/var/icons' do
  user 'root'
  owner 'isucon'
  group 'isucon'
  mode '755'
end
# それぞれのホストで変更した方が柔軟説
remote_file '/home/isucon/env.sh' do
 user 'isucon'
 owner 'isucon'
 group 'isucon'
 mode '755'

 notifies :restart, 'service[isupipe-rust]'
end
