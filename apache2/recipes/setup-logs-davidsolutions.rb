service 'httpd' do
        action :enable
end


cookbook_file "/etc/httpd/sites-available/davidsolutionsnet.conf.d/local-davidsolutions.net.conf" do
        source "local-davidsolutions.net.conf"
        mode 0644
        notifies :restart, resources(:service => 'httpd')
end
