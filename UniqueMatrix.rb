require 'matrix'

class MyMatrix
  def initialize(m)
    #aby uniezaleznic od rozmiaru macierzy, tworzymy macierz z kazdego elementu (wiersza) m:
    @matrix = Matrix[*m]
    @size = m.size    
  end
  
  def to_s
    @matrix.to_a.each {|array| puts array.inspect}
  end
  
  def valid?
    if @matrix.square?
      unique_result = true
      i = 0
      arr = Array.new()

      #przepisujemy macierz do jednej tablicy n-wymiarowej
      @matrix.to_a.each {|e| arr.push(e)}
      #p arr

      while i < @size-1 do
        #puts "Check #{i}: #{arr[i] != arr[i+1]}"
        unique_result = arr[i] != arr[i+1]
        if unique_result==false
          break
        end
        i += 1
      end
  
      p unique_result
    else
      puts "Matrix is not square"
    end
  end
end

m = [[1,2,3],[1,2,3],[1,2,3]]
matrix = MyMatrix.new(m)
matrix.to_s
matrix.valid?




