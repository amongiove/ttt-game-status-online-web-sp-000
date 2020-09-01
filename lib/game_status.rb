board = [" ", " ", " ", " ", " ", " ", " ", " ", " ",]

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6],[0,3,6],[1,4,7],[2,5,8]
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|

    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if board.any?{|index| index == "X" || index == "O"}
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      elsif board.all?{|index| index == "X" || index == "O"}
        return false
      else
        false
      end
    else
     return false
    end
  end
end

def full?(board)
  if board.all?{|index| index == "X" || index == "O"}
    return true
  elsif board.any?{|index| index == "X" || index == "O"}
    return false
  else return false
  end
end

def draw?(board)
  if won?(board) == true
    return false
  elsif won?(board) == false && full?(board) == true
    return true
  else
   return false
  end
end

def over?(board)
  if won?(board) == true || draw?(board) == true || full?(board) == true
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board) == true
    return board[win_index_1]
  else
    return nil
  end
end
