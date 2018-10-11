# Set sentry to filter out certain parameters (e.g. :password)
Raven.configure do |config|
  config.sanitize_fields = Rails.application.config.filter_parameters.map(&:to_s)
end