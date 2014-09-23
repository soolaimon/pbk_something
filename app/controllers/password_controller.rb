require 'pbkdf2'
require 'openssl'
class PasswordController < ApplicationController

  def authenticate
    hash = "CAC5E4E279C26F2493A0307F0616A5B1BA190BC1"
    salt = "89CC26F6B005043B"
    encrypted = pbkdf2(params[:password], salt)

    if encrypted == hash
      flash[:notice] = "Password is valid."
    else
      flash[:alert] = "You did it wrong. C'mon, man."
    end

    render :index

  end

  private

  def pbkdf2(pass, salt, iterations=2000, key_length=20)
    hex_coded_salt  = [salt].pack('H*')
    salted_password = OpenSSL::PKCS5.pbkdf2_hmac_sha1(pass, hex_coded_salt, iterations, key_length)
    hex_password    = salted_password.unpack('H*')[0]
   
    hex_password.upcase
  end
end
 
