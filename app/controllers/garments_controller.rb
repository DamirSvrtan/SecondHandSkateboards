class GarmentsController < ApplicationController
  before_filter :correct_user, only: [:destroy, :edit, :update]
  helper_method :sort_column, :sort_direction

  def new
         @garment = current_user.garments.build if signed_in?
  end

  def index
        @garments = Garment.order(sort_column + " " + sort_direction).paginate(:page => params[:page], :per_page => 10)
  end

  def show
        @garment=Garment.find(params[:id])
  end

  def edit
        @garment=Garment.find(params[:id])
  end

  def update
    @garment = Garment.find(params[:id])
    if @garment.update_attributes(params[:garment])
      redirect_to @garment
    else
      render 'edit'
    end
  end

  def create
        @garment = current_user.garments.build(params[:garment])
    if @garment.save
      redirect_to garments_path
    else
      render 'garments/new'
    end
  end

  def destroy
        @garment.destroy
        @user=User.find(@garment.user_id)
        redirect_to @user
  end

private

  def correct_user
      @garment = current_user.garments.find_by_id(params[:id])
      redirect_to root_path if @garment.nil?
  end
  
  def sort_column
    Garment.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end

end

