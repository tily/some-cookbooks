
file "/etc/nginx/conf.d/htpasswd.conf" do
  content <<-EOF
    auth_basic "Secret Area";
    auth_basic_user_file "/etc/nginx/htpasswd";
  EOF
end

file "/etc/nginx/htpasswd" do
  content <<-EOF
#{node[:nginx_ext][:basic_auth][:user]}:#{node[:nginx_ext][:basic_auth][:password].crypt(node[:nginx_ext][:basic_auth][:salt])}
  EOF
end

service 'nginx' do
  action :restart
end
