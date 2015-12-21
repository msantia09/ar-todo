require_relative 'config/application'

	puts "Put your application code in #{File.expand_path(__FILE__)}"


	## Displays the application menu.
	def disp_menu
		puts "\n\n	TODO MENU	"
		puts " ------------------------------------------ "
		puts " add <task>		i.e: add Bake a cake."
		puts " list			i.e: list"
		puts " delete <task id>	i.e: delete 3"
		puts " complete <task id>	i.e: complete 5"
		puts " ------------------------------------------ \n\n"
	end


	## Run the application.
	def start_todo

		if ARGV.any?
			cmd = ARGV.shift(1)
			if ARGV.any?
				task_id = ARGV[0].to_i
				task_name = ARGV[0..-1].join(' ')
			end

			if cmd.join.casecmp("add") == 0
				Task.add_task(task_name)
			elsif cmd.join.casecmp("list") == 0
				Task.disp_task
			elsif cmd.join.casecmp("delete") == 0
				Task.del_task(task_id)		
			elsif cmd.join.casecmp("complete") == 0
				Task.complete_task(task_id)
			end
		else
			puts "\nNo input was given. Please re-enter..\n\n"
			disp_menu
		end
	end


start_todo
# Task.all.each do |t|
# 	puts t.name, t.complete
# end


		