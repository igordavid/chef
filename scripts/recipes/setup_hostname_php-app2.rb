bash "setup_hostname_php-app2" do
	user "root"
	code <<-EOH
		echo "php-app2.igord.net" > /proc/sys/kernel/hostname
		/etc/init.d/postfix restart
	EOH
end
