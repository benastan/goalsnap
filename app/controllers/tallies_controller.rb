class TalliesController < ApplicationController
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
    @tally = Tally.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tally }
    end
  end

  # GET /tallies/1/edit
  def edit
    @tally = Tally.find(params[:id])
  end

  # POST /tallies
  # POST /tallies.json
  def create
    @tally = Tally.new(params[:tally])

    respond_to do |format|
      if @tally.save
        format.html { redirect_to @tally, notice: 'Tally was successfully created.' }
        format.json { render json: @tally, status: :created, location: @tally }
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
      format.html { redirect_to tallies_url }
      format.json { head :no_content }
    end
  end
end
