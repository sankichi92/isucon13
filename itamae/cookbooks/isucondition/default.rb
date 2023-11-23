service 'isucondition.rust' do
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

remote_file '/home/isucon/webapp/rust/target/x86_64-unknown-linux-gnu/release/isucondition' do
  user 'root'
  mode '755'
  source '../../../webapp/rust/target/x86_64-unknown-linux-gnu/release/isucondition'
  notifies :restart, 'service[isuconditon]'
end

remote_file '/etc/systemd/system/isucondition.rust.service' do
  user 'root'
  mode '644'
  notifies :run, 'execute[systemctl daemon-reload]'
  notifies :restart, 'service[isucondition.rust]'
end

remote_file '/home/isucon/env.sh' do
  user 'isucon'
  mode '644'
end
