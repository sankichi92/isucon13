service 'nginx' do
  action :nothing
end

remote_file '/etc/nginx/nginx.conf' do
  user 'root'
  mode '644'
  notifies :reload, 'service[nginx]'
end

remote_directory '/etc/nginx/sites-enabled' do
  user 'root'
  mode '644'
  notifies :reload, 'service[nginx]'
end
