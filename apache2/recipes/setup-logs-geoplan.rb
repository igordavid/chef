service 'httpd' do
        action :enable
end


cookbook_file "/etc/httpd/sites-available/geoplanrbcom.conf.d/local-geoplanrb.com.conf" do
        source "local-geoplanrb.com.conf"
        mode 0644
        notifies :restart, resources(:service => 'httpd')
end
