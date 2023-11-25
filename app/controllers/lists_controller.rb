class ListsController < ApplicationController


  def new
    @list = List.new
  end

  def create
    @list = List.new(set_list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @list = List.find(params[:id])
  end
  def index
    @lists = List.all
  end

  private

  def set_list_params
    params.require(:list).permit(:name)
  end
end
