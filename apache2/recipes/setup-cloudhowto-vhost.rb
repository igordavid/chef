service 'httpd' do
        action :enable
end


cookbook_file "/etc/httpd/sites-available/cloudhowtoorg.conf.d/local-cloudhowto.org.conf" do
        source "local-cloudhowto.org.conf"
        mode 0644
        notifies :restart, resources(:service => 'httpd')
end
