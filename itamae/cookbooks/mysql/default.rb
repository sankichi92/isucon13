service 'mysql' do
  action :nothing
end

remote_directory '/etc/mysql/conf.d' do
  user 'root'
  mode '755'
  notifies :restart, 'service[mysql]'
  source 'files/etc/mysql/conf.d'
end

remote_directory '/etc/mysql/mysql.conf.d' do
  user 'root'
  mode '755'
  notifies :restart, 'service[mysql]'
  source 'files/etc/mysql/mysql.conf.d'
end


