require 'pbkdf2'
class PasswordController < ApplicationController
  def authenticate
    hash = "CAC5E4E279C26F2493A0307F0616A5B1BA190BC1"
    salt = "89CC26F6B005043B"
    encrypted = PBKDF2.new(password: params[:password], salt: salt, iterations: 2000)

    binding.pry

    if encrypted.hex_string == hash
      flash[:notice] = "Password is valid."
    else
      flash[:alert] = "You did it wrong. C'mon, man."
    end

    render :index

  end

end
