require_relative 'common'

class Day3 < AdventDay
  def first_part
    gamma_bin = ""
    epsi_bin = ""
    counts = Hash.new(0)
    input.each do |data|
      data.split("").each_with_index do |digit, index|
        counts[index] += 1 if digit == "1"
      end
    end
    counts.sort.each do |nb|
      if nb.last > (input.size / 2)
        gamma_bin << "1"
        epsi_bin << "0"
      else
        gamma_bin << "0"
        epsi_bin << "1"
      end
    end
    power_consumption = gamma_bin.to_i(2) * epsi_bin.to_i(2)
  end

  def second_part
  end

  private

  def convert_data(data)
    super
  end

  def debug_input
    "00100\n11110\n10110\n10111\n10101\n01111\n00111\n11100\n10000\n11001\n00010\n01010"
  end
end



Day3.solve
