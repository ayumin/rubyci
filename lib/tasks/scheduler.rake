desc "This task is called by the Heroku scheduler add-on"
task :fetch_recent => :environment do
    puts "Fetching recent results..."
    Report.fetch_recent
    puts "done."
end

desc "This task is called by the Heroku scheduler add-on"
task :post_recent => :environment do
    puts "Posting recent results..."
    Report.post_recent
    puts "done."
end

desc "inspect the environment"
task :inspect_env => :environment do
  require 'rbconfig'
  require 'open-uri'
  require 'pp'
  puts "inspecting..."
  p `hostname`
  p `uname -a`
  Dir["/etc/{*_version,*-release}"].each do |path|
    p path
    puts IO.read(path)
  end
  pp ENV
  p URI("http://www.yahoo.co.jp").read(100) rescue nil
end
