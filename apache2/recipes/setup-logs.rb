cookbook_file "/etc/httpd/sites-available/igordnet.conf.d/local-igord.net.conf" do
        source "local-igord.net.conf"
        mode 0644
        notifies :restart, resources(:services => 'httpd')
end
