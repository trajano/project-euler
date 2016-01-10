def is_palindrome(str)
   str == str.reverse
end
def double_base_palindrome(n)
  if is_palindrome(n.to_s) && is_palindrome(n.to_s(2))
    return n
  else
    return 0
  end
end

sum = 0
(1..1000000).each do |z|
  sum += double_base_palindrome(z)
end

puts sum
