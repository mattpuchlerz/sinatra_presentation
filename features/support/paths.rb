module NavigationHelpers
  
  # Maps a static name to a static route.
  def path_to(page_name)
    case page_name
    when /the home page/
      '/'
    when /the games index page/
      '/games'
    when /the new game page/
      '/games/new'
    when /the show game page/
      "/games/#{ Game.first( :order => [:id.desc] ).id }"
    when /the edit game page/
      "/games/#{ Game.first( :order => [:id.desc] ).id }/edit"
    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in features/support/paths.rb"
    end
  end
  
end

World(NavigationHelpers)