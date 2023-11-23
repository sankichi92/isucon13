service 'mariadb' do
  action :nothing
end

remote_directory '/etc/mysql/conf.d' do
  user 'root'
  mode '755'
  notifies :reload, 'service[mariadb]'
end

remote_file '/etc/mysql/mariadb.cnf' do
  user 'root'
  mode '755'
  notifies :reload, 'service[mariadb]'
end

remote_directory '/etc/mysql/mariadb.conf.d' do
  user 'root'
  mode '755'
  notifies :reload, 'service[mariadb]'
end

remote_file '/etc/nginx/sites-available/isucondition.conf' do
  user 'root'
  mode '644'
  notifies :reload, 'service[nginx]'
end

