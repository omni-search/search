require Dir.pwd + '/cards/wikipediacard.rb'

class Cards
	def self.getCards(searchterm)
		cards = []
		cards << '<div class="card">example card</div>'
		wiki = Wikipedia.new searchterm
		if wiki.show
			cards << wiki.html
		end
		return cards
	end
	
	def self.cardTemplate(image, title, text)
		'<div class="card">
			<img src="' + image + '" />
			<span class="title">' + title + '</span>
			<span class="text">' + text + '</span>
		</div>'
	end
end