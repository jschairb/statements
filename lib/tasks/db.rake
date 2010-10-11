namespace :db do
  desc "drop and recreate all databases"
  task :do_over => %w[db:drop db:create db:migrate db:seed db:test:clone_structure]

  desc "alias for do_over"
  task :do => :do_over
end
