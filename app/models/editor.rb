class Editor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable

  attr_readonly :email
  validates_format_of :email, with: /\@tcd\.ie/, message: 'You should have an email from tcd.ie'
end
