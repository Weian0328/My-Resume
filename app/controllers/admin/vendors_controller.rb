class Admin::VendorsController < ApplicationController
    def index
        @vendors = User.where(role: "vendor")
    end

    def new
        @vendor = User.new
    end

    def create
        @vendor = User.new(vendor_params)
        @vendor.role = "vendor"

        if @vendor.save
            redirect_to admin_vendors_path, notice: "已成功新增"
        else
            render :new
        end
    end

    def vendor_params
        params.require(:user).permit(:email, :username, :password, :password_confirmation).merge(role: 'vendor')
    end
end
