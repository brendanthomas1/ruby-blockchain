require './blockchain'

def start
  @blockchain = Blockchain.new
end

def print_blockchain
  pp @blockchain.chain
  puts
end

def add_block
  @blockchain.add_block
  puts "Block added!"
  puts
end

def menu
  puts 'What would you like to do?'
  puts '1 - Print Blockchain'
  puts '2 - Add Block'
  puts '4 - Exit'
  puts
  print 'Option: '
end

start
continuing = true

while continuing
  menu
  choice = gets.chomp

  case choice
  when '1'
    print_blockchain
  when '2'
    add_block
  when '4'
    continuing = false
  else
    puts 'Invalid choice, try again'
    puts
  end
end
