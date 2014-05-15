class ArticleController < ApplicationController
before_filter :authenticate_user!, :only => [:write,:edit]
  
  def report
  r=ReportArticle.where(user_id:@user.id,article_id:params[:id],report_type:params[:report])
    if r.empty?
        a=Article.find(params[:id])
        if params[:report].to_i==1
            if a.reportev.nil? then a.update(reportev:2) else a.update(reportev:a.reportev+1)  end
        else
            if a.reportco.nil? then a.update(reportco:2) else a.update(reportco:a.reportco+1)  end
        end
        ReportArticle.create(user_id:@user.id,article_id:params[:id],report_type:params[:report])
    end
    flash[:notice] = "Thanks for Reporting!"
    redirect_to "/article/show/"+params[:id].to_s
  end
  
  def show
  
  @article=Article.find(params[:id])
  @config={
  css:"article",
  js:"article",
  title:"Tordate - "+@article.headling.to_s,
  image:"http://tordate.com"+@article.picture.url
  }
    if params[:json]
        render  json:@article
    end
    
    
  if !@user.blank?
  vote=VoteArticle.where(user_id:@user.id,article_id:params[:id]).first
      @voted_up=false
      @voted_down=false
      if(!vote.blank?)
        if  vote.is_up
            @voted_up = true
        else
            @voted_down = true
        end
      end
  end
  
  end

  def edit
  @error=[]
  @article=Article.find(params[:id])
   @config={css:"writearticle",js:"writearticle",title:"Tordate - Writing Article:"+@article.headling.to_s}
  if @article.score>get_config("trending").to_i
    @error.push("This article has too many votes to be edited.")
  end
  if @article.user_id!=@user.id
     @error.push("This article does not belong to you")
  end
  end
  
  def destroy
      article=Article.find(params[:id])
      @error=[]
  if article.score>get_config("trending").to_i
     @error.push("This article has too many votes to be destroyed")
  end
  if article.user_id!=@user.id
     @error.push("This article does not belong to you")
  end
  if article.score<get_config("trending").to_i and article.user_id==@user.id
    @destroyed=article.destroy
  end
  
  end
  
  def save
  article=Article.find(params[:id])
  if article.score<get_config("trending").to_i and article.user_id==@user.id
      article.body=params[:body]
      article.save
       params[:evidence].each do |key, e|
            if(!e.blank?)
            evidence=Evidence.new
            evidence.url=e[:url]
            evidence.score=0
            evidence.description=e[:desc]
            evidence.article=article
            evidence.save
            end
        end
      redirect_to "/article/show/"+article.id.to_s
  else
    redirect_to "/article/edit/"+article.id.to_s
  end
  end
  
  def write
  @config={css:"writearticle",js:"writearticle",title:"Tordate - Writing Article"}
    if params[:writing]
        article= Article.new(article_params)
        article.score=0
        if !@user.blank?
        article.user_id=@user.id
        else
        redirect_to "/user/login"
        end
        article.save
        params[:evidence].each do |key, e|
            if(!e.blank?)
            evidence=Evidence.new
            evidence.url=e[:url]
            evidence.score=0
            evidence.description=e[:desc]
            evidence.article=article
            evidence.save
            end
        end
        if !params[:category].blank?
            params[:category].each do |key, val|
                if val
                    Categorize.create(article_id:article.id,category_id:key)
                end
            end
        end
        if !params[:region].blank?
            Regionalize.create(article_id:article.id,region_id:params[:region])
        end
        
        
        redirect_to "/article/show/"+article.id.to_s
    end 
  end
  
  
  private
  def article_params
    params.require(:article).permit(:headling,:header,:body,:picture,:language_id)
  end
  
  private 
  def evidences
    params.require(:evidence).permit(:url)
  end
    
end
