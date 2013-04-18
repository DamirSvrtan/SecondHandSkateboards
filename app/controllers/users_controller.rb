class UsersController < ApplicationController
	before_filter :signed_in_user, only: [:edit, :update]
	before_filter :correct_user, only: [:edit, :delete, :update]
  def show

	@user=User.find(params[:id])

	@decks = @user.decks
	@wheels = @user.wheels


        @skates = @user.skates
        @trucks = @user.trucks

        @garments = @user.garments
        @shoes = @user.shoes

        @hats = @user.hats
        @clothing_ostalos = @user.clothing_ostalos

        @skate_ostalos = @user.skate_ostalos
  end

  def new
	@user=User.new
	@imena=User.pluck(:name)
	@mailovi=User.pluck(:email)
  end

  def create
	@user=User.new(params[:user])
	if @user.save
		sign_in @user
		flash[:success] = "Dobrodosao!"
		redirect_to @user
	else 
		render 'new'
	end
  end

  def edit
	@user=User.find(params[:id])	
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end


  private

    def signed_in_user
      unless signed_in?
      store_location
      redirect_to signin_path, notice: "Please sign in." unless signed_in?
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end	
end
