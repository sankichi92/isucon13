package 'sysstat'
package 'netdata'

execute 'sysctl -w kernel.perf_event_paranoid=-1' do
  user 'root'
  action :nothing
end
