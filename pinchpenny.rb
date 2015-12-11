require 'colorize'
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

annual_net_income = (net_wage * annual_hours).round(2)
monthly_net_income = (annual_net_income / 12).round(2)
weekly_net_income = (net_wage * income_hours).round(2)
daily_net_income = (weekly_net_income / 5).round(2)

puts "\nHOURLY WAGE: $#{'%.2f' % income_wage}".green
puts "NET HOURLY WAGE: $#{'%.2f' % net_wage}".green
puts "DAILY NET INCOME: $#{'%.2f' % daily_net_income}".green
puts "WEEKLY NET INCOME: $#{'%.2f' % weekly_net_income}".green
puts "MONTHLY NET INCOME: $#{'%.2f' % monthly_net_income}".green
puts "ANNUAL NET INCOME: $#{'%.2f' % annual_net_income}".green

puts "\n\n----- REGULAR EXPENSES -----"
puts "Please input your monthly expenses by category...Press ENTER to skip if a category does not apply to your budget."
puts "Please do not include payments toward a mortgage, car, or other loans, as they will be handled separately.".blue

print "Rent (do not include mortgage payments): $"
expenses_rent = gets.chomp.to_f.round(2)
total_regular_expenses = expenses_rent
puts "= $#{'%.2f' % total_regular_expenses}".yellow

print "Insurance: $"
expenses_insurance = gets.chomp.to_f.round(2)
total_regular_expenses += expenses_insurance
puts "= $#{'%.2f' % total_regular_expenses}".yellow

print "Utilities (Heat/Electricity/Water): $"
expenses_utilities = gets.chomp.to_f.round(2)
total_regular_expenses += expenses_utilities
puts "= $#{'%.2f' % total_regular_expenses}".yellow

print "Public Transit: $"
expenses_transit = gets.chomp.to_f.round(2)
total_regular_expenses += expenses_transit
puts "= $#{'%.2f' % total_regular_expenses}".yellow

print "Personal Transportation (Gas/Car Insurance -- do not include car payments): $"
expenses_transportation = gets.chomp.to_f.round(2)
total_regular_expenses += expenses_transportation
puts "= $#{'%.2f' % total_regular_expenses}".yellow

print "Cell Phone: $"
expenses_phone = gets.chomp.to_f.round(2)
total_regular_expenses += expenses_phone
puts "= $#{'%.2f' % total_regular_expenses}".yellow

print "Internet, Cable, & Home Phone: $"
expenses_internet = gets.chomp.to_f.round(2)
total_regular_expenses += expenses_internet
puts "= $#{'%.2f' % total_regular_expenses}".yellow

print "Food: $"
expenses_food = gets.chomp.to_f.round(2)
total_regular_expenses += expenses_food
puts "= $#{'%.2f' % total_regular_expenses}".yellow

print "Household Supplies & Toiletries: $"
expenses_household = gets.chomp.to_f.round(2)
total_regular_expenses += expenses_household
puts "= $#{'%.2f' % total_regular_expenses}".yellow

print "Entertainment (TV, Netflix, misc. subscriptions): $"
expenses_entertainment = gets.chomp.to_f.round(2)
total_regular_expenses += expenses_entertainment
puts "= $#{'%.2f' % total_regular_expenses}".yellow

print "Education or Self-Improvement: $"
expenses_education = gets.chomp.to_f.round(2)
total_regular_expenses += expenses_education
puts "= $#{'%.2f' % total_regular_expenses}".yellow

print "Fitness & Health: $"
expenses_health = gets.chomp.to_f.round(2)
total_regular_expenses += expenses_health
puts "= $#{'%.2f' % total_regular_expenses}".yellow

print "Other (do not include debt payments): $"
expenses_other = gets.chomp.to_f.round(2)
total_regular_expenses += expenses_other
puts "= $#{'%.2f' % total_regular_expenses}".yellow

puts "\nREGULAR EXPENSES: $#{'%.2f' % total_regular_expenses}".red
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
    puts "Education & Self-Improvement......$#{'%.2f' % expenses_education}"
    puts "Fitness & Health......$#{'%.2f' % expenses_health}"
    puts "Other......$#{'%.2f' % expenses_other}"
    puts "==========================="

    edit_which = ""
    until edit_which == "rent" || edit_which == "insurance" || edit_which == "utilities" || edit_which == "public transit" || edit_which == "transportation" || edit_which == "cell phone" || edit_which == "internet" || edit_which == "internet, cable, phone" || edit_which == "food" || edit_which == "household" || edit_which == "entertainment" || edit_which == "education" || edit_which == "health" || edit_which == "other"
      print "\nWhich expense would you like to edit? (rent/insurance/utilities/public transit/transportation/cell phone/internet/cable/home phone/food/household/entertainment/education/health/other): "
      edit_which = gets.chomp.downcase

      case edit_which
      when "rent"
        print "Editing rent:".blue
        print " $"
        expenses_rent = gets.chomp.to_f.round(2)
        puts "Rent......$#{'%.2f' % expenses_rent}".yellow
      when "insurance"
        print "Editing insurance:".blue
        print " $"
        expenses_insurance = gets.chomp.to_f.round(2)
        puts "Insurance......$#{'%.2f' % expenses_insurance}".yellow
      when "utilities"
        print "Editing utilities:".blue
        print " $"
        expenses_utilities = gets.chomp.to_f.round(2)
        puts "Utilities......$#{'%.2f' % expenses_utilities}".yellow
      when "public transit", "transit"
        print "Editing public transit:".blue
        print " $"
        expenses_transit = gets.chomp.to_f.round(2)
        puts "Public Transit......$#{'%.2f' % expenses_transit}".yellow
      when "transportation", "personal transportation"
        print "Editing transportation:".blue
        print " $"
        expenses_transportation = gets.chomp.to_f.round(2)
        puts "Personal Transportation......$#{'%.2f' % expenses_transportation}".yellow
      when "cell phone", "phone"
        print "Editing cell phone:".blue
        print " $"
        expenses_phone = gets.chomp.to_f.round(2)
        puts "Cell Phone......$#{'%.2f' % expenses_phone}".yellow
      when "internet", "cable", "home phone", "internet, cable, home phone", "internet, cable, & home phone"
        print "Editing internet, cable, & home phone:".blue
        print " $"
        expenses_internet = gets.chomp.to_f.round(2)
        puts "Internet, Cable, & Home Phone......$#{'%.2f' % expenses_internet}".yellow
      when "food"
        print "Editing food:".blue
        print " $"
        expenses_food = gets.chomp.to_f.round(2)
        puts "Food......$#{'%.2f' % expenses_food}".yellow
      when "household", "toiletries", "household supplies", "household supplies & toiletries"
        print "Editing household supplies & toiletries:".blue
        print " $"
        expenses_household = gets.chomp.to_f.round(2)
        puts "Household Supplies & Toiletries......$#{'%.2f' % expenses_household}".yellow
      when "entertainment"
        print "Editing entertainment:".blue
        print " $"
        expenses_entertainment = gets.chomp.to_f.round(2)
        puts "Entertainment......$#{'%.2f' % expenses_entertainment}".yellow
      when "education", "self improvement", "self-improvement", "education & self-improvement", "education & self improvement"
        print "Editing education & self-improvement:".blue
        print " $"
        expenses_education = gets.chomp.to_f.round(2)
        puts "Education & Self-Improvement......$#{'%.2f' % expenses_education}".yellow
      when "health", "fitness", "fitness & health"
        print "Editing health:".blue
        print " $"
        expenses_health = gets.chomp.to_f.round(2)
        puts "Health & Fitness......$#{'%.2f' % expenses_health}".yellow
      when  "other"
        print "Editing other:".blue
        print " $"
        expenses_other = gets.chomp.to_f.round(2)
        puts "Other......$#{'%.2f' % expenses_other}".yellow
      else
        "Something went terribly wrong, unable to edit expenses at this time."
      end
    end

    total_regular_expenses = (expenses_rent + expenses_insurance + expenses_utilities + expenses_transit + expenses_transportation + expenses_phone + expenses_internet + expenses_food + expenses_household + expenses_entertainment + expenses_education + expenses_health + expenses_other).round(2)
    print "Edit another? (y/n): "
    edit_expenses = gets.chomp.downcase

    if edit_expenses == "n"
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
      puts "Education & Self-Improvement......$#{'%.2f' % expenses_education}"
      puts "Fitness & Health......$#{'%.2f' % expenses_health}"
      puts "Other......$#{'%.2f' % expenses_other}"
      puts "TOTAL......$#{'%.2f' % total_regular_expenses}".red
      puts "==========================="
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

# maximum 9 separate loans/debts
loan1 = Hash.new
loan2 = Hash.new
loan3 = Hash.new
loan4 = Hash.new
loan5 = Hash.new
loan6 = Hash.new
loan7 = Hash.new
loan8 = Hash.new
loan9 = Hash.new

while payments == "y" || payments == "yes"
  num_payments = num_payments + 1
  puts "--- debt #{num_payments} ---"
  print "Name of payment: "
  name = gets.chomp
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

puts "\n-- debt stats --"
puts "HIGHEST INTEREST DEBT: #{highest_interest_name} with #{'%.2f' % highest_interest}% interest".red
puts "LOWEST DEBT AMOUNT: #{lowest_amount_name} with a total owing of $#{'%.2f' % lowest_amount}".red
puts "TOTAL NUMBER OF DEBTS: #{num_payments}".red
puts "TOTAL AMOUNT OWING: $#{'%.2f' % total_remains}".red
puts "AVERAGE INTEREST ON DEBTS: #{'%.2f' % avg_interest}%".red
puts "TOTAL MONTHLY PAYMENTS: $#{'%.2f' % total_monthly_contributions}".red
puts "TOTAL MONTHS TO REPAYMENT FOR ALL DEBTS AT THIS RATE: #{total_months_to_repayment}".red

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
end

total_remainder = monthly_difference - monthly_savings
puts "\nMONTHLY NET INCOME: $#{'%.2f' % monthly_net_income}".green
puts "REGULAR EXPENSES: $#{'%.2f' % total_regular_expenses}".red
puts "MONTHLY DEBT PAYMENTS: $#{'%.2f' % total_monthly_contributions}".red
puts "TOTAL MONTHLY EXPENSES: #{'%.2f' % total_expenses}".red
puts "MONTHLY DIFFERENCE: $#{'%.2f' % monthly_difference}".blue
puts "REGULAR MONTHLY SAVINGS: $#{'%.2f' % monthly_savings}".yellow
puts "CURRENT SAVINGS: $#{'%.2f' % current_savings}".yellow
puts "TOTAL MONTHLY INCOME REMAINDER: $#{'%.2f' % total_remainder}".blue

puts "\n----- SAVINGS GOALS -----"
if total_remainder < 0
  puts "WARNING:  Your expenses are higher than your income!".red
end

puts "Select an option to continue..."
max_savings = (total_remainder + monthly_savings).to_f.round(2)
savings_goal = 0
remaining_savings_goal = (savings_goal - current_savings).to_f.round(2)
continue_option = ""
until continue_option == "A" || continue_option == "B" || continue_option == "C" || continue_option == "D"
  puts "A. Create a short term savings plan (3 months - 3 years)"
  puts "B. Create a long term savings plan (3 years +)"
  puts "C. Create a savings plan for a specific amount"
  puts "D. Create a plan to aggressively pay off debt"
  print "(A/B/C/D): "
  continue_option = gets.chomp.upcase
end

if continue_option == "A"
  puts "\n----- A. SHORT TERM SAVINGS PLAN -----"
  st_savings_months = 0
  st_savings_years = 0
  include_current = ""
  total_savings = 0
  st_wmy = ""
  until st_wmy == "M" || st_wmy == "Y"
    puts "Calculate in months or years?"
    print "(M/Y): "
    st_wmy = gets.chomp.upcase
  end
  if st_wmy == "M"
    until st_savings_months >= 0.5 && st_savings_months <= 36
      print "Number of Months (minimum 0.5, maximum 36): "
      st_savings_months = gets.chomp.to_i
    end
    puts "You plan to maximize short term savings over the course of #{st_savings_months} months.".green
    total_savings = (max_savings * st_savings_months).to_f.round(2)
    puts "Based on your current budget, you will likely save approximately $#{'%.2f' % total_savings}.".green
  elsif st_wmy == "Y"
    until st_savings_years <= 3 && st_savings_years != 0
      print "Number of Years (maximum 3.0): "
      st_savings_years = gets.chomp.to_f.round(2)
    end
    puts "You plan to maximize short term savings over the course of #{st_savings_years} years.".green
    total_savings = ((max_savings * 12 )* st_savings_years).to_f.round(2)
    puts "Based on your current budget, you will likely save approximately $#{'%.2f' % total_savings}.".green
  end

elsif continue_option == "B"
puts "\n----- B. LONG TERM SAVINGS PLAN -----"
lt_savings_years = 0
  until lt_savings_years >= 3
    print "Number of Years (minimum 3.0): "
    lt_savings_years = gets.chomp.to_f.round(2)
  end
  puts "You plan to maximize long term savings over the course of #{lt_savings_years} years.".green
  total_savings = ((max_savings * 12 )* lt_savings_years).to_f.round(2)
  puts "Based on your current budget, you will likely save approximately $#{'%.2f' % total_savings}.".green

elsif continue_option == "C"
  puts "\n----- C. SAVINGS GOAL AMOUNT -----"
  savings_months = 0
  savings_years = 0
  timeline_over_year = FALSE
  until savings_goal > 0
    print "Savings Goal Amount: $"
    savings_goal = gets.to_f.round(2)
  end
  puts "You plan to save a total of #{'%.2f' % savings_goal}.".green
  puts "Based on your current budget, you will likely save approximately $#{'%.2f' % total_savings}.".green

  # new logic from here forward
elsif continue_option == "D"
  puts "\n----- D. PAY DEBT -----"
end
