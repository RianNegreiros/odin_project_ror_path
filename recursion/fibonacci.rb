def fibs(n)
  i, j = 0, 1
  seq = []
  while i <= n do
    seq << i
    i, j = j, i + j
  end
  seq << i
end

puts fibs(8)

def fibs_rec(n)
  return [0, 1] if n == 2

  seq = fibs_rec(n - 1)

  seq << seq[-2] + seq[-1]
end

puts fibs_rec(8)