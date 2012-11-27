class TalliesController < ApplicationController
  before_filter :must_be_logged_in

  # GET /tallies
  # GET /tallies.json
  def index
    @tallies = Tally.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tallies }
    end
  end

  # GET /tallies/1
  # GET /tallies/1.json
  def show
    @tally = Tally.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tally }
    end
  end

  # GET /tallies/new
  # GET /tallies/new.json
  def new
    @axis_type = params[:axis_type]
    @axis_collection = user.send(@axis_type.underscore.pluralize.to_sym).uniq { |m| m.id }

    @tally = user.tallies.new(
      axis_type: @axis_type
    )

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tally }
    end
  end

  # GET /tallies/1/edit
  def edit
    @tally = Tally.find(params[:id])
    @axis_type = @tally.axis_type
  end

  # POST /tallies
  # POST /tallies.json
  def create
    @tally = Tally.new(params[:tally])

    respond_to do |format|
      if @tally.save
        format.html { redirect_to [user, GoalReward], notice: 'Tally was successfully created.' }
        format.json { render json: @tally, status: :created, location: [user, @tally] }
      else
        format.html { render action: "new" }
        format.json { render json: @tally.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tallies/1
  # PUT /tallies/1.json
  def update
    @tally = Tally.find(params[:id])

    respond_to do |format|
      if @tally.update_attributes(params[:tally])
        format.html { redirect_to @tally, notice: 'Tally was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tally.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tallies/1
  # DELETE /tallies/1.json
  def destroy
    @tally = Tally.find(params[:id])
    @tally.destroy

    respond_to do |format|
      format.html { redirect_to user_tallies_url(user) }
      format.json { head :no_content }
    end
  end

  private

  def user
    unless @user
      @user = User.find params[:user_id] rescue nil
      unless @user
        @user = current_user
      end
    end
    @user
  end
  helper_method :user
end
