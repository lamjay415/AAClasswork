class Api::TodosController < ApplicationController 
  def show
      render json: Todo.find(params[:id]) 
  end

  def index
      @todos = Todo.all
      render json: @todos
  end

  def create
      @todo = Todo.new(todo_params)
      if @todo.save
          render json: @todo
      else
          render json: @todo.errors.full_message, status: 422
      end
  end

  def update
      @todo = Todo.find(params[:id])
      @todo.update!(todo_params)
      render json: @todo
  end

  def destroy
      @todo = Todo.find(params[:id])
      @todo.destroy
      @todos = Todo.all
      render json: @todos
  end

  def todo_params
      params.require(:todo).permit(:title, :body, :done)
  end
end