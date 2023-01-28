class Api::TodosController < ApplicationController
  def index
    @todos = TodoItem.all
    render json: @todos
  end

  def show
    @todo = TodoItem.find(params[:id])
    render json: @todo
  end

  def create
    @todo = TodoItem.new(create_user_params)
    if @todo.save
      render json: @todo
    else
      render json: { errros: @todo.errors }, status: :unprocessable_entity
    end
  end

  def update
    @todo = TodoItem.find(params[:id])
    updates = update_user_params
    complete = updates.delete(:complete)
    if complete && !@todo.is_complete? then @todo.mark_complete! end
    if @todo.update(updates)
      render json: @todo
    else
      render json: { errros: @todo.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @todo = TodoItem.find(params[:id])
    if @todo.destroy
      render json: @todo.id
    else
      render json: { errros: @todo.errors }, status: :unprocessable_entity
    end
  end

  private

  def create_user_params
    params.require(:todo).permit(:title, :description)
  end

  def update_user_params
    params.require(:todo).permit(:title, :description, :complete)
  end
end
