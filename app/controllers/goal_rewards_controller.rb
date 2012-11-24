class GoalRewardsController < ApplicationController
  # GET /goal_rewards
  # GET /goal_rewards.json
  def index
    @goal_rewards = GoalReward.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @goal_rewards }
    end
  end

  # GET /goal_rewards/1
  # GET /goal_rewards/1.json
  def show
    @goal_reward = GoalReward.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @goal_reward }
    end
  end

  # GET /goal_rewards/new
  # GET /goal_rewards/new.json
  def new
    @goal_reward = GoalReward.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @goal_reward }
    end
  end

  # GET /goal_rewards/1/edit
  def edit
    @goal_reward = GoalReward.find(params[:id])
  end

  # POST /goal_rewards
  # POST /goal_rewards.json
  def create
    @goal_reward = GoalReward.new(params[:goal_reward])

    respond_to do |format|
      if @goal_reward.save
        format.html { redirect_to @goal_reward, notice: 'Goal reward was successfully created.' }
        format.json { render json: @goal_reward, status: :created, location: @goal_reward }
      else
        format.html { render action: "new" }
        format.json { render json: @goal_reward.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /goal_rewards/1
  # PUT /goal_rewards/1.json
  def update
    @goal_reward = GoalReward.find(params[:id])

    respond_to do |format|
      if @goal_reward.update_attributes(params[:goal_reward])
        format.html { redirect_to @goal_reward, notice: 'Goal reward was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @goal_reward.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goal_rewards/1
  # DELETE /goal_rewards/1.json
  def destroy
    @goal_reward = GoalReward.find(params[:id])
    @goal_reward.destroy

    respond_to do |format|
      format.html { redirect_to goal_rewards_url }
      format.json { head :no_content }
    end
  end
end
