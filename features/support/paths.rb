module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the signup page$/ then '/users/sign_up'
    when /^the login page$/ then '/users/sign_in'
    when /^the join us page$/ then '/'
    when /^the "(.*)" user page$/ then '/index/'+String(User.find_by(email: $1) ? User.find_by_email($1).id : '')
    when /^the admin page$/ then '/admin'
    when /^the profile page$/ then '/profile'

    when /^the home page of the website$/
      '/'
    when /^the home page of the forum$/
      '/forum'

    when /^the new post page$/
      '/posts/new'
      
    when /^the (.*) section$/
      page_name =~ /^the (.*) page$/
      section_name = $1
      '/'
      
    when /^the "(.*)" detail page$/ then '/posts/'+String(Post.find_by_title($1).id)


    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end



World(NavigationHelpers)
