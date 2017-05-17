class AdminsController < ApplicationController
	before_action :authenticate_admin!

	def home
	end

    def manage
      @admins = Admin.all
    end
end
