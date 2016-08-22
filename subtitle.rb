class Subtitle
  attr_accessor :text, :start_time, :end_time
  
  def initialize (text:, start_time: 0.0, end_time: 0.0)
    self.text = text
    self.start_time = start_time
    self.end_time = end_time
  end
  
  def to_s
    "#{start_time} -> #{end_time} #{text}"
  end
  
  def self.load_subtitles(raw_subtitles)
    raw_subtitles.map do |raw_subtitle|
      Subtitle.new(raw_subtitle)
    end
  end
end

class SlideShow
  def initialize (subtitle_array, framerate)
    @subtitle_array = subtitle_array
    @framerate = framerate
  end
  
  def slide_show
    @subtitle_array.sort_by! {|e| e[:end_time]}
    
    puts "#{Subtitle.load_subtitles(@subtitle_array)} #{@framerate}"
  end
end


subtitle_array = [
  {text:"World", start_time:1.6, end_time:2.3},
  {text:"Hello", start_time:0.3, end_time:1.3},
  {text:"!!!", start_time:2.3, end_time:3.1}
]

frame_rate = 25
SlideShow.new(subtitle_array, frame_rate).slide_show
