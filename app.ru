app = Rack::Builder.new do
  map "/" do
    run Proc.new {|env| [200, {"Content-Type" => "text/html"}, File.open("public/index.html",File::RDONLY)]}
  end
 
end
 
run app