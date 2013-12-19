class ErrorPage
	def initialize(env)
		@env = env
	end
	
	def html
		'<html>
			<body>
				<h1>ERROR</h1>
			</body>
		</html>'
	end
end