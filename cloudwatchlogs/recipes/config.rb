# install cloudwatch logs
#

template "/tmp/cwlogs.cfg" do
  cookbook "cloudwatchlogs"
  source "cwlogs.cfg.erb"
  owner "root"
  group "root"
  mode 0644
end
