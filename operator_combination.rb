# Write a program that outputs all possibilities to put the operators ‘+’, ‘-’, 
# or nothing between the numbers 1,2,...,9 (in this order) such that the result is 100. 
# For example 1 + 2 + 3 - 4 + 5 + 6 + 78 + 9 = 100.
# Run tests with rspec operator_combination.rb

def possibility(equation_string, remaining_numbers, results)
  if remaining_numbers.empty?
    results.push(equation_string)
    return
  end
  num = remaining_numbers[0]
  new_numbers = remaining_numbers.slice(1, remaining_numbers.length - 1)

  if num == 0
    possibility("#{num}", new_numbers, results)
  else
    possibility("#{equation_string} - #{num}", new_numbers, results)
    possibility("#{equation_string} + #{num}", new_numbers, results)
    possibility("#{equation_string}#{num}", new_numbers, results)
  end
end

def get_sum(equation_string)
array = equation_string.split(' ')
sum = array[0].to_i

for i in 1..array.length
  next if array[i] == "-" || array[i] == "+"
  operator = array[i - 1]
  sum = sum + array[i].to_i if operator == "+"
  sum = sum - array[i].to_i if operator == "-"
end

sum
end

def find_equations_equaling_one_hundred
results = []
possibility("", numbers = [0,1,2,3,4,5,6,7,8,9], results)
results.select{|equation_string| get_sum(equation_string) == 100 }
end

describe "#get_sum" do
    it "it should equal 100 for the sample string" do
        expect(get_sum("1 + 2 + 3 - 4 + 5 + 6 + 78 + 9")).to eq(100)
    end
end

describe "#find_equations_equaling_one_hundred" do
    it "it should find that all result equation strings should add up to 100" do
        results = find_equations_equaling_one_hundred
        results.each do |equation_string|
        expect(get_sum(equation_string)).to eq(100)
      end
    end
end