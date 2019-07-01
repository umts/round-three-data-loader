module YamlDb
  module RakeTasks
    def self.data_load_dir_without_truncating_task
      dir = ENV['dir'] || 'base'
      SerializationHelper::Base.new(helper).load_from_dir(dump_dir("/#{dir}"), false)
    end
  end
end

namespace :db do
  namespace :data do
    desc "Load contents of db/data_dir into database skipping table truncation"
    task :load_dir_dirty  => :environment do
      YamlDb::RakeTasks.data_load_dir_without_truncating_task
    end
  end
end
