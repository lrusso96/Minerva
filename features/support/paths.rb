# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #

  def path_to(page_name)
    case page_name

    when /^homepage$/
      '/'
    when /^sign up page$/
      '/users/sign_up'
    when /^log in page$/
      '/users/sign_in'
    when /^contact page$/
      '/contact'
    when /^help page$/
      '/help'
    when /^settings page$/
      '/users/edit'
    when /^upload paper/
      '/users/1/papers/new'
    when /^users page/
      '/users/'
    when /^simple paper page/
      '/users/1/papers/1'
    when /^simple paper's issues page/
      '/users/1/papers/1/issues'
    when /^simple comment page/
      '/users/1/papers/1/issues/1/comments/new'
    when /^explore page/
      '/explore'

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = Regexp.last_match(1).split(/\s+/)
        send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" \
              "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
