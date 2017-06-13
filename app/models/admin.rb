class Admin < ActiveRecord::Base
  include DeviseInvitable::Inviter
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable

  attr_readonly :email
  validates_format_of :email, with: /piranhatcd\@gmail\.com/, message: "There is only one admin account"
end
