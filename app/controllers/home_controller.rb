class HomeController < ApplicationController
  def index
  @config={css:"index",js:"index",title:"Tordate - Home"}
  
  end

  def update
   Thread.new do
        UpdateNews.main
    end
  redirect_to "/", notice: "Updating news..."
  
  end
  
  def about
  end
end
