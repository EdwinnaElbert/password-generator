class PasswordsController < ApplicationController

  def new
    @password = Password.new
  end

  def create
    @password = Password.new(password_params)

    if @password.save
      redirect_to @password
    else
      render :new
    end
  end

  def show
    @password = Password.find(params[:id])
  end

  def destroy
     @password = Password.find(params[:id])
     @password.destroy
     redirect_to passwords_path
  end

  private

  def password_params
    params.require(:password)
          .permit(user_inputs: [])
          .merge(combinations: GenerateCombinations.new(params.dig(:password, :user_inputs)).call)
  end

end
