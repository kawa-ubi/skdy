class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy]
  before_action :require_login

  # GET /todos
  def index
    # @todos = Todo.all.order(:due).page(params[:page]).per(5)
    # @todos = Todo.order_by_column

    # if params[:user_id]
    #   @todos = Todo.where(user_id: params[:user_id]).order(:due).page(params[:page]).per(5)
    # else
    #   @todos = Todo.all.order(:due).page(params[:page]).per(5)
    # end

    if params[:user_id]
      @todos = Todo.list_by_user(params[:user_id]).page(params[:page])
    else
      @todos = Todo.list_all
    end
  end

  # GET /todos/1
  def show
  end

  # GET /todos/new
  def new
    @todo = Todo.new
  end

  # GET /todos/1/edit
  def edit
  end

  # POST /todos
  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      redirect_to @todo, notice: 'Todo was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /todos/1
  def update
    if @todo.update(todo_params)
      redirect_to @todo, notice: 'Todo was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /todos/1
  def destroy
    @todo.destroy
    redirect_to todos_url, notice: 'Todo was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def todo_params
      params.require(:todo).permit(:due, :task, :memo, :user_id)
    end

end
