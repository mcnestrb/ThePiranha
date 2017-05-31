class EditorsController < ApplicationController
	before_action :authenticate_editor!
	before_action :is_verified_editor?

    def home
    end
end
