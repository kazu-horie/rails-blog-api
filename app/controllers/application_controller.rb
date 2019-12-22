class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound do |_exception|
    head(:not_found)
  end
end
