require_relative 'common'

class Day2 < AdventDay
  def first_part
    x = 0
    y = 0
    input.each do |data|
      data = data.split
      nb = data.last.to_i
      case data.first
      when "forward"
        x += nb
      when "up"
        y -= nb
      when "down"
        y += nb
      end
    end
    coordinates = x * y
  end

  def second_part
    x = 0
    y = 0
    aim = 0

    input.each do |data|
      data = data.split
      nb = data.last.to_i
      case data.first
      when "forward"
        x += nb
        if aim > 0
          y += nb * aim
        end
      when "up"
        aim -= nb
      when "down"
        aim += nb
      end
    end
    coordinates = x * y
  end

  private

  def convert_data(data)
    super
  end

  def debug_input
    "forward 5\ndown 5\nforward 8\nup 3\ndown 8\nforward 2"
  end
end

Day2.solve
