class HomeController < ApplicationController
  def index
  @config={css:"index",js:"index",title:"Tordate - Home"}
  
  end

  def update
  UpdateNews.main
  redirect_to index, notice: "Updating news..."
  end
  
  def about
  end
end
