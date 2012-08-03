class SessionsController < ApplicationController

def new
end

def create
	user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or user
    else
      flash.now[:error] = 'Unesena kriva kombinacija E-maila i Lozinke. Probaj opet! U slucaju zaboravljanja lozinke posalji mail na podrska@2ndHandSkaters.com'
      render 'new'
    end
end

def destroy
    sign_out
    redirect_to root_path
end





end
