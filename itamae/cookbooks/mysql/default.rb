service 'mariadb' do
  action :nothing
end

remote_directory '/etc/mysql/conf.d' do
  user 'root'
  mode '644'
  notifies :reload, 'service[mysql]'
end

remote_directory '/etc/mysql/mysql.conf.d' do
  user 'root'
  mode '644'
  notifies :reload, 'service[mysql]'
end


