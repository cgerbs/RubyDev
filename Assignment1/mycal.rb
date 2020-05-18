# COEN 164 - HW #1
# Chris Gerbino

# firstDayInMonth is a number between 1-7, and it tells us what day of the week the month will start on 
# monthLength will provide the # of days in the respective month
$current_column = 0;

def print_MonthCal(firstDayInMonth, monthLength)
    days = %w(Mon Tue Wed Thu Fri Sat Sun)
    days.each { |day| print "#{day} " }
    puts
    dayNum = 1
    month_started = false
    $current_column = firstDayInMonth
    while dayNum <= monthLength
        (1..7).each do |i|
            if  (month_started == false) && (firstDayInMonth > i)
                print '    '
            
            else
                month_started = true
                print ' ' if dayNum < 10 #accounting for single digit numbers.. if single digit then add space
                print " #{dayNum} " if dayNum <= monthLength
                dayNum += 1    
                #print "-#{$current_column}-"    
                if $current_column < 7
                    $current_column+=1 if dayNum <= monthLength
                else
                    $current_column = 1
                end 

       
            end
        end
        puts
    end
    puts
end
 

def IsLeapYear(yearNum)
    answer = false
    #puts "false"
    if yearNum % 4 == 0
        answer = true
        #puts "true"
        if yearNum % 100 == 0
            if yearNum % 400 == 0
                answer = true  #should return true if yearNum % 4 == 0 && yearNum % 100 = 0 && yearNum % 400 == 0
                #puts "true"
            else
                answer = false #should return fals if yearNum % 4 == 0 && yearNum % 100 = 0
                #puts "false"
            end
        end
    else 
        answer = false
        #puts "false"
    end
    answer #returning answer
end


#for vars 'firstDayOfYear' and 'firstDayInMonth'
    #1 = Monday, 2 = Tuesday, 3 = Weds, 4 = Thur, 5 = Fri, 6 = Sat, 7 = Sun


def mainFunc(yearNum, firstDayOfYear)
    puts
    puts "           #{yearNum}"
    puts
    for i in 1..12
        if $current_column == 1
            firstDay = $current_column
        else
            firstDay = $current_column + 1 
        end
        puts firstDay
        if i == 1
            puts "          January"
            print_MonthCal(2, 31) #hardcoded for 2019 values
        elsif i == 2
            #puts firstDay
            puts "          February"
            if IsLeapYear(yearNum)
                print_MonthCal(firstDay, 29) #if it is a leap year then theyre 29 days in feb
            else
                print_MonthCal(firstDay, 28) #if it is not a leap year then theyre 29 days in feb
            end
        elsif i == 3
            #puts firstDay
            puts "          March"
            print_MonthCal(firstDay, 31)
        elsif i == 4
            #puts firstDay
            puts "          April"
            print_MonthCal(firstDay, 30)
        elsif i == 5
            puts "          May"
            print_MonthCal(firstDay, 31)
        elsif i == 6
            puts "          June"
            print_MonthCal(firstDay, 30)
        elsif i == 7
            puts "          July"
            print_MonthCal(firstDay, 31)
        elsif i == 8
            puts "          August"
            print_MonthCal(firstDay, 31)
        elsif i == 9
            puts "          September"
            print_MonthCal(firstDay, 30)
        elsif i == 10
            puts firstDay
            puts "          October"
            print_MonthCal(firstDay+1, 31)
        elsif i == 11
            puts "          November"
            print_MonthCal(firstDay, 30)
        elsif i == 12 
            puts "          December"
            print_MonthCal(firstDay, 31)
        else
            puts "Invalid number... Please pick a number between 1-12"
        end
    end
    
end


mainFunc(2019,2)