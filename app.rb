#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"
end

get '/about' do
	erb :about
end

get '/visit' do
	erb :visit
end

get '/contacts' do
	erb :contacts
end

post '/visit' do
	@username = params[:username]
	@phone    = params[:phone]
	@datatime = params[:datatime]
	@master   = params[:master]
	@color    = params[:color]
	if @master == '1'
		@master = 'Walter White'
	elsif @master == '2'
		@master = 'Jessie Pincman'
	else
		@master = 'Gus Fring'
	end

	hh = {
		:username => 'Enter name',
		:phone    => 'Enter phone',
		:datatime => 'Enter date and time'
	}

	hh.each do |key, value|
		if params[key] == ''
			@error = hh[key]
			return erb :visit
	end
end

	@message = "#{@username}, you register on #{@datatime}.Your master #{@master}.Color: #{@color}. We are waiting for you!"
	f = File.open './public/visit.txt', 'a'
	f.write "Username: #{@username}, phone: #{@phone}, date and time: #{@datatime}, master: #{@master}, color: #{@color}"
	f.close
	erb :visit
end

post '/contacts' do
	@email    = params[:email]
	@contacts = params[:contacts]
	@message = "We get your data!"
	f = File.open './public/contacts.txt', 'a'
	f.write "Email: #{@email}, contacts: #{@contacts}"
	f.close
	erb :contacts
end
