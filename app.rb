require 'presto_api'
require 'json'

before do
	request.path_info = '/' unless params[:api_key] == ENV['api_key']
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
