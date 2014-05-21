
package 'snmpd' do
  case node[:platform]
  when 'centos','redhat','fedora','amazon'
    package_name 'net-snmp'
  when 'debian','ubuntu'
    package_name 'snmpd'
  end
  action :install
end

snmpd_version = `dpkg -l snmpd`.chomp

template '/etc/snmp/snmpd.conf' do
  source 'snmpd.conf.erb'
  action :create
  notifies :restart, 'service[snmpd]', :delayed
end

case node[:platform]
when 'debian','ubuntu'
  template '/etc/default/snmpd' do
    source 'etc_default_snmpd.erb'
    action :create 
    notifies :restart, 'service[snmpd]', :delayed
  end
end

service 'snmpd' do
 action :enable
end
