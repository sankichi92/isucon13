package 'jq'
package 'fish'
package 'neovim'
package 'unzip'
package 'redis'
package 'sysstat'

directory '/home/isucon/.config/fish' do
  user 'isucon'
end
directory '/home/isucon/.installer' do
  user 'isucon'
end

remote_file '/home/isucon/.config/fish/config.fish' do
  user 'isucon'
end

remote_file '/home/isucon/alp.sh' do
  user 'isucon'
end

execute 'bash /home/isucon/.installer/rust_tools.sh' do
  user 'isucon'
  action :nothing
end

execute 'sh /home/isucon/.installer/lazygit.sh' do
  user 'root'
  action :nothing
end

execute 'sh /home/isucon/.installer/trdsql.sh' do
  user 'root'
  action :nothing
end

execute 'sh /home/isucon/.installer/percona_toolkit.sh' do
  user 'root'
  action :nothing
end

execute 'sh /home/isucon/.installer/alp.sh' do
  user 'root'
  action :nothing
end

remote_file '/home/isucon/.installer/rust_tools.sh' do
  notifies :run, 'execute[sh /home/isucon/.installer/rust_tools.sh]'
end

remote_file '/home/isucon/.installer/lazygit.sh' do
  notifies :run, 'execute[sh /home/isucon/.installer/lazygit.sh]'
end

remote_file '/home/isucon/.installer/trdsql.sh' do
  notifies :run, 'execute[sh /home/isucon/.installer/trdsql.sh]'
end

# remote_file '/home/isucon/.installer/percona_toolkit.sh' do
#   notifies :run, 'execute[sh /home/isucon/.installer/percona_toolkit.sh]'
# end

remote_file '/home/isucon/.installer/alp.sh' do
  notifies :run, 'execute[sh /home/isucon/.installer/alp.sh]'
end

