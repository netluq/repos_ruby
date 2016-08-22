class Subtitle
  attr_accessor :text, :start_time, :end_time
  
  def initialize (text, start_time, end_time)
    @text = text
    @start_time = start_time
    @end_time = end_time
  end
end

class LoadSubtitle
  def initialize(raw_array)
    @raw_array = raw_array
  end
  def load_subtitle
    @raw_array.map { |raw_subtitle| Subtitle.new(raw_subtitle[:text], raw_subtitle[:start_time], raw_subtitle[:end_time]) }
  end
end

class Slide
  attr_accessor :subtitle, :framerate
  def initialize (subtitle, framerate)
    @subtitle = subtitle
    @framerate = framerate
    @subtitle[:framerate] = @framerate
  end
  def show_subtitle
    print "#{@subtitle[:text]} "
  end
  def get_first_frame
    puts "StartFrame: #{(@subtitle[:start_time] * @subtitle[:framerate]).round}"  
  end
  def get_last_frame
    puts "EndFrame: #{(@subtitle[:end_time] * @subtitle[:framerate]).round}" 
  end
end

class SlideShow
  def initialize (subtitle_array, framerate)
    @subtitle_array = subtitle_array
    @framerate = framerate
  end
  def slide_show
    #sortujemy tablice
    @subtitle_array.sort_by! {|row| row[:end_time]}
    
    #wyswietlamy posortowane napisy
    print "\n"
    @subtitle_array.each {|subtitle_row| Slide.new(subtitle_row, @framerate).show_subtitle}
    print "\n"
    
    #wyswietlamy pierwsza i ostatnia klatke dla calego napisu
    first_frame = Slide.new(@subtitle_array.first,@framerate).get_first_frame
    last_frame = Slide.new(@subtitle_array.last,@framerate).get_last_frame
  end
end


subtitle_array = [
  {text:"World", start_time:1.6, end_time:2.3},
  {text:"Hello", start_time:0.3, end_time:1.3},
  {text:"!!!", start_time:2.3, end_time:3.1}
]

subtitle = LoadSubtitle.new(subtitle_array).load_subtitle
frame_rate = 25
SlideShow.new(subtitle, frame_rate).slide_show
