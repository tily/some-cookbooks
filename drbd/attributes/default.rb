default[:drbd][:remote_host] = nil
default[:drbd][:disk] = nil
default[:drbd][:mount] = nil
default[:drbd][:fs_type] = "ext3"
default[:drbd][:dev] = "/dev/drbd0"
default[:drbd][:master] = false
default[:drbd][:port] = 7789
default[:drbd][:configured] = false
case node["platform"]
when "redhat", "centos", "fedora"
  default[:drbd][:packages] = ["drbd84-utils", "kmod-drbd84"]
when "debian", "ubuntu"
  default[:drbd][:packages] = ["drbd8-utils"]
end
