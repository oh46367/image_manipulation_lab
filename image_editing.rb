require "./image_array.rb"
puts "What is the name of the file with the image you would like to perform a manipulation on? It must be in this directory."
file_name = gets.chomp
img = ImageArray.new("./" + file_name)
puts "What effect would you like do use: red tint, random noise, black and white, or photo negative?"
answer = gets.chomp.to_s
if answer == "black and white".downcase
	img.each do |row|
		row.each do |pixel|
			pixel_gray = (pixel.red + pixel.blue + pixel.green)/3
			pixel.red = pixel_gray
			pixel.blue = pixel_gray
			pixel.green = pixel_gray
		end
	end
img.write("./picture_bandw.jpg")
elsif answer == "red tint".downcase
	img.each do |row|
		row.each do |pixel|
 			pixel.red = img.max_intensity
		end
	end
img.write("./picture_red_tint.jpg")
elsif answer == "random noise".downcase
	img.each do |row|
		row.each do |pixel|
			pixel.red = -rand(pixel.red > 10000 ? 10000 : pixel.red)
			pixel.blue = -rand(pixel.blue > 10000 ? 10000 : pixel.blue)
			pixel.green = -rand(pixel.green > 10000 ? 10000 : pixel.green)
				
		end
	end
img.write("./picture_random_noise.jpg")
elsif answer == "photo negative".downcase
	img.each do |row|
		row.each do |pixel|
			pixel.red = img.max_intensity - pixel.red
			pixel.blue = img.max_intensity - pixel.blue
			pixel.green = img.max_intensity - pixel.green
		end
	end
img.write("./picture_photo_negative.jpg")
else
	puts "The effect you have put is not available or does not exist. Please try again."
end
puts "The image has been placed in a jpeg file titled 'picture_(effect).jpg'. In order to view it, please copy it to your public html folder."
