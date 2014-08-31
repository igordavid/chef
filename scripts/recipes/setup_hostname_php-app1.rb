bash "setup_hostname_php-app1" do
	user "root"
	code <<-EOH
		echo "php-app1.igord.net" > /proc/sys/kernel/hostname
		/etc/init.d/postfix restart
	EOH
end
