require "sinatra"
require "wordnik"
require 'open-uri'
require "nokogiri"
require "haml"

Wordnik.configure do |config|
  config.api_key = 'api_key_goes_here'
end


class Word
  attr_accessor :spelling, :definitions

  def initialize(spelling)
    @spelling = spelling
    @definitions = []
    find_definitions
  end

  def find_definitions
    definitions = Wordnik.word.get_definitions(self.spelling, :limit => 5)
    definitions.each{ |definition| @definitions << definition["text"] }
  end

  def definitions
    @definitions
  end

  def has_definitions?
    !@definitions.empty?
  end
end


get "/" do
  if params[:word]
    doc = Nokogiri::HTML(open("http://spell.ockham.org/?word=#{params[:word]}"))
    @words = []
    doc.xpath("//spelling").first(5).each do |spelling|
      @words << Word.new(spelling.content)
    end
  end
  haml :index
end
