class SearchesController < ApplicationController
  before_action :set_parents, only: [:index]
  before_action :set_ransack, only: [:index]

  def index

    if params[:q]
      @search_item = Item.ransack(params[:q]) 
      @items = @search_item.result.page(params[:page])
    else
      @items = Item.search(params[:search]).limit(132)
      @search = params[:search]
    end
    
  end
  
  def detail_search
    @search_item = Item.ransack(params[:q]) 
    @items = @search_item.result.page(params[:page])
  end



  private

  def set_parents
    @parents = Category.where(ancestry: nil)
  end
  
  def set_ransack
    @q = Item.ransack(params[:q])
  end
end
