student_count = 11

def input_students
  months = [:january, :february, :march, :april, :june, :july, :august, :september, :october, :november, :december]
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  #get the first name
  name = gets.chomp
  puts "What is #{name}\'s hobby?"
  hobby = gets.chomp
  puts "What is #{name}\'s cohort?"
  cohort = gets.chomp.downcase.to_sym
  if !months.include? cohort
    puts "Have you made a typo?"
    cohort = gets.chomp.downcase.to_sym
  end
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    students << {:name => name, :hobby => hobby, :cohort => cohort}
    if students.length == 1
      puts "Now we have 1 student"
    else
      puts "Now we have #{students.count} students"
    end
    #get more data from the user
    puts "Another name:"
    name = gets.chomp
    if !name.empty?
      puts "hobby of #{name}:"
      hobby = gets.chomp
      puts "cohort of #{name}:"
      cohort = gets.chomp.downcase.to_sym
      if !months.include? cohort
        puts "Have you made a typo?"
        cohort = gets.chomp.downcase.to_sym
      end
    end
  end
  #return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-----------"
end

def print(students)
  i = 0
  until i == students.length
    puts "#{i+1}: #{students[i][:name]}," + "#{students[i][:hobby]},".center(14) + "(#{students[i][:cohort]} cohort)".center(10)
    #if students[i][:name][0, 1].downcase == "s" && students[i][:name].length < 12
    i += 1
  end
end

#def print(students)
#  students.each_with_index do |student, index|
#    puts "#{index+1}: #{student[:name]} (#{student[:cohort]} cohort)" if student[:name][0, 1].downcase == "s" && student[:name].length < 12
#  end
#end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

#nothing happens until we call the methods

students = input_students.sort_by {|student| student[:cohort].to_s}
print_header
print(students)
print_footer(students)


#students = [
#            {:name => "Dr. Hannibal Lecter", :cohort => :november},
#            {:name => "Darth Vader", :cohort => :november},
#            {:name => "Nurse Ratched", :cohort => :november},
#            {:name => "Michael Corleone", :cohort => :november},
#            {:name => "Alex DeLarge", :cohort => :november},
#            {:name => "The Wicked Witch of the West", :cohort => :november},
#            {:name => "Terminator", :cohort => :november},
#            {:name => "Freddy Krueger", :cohort => :november},
#            {:name => "The Joker", :cohort => :november},
#            {:name => "Joffrey Baratheon", :cohort => :november},
#            {:name => "Norman Bates", :cohort => :november},
#]
