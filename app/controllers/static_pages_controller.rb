class StaticPagesController < ApplicationController
  def home
	@deck = current_user.decks.build if signed_in?
  end

  def help
  end

  def about
  end

  def contact
  end
end
