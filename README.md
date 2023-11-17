```lua
local Number = 4
local Encoded = NumberCompress.Encode(Number)
local Decoded = NumberCompress.Decode(Encoded)

print(Number, Number == Decoded) --> 4 true
print(Number, #tostring(Encoded), #tostring(Number)) --> 4 1 1

local Number = 0.5321257644
local Encoded = NumberCompress.Encode(Number)
local Decoded = NumberCompress.Decode(Encoded)

print(Number, Number == Decoded) --> 0.5321257644 true
print(Number, #tostring(Encoded), #tostring(Number)) --> 0.5321257644 6 12

local Number = 2 ^ 62
local Encoded = NumberCompress.Encode(Number)
local Decoded = NumberCompress.Decode(Encoded)

print(Number, Number == Decoded) --> 4611686018427388000 true
print(Number, #tostring(Encoded), #tostring(Number)) --> 4611686018427388000 8 19

local Number = 2 ^ 24 + 0.5324634743
local Encoded = NumberCompress.Encode(Number)
local Decoded = NumberCompress.Decode(Encoded)

print(Number, Number == Decoded) --> 16777216.532463476, true
print(Number, #tostring(Encoded), #tostring(Number)) --> 16777216.532463476 11 18
```
