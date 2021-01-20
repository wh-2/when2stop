require "when2stop/railtie"

module When2stop
  require 'when2stop/timer'

  def iterate options = { for: 10.minutes }, &block
    timer = Timer.new for: options[:for]

    enum = options[:enum] || false
    if enum
      enum.each do |el|
        if timer.there_is_more_time?
          ret = block.call el
          if options.has_key? :break_when_returns and ret == options[:break_when_returns]
            break
          end
        else
          break
        end
      end
    else
      begin
        ret = block.call
        if options.has_key? :break_when_returns and ret == options[:break_when_returns]
          break
        end
      end while timer.there_is_more_time?
    end

    timer.get_elapsed_time
  end
end
