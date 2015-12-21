class Task < ActiveRecord::Base

	validates :name, presence: true
  	validates :name, uniqueness: true

	## Displays a list of tasks.
	def self.disp_task
		all_tasks = Task.all

		if all_tasks.empty?
			puts "No tasks in the list."
		else
			puts "\n\n ------- TASK LIST ------- \n"
	      	all_tasks.each_with_index do |task, idx|
	      		if task.complete == true
	      			puts "#{idx+1}. [X] #{task.name}"
	      		else
	      			puts "#{idx+1}. [ ] #{task.name}"
      			end
      		end
      		puts " ------------------------- \n\n"
		end
	end


	## Finds a specific task by task id.
	def self.find_a_task(task_id)
		Task.find(task_id)
	end


	## Adds a task.
	def self.add_task(task_info)
		Task.create(name: task_info)
		puts "Appended \"#{task_info}\" to your TODO list..."
	end


	## Deletes a task and displays the updated list.
	def self.del_task(task_id)
		task = find_a_task(task_id)

		if task == nil
			puts "Invalid task."
		else
			puts "Deleted \"#{task.name}\" from your TODO list..."
			task.destroy
			disp_task
		end
	end


	## Marks a task as completed and displays the updated list.
	def self.complete_task(task_id)
		task = find_a_task(task_id)

		if task == nil
			puts "Invalid task."
		else
			puts "Task is marked as Completed [X]."
			task.update_attributes(complete: true)
		end
		disp_task
	end
end
