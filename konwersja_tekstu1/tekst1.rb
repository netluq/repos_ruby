class InputFile
  def path
    File.open('c:\lukasz\_priv\temp\testfile.txt','r')
  end
end

class OutputFile
  def path
    File.open('c:\lukasz\_priv\temp\outfile.txt','a')
  end
end

in_file = InputFile.new.path

#content  = in_file.read
#puts content

content  = in_file

a = ""
bufor = ""

content.each_char do |char|
  char.each_byte do |byte|
    if byte == 167 && bufor != "\n"
      a << "\n"
    end
  end
  a << char
  bufor = char
end

puts a

#dopracowac aby nie bylo podwojnych enterow

#out_file = OutputFile.new


#zapis do tablicy a nastepnie z tablicy do pliku
#arr = in_file.path.readlines.map {|line| line}
#arr.each do
#  |e| out_file.path.puts(e)
#end

#paragraf "\xA7"
#char.ord == 245

#znalezienie numery bajtu (167)
#content.each_byte do |byte|
  #if byte == 167
    #p byte.chr
  #end
#end


#myfile_array = myfile.path.read
#myfile_array.split("a").count