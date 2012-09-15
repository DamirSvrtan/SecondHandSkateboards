class StaticPagesController < ApplicationController
  def home
	@deck = current_user.decks.build if signed_in?
	@wheel = current_user.wheels.build if signed_in?
	@truck = current_user.trucks.build if signed_in?
        @skate = current_user.skates.build if signed_in?
        @skate_ostalo = current_user.skate_ostalos.build if signed_in?
	@garment = current_user.garments.build if signed_in?
        @shoe = current_user.shoes.build if signed_in?
        @hat = current_user.hats.build if signed_in?
        @clothing_ostalo = current_user.clothing_ostalos.build if signed_in?

  end

  def help
  end

  def about
  end

  def contact
  end

  def objavi
        @deck = current_user.decks.build if signed_in?
        @wheel = current_user.wheels.build if signed_in?
        @truck = current_user.trucks.build if signed_in?
        @skate = current_user.skates.build if signed_in?
        @skate_ostalo = current_user.skate_ostalos.build if signed_in?
	@garment = current_user.garments.build if signed_in?
        @shoe = current_user.shoes.build if signed_in?
        @hat = current_user.hats.build if signed_in?
        @clothing_ostalo = current_user.clothing_ostalos.build if signed_in?	
  end

end
