case node["platform"]
when "centos"
  default["s3fs"]["packages"] = %w{gcc libstdc++-devel gcc-c++ curl-devel libxml2-devel openssl-devel mailcap make svn}
  if node["platform_version"].to_f >= 6.0
    default["fuse"]["version"] = "2.9.1"
  else
    default["fuse"]["version"] = "2.8.7"
  end
else
  default["s3fs"]["packages"] = %w{build-essential pkg-config libcurl4-openssl-dev libfuse-dev fuse-utils libfuse2 libxml2-dev mime-support}
  default["fuse"]["version"] = "2.8.7"
end
default["s3fs"]["version"] = "1.61"
default["s3fs"]["options"] = 'allow_other,use_cache=/tmp'
