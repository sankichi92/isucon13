service 'nginx' do
  action :nothing
end

remote_file '/etc/nginx/nginx.conf' do
  user 'root'
  mode '644'
  notifies :reload, 'service[nginx]'
end

remote_file '/etc/nginx/sites-available/isucondition.conf' do
  user 'root'
  mode '644'
  notifies :reload, 'service[nginx]'
end
