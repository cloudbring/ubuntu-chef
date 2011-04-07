#-*- mode: ruby; -*-

desc "Setup Ruby Dependencies"
task :setup do
  `rvm install 1.8.7`
  `rvm use 1.8.7`
  `rvm gemset use global`
  `gem install bundler`
  `rvm gemset create devops`
  `rvm gemset use devops`
  `bundle install`
  `cd iso && wget -c -i .iso`
end

desc "Ubuntu 10.04.2 32 Vagrant Basebox"
task :lucid32 do
  `bundle exec vagrant basebox build ubuntu-10.04.2-server-i386`
  `bundle exec vagrant basebox export ubuntu-10.04.2-server-i386`
end

desc "Ubuntu 10.04.2 64 Vagrant Basebox"
task :lucid64 do
  `bundle exec vagrant basebox build ubuntu-10.04.2-server-amd64`
  `bundle exec vagrant basebox export ubuntu-10.04.2-server-amd64`
end

desc "Ubuntu 10.10 32 Vagrant Basebox"
task :maverick32 do
  `bundle exec vagrant basebox build ubuntu-10.10-server-i386`
  `bundle exec vagrant basebox export ubuntu-10.10-server-i386`
end

desc "Ubuntu 10.10 64 Vagrant Basebox"
task :maverick64 do
  `bundle exec vagrant basebox build ubuntu-10.10-server-amd64`
  `bundle exec vagrant basebox export ubuntu-10.10-server-amd64`
end

desc "Ubuntu Vagrant Baseboxes (all)"
task :vagrants => [ :lucid32, :lucid64, :maverick32, :maverick64 ]
