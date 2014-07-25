package 'proftpd' do
	action :install
end

service 'proftpd' do
	action :start
end


