require 'json'

class Wikipedia
	def initialize(searchterm)
		# do setup
	  # https://en.wikipedia.org/w/api.php?action=query&list=search&srsearch=chickens&srprop=snippet&srlimit=3

#	  data = URI.encode_www_form 'action' => 'query',
#	    'list' => 'search',
#	    'srsearch' => searchterm,
#	    'srprop' => 'snippet',
#	    'srlimit' => 3
#	  url = URI 'http://en.wikipedia.org/w/api.php'
#    url.query = data
#	  http = Net::HTTP.new url.host
#	  request = http.get url
#	  response = request.body

#    if request.is_a? Net::HTTPSuccess
#      @show = true
#      @text = res.body
#    else
#      @show = false
#    end

#	  puts request.inspect
	  puts 'hi'

    uri = URI 'http://en.wikipedia.org/w/api.php'

    data = URI.encode_www_form 'action' => 'query',
      'list' => 'search',
      'srsearch' => searchterm,
      'srprop' => 'snippet',
      'srlimit' => 3,
      'format' => 'json'
    uri.query = data

    res = Net::HTTP.get_response  uri

    json = JSON.parse( res.body )['query']['search']

    @data = { :title => json[0]['title'],
      :snippet => json[0]['snippet'],
      :url => 'http://en.wikipedia.org/wiki/' + URI.encode(json[0]['title']),
      :also => [
        {
          :title => json[1]['title'],
          :url => 'http://en.wikipedia.org/wiki/' + URI.encode(json[1]['title']),
        },
        {
          :title => json[2]['title'],
           :url => 'http://en.wikipedia.org/wiki/' + URI.encode(json[2]['title']),
        },
      ]
	  }
	end

	def show # show the card or not?
		true
	end

	def html
    '<div class="card wikipedia">
      <a href="' + @data[:url] + '" class="main">
        <span class="title">' + @data[:title] + '</span><br />
        <span class="text">' + @data[:snippet] + '</span>
      </a>
      <span>Also:</span>
      <a href="' + @data[:also][0][:url] + '" class="also">' + @data[:also][0][:title] + '</a>,
      <a href="' + @data[:also][1][:url] + '" class="also">' + @data[:also][1][:title] + '</a>
    </div>'
	end
end