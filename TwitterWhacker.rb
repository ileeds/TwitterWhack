require 'twitter'
require 'byebug'

class TwitterWhacker
  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "cyQva4TaPBOUkPJUkqXRcLTd1"
      config.consumer_secret     = "jDcxasGsRKCGafjwJATiO9X0XcZgP3nbzZaOoFbk7f6pLMlPa0"
      config.access_token        = "1322322090-SsLywbVCowKIb4hqcsHvJqfeXZCOg8yvrRPcJdw"
      config.access_token_secret = "Ct2VZuBpqCtQkZvV2CaUlkbSA8Op2C9Rc9aw3IWOcU5mz"
    end
  end

  def word_search (one, two)
    @results=@client.search("#{one} #{two}", result_type: "recent").take(100)
  end

  def score (one, two)
    @results_one=@client.search("#{one}", result_type: "recent").take(100)
    @results_two=@client.search("#{two}", result_type: "recent").take(100)
    @results_one.count*@results_two.count
  end

  def index
    if @results.nil?
      0
    else
      @results.count
    end
  end

  def example
    return @results.first
  end

end
