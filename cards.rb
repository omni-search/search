require Dir.pwd + '/cards/wikipediacard.rb'
require Dir.pwd + '/cards/twitter.rb'

class Cards
	def self.getCards(searchterm)
		cards = []
		cards << '<div class="card">example card. you searched for: ' + searchterm + '</div>'
		wiki = Wikipedia.new searchterm
		tweet = Twitter.new searchterm
		if wiki.show # only show the card if it wants to be shown
			cards << wiki.html # add the html for the card to the cards
		end
		if tweet.show # if, not elsif, otherwise you will only get one and not the other!
		  cards << tweet.html
		end	
		
		return cards
	end
	
	# show the card, using the template and the info passed to this function
	def self.cardTemplate(image, title, text)
		'<div class="card">
			<img src="' + image + '" />
			<span class="title">' + title + '</span>
			<span class="text">' + text + '</span>
		</div>' # this is just an example at the mo, the actual html can be changed
	end
end