fizzbuzz = fn
  0, 0, _ -> "FizzBuzz"
  0, _, _ -> "Fizz"
  _, 0, _ -> "Buzz"
  _, _, arg -> "#{arg}"
end

fizzbuzz_solver = fn
  n -> IO.puts(fizzbuzz.(rem(n, 3), rem(n, 5), n))
end

fizzbuzz_solver.(10)
fizzbuzz_solver.(11)
fizzbuzz_solver.(12)
fizzbuzz_solver.(13)
fizzbuzz_solver.(14)
fizzbuzz_solver.(15)
fizzbuzz_solver.(16)
