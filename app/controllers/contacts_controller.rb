class ContactsController < ApplicationController
    skip_before_action :ensure_login, only: [:new, :create]

    def new

    end

    def create

    end
end
