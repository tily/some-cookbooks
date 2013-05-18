#
# Cookbook Name:: some
# Recipe:: haproxy
#
# Copyright 2011, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
include_recipe "haproxy"

pool_members = []
node["haproxy"]["pool_members"].each do |member|
  inst = node["some"]["instances"].find {|inst| member == inst["instance_id"] }
  if inst
    pool_members << {:ipaddress => inst["private_ip"], :hostname => inst["instance_id"]}
  end
end

package "haproxy" do
  action :install
end

cookbook_file "/etc/default/haproxy" do
  cookbook "haproxy"
  source "haproxy-default"
  owner "root"
  group "root"
  mode 00644
  notifies :restart, "service[haproxy]"
end

template "/etc/haproxy/haproxy.cfg" do
  source "haproxy.cfg.erb"
  owner "root"
  group "root"
  mode 00644
  variables(
    :pool_members => pool_members.uniq,
    :defaults_options => defaults_options,
    :defaults_timeouts => defaults_timeouts
  )
  notifies :reload, "service[haproxy]"
end

service "haproxy" do
  supports :restart => true, :status => true, :reload => true
  action [:enable, :start]
end
