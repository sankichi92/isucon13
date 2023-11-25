service 'pdns' do
  action :nothing
end

remote_file '/etc/powerdns/pdns.conf' do
  user 'root'
  mode '644'
  notifies :restart, 'service[pdns]'
end

remote_file '/etc/powerdns/named.conf' do
  user 'root'
  mode '644'
  notifies :restart, 'service[pdns]'
end

remote_directory '/etc/powerdns/pdns.d' do
  user 'root'
  mode '755'
  notifies :restart, 'service[nginx]'
  source 'files/etc/powerdns/pdns.d'
end
