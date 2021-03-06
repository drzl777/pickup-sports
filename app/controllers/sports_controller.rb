class SportsController < ApplicationController
  before_action :verify, except: [:index, :show]

  def index
    if params[:sports]
      @sports = Sport.where("LOWER(name) LIKE ?", "%#{params[:sports].downcase}%")
    else
      @sports = Sport.all
    end
  end

  def new
    @sport = Sport.new
  end

  def create
    @sport = Sport.new(sports_params)
    if @sport.save
      redirect_to sport_path(@sport)
    else
      if @sport.errors.any?
        flash[:danger] = @sport.errors.full_messages
      else
        flash[:danger] = "There was an error with your submission"
      end
      render :new
    end
  end

  def show
    @sport = Sport.find(params[:id])
  end

  def edit
    @sport = Sport.find(params[:id])
  end

  def update
    @sport = Sport.find(params[:id])
    @sport.update(sports_params)
    redirect_to sport_path(@sport)
  end

  private

  def sports_params
    params.require(:sport).permit(:name, :image)
  end
end
