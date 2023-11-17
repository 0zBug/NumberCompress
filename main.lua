
local Base255 = {}
local NumberCompress = {}

Base255.Encode = function(Number)
	local Encoded = {}

	while Number > 0 do
		table.insert(Encoded, 1, (Number % 255))

		Number = math.floor(Number / 255)
	end

	return string.char(table.unpack(Encoded))
end

Base255.Decode = function(String)
	local Table = {string.byte(String, 1, -1)}

	local Decoded = 0
	for Index = 1, #Table do
		Decoded = Decoded + Table[#Table - Index + 1] * 255 ^ (Index - 1) 
	end

	return Decoded
end

NumberCompress.Encode = function(Number)
	local Floor = math.floor(Number)
	local Decimal = tonumber(string.reverse(Number - Floor))

	return (Floor ~= 0 and Decimal ~= 0) and Base255.Encode(Floor) .. string.char(255) .. Base255.Encode(Decimal) or (Floor ~= 0 and Base255.Encode(Floor)) or string.char(255) .. Base255.Encode(Decimal)
end

NumberCompress.Decode = function(Encoded)
	local Floor, Decimal = unpack(string.split(Encoded, string.char(255)))
	
	Decimal = Decimal and tonumber("0." ..string.reverse(Base255.Decode(Decimal))) or 0
	Floor = Floor and  Base255.Decode(Floor) or 0
	
	return Floor + Decimal
end

return NumberCompress
