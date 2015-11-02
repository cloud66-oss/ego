require 'RMagick'

class ImagesController < ApplicationController
	def generate
		# TOOD: add caching?

		letters = params[:letters]
		render_error if letters !~ /^[a-zA-Z]{1,2}$/

		if params.has_key?(:size)
			size = params[:size].to_i
			render_error if size < 10 || size > 400
		else
			size = 100
		end

		letters = letters.upcase
		# generate the image
		image = ImageGenerator.new.generate(letters, size: size)
		send_data image.to_blob, :type => 'image/png', :disposition => 'inline'
	end

	def render_error
		raise ActionController::RoutingError.new('Not Found')
	end
end