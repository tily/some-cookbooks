require 'highline'
require 'aws-sdk'

desc 'upload cookbooks to nifty cloud storage'
task :upload do
    ENV['S3_BUCKET'] ||= 'some'
    ENV['S3_KEY'] ||= 'cookbooks.tgz'

    dir = File.dirname(__FILE__)
    system "cd #{dir}/../; tar czvf /tmp/cookbooks.tgz cookbooks"

    s3 = AWS::S3.new(
      :access_key_id => HighLine.new.ask('access key: '),
      :secret_access_key => HighLine.new.ask('secret key: '),
      :s3_endpoint => 'ncss.nifty.com'
    )
    bucket = s3.buckets[ENV['S3_BUCKET']]
    unless bucket.exists?
      s3.buckets.create(ENV['S3_BUCKET'])
    end
    obj = bucket.objects[ENV['S3_KEY']]
    obj.write(File.read("/tmp/cookbooks.tgz"))
    obj.acl = :public_read

    system "rm /tmp/cookbooks.tgz"

    puts "cookbooks url: #{obj.url_for(:read).to_s.gsub(/\?(.+)$/, '')}"
end
