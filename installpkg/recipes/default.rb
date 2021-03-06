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

cookbook_file "/etc/munin/munin-node.conf" do
	source "munin-node.conf"
	mode 0644
#	action :create
	notifies :restart, resources(:service => 'munin-node')
end


package 'ruby-shadow' do
	action :install
end
