if !ENV['RESQUE_WEB_HTTP_BASIC_AUTH_USER'].nil? && !ENV['RESQUE_WEB_HTTP_BASIC_AUTH_USER'].empty?
  Resque::Server.use Rack::Auth::Basic do |username, password|
    username == ENV['RESQUE_WEB_HTTP_BASIC_AUTH_USER']
    password == ENV['RESQUE_WEB_HTTP_BASIC_AUTH_PASSWORD']
  end
end