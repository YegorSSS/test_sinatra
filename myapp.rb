require 'sinatra'
require 'mongoid'
require 'json/ext'


configure do
  Mongoid.load!("mongoid.yml")
end

class Statistic
	include Mongoid::Document
	field :time, type: String
	field :info, type: String
end

get "/" do
	@stat = Statistic.all
	erb :home
end

post "/" do
	static = Statistic.new(time: params[:time], info: params[:info])
	static.save
	redirect "/"
end

get "/memory" do
	@m = `free -m`
	erb :memory
end

get "/disk" do
	@h = `df -h`
	erb :disk
end

post "/delete" do
	Statistic.where(time: params[:time]).delete
	redirect "/"
end
