node.default[:nginx_ext] = {}
node.default[:nginx_ext][:basic_auth][:user] = 'user'
node.default[:nginx_ext][:basic_auth][:password] = 'password'
node.default[:nginx_ext][:salt] = 'salt'

node.default[:private_lan] = {}
node.default[:private_lan][:mask] = nil
node.default[:private_lan][:ip] = {}

node.default[:sleep] = 0

node.default[:snmp_servers] = %w(
  10.100.0.14
  10.100.8.15
  10.100.16.13
  10.100.32.15
  202.248.175.141
  10.100.48.13
  175.184.41.60
  10.100.64.11
  10.100.64.12
  202.248.45.254
  10.100.128.14
  10.100.144.15
)

