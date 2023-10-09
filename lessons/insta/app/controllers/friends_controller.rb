class FriendsController < ApplicationController
    Friends = Friend

    def index
        @friends = Friend.all
    end

    def friendly     
        @friend = Friend.find_by user_id: current_user.id, friendly_unfriendly: params[:post_user_id]
        if @friend.nil?
            params[:friendly_unfriendly] = params[:post_user_id]
            create
        else
            params[:friendly_unfriendly] = params[:post_user_id]
            delete
        end
    end
    
    private

    def create
        @friend = Friend.create(user_id: current_user.id, friendly_unfriendly: params[:friendly_unfriendly])
        redirect_to root_path
    end

    def delete
        Friend.delete(@friend)
        redirect_to root_path
    end

    def friend_params
        params.permit(:user_id, :friendly_unfriendly)
  
      end
  end
