class Home
	def initialize(env)
		@env = env
	end
	
	def html()
		'<html>
			<body>
				<h1>Welcome to Omni</h1>
				<form action="/search" method="GET">
					<p>Here is a search box: <input type="text" name="q" /></p>
					<p>And here is a go button: <input type="submit" /></p>
				</form>
			</body>
		</html>'
	end
end