class DecksController < ApplicationController
  before_filter :correct_user, only: [:destroy, :edit, :update]
  helper_method :sort_column, :sort_direction


  def new
        @deck = current_user.decks.build if signed_in?
  end

  def index
	@decks = Deck.order(sort_column + " " + sort_direction).paginate(:page => params[:page], :per_page => 3)
  end

  def show
	@deck=Deck.find(params[:id])
  end

  def edit
	@deck=Deck.find(params[:id])
  end

  def update
    @deck = Deck.find(params[:id])
    if @deck.update_attributes(params[:deck])
      redirect_to @deck
    else
      render 'edit'
    end
  end


  def create
	@deck = current_user.decks.build(params[:deck])
    if @deck.save
      redirect_to decks_path
    else
      render 'decks/new'
    end
  end

  def destroy
	@deck.destroy
	@user=User.find(@deck.user_id)
	redirect_to @user
  end

private

    def correct_user
      @deck = current_user.decks.find_by_id(params[:id])
      redirect_to root_path if @deck.nil?
    end

     def sort_column
   	 Deck.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
     end

     def sort_direction
    	%w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
     end

end
