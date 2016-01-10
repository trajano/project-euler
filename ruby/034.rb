$facts = [1]
(1..9).each do |n|
  $facts[n] = n * $facts[n-1]
end

def sum_factorial_of_digits(n)
  a = n.to_s.chars.map(&:to_i)
  sum = 0
  a.each do |z|
    sum += $facts[z]
  end
  if sum == n
    return n
  else
    return 0
  end
end

sum = 0
(10..10**$facts[9].to_s.length).each do |z|
  sum += sum_factorial_of_digits(z)
end

puts sum
