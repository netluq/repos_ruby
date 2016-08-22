class MyMatrix
  def initialize(m)
    @matrix = m
  end
  
  def to_s
    @matrix.each {|array| puts array.inspect}
  end
  
  def valid?
    row_result = @matrix.all? {|row| row.size == row.uniq.size}
    column_result = @matrix.transpose.all? {|column| column.size == column.uniq.size}
    matrix_result = row_result && column_result
    p matrix_result
  end
end

m = [[1,2],[1,2]]
matrix = MyMatrix.new(m)
matrix.to_s
matrix.valid?