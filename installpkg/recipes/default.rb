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


# install cloudwatch logs
#

template "/tmp/cwlogs.cfg" do
  cookbook "logs"
  source "cwlogs.cfg.erb"
  owner "root"
  group "root"
  mode 0644
end


# install and starts cloudwatch logs agent on the instance:
directory "/opt/aws/cloudwatch" do
 recursive true
end
 
 
remote_file "/opt/aws/cloudwatch/awslogs-agent-setup-v1.0.py" do
source "https://s3.amazonaws.com/aws-cloudwatch/downloads/awslogs-agent-setup-v1.0.py"
mode "0755"
end
 
execute "Install CloudWatch Logs agent" do
command "/opt/aws/cloudwatch/awslogs-agent-setup-v1.0.py -n -r us-east-1 -c /tmp/cwlogs.cfg"
not_if { system "pgrep -f aws-logs-agent-setup" }
end

