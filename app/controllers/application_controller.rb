class ApplicationController < ActionController::API
  include Response
    rescue_from ActiveRecord::RecordNotFound do |exception|
    json_response({ error: exception.message }, :bad_request)
  end
  rescue_from ActiveRecord::RecordNotFound do |exception|
    json_response({ error: exception.message }, :not_found)
end
rescue_from ActiveRecord::RecordNotFound do |exception|
    json_response({ error: exception.message }, :not_found)
end
end