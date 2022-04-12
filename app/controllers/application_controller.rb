class ApplicationController < ActionController::Base
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    def not_found
        render file: "#{Rails.root}/public/not_found.html", status: 404, layout: false
      end
end
