#
# Cookbook Name:: some
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

node["some"]["instances"].each do |inst|
  hostsfile_entry inst["private_ip"] do
    hostname inst["instance_id"]
    comment "appended by some::hostsfile"
    action :create
  end
end
