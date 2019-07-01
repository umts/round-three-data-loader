%w[setup deploy scm/git bundler pending].each do |lib|
  require "capistrano/#{lib}"
end

install_plugin Capistrano::SCM::Git

Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
