require 'colorize'
puts "\n\n\n"
puts "############## -pinchpenny- ##############".yellow
puts "Welcome!  This tool will walk you through the steps of outlining your income, expenses, savings goals, and will assist in creation of a budget."
puts "DISCLAIMER: This program is not intended as financial advice."

puts "\n####### Step 1: Income & Expenses #######"
puts "----- INCOME -----"

print "\nPlease input your before tax hourly wage: $"
income_wage = gets.chomp.to_f.round(2)

known_tax = ""
until known_tax == "y" || known_tax == "yes" || known_tax == "n" || known_tax == "no"
  print "\nDo you know your tax deducations as a percentage? (y/n): "
  known_tax = gets.chomp.downcase
end

net_wage = ""
if known_tax == "n" || known_tax == "no"
  puts "OK!  We'll help figure out an approximation for your after tax wage.  \nIf you have more than one pay stub on hand, please input the total between as many as possible for a more accurate calculation."
  print "Please input last net payday amount: $"
  payday_amount = gets.chomp.to_f.round(2)
  print "Number of hours from referenced pay period (input partial hours as a decimal value): "
  payday_hours = gets.chomp.to_f.round(2)
  net_wage = (payday_amount / payday_hours).round(2)
elsif known_tax == "y" || known_tax == "yes"
  print "Tax deducations (%): "
  income_tax = gets.chomp.to_i
  tax_remainder = (100 - income_tax) * 0.01
  net_wage = (income_wage * tax_remainder).round(2)
else
end


print "Number of work hours per week (if you do not work consistent hours, please input a reasonable average -- input partial hours as a decimal value): "
income_hours = gets.chomp.to_f.round(2)

annual_hours = income_hours * 52
annual_net_income = (net_wage * annual_hours).round(2)
monthly_net_income = (annual_net_income / 12).round(2)

puts "\nHOURLY WAGE: $#{'%.2f' % income_wage}".green
puts "NET HOURLY WAGE: $#{'%.2f' % net_wage}".green
puts "MONTHLY NET INCOME: $#{'%.2f' % monthly_net_income}".green
puts "ANNUAL NET INCOME: $#{'%.2f' % annual_net_income}".green

puts "\n\n----- REGULAR EXPENSES -----"
puts "Please input your monthly expenses by category...Press ENTER to skip if a category does not apply to your budget."

print "Rent (do not include mortgage payments): $"
expenses_rent = gets.chomp.to_f.round(2)
print "Insurance: $"
expenses_insurance = gets.chomp.to_f.round(2)
print "Utilities (Heat/Electricity/Water): $"
expenses_utilities = gets.chomp.to_f.round(2)
print "Public Transit: $"
expenses_transit = gets.chomp.to_f.round(2)
print "Personal Transportation (Gas/Car Insurance -- do not include car payments): $"
expenses_transportation = gets.chomp.to_f.round(2)
print "Phone Bill: $"
expenses_phone = gets.chomp.to_f.round(2)
print "Internet: $"
expenses_internet = gets.chomp.to_f.round(2)
print "Food: $"
expenses_food = gets.chomp.to_f.round(2)
print "Household Supplies & Toiletries: $"
expenses_household = gets.chomp.to_f.round(2)
print "Entertainment (TV, Netflix, misc. subscriptions): $"
expenses_entertainment = gets.chomp.to_f.round(2)
print "Other (do not include debt payments): $"
expenses_other = gets.chomp.to_f.round(2)

total_regular_expenses = expenses_rent + expenses_insurance + expenses_utilities + expenses_transit + expenses_transportation + expenses_phone + expenses_internet + expenses_food + expenses_household + expenses_entertainment + expenses_other


puts "\nREGULAR EXPENSES: $#{'%.2f' % total_regular_expenses}".red

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

  if remains < lowest_amount
    lowest_amount = remains
    lowest_amount_name = name
  end


  print "\nAdd another recurring payment? (y/n) "
  payments = gets.chomp.downcase
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
puts "----- INCOME vs EXPENSES -----"

total_expenses = (total_regular_expenses + total_monthly_contributions).to_f.round(2)
monthly_difference = (monthly_net_income - total_expenses).to_f.round(2)

puts "\nMONTHLY NET INCOME: $#{'%.2f' % monthly_net_income}".green
puts "REGULAR EXPENSES: $#{'%.2f' % total_regular_expenses}".red
puts "MONTHLY DEBT PAYMENTS: $#{'%.2f' % total_monthly_contributions}".red
puts "TOTAL MONTHLY EXPENSES: #{'%.2f' % total_expenses}".red
puts "\nDIFFERENCE: $#{'%.2f' % monthly_difference}".blue
