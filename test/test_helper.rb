ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  def sign_in(user)
    post user_session_path \
      'user[email]'    => user.email,
      'user[password]' => user.password
  end

  def sign_out(user)
    delete destroy_user_session_path \
      'user[email]'    => user.email
  end
end
