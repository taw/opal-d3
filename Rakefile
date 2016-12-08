require "bundler"
Bundler.require
Bundler::GemHelper.install_tasks

require "opal/rspec/rake_task"
Opal::RSpec::RakeTask.new(:default) do |s, t|
  ENV["SPEC_OPTS"] = "--color --require spec_helper"
  s.index_path = "spec/html/index.html.erb"
  s.append_path "lib"
end
