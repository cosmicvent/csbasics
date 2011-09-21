#names = ['omar', 'khalid', 'jack', 'john'] # => [4, 6, 4, 4]

#name_lengths = []

#names.each do |n|
#name_lengths << n.length
#end

#puts name_lengths.inspect
#
#

#names = ['omar', 'khalid', 'jack', 'john'] 

#cap_names = []

#names.each do |n|
#cap_names << n.upcase
#end


#puts cap_names.inspect


names = ['omar', 'khalid', 'jack', 'john'] 

cap_names = names.map do |n|
  n.upcase
end

puts cap_names


#def map_color_to_hex(color)
  #if color == 'red' 
    #return '#ff0000'
  #end
  #if color == 'blue' 
    #return '#00ff00'
  #end
  #if color == 'green' 
    #return '#0000ff'
  #end
#end

#colors = ["red" , "blue", "red", "green", "blue"]

#hex_colors = colors.map do |color|
  #color == 'red' ? '#ff0000' : ( color == 'blue' ? '#00ff00' : '#0000ff')
#end

#puts hex_colors.inspect

