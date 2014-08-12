ruby_block "identify" do
	block do
		require 'net/smtp'
		message = <<MESSAGE_END
		From: NODE <#{node['hostname']}>
		TO: igord@bra.in.rs
		Subject: NODE IDENTIFY
		
		This is node identify
		
		Stack: #{node['platform']}	
		Layer: #{node['platform']} 
		AWS InstanceID: #{node['platform']}
		AWS AZ: #{node['platform']}	
		
		MESSAGE_END

		Net::SMTP.start('localhost') do |smtp|
		smtp.send_message message, 'igord@bra.in.rs'
		end
	end
	action :run
end
		
	
