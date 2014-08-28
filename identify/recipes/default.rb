ruby_block "identify" do
	block do
		HOST = #{node['hostname']}
		require 'net/smtp'
		message = <<MESSAGE_END
From: NODE <#{node['hostname']}>
To: igord@bra.in.rs
Subject: NODE IDENTIFY
		
This is node identify
		
Stack: #{node['platform']}	
Layer: #{node['platform']} 
AWS InstanceID: #{node['platform']}
AWS AZ: #{node['platform']}	
MESSAGE_END

		Net::SMTP.start('localhost') do |smtp|
		smtp.send_message message, 	"root@#{HOST}",
						'igord@bra.in.rs'
		end
	end
	action :run
end
		
	
