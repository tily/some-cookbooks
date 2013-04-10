require 'highline'
require 'aws-sdk'

desc 'upload cookbooks to nifty cloud storage'
task :upload do
    s3_bucket = ENV['S3_BUCKET'] || 'some'
    s3_key = ENV['S3_KEY'] || 'cookbooks.tgz'
    access_key_id = ENV['AWS_ACCESS_KEY_ID'] || HighLine.new.ask('access key id: ')
    secret_access_key = ENV['AWS_SECRET_ACCESS_KEY'] || HighLine.new.ask('secret access key: ')

    dir = File.dirname(__FILE__)
    system "cd #{dir}/../; tar czf /tmp/cookbooks.tgz cookbooks"

    s3 = AWS::S3.new(
      :access_key_id => access_key_id,
      :secret_access_key => secret_access_key,
      :s3_endpoint => 'ncss.nifty.com'
    )
    bucket = s3.buckets[s3_bucket]
    unless bucket.exists?
      s3.buckets.create(s3_bucket)
    end
    obj = bucket.objects[s3_key]
    obj.write(File.read("/tmp/cookbooks.tgz"))
    obj.acl = :public_read

    system "rm /tmp/cookbooks.tgz"

    puts "cookbooks url: #{obj.url_for(:read).to_s.gsub(/\?(.+)$/, '')}"
end
