require 'net/http'
class ContentGrabber

  def grab(url, file_name)
    uri = URI.parse(url)
    open(file_name, 'wb') do |file|
      file << Net::HTTP.get(uri)
    end
  end
end