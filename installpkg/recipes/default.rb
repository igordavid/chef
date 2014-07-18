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


cookbook_file "/etc/munin/munin-node.conf" do
	source "munin-node.conf"
	mode 0644
	action :create
end

service 'munin-node' do
        action :start
end
