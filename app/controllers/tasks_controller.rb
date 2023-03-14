class TasksController < ApplicationController
  include DateHelper

  def index
    date = parse_date_or_get_today(params[:date])

    @tasks = Task.for_date(date)
  end
end
