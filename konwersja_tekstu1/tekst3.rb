class InputFile
  def initialize(path)
    @path = path
  end
  
  def path
    File.open(@path,'r')
  end
end

class OutputFile
  def initialize(path)
    @path = path
  end

  def path
    File.open(@path,'w')
  end
end

class SpecialChar
  attr_accessor :char
  
  def initialize(char)
    self.char = char
  end
  
  def is_paragraph?
    char.each_byte do |byte|
      if byte == 167
        return true
      else
        return false
      end
    end
  end
end

class ConvertFile
  attr_accessor :input_file, :output_file
  
  def initialize (input_file, output_file)
    self.input_file = input_file
    self.output_file = output_file
  end
  
  def convert
    new_text = ""
    buffer = ""
    
    source = input_file.path
    destination = output_file.path
    
    source.each_char do |char|
      #jezeli trafimy na znak ustepu
      if SpecialChar.new(char).is_paragraph? == true
        
        #jezeli znak poprzedzajacy to nowa linia --> zrob tylko wciecie
        if buffer == "\n"
          new_text << "     "
        
        #jezeli nie --> wstaw znak nowej linii i zrob wciecie
        else
          new_text << "\n     "
        end
      end
      new_text << char
      buffer = char
    end
    
    destination.puts(new_text)
  end
end

input_file = InputFile.new('/home/luq/temp/infile.txt')
output_file = OutputFile.new('/home/luq/temp/outfile.txt')

ConvertFile.new(input_file,output_file).convert