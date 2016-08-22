class Subtitle
  attr_accessor :text, :start_time, :end_time
  
  def initialize(text,start_time,end_time)
    @text = text
    @start_time = start_time
    @end_time = end_time
  end
  
  def add_subtitle
    if defined? subtitle_array
      subtitle_array.push([@text,@start_time,@end_time])
    else
      subtitle_array = [@text, @start_time, @end_time]
    end

    DisplaySubtitle.new(subtitle_array).display_start
  end
end

class DisplaySubtitle
  attr_accessor :subtitle_array
  
  def initialize(subtitle_array)
    @subtitle_array = subtitle_array
    #zakladam ze video ma 20 klatek na sekunde
    @framerate = 25
  end
  
  def display_start
    #@subtitle_array[1..3].each {|e| puts "#{e} :   #{e*@framerate}"}
    start_frame = @subtitle_array[1..1].collect {|e| "start_frame #{e*@framerate}"}
    end_frame = @subtitle_array[2..3].collect {|e| "end_frame #{e*@framerate}"}
    p @subtitle_array[0..0].concat(start_frame).concat(end_frame)
  end
end


Subtitle.new("Hello",0,1.3).add_subtitle
Subtitle.new("World",1.3,2.5).add_subtitle
Subtitle.new("!!!",2.6,3.6).add_subtitle



