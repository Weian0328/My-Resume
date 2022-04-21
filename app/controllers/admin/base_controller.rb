class Admin::BaseController < ApplicationController
    before_action :check_permission

    private
    def check_permission
        available_roles = ["admin", "staff"]
        redirect_to root_path unless (user_signed_in? && current_user.role.in? (available_roles))
    end
end