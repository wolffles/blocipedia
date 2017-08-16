class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable



#Database Authenticatable: hashes and stores a password in the database to validate the authenticity of a user while signing in. The authentication can be done both through POST requests or HTTP Basic Authentication.
#Registerable: handles signing up users through a registration process, also allowing them to edit and destroy their account.
#Recoverable: resets the user password and sends reset instructions.
#Rememberable: manages generating and clearing a token for remembering the user from a saved cookie.
#Trackable: tracks sign in count, timestamps and IP address.
#Validatable: provides validations of email and password. It's optional and can be customized, so you're able to define your own validations.
#Confirmable: sends emails with confirmation instructions and verifies whether an account is already confirmed during sign in.
end
