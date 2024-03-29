class ShoesController < ApplicationController
  before_filter :correct_user, only: [:destroy, :edit, :update]
  helper_method :sort_column, :sort_direction

  def new
         @shoe = current_user.shoes.build if signed_in?
  end

  def index
        @shoes = Shoe.order(sort_column + " " + sort_direction).paginate(:page => params[:page], :per_page => 10)
  end

  def show
        @shoe=Shoe.find(params[:id])
  end

  def edit
        @shoe=Shoe.find(params[:id])
  end

  def update
    @shoe = Shoe.find(params[:id])
    if @shoe.update_attributes(params[:shoe])
      redirect_to @shoe
    else
      render 'edit'
    end
  end

  def create
        @shoe = current_user.shoes.build(params[:shoe])
    if @shoe.save
      redirect_to shoes_path
    else
      render 'shoes/new'
    end
  end

  def destroy
        @shoe.destroy
        @user=Shoe.find(@shoe.user_id)
        redirect_to @user
  end

private

  def correct_user
      @shoe = current_user.shoes.find_by_id(params[:id])
      redirect_to root_path if @shoe.nil?
  end
  
  def sort_column
    Shoe.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end

end

