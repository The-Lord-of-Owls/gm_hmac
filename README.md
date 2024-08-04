# gm_hmac
An HMAC Hashing module for garry's mod written purely in lua.

# Purpose
This was a small one day module I built to learn how HMAC hashing works. I decided to put this on github for others.

# Usage
The module provides 3 functions for sha256, sha1 and md5 hasing using hmac. They all work pretty much the same, the only differance is the hashing algorythm used
sha1 and md5 are only provided for support in the case where sha256 is not an option. It is strongly advised to use sha256 unless you have no other choice.

## Example
hmac.sha256( "Your message you here", "your secret key" )

# FAQ
Is it likely to have a use case in Garry's Mod? Who knows, this was just made for learning how hmac works in depth.

Can this be used with other applications that use lua? Yes, just change the hashing functions in the moudle to make it work, or make sure your hashing functions are defined as util.sha256, util.sha1 and util.md5


