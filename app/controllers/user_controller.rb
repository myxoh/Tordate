class UserController < ApplicationController
  def profile
    
    if params[:id].nil? and @user.blank?
    redirect_to "/user/login"
    else if params[:id].nil?
    @u=@user
    else
    @u=User.find_by_id(params[:id])
    end
    end
    @config={css:"profile", title:"Tordate - "+get_name(@u)}
  end

  def follow
      if(!@user.blank? and !params[:followed].blank?)
        if Follow.find_by(follower_id:@user.id,followed_id:params[:followed]).nil?
        Follow.create(follower_id:@user.id,followed_id:params[:followed])
        end
      end
  end

  def unfollow
  if !Follow.find_by_id(params[:id]).nil? then Follow.find_by_id(params[:id]).destroy end
  redirect_to "/user/follow"
  end

  def login
  user=User.find_by_email(params[:email])
  if !user.blank? and user.password==params[:password] then 
      session[:user]=user.id 
      if params[:old_direction].blank?
        redirect_to "/"
      else
        redirect_to params[:old_direction]
      end
  else
      if params[:old_direction].blank?
        redirect_to "/"
      else
        redirect_to params[:old_direction]
      end
  end
  
  end

  def register
  if params[:registering]
    if params[:user][:password]==params[:checkpassword]
    errors=[]
        if validators(user_params,errors)
            u=User.create(user_params)
            session[:user]=u.id
            redirect_to "/"
        end
    end
  end
  end
  
  def logout
    session[:user]=""
    redirect_to "/"
  end
  
  
  private
  def user_params
  params.require(:user).permit(:name,:surname,:email,:password)
  end
  
  private
  def validators(to_check, errors)
  return true
  end
end
