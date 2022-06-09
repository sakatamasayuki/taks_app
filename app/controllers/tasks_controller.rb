class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end
  
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params.require(:task).permit(:name, :begin, :end, :allday, :memo))
    if @task.save
      flash[:notice] = "スケジュール「#{@task.name}」を新規登録しました。"
      redirect_to :tasks
    else
      render "new", status: :unprocessable_entity
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(params.require(:task).permit(:name, :begin, :end, :allday))
      flash[:notice] = "スケジュール「#{@task.name}」の情報を更新しました。"
      redirect_to :tasks
    else
      render "edit"
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:alert] = "スケジュール「#{@task.name}」を削除しました。"
    redirect_to :tasks, status: 303
  end

end

