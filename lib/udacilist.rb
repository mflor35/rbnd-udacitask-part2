class UdaciList
  attr_reader :title, :items

  def initialize(options={:title => "UNTITLED LIST"})
    @title = options[:title]
    @items = []
  end

  def add(type, description, options={})
    begin
      type = type.downcase
      raise UdaciListErrors::InvalidItemType unless valid_type?(type)
      @items.push TodoItem.new(description, options) if type == "todo"
      @items.push EventItem.new(description, options) if type == "event"
      @items.push LinkItem.new(description, options) if type == "link"
    rescue Exception => message
      puts message
    end
  end

  def delete(index)
    begin
      raise UdaciListErrors::IndexExceedsListSize unless index < items.count
      @items.delete_at(index - 1)
    rescue Exception => message
      puts message
    end

  end

  def all
    puts "-" * @title.length
    puts @title.colorize(:cyan)
    puts "-" * @title.length
    @items.each_with_index do |item, position|
      puts "#{position + 1}) #{item.details}"
    end
  end

  private
  def valid_type?(type)
    return ['todo','event','link'].include?(type)
  end

end
