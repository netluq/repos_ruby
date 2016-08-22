require 'matrix'

class MyMatrix
  def initialize(m)
    #@matrix = Matrix[m[0],m[1],m[2]]  / przyklad uzycia pierwszego i ostatniego: @matrix = Matrix[m.first,m.last]
    #aby unizezaleznic powyzszy zapis od rozmiaru macierzy, wykonujemy dla kazdego elementu m:
    @matrix = Matrix[*m]
    @size = m.size    
  end
  
  #def []*a
  #  a.size == 1 ? @matrix[*a] : @matrix[a.first][a.last]
  #end

  #def []
  #  m1 = Matrix[@row,@column]
  #  p m1[0,0]
  #end
  
  def pokaz
    p @matrix
    p @matrix[0,0]
    puts('Rozmiar '+@size.to_s)
    puts @matrix.square?
    #@matrix.to_a.each {|e| puts e.inspect} - OK
    @matrix.to_a.each {|e| puts e.inspect}
    #@matrix.to_a.each do |e|
    #  if(e==1) then*
    #    e=0
    #  end
    #  puts e
    #end
  end
  
  def valid?
    unique_result = true
    i = 0
    l = 3
    arr = Array.new()

    #przepisujemy macierz do jednej tablicy n-wymiarowej
    @matrix.to_a.each {|e| arr.push(e)}
    p arr

    while i < l-1 do
      #puts "Check #{i}: #{arr[i] == arr[i+1]}"
      #unique_result = arr[i] == arr[i+1]
      #puts "Check #{i}: #{arr[i] != arr[i+1]}"
      unique_result = arr[i] != arr[i+1]
      if (unique_result==false)
        break
      end
      i += 1
    end

    p unique_result
  end
end

m = [[7,28,9],[7,28,9],[7,28,9]]
matrix = MyMatrix.new(m)
#matrix.pokaz
matrix.valid?

#matrix = Matrix[[1,2],[3,4]]
#puts(matrix[0,0])



