require Dir.pwd + '/cards/wikipediacard.rb'

class Cards
	def self.getCards(searchterm)
		cards = []
		cards << '<div class="card">example card. you searched for: ' + searchterm + '</div>'
		wiki = Wikipedia.new searchterm
		if wiki.show # only show the card if it wants to be show
			cards << wiki.html # add the html for the card to the cards
		end
		return cards
	end
end