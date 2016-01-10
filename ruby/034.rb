def fact(n)
   if (n == 0)
       return 1
   else 
      return n * fact(n-1);
   end
end

$facts = [
  fact(0),
  fact(1),
  fact(2),
  fact(3),
  fact(4),
  fact(5),
  fact(6),
  fact(7),
  fact(8),
  fact(9)
]

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
