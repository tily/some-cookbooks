node.default[:nginx_ext] = {}
node.default[:nginx_ext][:basic_auth][:user] = 'user'
node.default[:nginx_ext][:basic_auth][:password] = 'password'
node.default[:nginx_ext][:salt] = 'salt'

node.default[:private_lan] = {}
node.default[:private_lan][:mask] = nil
node.default[:private_lan][:ip] = {}
