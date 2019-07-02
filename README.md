`round-three` dataloader
========================

This app is a minimal Rails 3.2 skeleton capable of running the data conversion
tasks required to migrate the [round-three](/umts/round-three) application from
Postgres to Mariadb.

With any luck, it will be a very short-lived project, deployed only for one
weekend.

Features
--------

The app is always in "production" mode for ease of use. The [yaml_db][yaml_db]
gem is loaded into the `Gemfile`to provide the `rake` tasks that come with that
gem.

In the `script/` directory, there is a `split.rb` script that can be pointed at
a file which contains the YAML for _one_ model (like you get from `rake
db:data:dump_dir`) and splits it into multiple YAML files:

```
$ RPC=50000 ruby script/split.rb db/something/something.yml
```
In addition, there is a "freedom-patch" located in `lib/tasks` that loads a
data directory without truncating the table each time. This is for use on a
directory that contains the output from the split script.
