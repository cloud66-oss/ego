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
		txt.pointsize = (1.0 / 2.0) * size
		txt.fill = 'white'
		txt.font = 'Helvetica New'

		adjustment_x = -4.0/(200.0/size.to_f)
		adjustment_y = 12.0/(200.0/size.to_f)
		image.annotate(txt, 0, 0, adjustment_x, adjustment_y, letters)
		return image
	end
end