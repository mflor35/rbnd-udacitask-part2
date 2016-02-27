class TodoItem
    include Listable
    attr_reader :description, :due, :priority

    def initialize(description, options={})
        @description = description
        @due = options[:due] ? Chronic.parse(options[:due]) : options[:due]
        @priority = options[:priority] if options[:priority]
        raise UdaciListErrors::InvalidPriorityValue unless valid_priority?
    end

    def format_date
        @due ? @due.strftime("%D") : "No due date".colorize(:magenta)
    end

    def format_priority
        value = " ⇧".colorize(:red) if @priority == "high"
        value = " ⇨".colorize(:yellow) if @priority == "medium"
        value = " ⇩".colorize(:green) if @priority == "low"
        value = "" if !@priority
        return value
    end

    def details
        format_description.colorize(:white) + "due: " +
        format_date +
        format_priority
    end

    private

    def valid_priority?
        return ["high","medium","low",nil].include?(@priority)
    end
end
