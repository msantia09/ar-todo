#require 'byebug'

class Task < ActiveRecord::Base

	validates :name, presence: true
  	validates :name, uniqueness: true


  	def self.find_all_tasks
  		Task.all
  	end

	## Displays a list of tasks.
	def self.disp_task
		all_tasks = find_all_tasks

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
	def self.find_tasks(index)
		Task.find(task_id)
	end


	## Adds a task.
	def self.add_task(task_info)
		Task.create(name: task_info)
		puts "Appended \"#{task_info}\" to your TODO list..."
	end


	## Deletes a task and displays the updated list.
	def self.del_task(index)
		all_tasks = find_all_tasks

		if all_tasks == nil
			puts "Invalid task."
		else
			puts "Deleted \"#{all_tasks[index-1].name}\" from your TODO list..."
			all_tasks.each_with_index do |t, idx|
				if idx == index-1
					t.destroy
				end
			end
			re_index_taskid
			disp_task
		end
	end


	def self.re_index_taskid
		all_tasks = find_all_tasks
		all_tasks.each_with_index do |t, idx|
			t.update(id: idx+1)
		end
	end


	## Marks a task as completed and displays the updated list.
	def self.complete_task(index)
		all_tasks = find_all_tasks

		if all_tasks == nil
			puts "Invalid task."
		else
			puts "Task #{all_tasks[index-1].name} is marked as Completed [X]."
			all_tasks.each_with_index do |t, idx|
				if idx == index-1
					t.update_attributes(complete: true)
				end
			end
			re_index_taskid
			disp_task
		end

	end
end
