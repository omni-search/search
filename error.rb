class Error
	def initialize(env)
		@env = env
	end
	
	def html()
	  '<title> Oh Snap!</title>
	  <h1> 404</h1>
	  <h1> Unfortunatly the page you were looking for is not on this server</h1>
	  <h1> Maybe you were looking for <a href="/home">this?</a></h1>'# shows error page
	end
end