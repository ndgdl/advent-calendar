require_relative 'common'

class Day1 < AdventDay
  def first_part
    previous_data = nil
    increase_count = 0

    input.each do |data|
      new_data = data

      if !previous_data.nil? && new_data > previous_data
        increase_count += 1
      end

      previous_data = data
    end

    increase_count
  end

  def second_part
    input.last(2).map(&:to_s).map(&:reverse).map(&:to_i).sum
    previous_sum = nil
    nbs = input

    count = 0

    until nbs.size < 3
      if nbs.size >= 3
        sum = nbs.first(3).sum
        nbs.delete_at(0)
      end

      if !previous_sum.nil? && sum > previous_sum
        count += 1
      end
      previous_sum = sum
    end

    count
  end

  private

  def convert_data(data)
    super.map(&:to_i)
  end

  def debug_input
    "199\n200\n208\n210\n200\n207\n240\n269\n260\n263"
  end
end

Day1.solve
