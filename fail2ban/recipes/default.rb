#
# Cookbook Name:: fail2ban
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package 'fail2ban' do
  action :install
end
remote_directory "/etc/fail2ban/action.d" do
  source "action.d"
end
remote_directory "/etc/fail2ban/filter.d" do
  source "filter.d"
end
remote_directory "/etc/fail2ban/jail.d" do
  source "jail.d"
end
cookbook_file "/etc/fail2ban/jail.local" do
  source "jail.local"
end
service 'fail2ban' do
  supports :status => true, :start => true, :stop => true, :restart => true, :reload => true
  action [ :enable, :start, :reload ]
end
