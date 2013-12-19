class Error
	def initialize(env)
		@env = env
	end
	
	def html()
		'<html>
			<head>
				<title> Oh Snap!</title>
			</head>
			<body>
				<h1> 404</h1>
				<p> Unfortunatly the page you were looking for is not on this server</p>
				<p> Maybe you were looking for <a href="/home">this?</a></p>
			</body>
		</html>' # shows error page
	end
end