require '/home/doug/projecteuler.net/tools/pemethods.so'

include PEMethods

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
