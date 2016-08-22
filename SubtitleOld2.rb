class Subtitle
  def initialize(subtitle_array)
    @subtitle_array = subtitle_array
    @framerate = 25
  end
  
  def display
    #posortowanie i zapisanie tablicy
    @subtitle_array.sort_by! {|row| row[:end_time]}
    @subtitle_array.each {|text| print "#{text[:text]} "}
    
    start_time = @subtitle_array.first[:start_time]
    end_time = @subtitle_array.last[:end_time]
    
    start_frame = time2frame(start_time,@framerate)
    end_frame = time2frame(end_time,@framerate)
    
    puts "\n\nstart_frame: #{start_frame}"
    puts "end_frame: #{end_frame}"
  end
  
  def time2frame(time,framerate)
    result = (time * framerate).round
  end
end

sub1 = {:text => "World", :start_time => 1.6, :end_time => 2.3}
sub2 = {:text => "Hello", :start_time => 0, :end_time => 1.3}
sub3 = {:text => "!!!", :start_time => 2.3, :end_time => 3.1}

subtitle_array = []
subtitle_array.push(sub1, sub2, sub3)

subtitle = Subtitle.new(subtitle_array)
subtitle.display



