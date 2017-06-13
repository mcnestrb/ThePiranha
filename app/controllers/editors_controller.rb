class EditorsController < ApplicationController
	before_action :authenticate_editor!

    def home
    end
end
