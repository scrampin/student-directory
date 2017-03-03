@students = [] #empty array accessible to all methods

def add_students
  @students << {:name => @name, :cohort => @cohort.to_sym}
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} does not exist"
    exit
  end
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    @name, @cohort = line.chomp.split(',')
    add_students
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
  puts "5. Sort the list of students by cohort"
  puts "9. Exit"
end

def sort_students
  @students = @students.sort_by {|student| student[:cohort].to_s}
  puts "Students sorted"
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
      when "5"
      sort_students
      when "9"
      exit
      else
      puts "I don't know what you meant, try again"
    end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def get_data
  @name = STDIN.gets.chomp
  if !@name.empty?
  puts "What is #{@name}\'s cohort?"
  @cohort = STDIN.gets.chomp.downcase
  while !@months.include? @cohort || @cohort == ""
    puts "Have you made a typo?"
    @cohort = STDIN.gets.chomp.downcase
  end
 end
end

def count_students
      if @students.length == 1
      puts "Now we have 1 student"
    else
        puts "Now we have #{@students.count} students"
    end
    puts "Another name:"
end

def input_students
  @months = ["january", "february", "march", "april", "june", "july", "august", "september", "october", "november", "december"]
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  get_data
  while !@name.empty? do
    add_students
    count_students
    get_data
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

try_load_students
interactive_menu
