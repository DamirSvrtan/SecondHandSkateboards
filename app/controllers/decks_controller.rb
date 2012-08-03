class DecksController < ApplicationController
  before_filter :signed_in_user
  before_filter :correct_user, only: [:destroy, :edit, :update]

  def index
	@decks = Deck.all
	@users = User.all
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
      flash[:success] = "Oglas editiran!"
      redirect_to @deck
    else
      render 'edit'
    end
  end


  def create
	@deck = current_user.decks.build(params[:deck])
    if @deck.save
      flash[:success] = "Napravljen oglas!"
      redirect_to decks_path
    else
      render 'static_pages/home'
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

end
