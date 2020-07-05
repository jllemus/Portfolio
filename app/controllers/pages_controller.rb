class PagesController < ApplicationController

    skip_before_action :ensure_login, only: [:home, :about]
    
    def home
    end

    def about
        default_user = User.find_by(username: 'admin')
        if logged_in?
        end
    end

    def contact
        
    end
end
