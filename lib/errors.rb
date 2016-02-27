module UdaciListErrors
    # Error classes go here
    class IndexExceedsListSize < StandardError
        def initialize
            @message = "IndexExceedsListSize error".colorize(:red)
            super(@message)
        end
    end

    class InvalidPriorityValue < StandardError
        def initialize
            @message = "InvalidPriorityValue error".colorize(:red)
            super(@message)
        end
    end

    class InvalidItemType < StandardError
        def initialize
            @message = "InvalidItemType error".colorize(:red)
            super(@message)
        end
    end
end
