class Subtitle
  attr_accessor :text, :start_time, :end_time
  
  def initialize(text:, start_time: 0.0, end_time: 0.0)
    self.text = text
    self.start_time = start_time
    self.end_time = end_time
  end

  def to_s
    "#{start_time} -> #{end_time} #{text}"
  end
  
  def self.load_list(raw_subtitles)
    raw_subtitles.map do |raw_subtitle|
      Subtitle.new(raw_subtitle)
    end
  end
end

class SlideShow
  attr_accessor :subtitle_array, :framerate
  
  def initialize(subtitle_array, framerate)
    self.subtitle_array = subtitle_array
    self.framerate = framerate
  end
  
  def slide_show
    subtitle_array.sort_by! {|subtitle| subtitle[:end_time]}
    Subtitle.load_list(subtitle_array).each do |subtitle|
      # w tej petli chcialbym wykonac np operacje mnozenia: subtile[:start_time] * framerate,
      # ale Subtitle.to_s nie zwraca mi juz tego w postaci tablicy
      puts subtitle
    end
  end
end

raw_subtitles = [
  { text: "World", start_time: 1.6, end_time: 2.3 },
  { text: "Hello", start_time: 0.3, end_time: 1.3 },
  { text: "!!!",   start_time: 2.3, end_time: 3.1 }
]

framerate = 25
SlideShow.new(raw_subtitles,framerate).slide_show
