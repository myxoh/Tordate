class FeedController < ApplicationController
  
  def rss
      @title = "Best Articles!"

      # the news items
      @articles=Article.where("score >= "+get_config("best")).order("created_at DESC")

      # this will be our Feed's update timestamp
      @updated = @articles.first.created_at unless @articles.empty?

      respond_to do |format|
        format.atom { render :layout => false }

        # we want the RSS feed to redirect permanently to the ATOM feed
        format.rss { redirect_to feed_path(:format => :atom), :status => :moved_permanently }
      end
  end
  
  
  def defaultfeed
  @default=true
  @articles=[]
  @reason=[]
  page=params[:page].to_i
  articles=filterFeed Article.all
  ampp=get_config("amount_per_page").to_i
  @featured=articles.where("picture_file_name IS NOT NULL AND score >= "+get_config("best")).order("created_at DESC")[0..5]
  if @featured.count < 6 then
  @featured=articles.where("picture_file_name IS NOT NULL AND score >= "+get_config("trending")).order("created_at DESC")[0..5]
  end
  if @featured.count < 6 then
  @featured=articles.where("picture_file_name IS NOT NULL").order("created_at DESC")[0..5]
  end
  
  
  
  if (@user.blank?)
  mad=6
  else
  mad=8 #Minimum amount of articles in default feed.
  end
  
  amount_in_best=ampp*3/mad
  best=articles.where("score >= "+get_config("best")).order("created_at DESC")[page*amount_in_best+5..page*amount_in_best+amount_in_best-1+5]
  
  amount_in_trending=ampp*2/mad
  trending=articles.where("score >= "+get_config("trending")+" AND score < "+get_config("best")).order("created_at DESC")[page*amount_in_trending..page*amount_in_trending+amount_in_trending-1]
  
  amount_in_newest=ampp*1/mad
  newest=articles.where("score < "+get_config("trending")+" AND score > -"+get_config("trending")).order("created_at DESC")[page*amount_in_newest..page*amount_in_newest+amount_in_newest-1]
  if @user.blank?
  following = []
  else
  amount_in_following=ampp*2/mad
  following=@user.following_articles.where("articles.created_at > '"+(Date.today).to_s+"'").order("created_at DESC")
  following=(filterFeed following)[page*amount_in_following..page*amount_in_following+amount_in_following]
  end
  ampp.times do |t|
  
      if !best.blank? and !best[t*3].blank? then 
      @articles.push(best[t*3])
      @reason.push(1)
      end
      
      if !best.blank? and !best[t*3+1].blank? then @articles.push(best[t*3+1])
      @reason.push(1)
      end
      if !following.blank? and !following[t*2].blank? then @articles.push(following[t*2]) 
      @reason.push(4)
      end
      if !best.blank? and !best[t*3+2].blank? then @articles.push(best[t*3+2]) 
      @reason.push(1)
      end
      
      if !trending.blank? and !trending[t*2].blank? then @articles.push(trending[t*2]) 
      @reason.push(2)
      end
      if !following.blank? and !following[t*2+1].blank? then @articles.push(following[t*2+1]) 
      @reason.push(4)
      end
      if !trending.blank? and !trending[t*2+1].blank? then @articles.push(trending[t*2+1]) 
      @reason.push(2)
      end
      
      if !newest.blank? and !newest[t].blank? then @articles.push(newest[t]) 
      @reason.push(3)
      end
     
  end
  
  
   @articles=@articles[0..ampp]
  
    render "feed/feed"
  end
  
  
  def following
  if @user.blank?
  @articles=[]
  else
  ampp=get_config("amount_per_page").to_i
  page=params[:page].to_i
  @articles=@user.following_articles.order("created_at DESC")
  @articles=(filterFeed @articles)[page*ampp..page*ampp+ampp]
  end
  render "feed/feed"
  end
  
  def user
  page=params[:page].to_i
  ampp=get_config("amount_per_page").to_i
  @articles=Article.where(user_id:params[:id]).order("created_at DESC")
  @articles=(filterFeed @articles)[page*ampp..page*ampp+ampp]
  
  render "feed/feed"
  end
    
  def best
  page=params[:page].to_i
  ampp=get_config("amount_per_page").to_i
  @articles=Article.where("score >= "+get_config("best")).order("created_at DESC")
  @articles=(filterFeed @articles)[page*ampp..page*ampp+ampp]
  @featured=Article.where("picture_file_name IS NOT NULL AND score >= "+get_config("best")).order("created_at DESC")
  @featured=(filterFeed @featured)[0..5]
  render "feed/feed"
  end

  def trending
  page=params[:page].to_i
  ampp=get_config("amount_per_page").to_i
  @articles=Article.where("score >= "+get_config("trending")+" AND score < "+get_config("best")).order("created_at DESC")
  @articles=(filterFeed @articles)[page*ampp..page*ampp+ampp]
  @featured=Article.where("picture_file_name IS NOT NULL AND score >= "+get_config("trending")+" AND score < "+get_config("best")).order("created_at DESC")
  @featured=(filterFeed @featured)[0..5]
  render "feed/feed"
  end

  def newest
  page=params[:page].to_i
  ampp=get_config("amount_per_page").to_i
   @articles=Article.where("score < "+get_config("trending")).order("created_at DESC")
   @articles=(filterFeed @articles)[page*ampp..page*ampp+ampp]
   @featured=Article.where("picture_file_name IS NOT NULL AND score < "+get_config("trending")).order("created_at DESC")
  @featured=(filterFeed @featured)[0..5]
  render "feed/feed"
  end
  
  private
  def filterFeed articles
      if !params[:feed].blank?
        if !params[:feed][:region].blank? and !articles.nil? then
        articles=articles.joins(:regions).where(regions:{id:params[:feed][:region]})
        end
        
        if !params[:feed][:category].blank? and !articles.nil? then
        articles=articles.joins(:categories).where(categories:{id:params[:feed][:category]})
        end        
        
        defaultlanguage="en"
        defaultlanguage_id=Language.find_by_shortname(defaultlanguage).id
        
        if !articles.nil? then
            if  params[:feed][:language].blank? or params[:feed][:language].to_i==1 then 
             articles=articles.where("language_id IS NULL OR language_id="+defaultlanguage_id.to_s)
             else
             articles=articles.where(language_id:Language.find_by_id(params[:feed][:language]).id)
            end
        end
        
      end
      return articles
  end
end
