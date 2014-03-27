require 'presto_api'
require 'json'

helpers do
  def request_headers
    env.inject({}){|acc, (k,v)| acc[$1.downcase] = v if k =~ /^http_(.*)/i; acc}
  end  
end

before do
	request.path_info = '/' unless request_headers['x_api_key'] == ENV['api_key']
end

get '/' do
  "Welcome to the Presto API"
end

get '/card_status/:card_number' do
	PrestoAPI::Client.new.card_status_with_number(params[:card_number]).to_json
end

get '/card_status/:username/:password' do
	PrestoAPI::Client.new.card_status_with_username_password(params[:username], params[:password]).to_json
end

get '/me/:username/:password' do
	PrestoAPI::Client.new.user_with_username_password(params[:username], params[:password]).to_json
end

get '/transaction_history/:username/:password' do
	PrestoAPI::Client.new.transaction_history_with_username_password(params[:username], params[:password]).map(&:to_json).to_json
end

post '/balance' do
	credit_card = PrestoAPI::CreditCard.new
	credit_card.name = params[:credit_card_name]
	credit_card.number = params[:credit_card_number]
	credit_card.expiry_month = params[:credit_card_expiry_month]
	credit_card.expiry_year = params[:credit_card_expiry_year]

	puts PrestoAPI::Client.new.load_unregistered_card(params[:card_number],
																										params[:email],
																										params[:amount],
																										credit_card).to_json
end
