require 'sinatra'

get '/' do
	'<p><a href="/memory">Memory</a></p>
	<p><a href="/disk">Disk</a></p>'
end


get '/memory' do
	m = `free -m` 
	"<pre>#{m}</pre>"
  
end

get '/disk' do
	d = `df -h`
	"<pre>#{d}</pre>"
end

