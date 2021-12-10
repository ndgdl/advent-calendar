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
    counts = Hash.new(0)
    oxygen_data = input

    i = 0

    while oxygen_data.size > 1 do

      oxygen_data.each do |data|
        counts[i] += data[i] == "1" ? 1 : 0
      end

      oxygen_data = oxygen_data.select do |data|
        data[i] == (counts[i] >= (oxygen_data.size - counts[i]) ? "1" : "0")
      end

      i += 1
    end

    counts = Hash.new(0)
    co2_data = input

    i = 0

    while co2_data.size > 1 do

      co2_data.each do |data|
        counts[i] += data[i] == "1" ? 1 : 0
      end

      co2_data = co2_data.select do |data|
          data[i] == (counts[i] >= (co2_data.size - counts[i]) ? "0" : "1")
        end

      i += 1
    end

    oxygen_data.join.to_i(2) * co2_data.join.to_i(2)
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
