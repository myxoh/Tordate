class VoteController < ApplicationController
  def up
  vote=VoteArticle.where(user_id:@user.id,article_id:params[:id]).first
  article=Article.find(params[:id])
  if(vote.blank?) then
      #CASO 1: PRIMER VOTO / LO CUENTO
      VoteArticle.create(user_id:@user.id,article_id:params[:id],is_up:true)
      article.update(score:article.score+(get_config("vote_power").to_i))
      render json:{"selected"=>true}
  else if(!vote.is_up) then
        #CASO 2: HABIA VOTADO LO OTRO / BORRO EL OTRO VOTO SUMO ESTE
        vote.update(is_up:true)
        article.update(score:article.score+(get_config("vote_power").to_i)*2)
        render json:{"selected"=>true}
        else
        #CASO 3: YA HABIA HECHO EL VOTO - Esta borrandolo!
        vote.destroy
        article.update(score:article.score-(get_config("vote_power").to_i))
        render json:{"selected"=>false}
       end
       
  end
  
  end

  def down
  
  vote=VoteArticle.where(user_id:@user.id,article_id:params[:id]).first
  article=Article.find(params[:id])
  if(vote.blank?) then
      #CASO 1: PRIMER VOTO / LO CUENTO
      VoteArticle.create(user_id:@user.id,article_id:params[:id],is_up:false)
      
      article.update(score:article.score-(get_config("vote_power").to_i))
      render json:{"selected"=>true}
  else if(vote.is_up) then
        #CASO 2: HABIA VOTADO LO OTRO / BORRO EL OTRO VOTO SUMO ESTE
        vote.update(is_up:false)
        article.update(score:article.score-(get_config("vote_power").to_i)*2)
        render json:{"selected"=>true}
        else
        #CASO 3: YA HABIA HECHO EL VOTO - Esta borrandolo!
        vote.destroy
        article.update(score:article.score+(get_config("vote_power").to_i))
        render json:{"selected"=>false}
       end
       
  end
  end
  
  def show
  vote=VoteArticle.where(user_id:@user.id,article_id:params[:id]).first
  @id=params[:id]
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
