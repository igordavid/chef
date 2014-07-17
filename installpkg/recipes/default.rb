package 'postfix' do
	action :install
end


package 'munin' do
	action :install
end

service 'postfix' do
	action :start
end

service 'sendmail' do
	action :stop
end

service 'munin-node' do
	action :enable
end

template "/etc/munin/munin-node.conf" do
	source "munin-node.conf.erb"
	mode 0644
	only_if {node['createfile']['install_file']}
	notifies :restart, resources(:service => 'munin-node')
end
