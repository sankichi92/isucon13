package 'dnsdist'

service 'dnsdist' do
  action :nothing
end

remote_file '/etc/dnsdist/dnsdist.conf' do
  user 'root'
  mode '644'
  notifies :restart, 'service[dnsdist]'
end
