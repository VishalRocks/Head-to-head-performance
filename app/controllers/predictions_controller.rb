class PredictionsController < ApplicationController
  before_action :set_prediction, only: [:show, :edit, :update, :destroy]

  # GET /predictions
  # GET /predictions.json
  def index
    @predictions = Prediction.all
  end

  # GET /predictions/1
  # GET /predictions/1.json
  def show
	@count=0    		    # to count the favourable outcomes
	@i=0        		    # initialising a counter
	require 'distribution'      # using the gem
	@normal1 = Distribution::Normal.rng(@prediction.rating1.to_f,@prediction.volatility1.to_f)
	@normal2 = Distribution::Normal.rng(@prediction.rating2.to_f,@prediction.volatility2.to_f)
	# creating two arrays with the normally distributed values for respective players with mean as rating and standard devaition as volatility
	@norm1_distribution = 10_000.times.map {@normal1.call.to_f}	
	@norm2_distribution = 10_000.times.map {@normal2.call.to_f}
	while @i<10000 do
		if @norm1_distribution[@i]>@norm2_distribution[@i]
			@count=@count+1					#incrementing favourable outcomes
		end
		@i=@i+1
	end
	@percent1=(@count)/100           # % for 1st player
	@percent2=100-@percent1          # % for 2nd player
  end

  # GET /predictions/new
  def new
    @prediction = Prediction.new
  end

  # GET /predictions/1/edit
  def edit
  end

  # POST /predictions
  # POST /predictions.json
  def create
    @prediction = Prediction.new(prediction_params)
    respond_to do |format|
      if @prediction.save
        format.html { redirect_to @prediction, notice: 'Prediction was successfully created.' }
        format.json { render action: 'show', status: :created, location: @prediction }
      else
        format.html { render action: 'new' }
        format.json { render json: @prediction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /predictions/1
  # PATCH/PUT /predictions/1.json
  def update
    respond_to do |format|
      if @prediction.update(prediction_params)
        format.html { redirect_to @prediction, notice: 'Prediction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @prediction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /predictions/1
  # DELETE /predictions/1.json
  def destroy
    @prediction.destroy
    respond_to do |format|
      format.html { redirect_to predictions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prediction
      @prediction = Prediction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prediction_params
      params.require(:prediction).permit(:rating1, :volatility1, :rating2, :volatility2)
    end
end
