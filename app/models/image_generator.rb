require 'RMagick'

class ImageGenerator
	include Magick

	def generate(letters, size: 100)
		image = Image.new(size, size) {
			self.background_color = '#cccccc'
			self.gravity = Magick::CenterGravity
			self.format = 'png'
		}

		txt = Magick::Draw.new
		txt.gravity = Magick::CenterGravity
		txt.pointsize = (3.0 / 5.0) * size
		txt.fill = 'white'
		txt.font = 'Helvetica New'
		image.annotate(txt, 0, 0, 0, 0, letters)
		return image
	end
end