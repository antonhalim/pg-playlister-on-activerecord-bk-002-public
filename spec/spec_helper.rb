require_relative '../config/environment'
require 'rake'
load './Rakefile'

RSpec.configure do |config|
  config.before do
    run_rake_task('db:migrate')
  end
  config.after do
    run_rake_task('db:drop')
  end
end

def run_rake_task(task)
  RAKE_APP[task].invoke
  if task == 'db:migrate'
    RAKE_APP[task].reenable
  end
end