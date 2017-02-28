@students = [] #empty array accessible to all methods

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {:name => name, :cohort => cohort.to_sym}
  end
  file.close
end

def save_students
  #open the file for writing
  file = File.open("students.csv", "w")
  #iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print(@students)
  print_footer(@students)
end

def process(selection)
    case selection
      when "1"
      students = input_students
      when "2"
      print_header
      print_students_list
      print_footer
      when "3"
      save_students
      when "4"
      load_students
      when "9"
      exit
      else
      puts "I don't know what you meant, try again"
    end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def input_students
  months = ["january", "february", "march", "april", "june", "july", "august", "september", "october", "november", "december"]
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #get the first name
  name = gets.chomp
  puts "What is #{name}\'s cohort?"
  cohort = gets.chomp.downcase
  while !months.include? cohort || cohort == ""
    puts "Have you made a typo?"
    cohort = gets.chomp.downcase
  end
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    @students << {:name => name, :cohort => cohort.to_sym}
    if @students.length == 1
      puts "Now we have 1 student"
    else
      puts "Now we have #{@students.count} students"
    end
    #get more data from the user
    puts "Another name:"
    name = gets.chomp
    if !name.empty?
      puts "cohort of #{name}:"
      cohort = gets.chomp.downcase
      while !months.include? cohort || cohort == nil
        puts "Have you made a typo?"
        cohort = gets.chomp.downcase
      end
    end
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-----------"
end

def print_students_list
  i = 0
  until i == @students.length
    puts "#{i+1}: #{@students[i][:name]}," + "(#{@students[i][:cohort]} cohort)".center(10) if @students[i][:name] != nil
    i += 1
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end


interactive_menu
