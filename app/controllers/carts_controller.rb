class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def index
    byebug
    @items = Item.find(@cart.contents.keys)
  end

  def create
    item = Item.find(params[:item_id])

    @cart.add_item(item.id)
    session[:cart] = @cart.contents

    flash[:notice] = "You now have #{pluralize(session[:cart][item.id.to_s], item.title)}."
    redirect_to items_path
  end

  def delete
    item = Item.find(params[:item_id])

    @cart.delete_item(item.id)
    session[:cart] = @cart.contents

    flash[:notice] = "You now have #{pluralize(session[:cart][item.id.to_s], item.title)}."
    redirect_to items_path
  end

end
