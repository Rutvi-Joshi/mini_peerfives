class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update]

    def index
      @users = User.all
    end
  
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to users_path, notice: 'User was 
         created.'
      else
        render :new
      end
    end
  
    def show
      @p5_history = RewardHistory.where(given_by: @user.id)
      @reward_history = RewardHistory.where(given_to: @user.id)
    end
  
    def edit
        @user
    end
  
    def update
      if @user.update(user_params)
        redirect_to @user, notice: 'User was successfully updated.'
      else
        render :edit
      end
    end
  
    private
      def set_user
        @user = User.find(params[:id])
      end
  
      def user_params
        params.require(:user).permit(:name)
      end
end
