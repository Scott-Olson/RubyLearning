# user avoids death by answering questions
# 2 options - one conts one kills
# chapter 1
# loop do
#   puts "###########################"
#   puts "Chapter 1"
#   puts 
#   puts "You are in a dark room. "
#   puts "1. Stand up"
#   puts "2. Open the door"
#   answer = gets.chomp

#   if answer == "1"
#     puts "you die"
#     exit
#   elsif answer == "2"
#     puts "The door creeks open"
#     break
#   else 
#     puts "Try again"
#   end
# end


def chapter(chapter_info, chapter_number) 
  puts "-=-=-=-=-=- Chapter #{chapter_number} -=-=-=-=-=-"
  puts 
  puts "Make your move"
  puts "1. #{chapter_info[:option_one]}"
  puts "2. #{chapter_info[:option_two]}"
  # strips whitespace from beginning and end
  # to_i turns to integer
  answer = gets.chomp.strip.to_i
  correct_val = chapter_info[:correct_val]

  if answer == correct_val
    puts "#{chapter_info[:living_result]}"
    return true
  else
    puts "#{chapter_info[:death_result]}"
    return false
  end
end

# story input

# how to access when assigning as I did above -> chapters[0][:option_one]

# game loop




class Game 
  def initialize
    @alive = true
    @current_chapter = 0
    @chapters = [
      {
        option_one: "Stand up", 
        option_two: "Stay seated", 
        living_result: "You see a hallway and a door", 
        death_result: "The chair eats you", 
        correct_val: 1
      },
      {
        option_one: "Walk towards the ominous hallway", 
        option_two: "Walk towards the closed door", 
        living_result: "You see the door has a handle and a lever", 
        death_result: "A monster rushes down the hallway and eats you", 
        correct_val: 2
      },
      {
        option_one: "Open the door", 
        option_two: "Pull the lever", 
        living_result: "You survived", 
        death_result: "You fell into a spike trap", 
        correct_val: 1
      }
    ]
  end

  def play
    while @alive && @current_chapter < @chapters.size
      @alive = chapter(@chapters[@current_chapter], @current_chapter + 1)
      if @alive
        @current_chapter +=1
     end
    end
  end
end
game = Game.new
game.play