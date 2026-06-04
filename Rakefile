require "bundler/gem_tasks"

desc "Run tests"
task :test do
  files = FileList["test/**/*_test.rb", "test/**/test_*.rb"].to_a
  raise "No test files found" if files.empty?
  ruby "-Itest", *files
end

task default: :test
