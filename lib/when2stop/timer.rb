class Timer
  def initialize options
    @start_time = Time.now
    @remaining_time = options[:for] || 10.minutes
    @total_elapsed_time = 0
    @iteration_max_time = 0
  end

  def there_is_more_time?
    previous_elapsed_time = @total_elapsed_time
    @total_elapsed_time = Time.now - @start_time
    current_iteration_time = @total_elapsed_time - previous_elapsed_time
    @iteration_max_time = [@iteration_max_time, current_iteration_time].max
    @remaining_time -= current_iteration_time
    puts "Elapsed time: #{@total_elapsed_time} - Remaining time: #{@remaining_time} - Iteration max time: #{@iteration_max_time}"
    @remaining_time > @iteration_max_time
  end

  def get_elapsed_time
    @total_elapsed_time
  end
end