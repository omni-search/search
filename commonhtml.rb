class CommonHTML
	def self.getHeader(searchPreload = '')
		'<div id="header">
			<img src="images/omni.png" />
			<form action="/search" method="GET">
				<input type="text" name="q">' + searchPreload + '</input>
				<input type="submit" />
			</form>
		</div>'
	end
		
	def self.getHead(cards = false, header = true, common = true)
		html = '<head>
			<title>Omni - Search squared</title>' # need a better title, this was all I could think of in 10 seconds
		if cards
			html += '<link rel="stylesheet" type="text/css" href="/css/cards.css">'
		end
		if header
			html += '<link rel="stylesheet" type="text/css" href="/css/header.css">'
		end
		if common
			html += '<link rel="stylesheet" type="text/css" href="/css/common.css">'
		end
		html += '</head>'
	end
end