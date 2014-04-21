
mask = node[:private_lan][:mask]
ip = node[:private_lan][:ip][node.name]

if mask && ip
  ifconfig ip do
    device 'eth1'
    onboot 'yes'
    bootproto 'static'
    mask mask
    notifies :restart, 'service[network]'
  end
end

service 'network' do
 action :nothing
end
