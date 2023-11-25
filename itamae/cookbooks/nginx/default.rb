service 'nginx' do
  action :nothing
end

remote_file '/etc/nginx/nginx.conf' do
  user 'root'
  mode '644'
  notifies :reload, 'service[nginx]'
end

file '/var/log/nginx/access.log' do
  user 'root'
  mode '666'
end

remote_directory '/etc/nginx/sites-enabled' do
  user 'root'
  mode '755'
  notifies :reload, 'service[nginx]'
  source 'files/etc/nginx/sites-enabled'
end
