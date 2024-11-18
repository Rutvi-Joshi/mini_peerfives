class RewardHistoriesController < ApplicationController
        before_action :set_user
      
        def new
          @reward_history = RewardHistory.new
        end
      
        def create
            params[:reward_history][:given_to] = params[:reward_history][:given_to].to_i
          @reward_history = RewardHistory.new(reward_history_params)
          @reward_history.given_by = @user.id
      
          if @reward_history.save
            # Deduct points from the user's P5 balance
            @user.update(p5_balance: @user.p5_balance - @reward_history.points)
            redirect_to user_reward_histories_path(@user), notice: 'Reward successfully given.'
          else
            render :new
          end
        end
      
        private
      
        def set_user
            @user = User.find(params[:user_id])
        end
      
        def reward_history_params
          params.require(:reward_history).permit(:points, :given_to)
        end
end