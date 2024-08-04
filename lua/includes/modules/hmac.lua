AddCSLuaFile()

--Localization of our required functions
local stringChar	= string.char
local stringByte	= string.byte
local stringRep		= string.rep

local tableConcat	= table.concat

local bxor			= bit.bxor

local SHA256		= util.SHA256
local SHA1			= util.SHA1
local MD5			= util.MD5


--XOR function
local function XOR( a, b, length )
	local result = {}

	for i = 1, length do
		result[ i ] = stringChar( bxor( stringByte( a, i ), stringByte( b, i ) ) )
	end

	return tableConcat( result )
end

local block_size = 64


module( "hmac" )


--Produces a sha256 signed hmac using a 64byte key
function sha256( message, key )
	if #key > block_size then key = SHA256( key ) end
	if #key < block_size then key = key .. stringRep( '\0', block_size - #key ) end

	return SHA256(
		XOR( key, stringRep( '\92', block_size ), block_size ) ..
		SHA256( XOR( key, stringRep( '\54', block_size ), block_size ) .. message ) )
end

--Produces a sha1 signed hmac using a 64byte key
function sha1( message, key )
	if #key > block_size then key = SHA1( key ) end
	if #key < block_size then key = key .. stringRep( '\0', block_size - #key ) end

	return SHA1(
		XOR( key, stringRep( '\92', block_size ), block_size ) ..
		SHA1( XOR( key, stringRep( '\54', block_size ), block_size ) .. message ) )
end

--Produces a md5 signed hmac using a 64byte key
function md5( message, key )
	if #key > block_size then key = MD5( key ) end
	if #key < block_size then key = key .. stringRep( '\0', block_size - #key ) end

	return MD5(
		XOR( key, stringRep( '\92', block_size ), block_size ) ..
		MD5( XOR( key, stringRep( '\54', block_size ), block_size ) .. message ) )
end


