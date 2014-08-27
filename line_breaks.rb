require 'awesome_print'


def find_next_space(place_in_array)
  distance_to_next_space = 1
  element = "a"
  while element != " " && element != nil do
    element = @text_array[place_in_array + distance_to_next_space]
    distance_to_next_space += 1
  end
  distance_to_next_space - 1
end

what = "data/what!?.txt"
awesome = "data/awesome-sauce.txt"
i_knew = "data/I knew them before they were popular.txt"

file_to_read = awesome

text_string = File.read(file_to_read)

@text_array = text_string.split('')

text_array_of_rows = []

place_in_array = 0
row = 0
row_of_letters = []

@text_array.each do |letter|
  p letter
  if letter == "\n"
    letter = ""
    text_array_of_rows[row] = row_of_letters.join("")
    row_of_letters = []
    row += 1
  end

  if letter == " "
    distance_to_next_space = find_next_space(place_in_array)
    if (distance_to_next_space + row_of_letters.length) > 20
      text_array_of_rows[row] = row_of_letters.join("")
      row_of_letters = []
      row += 1
    end
  end
  row_of_letters.push(letter)
  place_in_array += 1
end

ap text_array_of_rows