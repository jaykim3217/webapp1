class ItemsController < ApplicationController
  before_action :login?, except: [:index]
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.all.order(created_at: "DESC")
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
  end

  def edit
    if current_user.id != @item.user.id
      redirect_to action: :index
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    if current_user.id == item.user.id
      item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :explain, :category_id, :price, :image, :brand).merge(user_id: current_user.id)
  end

  def move_to_login
    unless user_login?
      redirect_to login_path
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
