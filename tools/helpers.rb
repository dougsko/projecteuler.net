# libprime.rb
# A much faster prime class.
# 
class Integer
  def isPrime?
    if self <2
      return false
    elsif self < 4
      return true
    elsif self % 2 == 0
      return false
    elsif self < 9
      return true
    elsif self % 3 == 0
      return false
    else
      r = (self**0.5).floor
      f = 5
      f.step r,6 do |g|
        if self % g == 0
          return false
        end
        if self % (g + 2) == 0
          return false
        end
      end
      return true
    end
  end
end

class Prime
  def initialize
    @last_prime = nil
  end
  
  def succ
    if @last_prime.nil?
      @last_prime = 2
      return 2
    else
      i = @last_prime + 1
      i += 1 if i % 2 == 0
      while not i.isPrime?
        i += 2
      end
      @last_prime = i
      return i
    end
  end
  alias next succ
  def each
    loop do
      yield succ
    end
  end
end

def gcd(a, b)
    while a != b
        if a > b
            a = a-b
        else
            b = b-a
        end
    end
    a
end

def phi(n)
    result = n

    2.upto(n) do |i|
        break if i * i > n

        if (n % i == 0)
            result -= result / i
        end
        while (n % i == 0)
            n /= i
        end
    end
    if (n > 1)
        result -= result / n
    end
    result
end
