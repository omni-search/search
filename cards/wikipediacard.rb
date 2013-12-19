class Wikipedia
	def initialize(searchterm)
		# do setup
		@image = 'http://a.url'
		@title = 'Wikipedia'
		@text = 'This is on wikipedia: ' + searchterm + ' is a...'
	end
		
	def show # show the card or not? 
		true
	end
		
	def html
		Cards.cardTemplate(@image, @title, @text)
	end
end