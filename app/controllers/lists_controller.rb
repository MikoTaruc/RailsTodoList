class ListsController < ApplicationController
  before_action :find_list, only: [:show, :destroy, :edit, :update]

  def index 
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    # redirect_to list_path(@list)

    if @list.save
      redirect_to @list
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    @list.update(list_params)
    if @list.save
      redirect_to @list
    else
      render root_path
    end
  end

  def destroy
    @list.destroy
    redirect_to root_path
  end

  private
  def find_list
    @list = List.find(params[:id])
  end

  # Strong params
  def list_params
    params.require(:list).permit(:title, :description)
  end

end
