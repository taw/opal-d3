require "bundler"
Bundler.require
Bundler::GemHelper.install_tasks

require "opal/rspec/rake_task"
Opal::RSpec::RakeTask.new(:test) do |server, task|
  ENV["SPEC_OPTS"] = "--color --require spec_helper"
  server.index_path = "spec/html/index.html.erb"
  server.append_path "lib"
end

desc "Create static snapshot of the demo page"
task :snapshot do
  dir = Pathname("snapshot")
  system "trash", dir.to_s if dir.exist?
  dir.mkpath
  Dir.chdir(dir) do
    system "wget --mirror -np http://localhost:9292/"
  end
end

desc "Build gem"
task "gem:build" do
  system "gem build opal-d3.gemspec"
end

desc "Upload gem"
task "gem:push" => "gem:build" do
  gem_file = Dir["opal-d3-*.gem"][-1] or raise "No gem found"
  system "gem", "push", gem_file
end
