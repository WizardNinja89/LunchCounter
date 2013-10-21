class PlacesController < ApplicationController
	# require "oauth"

	def index
		if params[:term]
			@search = URI::escape(params[:term])
			@location = URI::escape(params[:location])
			path = "/v2/search?&term=#{@search}&location=#{@location}&limit=5"
			@results = JSON.parse(get_access_token.get(path).body)
		end
	end

	def show
		business = URI::escape(params[:id])
		path = "/v2/business/#{business}"
		@business = JSON.parse(get_access_token.get(path).body)
	end

	def new
		@id = params[:id]
	end

	def create
	end

end
