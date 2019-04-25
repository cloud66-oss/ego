require 'rmagick'

class ImageGenerator
	include Magick

		def generate(letters, size: 100)
		path = "/cache/#{letters}_#{size}.png"
		if File.exists?(path)
			image = Image.read(path).first
		else
			image = Image.new(size, size) {
				self.background_color = '#cccccc'
				self.gravity = Magick::CenterGravity
				self.format = 'png'
			}

			txt = Magick::Draw.new
			txt.gravity = Magick::CenterGravity
			txt.pointsize = (1.0 / 2.0) * size
			txt.fill = 'white'
			# this is now the font location
			txt.font = '/usr/share/fonts/truetype/liberation/LiberationMono-Regular.ttf'

			adjustment_x = -4.0/(200.0/size.to_f)
			adjustment_y = 12.0/(200.0/size.to_f)
			image.annotate(txt, 0, 0, adjustment_x, adjustment_y, letters)
			image.write(path)
		end
		return image
	end
end