# 3. Заполнить массив числами фибоначчи до 100

fib = [0,1]

loop do
  break if fib[-1] + fib[-2] > 100
  fib << fib[-1] + fib[-2]
end

p fib