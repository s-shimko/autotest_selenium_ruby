task :default => :get_up

task :get_up do
   puts 'Getting up...'
end

task :teeth => :get_up do
  puts 'Cleaning teeth...'
end

task :exercises => :get_up do
  puts 'Shake your body!!!'
end

task :breakfast => [:teeth, :exercises] do
  puts 'Heaving breakfast...'
end

task :get_to_work => [:breakfast, :get_in_the_car] do
  puts 'On my way'
end

task  :get_in_the_car do
  puts 'I\'m in and ready to go'
end


desc 'task to clean teeth'
task :clean_teeth => :get_up do
  puts 'Cleaning teeth...'
end

# $ rake get_to_work
# Getting up...
# Cleaning teeth...
# Shake your body!!!
# Heaving breakfast...
# I'm in and ready to go
# On my way


namespace :home do

  task :get_to_work => [:breakfast, :get_in_the_car] do
    puts 'On my way'
  end

  task  :get_in_the_car do
    puts 'I\'m in and ready to go'
  end

end

namespace :work do

  task :get_to_meeting do
    puts 'Boring...'
  end

end

task :with_args, [:first_arg, :second_arg] do |t, args|
  puts args.first_arg
  puts args.second_arg
  puts t
end

# to call namespaces:
# rake home:get_up


namespace :main do
  task :run_all do
    sh 'cucumber -t @reg -f junit -o reports/ -f html -o reports/reports.html'
  end


  task :registration do
    sh 'cucumber -t @reg'
  end

  task :reg_as_dep => [:regestration] do
    sh 'cucumber -t @s1'
  end

end

task :test do
  sh 'ruby tasks/test1_main_data_classes/test1_main_data_classes.rb'
end

task :rspec_test1 do
  # sh 'cd tasks/test11_rspec'
  sh 'rspec spec/lib/rspec_task2/rspec_testredmine.rb --format documentation --tag aaa'
  # sh 'rspec spec/lib/rspec_task2/rspec_testredmine.rb --format documentation --tag ~aaa'
  # sh 'rspec spec/lib/rspec_task2/rspec_testredmine.rb ---format documentation --out report.txt --tag aaa'
end



#cucumber --format junit --out reports/
# firewall-cmd --zone=public --add-port=8080/tcp --permanent
# firewall-cmd --zone=public --add-service=http --permanent
# firewall-cmd --reload
# firewall-cmd --list-all