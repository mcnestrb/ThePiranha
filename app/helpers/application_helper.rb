module ApplicationHelper
    def is_verified_editor?
        return current_editor['verified'] == true
    end
end
