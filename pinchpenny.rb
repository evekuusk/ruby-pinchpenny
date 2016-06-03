require 'colorize'

def separate_comma(number)
  whole, decimal = number.to_s.split(".")
  whole_with_commas = whole.chars.to_a.reverse.each_slice(3).map(&:join).join(",").reverse
  [whole_with_commas, decimal].compact.join(".")
end

puts "\n\n\n"
puts "############## {{ -pinchpenny- }} ##############".yellow
puts "Welcome!  This tool will walk you through the steps of outlining your income, expenses, savings goals, and will assist in creation of a budget."
puts "DISCLAIMER: This program is not intended as financial advice in any way."
puts "\n####### Step 1: Income & Expenses #######"
puts "----- INCOME -----"

income_type = ""
until income_type == "a" || income_type == "b"
puts "Select income type..."
puts "A. Annual Salary"
puts "B. Hourly Wage"
print "(A/B): "
income_type = gets.chomp.downcase
end

income_salary = 0
income_wage = 0
if income_type == "a"
  print "Please input your before tax annual salary: $"
  income_salary = gets.chomp.to_f.round(2)
elsif income_type == "b"
  print "Please input your before tax hourly wage: $"
  income_wage = gets.chomp.to_f.round(2)
end

print "Number of work hours per week (if you do not work consistent hours, please input a reasonable average -- input partial hours as a decimal value): "
income_hours = gets.chomp.to_f.round(2)
annual_hours = income_hours * 52

if income_type == "a"
  income_wage = (income_salary / 52) / income_hours
  income_wage = (income_salary / annual_hours).round(2)
elsif income_type == "b"
  income_salary = (income_wage * annual_hours).round(2)
end

known_tax = ""
until known_tax == "y" || known_tax == "yes" || known_tax == "n" || known_tax == "no"
  print "Do you know your tax deducations as a percentage? (y/n): "
  known_tax = gets.chomp.downcase
end

net_wage = ""
if known_tax == "n" || known_tax == "no"
  puts "OK!  We'll help figure out an approximation for your after tax wage.  \nIf you have more than one pay stub on hand, please input the total average between as many as possible for a more accurate calculation."
  print "Please input last net payday amount: $"
  payday_amount = gets.chomp.to_f.round(2)
  print "Number of hours from referenced pay period (input partial hours as a decimal value): "
  payday_hours = gets.chomp.to_f.round(2)
  net_wage = (payday_amount / payday_hours).round(2)
elsif known_tax == "y" || known_tax == "yes"
  print "Tax deducations (%): "
  income_tax = gets.chomp.to_f.round(2)
  tax_remainder = (100 - income_tax) * 0.01
  net_wage = (income_wage * tax_remainder).round(2)
else
end

annual_gross_income = (income_wage * annual_hours).round(2)
annual_net_income = (net_wage * annual_hours).round(2)
monthly_net_income = (annual_net_income / 12).round(2)
weekly_net_income = (net_wage * income_hours).round(2)
daily_net_income = (weekly_net_income / 5).round(2)

puts "\nGROSS HOURLY WAGE: $#{separate_comma('%.2f' % income_wage)}".yellow
puts "GROSS ANNUAL SALARY: $#{separate_comma('%.2f' % income_salary)}".yellow
puts "HOURLY NET WAGE: $#{separate_comma('%.2f' % net_wage)}".green
puts "DAILY NET INCOME: $#{separate_comma('%.2f' % daily_net_income)}".green
puts "WEEKLY NET INCOME: $#{separate_comma('%.2f' % weekly_net_income)}".green
puts "MONTHLY NET INCOME: $#{separate_comma('%.2f' % monthly_net_income)}".green
puts "ANNUAL NET INCOME: $#{separate_comma('%.2f' % annual_net_income)}".green

puts "\n\n----- REGULAR EXPENSES -----"

known_expenses = ""
until known_expenses == "y" || known_expenses == "yes" || known_expenses == "n" || known_expenses == "no"
  puts "You may input your regular expenses as a single amount OR you may input every expense separately."
  print "Would you like to input the full amount of your regular monthly expenses? (y/n): "
  known_expenses = gets.chomp.downcase
end

total_regular_expenses = 0
if known_expenses == "y" || known_expenses == "yes"
  puts "\nPlease do not include payments toward a mortgage, car, or other loans, as they will be handled separately.".blue
  print "Full amount of regular monthly expenses excluding debt repayments: $"
  until total_regular_expenses > 0
    total_regular_expenses = gets.chomp.to_f.round(2)
  end
elsif known_expenses == "n" || known_expenses == "no"
  puts "Please input your monthly expenses by category...Press ENTER to skip if a category does not apply to your budget."
  puts "Please do not include payments toward a mortgage, car, or other loans, as they will be handled separately.".blue

  print "Rent (do not include mortgage payments): $"
  expenses_rent = gets.chomp.to_f.round(2)
  total_regular_expenses = expenses_rent
  puts "= $#{separate_comma('%.2f' % total_regular_expenses)}".yellow

  print "Insurance: $"
  expenses_insurance = gets.chomp.to_f.round(2)
  total_regular_expenses += expenses_insurance
  puts "= $#{separate_comma('%.2f' % total_regular_expenses)}".yellow

  print "Utilities (Heat/Electricity/Water): $"
  expenses_utilities = gets.chomp.to_f.round(2)
  total_regular_expenses += expenses_utilities
  puts "= $#{separate_comma('%.2f' % total_regular_expenses)}".yellow

  print "Public Transit: $"
  expenses_transit = gets.chomp.to_f.round(2)
  total_regular_expenses += expenses_transit
  puts "= $#{separate_comma('%.2f' % total_regular_expenses)}".yellow

  print "Personal Transportation (Gas/Car Insurance -- do not include car payments): $"
  expenses_transportation = gets.chomp.to_f.round(2)
  total_regular_expenses += expenses_transportation
  puts "= $#{separate_comma('%.2f' % total_regular_expenses)}".yellow

  print "Cell Phone: $"
  expenses_phone = gets.chomp.to_f.round(2)
  total_regular_expenses += expenses_phone
  puts "= $#{separate_comma('%.2f' % total_regular_expenses)}".yellow

  print "Internet, Cable, & Home Phone: $"
  expenses_internet = gets.chomp.to_f.round(2)
  total_regular_expenses += expenses_internet
  puts "= $#{separate_comma('%.2f' % total_regular_expenses)}".yellow

  print "Food: $"
  expenses_food = gets.chomp.to_f.round(2)
  total_regular_expenses += expenses_food
  puts "= $#{separate_comma('%.2f' % total_regular_expenses)}".yellow

  print "Household Supplies & Toiletries: $"
  expenses_household = gets.chomp.to_f.round(2)
  total_regular_expenses += expenses_household
  puts "= $#{separate_comma('%.2f' % total_regular_expenses)}".yellow

  print "Entertainment (TV, Netflix, misc. subscriptions): $"
  expenses_entertainment = gets.chomp.to_f.round(2)
  total_regular_expenses += expenses_entertainment
  puts "= $#{separate_comma('%.2f' % total_regular_expenses)}".yellow

  print "Education, Hobbies, or Self-Improvement: $"
  expenses_education = gets.chomp.to_f.round(2)
  total_regular_expenses += expenses_education
  puts "= $#{separate_comma('%.2f' % total_regular_expenses)}".yellow

  print "Fitness & Health: $"
  expenses_health = gets.chomp.to_f.round(2)
  total_regular_expenses += expenses_health
  puts "= $#{separate_comma('%.2f' % total_regular_expenses)}".yellow

  print "Leisure & Other (do not include debt payments): $"
  expenses_other = gets.chomp.to_f.round(2)
  total_regular_expenses += expenses_other
  puts "= $#{separate_comma('%.2f' % total_regular_expenses)}".yellow

  puts "\nREGULAR EXPENSES: $#{separate_comma('%.2f' % total_regular_expenses)}".red
  edit_expenses = ""

  until edit_expenses == "y" || edit_expenses == "yes" || edit_expenses == "n" || edit_expenses == "no"
    print "Edit expenses? (y/n): "
    edit_expenses = gets.chomp.downcase
    while edit_expenses == "y" || edit_expenses == "yes"
      puts "\nCurrent Expenses"
      puts "==========================="
      puts "Rent......$#{'%.2f' % expenses_rent}"
      puts "Insurance......$#{'%.2f' % expenses_insurance}"
      puts "Utilities......$#{'%.2f' % expenses_utilities}"
      puts "Public Transit......$#{'%.2f' % expenses_transit}"
      puts "Personal Transportation......$#{'%.2f' % expenses_transportation}"
      puts "Cell Phone......$#{'%.2f' % expenses_phone}"
      puts "Internet & Cable & Home Phone......$#{'%.2f' % expenses_internet}"
      puts "Food......$#{'%.2f' % expenses_food}"
      puts "Household Supplies & Toiletries......$#{'%.2f' % expenses_household}"
      puts "Entertainment......$#{'%.2f' % expenses_entertainment}"
      puts "Education & Hobbies & Self-Improvement......$#{'%.2f' % expenses_education}"
      puts "Fitness & Health......$#{'%.2f' % expenses_health}"
      puts "Leisure & Other......$#{'%.2f' % expenses_other}"
      puts "==========================="
      edit_which = ""
      until edit_which == "rent" || edit_which == "insurance" || edit_which == "utilities" || edit_which == "public transit" || edit_which == "transportation" || edit_which == "cell phone" || edit_which == "internet" || edit_which == "internet, cable, phone" || edit_which == "food" || edit_which == "household" || edit_which == "entertainment" || edit_which == "education" || edit_which == "hobbies" || edit_which == "health" || edit_which == "other" || edit_which == "leisure"
        print "\nWhich expense would you like to edit? (rent/insurance/utilities/public transit/transportation/cell phone/internet/cable/home phone/food/household/entertainment/education/hobbies/health/other): "
        edit_which = gets.chomp.downcase
        case edit_which
        when "rent"
          print "Editing rent:".blue
          print " $"
          expenses_rent = gets.chomp.to_f.round(2)
          puts "Rent......$#{'%.2f' % expenses_rent}".yellow
          print "Edit another? (y/n): "
          edit_expenses = gets.chomp.downcase
        when "insurance"
          print "Editing insurance:".blue
          print " $"
          expenses_insurance = gets.chomp.to_f.round(2)
          puts "Insurance......$#{'%.2f' % expenses_insurance}".yellow
          print "Edit another? (y/n): "
          edit_expenses = gets.chomp.downcase
        when "utilities"
          print "Editing utilities:".blue
          print " $"
          expenses_utilities = gets.chomp.to_f.round(2)
          puts "Utilities......$#{'%.2f' % expenses_utilities}".yellow
          print "Edit another? (y/n): "
          edit_expenses = gets.chomp.downcase
        when "public transit", "transit"
          print "Editing public transit:".blue
          print " $"
          expenses_transit = gets.chomp.to_f.round(2)
          puts "Public Transit......$#{'%.2f' % expenses_transit}".yellow
          print "Edit another? (y/n): "
          edit_expenses = gets.chomp.downcase
        when "transportation", "personal transportation"
          print "Editing transportation:".blue
          print " $"
          expenses_transportation = gets.chomp.to_f.round(2)
          puts "Personal Transportation......$#{'%.2f' % expenses_transportation}".yellow
          print "Edit another? (y/n): "
          edit_expenses = gets.chomp.downcase
        when "cell phone", "phone"
          print "Editing cell phone:".blue
          print " $"
          expenses_phone = gets.chomp.to_f.round(2)
          puts "Cell Phone......$#{'%.2f' % expenses_phone}".yellow
          print "Edit another? (y/n): "
          edit_expenses = gets.chomp.downcase
        when "internet", "cable", "home phone", "internet, cable, home phone", "internet, cable, & home phone"
          print "Editing internet, cable, & home phone:".blue
          print " $"
          expenses_internet = gets.chomp.to_f.round(2)
          puts "Internet, Cable, & Home Phone......$#{'%.2f' % expenses_internet}".yellow
          print "Edit another? (y/n): "
          edit_expenses = gets.chomp.downcase
        when "food"
          print "Editing food:".blue
          print " $"
          expenses_food = gets.chomp.to_f.round(2)
          puts "Food......$#{'%.2f' % expenses_food}".yellow
          print "Edit another? (y/n): "
          edit_expenses = gets.chomp.downcase
        when "household", "toiletries", "household supplies", "household supplies & toiletries"
          print "Editing household supplies & toiletries:".blue
          print " $"
          expenses_household = gets.chomp.to_f.round(2)
          puts "Household Supplies & Toiletries......$#{'%.2f' % expenses_household}".yellow
          print "Edit another? (y/n): "
          edit_expenses = gets.chomp.downcase
        when "entertainment"
          print "Editing entertainment:".blue
          print " $"
          expenses_entertainment = gets.chomp.to_f.round(2)
          puts "Entertainment......$#{'%.2f' % expenses_entertainment}".yellow
          print "Edit another? (y/n): "
          edit_expenses = gets.chomp.downcase
        when "education", "self improvement", "self-improvement", "education & self-improvement", "education & self improvement", "hobbies"
          print "Editing education & hobbies & self-improvement:".blue
          print " $"
          expenses_education = gets.chomp.to_f.round(2)
          puts "Education & Self-Improvement......$#{'%.2f' % expenses_education}".yellow
          print "Edit another? (y/n): "
          edit_expenses = gets.chomp.downcase
        when "health", "fitness", "fitness & health"
          print "Editing health:".blue
          print " $"
          expenses_health = gets.chomp.to_f.round(2)
          puts "Health & Fitness......$#{'%.2f' % expenses_health}".yellow
          print "Edit another? (y/n): "
          edit_expenses = gets.chomp.downcase
        when  "other", "leisure"
          print "Editing other:".blue
          print " $"
          expenses_other = gets.chomp.to_f.round(2)
          puts "Leisure & Other......$#{'%.2f' % expenses_other}".yellow
          print "Edit another? (y/n): "
          edit_expenses = gets.chomp.downcase
        else
          "Something went terribly wrong, unable to edit expenses at this time."
      end
    end

      total_regular_expenses = (expenses_rent + expenses_insurance + expenses_utilities + expenses_transit + expenses_transportation + expenses_phone + expenses_internet + expenses_food + expenses_household + expenses_entertainment + expenses_education + expenses_health + expenses_other).round(2)

      if edit_expenses == "n" || edit_expenses == "no"
        puts "\nCurrent Expenses"
        puts "==========================="
        puts "Rent......$#{'%.2f' % expenses_rent}"
        puts "Insurance......$#{'%.2f' % expenses_insurance}"
        puts "Utilities......$#{'%.2f' % expenses_utilities}"
        puts "Public Transit......$#{'%.2f' % expenses_transit}"
        puts "Personal Transportation......$#{'%.2f' % expenses_transportation}"
        puts "Cell Phone......$#{'%.2f' % expenses_phone}"
        puts "Internet & Cable & Home Phone......$#{'%.2f' % expenses_internet}"
        puts "Food......$#{'%.2f' % expenses_food}"
        puts "Household Supplies & Toiletries......$#{'%.2f' % expenses_household}"
        puts "Entertainment......$#{'%.2f' % expenses_entertainment}"
        puts "Education & Hobbies & Self-Improvement......$#{'%.2f' % expenses_education}"
        puts "Fitness & Health......$#{'%.2f' % expenses_health}"
        puts "Leisure & Other......$#{'%.2f' % expenses_other}"
        puts "TOTAL......$#{separate_comma('%.2f' % total_regular_expenses)}".red
        puts "==========================="
      end
    end
  end
end



puts "\n\n----- PAYMENTS / DEBT -----"
payments = ""
until payments == "y" || payments == "yes" || payments == "n" || payments == "no"
  print "Do you have debts or payments that have an expiry date or will be paid in full after a certain amount has been contributed, such as loan/car/mortgage payments? (y/n): "
  payments = gets.chomp.downcase
end

expenses_payments = 0
num_payments = 0
total_remains = 0
avg_interest = 0
total_monthly_contributions = 0
total_months_to_repayment = 0

highest_interest = 0
highest_interest_name = ""
lowest_amount = 0
lowest_amount_name = ""
list_debt_names = []

while payments == "y" || payments == "yes"
  num_payments = num_payments + 1
  puts "--- debt #{num_payments} ---"
  print "Name of payment: "
  name = gets.chomp
  list_debt_names.push(name)
  print "Monthly payment amount: $"
  monthly_contribution = gets.chomp.to_f.round(2)
  total_monthly_contributions = total_monthly_contributions + monthly_contribution
  expenses_payments = expenses_payments + monthly_contribution
  print "Interest (%): "
  interest = gets.chomp.to_f.round(2)

  if interest > highest_interest
    highest_interest = interest
    highest_interest_name = name
  end

  avg_interest = (avg_interest + interest) / num_payments
  print "Total amount remaining: $"
  remains = gets.chomp.to_f.round(2)
  total_remains = total_remains + remains
  timeline = (remains / monthly_contribution).to_i
  total_months_to_repayment = total_months_to_repayment + timeline

  puts "MONTHS TO FULL REPAYMENT: #{timeline}"

  if remains < lowest_amount || lowest_amount == 0
    lowest_amount = remains
    lowest_amount_name = name
  end

  if num_payments == 8
    puts "OK...that's it!  You can only add a maximum of 9 separate debt entries.  Sorry about that!".red
    payments = "n"
  else
    print "\nAdd another recurring payment? (y/n): "
    payments = gets.chomp.downcase
  end
end

total_remains.to_f.round(2)
avg_interest.to_f.round(2)
total_monthly_contributions.to_f.round(2)
expenses_debt = total_monthly_contributions.to_f.round(2)
total_regular_expenses = total_regular_expenses + expenses_debt

puts "\nDEBT STATS"
puts "==========================="
puts "HIGHEST INTEREST DEBT: #{highest_interest_name} with #{'%.2f' % highest_interest}% interest".red
puts "LOWEST DEBT AMOUNT: #{lowest_amount_name} with a total owing of $#{separate_comma('%.2f' % lowest_amount)}".red
puts "TOTAL NUMBER OF DEBTS: #{num_payments}".red
puts "TOTAL AMOUNT OWING: $#{separate_comma('%.2f' % total_remains)}".red
puts "AVERAGE INTEREST ON DEBTS: #{'%.2f' % avg_interest}%".red
puts "TOTAL MONTHLY PAYMENTS: $#{separate_comma('%.2f' % total_monthly_contributions)}".red
puts "TOTAL MONTHS TO REPAYMENT FOR ALL DEBTS AT THIS RATE: #{total_months_to_repayment}".red

puts "\nEXPENSES BREAKDOWN"
puts "==========================="
if known_expenses == "y" || known_expenses == "yes"
  puts "TOTAL MONTHLY EXPENSES......$#{separate_comma('%.2f' % total_regular_expenses)}".red
  puts "TOTAL REGULAR MONTHLY EXPENSES (EXCLUDING DEBT REPAYMENTS)......$#{separate_comma('%.2f' % (total_regular_expenses - expenses_debt))}".red
  puts "TOTAL PERCENTAGE OF MONTHLY NET INCOME USED FOR EXPENSES......#{((total_regular_expenses / monthly_net_income) * 100).round(1)}%".green
  puts "AMOUNT REMAINING FOR SAVINGS POTENTIAL......#{(100 - ((total_regular_expenses / monthly_net_income) * 100)).round(1)}%".green
elsif known_expenses == "n" || known_expenses == "no"
  puts "Please Note: Percentages are rounded independently and may have slight inaccuracies.\n".blue
  puts "Rent......$#{'%.2f' % expenses_rent}"
  puts "......#{((expenses_rent / total_regular_expenses) * 100).round(1)}% of total expenses".yellow
  puts "......#{((expenses_rent / monthly_net_income) * 100).round(1)}% of monthly net income".yellow
  puts "Insurance......$#{'%.2f' % expenses_insurance}"
  puts "......#{((expenses_insurance / total_regular_expenses) * 100).round(1)}% of total expenses".yellow
  puts "......#{((expenses_insurance / monthly_net_income) * 100).round(1)}% of monthly net income".yellow
  puts "Utilities......$#{'%.2f' % expenses_utilities}"
  puts "......#{((expenses_utilities / total_regular_expenses) * 100).round(1)}% of total expenses".yellow
  puts "......#{((expenses_utilities / monthly_net_income) * 100).round(1)}% of monthly net income".yellow
  puts "Public Transit......$#{'%.2f' % expenses_transit}"
  puts "......#{((expenses_transit / total_regular_expenses) * 100).round(1)}% of total expenses".yellow
  puts "......#{((expenses_transit / monthly_net_income) * 100).round(1)}% of monthly net income".yellow
  puts "Personal Transportation......$#{'%.2f' % expenses_transportation}"
  puts "......#{((expenses_transportation / total_regular_expenses) * 100).round(1)}% of total expenses".yellow
  puts "......#{((expenses_transportation / monthly_net_income) * 100).round(1)}% of monthly net income".yellow
  puts "Cell Phone......$#{'%.2f' % expenses_phone}"
  puts "......#{((expenses_phone / total_regular_expenses) * 100).round(1)}% of total expenses".yellow
  puts "......#{((expenses_phone / monthly_net_income) * 100).round(1)}% of monthly net income".yellow
  puts "Internet & Cable & Home Phone......$#{'%.2f' % expenses_internet}"
  puts "......#{((expenses_internet / total_regular_expenses) * 100).round(1)}% of total expenses".yellow
  puts "......#{((expenses_internet / monthly_net_income) * 100).round(1)}% of monthly net income".yellow
  puts "Food......$#{'%.2f' % expenses_food}"
  puts "......#{((expenses_food / total_regular_expenses) * 100).round(1)}% of total expenses".yellow
  puts "......#{((expenses_food / monthly_net_income) * 100).round(1)}% of monthly net income".yellow
  puts "Household Supplies & Toiletries......$#{'%.2f' % expenses_household}"
  puts "......#{((expenses_household / total_regular_expenses) * 100).round(1)}% of total expenses".yellow
  puts "......#{((expenses_household / monthly_net_income) * 100).round(1)}% of monthly net income".yellow
  puts "Entertainment......$#{'%.2f' % expenses_entertainment}"
  puts "......#{((expenses_entertainment / total_regular_expenses) * 100).round(1)}% of total expenses".yellow
  puts "......#{((expenses_entertainment / monthly_net_income) * 100).round(1)}% of monthly net income".yellow
  puts "Education & Hobbies & Self-Improvement......$#{'%.2f' % expenses_education}"
  puts "......#{((expenses_education / total_regular_expenses) * 100).round(1)}% of total expenses".yellow
  puts "......#{((expenses_education / monthly_net_income) * 100).round(1)}% of monthly net income".yellow
  puts "Fitness & Health......$#{'%.2f' % expenses_health}"
  puts "......#{((expenses_health / total_regular_expenses) * 100).round(1)}% of total expenses".yellow
  puts "......#{((expenses_health / monthly_net_income) * 100).round(1)}% of monthly net income".yellow
  puts "Other......$#{'%.2f' % expenses_other}"
  puts "......#{((expenses_other / total_regular_expenses) * 100).round(1)}% of total expenses".yellow
  puts "......#{((expenses_other / monthly_net_income) * 100).round(1)}% of monthly net income".yellow
  puts "Debt Payments......$#{'%.2f' % expenses_debt}"
  puts "......#{list_debt_names.join(',')}".blue
  puts "......#{((expenses_debt / total_regular_expenses) * 100).round(1)}% of total expenses".yellow
  puts "......#{((expenses_debt / monthly_net_income) * 100).round(1)}% of monthly net income".yellow
  puts "\nTOTAL MONTHLY EXPENSES......$#{separate_comma('%.2f' % total_regular_expenses)}".red
  puts "TOTAL REGULAR MONTHLY EXPENSES (EXCLUDING DEBT REPAYMENTS)......$#{separate_comma('%.2f' % (total_regular_expenses - expenses_debt))}".red
  puts "TOTAL PERCENTAGE OF MONTHLY NET INCOME USED FOR EXPENSES......#{((total_regular_expenses / monthly_net_income) * 100).round(1)}%".green
  puts "AMOUNT REMAINING FOR SAVINGS POTENTIAL......#{(100 - ((total_regular_expenses / monthly_net_income) * 100)).round(1)}%".green
end
puts "==========================="

puts "\n\n####### Step 2: Overview #######"
puts "----- INCOME vs EXPENSES vs SAVINGS -----"
total_expenses = (total_regular_expenses + total_monthly_contributions).to_f.round(2)
monthly_difference = (monthly_net_income - total_expenses).to_f.round(2)

print "Total current cash savings: $"
current_savings = gets.chomp.to_f.round(2)

regular_savings = ""
until regular_savings == "y" || regular_savings == "yes" || regular_savings == "n" || regular_savings == "no"
  print "Do you have any regular monthly savings contributions? (y/n): "
  regular_savings = gets.chomp.downcase
end

if regular_savings == "y" || regular_savings == "yes"
  print "Total Regular Savings Contributions: $"
  monthly_savings = gets.chomp.to_f.round(2)
else
  monthly_savings = 0
end

total_remainder = monthly_difference - monthly_savings
puts "\nMONTHLY NET INCOME: $#{separate_comma('%.2f' % monthly_net_income)}".green
puts "TOTAL MONTHLY EXPENSES: $#{separate_comma('%.2f' % total_regular_expenses)}".red
puts "MAXIMUM MONTHLY SAVINGS POTENTIAL: $#{separate_comma('%.2f' % monthly_difference)}".blue
puts "CURRENT SAVINGS: $#{separate_comma('%.2f' % current_savings)}".yellow

puts "\n----- SAVINGS GOALS -----"
if total_remainder < 0
  puts "WARNING:  Your expenses are higher than your income!".red
end

puts "Select an option to continue..."
max_savings = (total_remainder + monthly_savings).to_f.round(2)
savings_goal = 0
remaining_savings_goal = (savings_goal - current_savings).to_f.round(2)
continue_option = ""
until continue_option == "A" || continue_option == "B"
  #  || continue_option == "C"
  puts "A. Estimate savings over a specified timeline with current budget"
  puts "B. Calculate debt repayment with maximized additional contributions ---> DEBUGGING / TEST MODE".blue
  # puts "C. Create a savings plan for a specific amount"
  print "(A/B): "
  continue_option = gets.chomp.upcase
end

if continue_option == "A"
  puts "\n----- A. ESTIMATE SAVINGS -----"
  savings_months = 0
  savings_years = 0
  total_savings = 0
  exclude_regular_savings = 0
  months_or_years = ""
  include_increase = ""
  raise_percentage = 0
  raise_frequency = 0
  averaged_percentage = 0
  averaged_net_wage = 0
  until months_or_years == "m" || months_or_years == "months" || months_or_years == "y" || months_or_years == "years"
    puts "Calculate in months or years?"
    print "(M/Y): "
    months_or_years = gets.chomp.downcase
  end
  if months_or_years == "m" || months_or_years == "months"
    until savings_months > 0
      print "Number of Months: "
      savings_months = gets.chomp.to_f.round(2)
    end
    total_savings = (max_savings * savings_months).to_f.round(2)
    exclude_regular_savings = ((max_savings - monthly_savings) * savings_months).to_f.round(2)
    puts "\nTOTAL ESTIMATED SAVINGS OVER #{savings_months} MONTHS......$#{separate_comma('%.2f' % total_savings)}".green
    puts "Excluding existing regular monthly savings......$#{separate_comma('%.2f' % exclude_regular_savings)}".yellow
    puts "Total including existing saved funds......$#{separate_comma('%.2f' % (total_savings + current_savings))}.".yellow
    puts "Total including saved funds AND excluding regular monthly savings......$#{separate_comma('%.2f' % (exclude_regular_savings + current_savings))}.".yellow
  elsif months_or_years == "y" || months_or_years == "years"
    until savings_years > 0
      print "Number of Years: "
      savings_years = gets.chomp.to_f.round(2)
    end
    total_savings = ((max_savings * 12 )* savings_years).to_f.round(2)
    exclude_regular_savings = (((max_savings - monthly_savings) * 12 ) * savings_years).to_f.round(2)
    puts "\nTOTAL ESTIMATED SAVINGS OVER #{savings_years} YEARS......$#{separate_comma('%.2f' % total_savings)}".green
    puts "Excluding existing regular monthly savings......$#{separate_comma('%.2f' % exclude_regular_savings)}".yellow
    puts "Total including existing saved funds......$#{separate_comma('%.2f' % (total_savings + current_savings))}.".yellow
    puts "Total including saved funds AND excluding regular monthly savings......$#{separate_comma('%.2f' % (exclude_regular_savings + current_savings))}.".yellow
  end

elsif continue_option == "B"
  puts "\n----- B. CALCULATE ACCELERATED DEBT REPAYMENT -----"
  puts "Oops!  Option B doesn't exist yet!  Sorry, chump.  Now get outta here.\n".red
end
