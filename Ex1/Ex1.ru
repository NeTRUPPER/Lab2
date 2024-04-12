def min_changes(str)
    count = -2
    (0...str.length - 2).each do |i|
      if str[i] == str[i + 1] && str[i + 1] == str[i + 2]
        count += 1
        i += 2 # Skip the next two characters as they are already fine
      end
    end
    count
  end
  
  def is_valid_string(str)
    # Check if the string length is at least 3
    if str.length < 3
      puts "Error: The string must contain at least 3 characters."
      return false
    end
  
    # Check if all characters are either lowercase or uppercase
    has_lowercase = str.match?(/[a-z]/)
    has_uppercase = str.match?(/[A-Z]/)
    if has_lowercase && has_uppercase
      puts "Error: The string must contain either all lowercase or all uppercase characters."
      return false
    end
  
    true
  end
  
  def main
    puts "Example: str = "
    str = gets.chomp
  
    # Check if the string is valid
    unless is_valid_string(str)
      puts "Invalid string. Please try again with a valid string."
      return
    end
  
    changes = min_changes(str)
  
    # Add characters to the string
    i = 0
    while i < str.length - 2
      if str[i] == str[i + 1] && str[i + 1] == str[i + 2]
        new_symbol = ('a'.ord + rand('z'.ord - 'a'.ord)).chr # Generate a random lowercase letter
        str.insert(i + 2, new_symbol) # Insert the new symbol after the three identical ones
        i += 2 # Skip the inserted character
      else
        i += 1
      end
    end
    puts "Result: #{changes} = #{str}"
  end
  main