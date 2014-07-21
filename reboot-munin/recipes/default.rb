bash "reboot_munin" do
	user "root"
	code <<-EOH
		/etc/init.d/munin-node restart
	EOH
end
