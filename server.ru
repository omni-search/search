require Dir.pwd + '/app.rb'

class RackServer
  def call(env)
	a = App.new
    [200, {"Content-Type" => "text/html"}, [a.html]]
  end
end
 
run RackServer.new