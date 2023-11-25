execute 'sh recreate_isupipe_db.sh' do
  user 'isucon'
  cwd '/home/isucon'
  action :nothing
end

remote_file '/home/isucon/recreate_isupipe_db.sh' do
  user 'isucon'
  owner 'isucon'
  group 'isucon'
  mode '755'
end

remote_directory '/home/isucon/webapp/sql' do
  user 'isucon'
  owner 'isucon'
  group 'isucon'
  mode '755'
  
  source '../../../webapp/sql'
  
  notifies :run, 'execute[sh recreate_isupipe_db.sh]'
end
