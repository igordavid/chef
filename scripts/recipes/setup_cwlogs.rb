bash "setup_cwlogs" do
	user "root"
	code <<-EOH
		mv /var/awslogs/etc/awslogs.conf /var/awslogs/etc/awslogs.conf-AULD
		mv /tmp/cwlogs.cfg /var/awslogs/etc/awslogs.conf
		/etc/init.d/awslogs restart
	EOH
end
