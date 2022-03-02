def fibs(n)
  fn = []
  a, b = [0, 1]  
  (n - 1).times do    
    fn << a
    a, b = b, a + b  
  end
  fn << a
end

puts fibs(8)