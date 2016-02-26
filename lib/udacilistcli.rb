class UdaciListCli < Thor
  desc "create LIST_TITLE", "create a list with LIST_NAME"
  method_option :create, :aliases => "-c", :desc => "creates a list wiht the given LIST_TITLE"
  def create(list_title)
    puts "Creating list with title: #{list_title}"
    create_list = options[:create]
    if create_list
      puts "You specified that you would like to create #{list_title}"
    else
      puts "You do not want to create #{list_title}"
    end
  end
end
