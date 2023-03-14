module TasksHelper
  def get_task_time(task)
    task.deadline.strftime("%l:%M %p")
  end

  def task_class(task)
    if task.completed?
      "task-completed"
    else
      "task-pending"
    end
  end
end
