require_relative 'common'

class Day4 < AdventDay

  def first_part
    nbs = input.first.split(",").map { |nb| nb.to_i}

    boards = Hash.new(0)
    i = 1
    input[1..-1].each do |ary|
      if ary.empty?
        i += 1;
        boards[i] = []
      else
        boards[i] << ary.split(" ").map { |nb| nb.to_i }
      end
    end

    drawn_nbs = []
    nbs.each do |nb|
      drawn_nbs << nb

      boards.each do | board, rows|
        rows.each do |row|
          if row.all? { |row_nb| drawn_nbs.include?(row_nb) }
            sum = rows.flatten.reject { |sum_nb| drawn_nbs.include?(sum_nb) }.sum
            return {
              board: board,
              location: "row",
              last_drawn_nb: drawn_nbs.last,
              winning_turn: drawn_nbs.index(drawn_nbs.last) + 1,
              result: sum * drawn_nbs.last
            }
          end
        end
        rows.transpose.each do |column|
          if column.all? { |column_nb| drawn_nbs.include?(column_nb) }
            sum = rows.transpose.flatten.reject { |sum_nb| drawn_nbs.include?(sum_nb) }.sum
            return {
              board: board,
              location: "column",
              last_drawn_nb: drawn_nbs.last,
              winning_turn: drawn_nbs.index(drawn_nbs.last) + 1,
              result: sum * drawn_nbs.last
            }
          end
        end
      end
    end
  end

  def second_part
    nbs = input.first.split(",").map { |nb| nb.to_i}

    boards = Hash.new(0)
    winning_boards = Hash.new(0)

    i = 0
    input[1..-1].each do |ary|
      if ary.empty?
        i += 1;
        boards[i] = []
      else
        boards[i] << ary.split(" ").map { |nb| nb.to_i }
      end
    end

    drawn_nbs = []
    nbs.each do |nb|
      drawn_nbs << nb

      boards.each do | board, rows|
        rows.each do |row|
          if row.all? { |row_nb| drawn_nbs.include?(row_nb) }
            sum = rows.flatten.reject { |sum_nb| drawn_nbs.include?(sum_nb) }.sum
            winning_turn = drawn_nbs.index(drawn_nbs.last) + 1
            winning_boards[board] = {
              winning_turn: winning_turn,
              location: "row",
              result: sum * drawn_nbs.last
            } unless winning_boards.key?(board)
          end
        end
        rows.transpose.each do |column|
          if column.all? { |column_nb| drawn_nbs.include?(column_nb) }
            sum = rows.transpose.flatten.reject { |sum_nb| drawn_nbs.include?(sum_nb) }.sum
            winning_turn = drawn_nbs.index(drawn_nbs.last) + 1
            winning_boards[board] = {
              winning_turn: winning_turn,
              location: "row",
              result: sum * drawn_nbs.last
            } unless winning_boards.key?(board)
          end
        end
      end
    end
    winning_boards
  end

  private

  def convert_data(data)
    super
  end

  def debug_input
    "7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1\n\n22 13 17 11  0\n 8  2 23  4 24\n21  9 14 16  7\n 6 10  3 18  5\n 1 12 20 15 19\n\n 3 15  0  2 22\n 9 18 13 17  5\n19  8  7 25 23\n20 11 10 24  4\n14 21 16 12  6\n\n14 21 17 24  4\n10 16 15  9 19\n18  8 23 26 20\n22 11 13  6  5\n 2  0 12  3  7"
  end
end

Day4.solve
