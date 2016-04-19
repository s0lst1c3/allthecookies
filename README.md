# ALLTHECOOKIES

Assorted cookie stealers for performing session hijacking attacks against websites vulnerable to xss.

## Features

Written by [s0lst1c3](https://twitter.com/s0lst1c3) for XSS-SESSION-HIJACKING blogpost at

	http://solstice.me

Assorted cookie stealers for performing session hijacking attacks against websites vulnerable to xss. Shoutout to [Hom1n1s](https://twitter.com/Hom1n1s) for coming up with the name.

ALLTHECOOKIES has four modes

 - no redirect - redirects users to delightfully loud landing page and steals their cookies
 - simple redirect - not for practical application... redirect loop for blog post
 - guarded redirect - redirects users to cookie stealer, then quickly redirects them back to target
 - ajax - silently steals cookies in the background using AJAX

To use ALLTHECOOKIES, just execute run.sh and follow the prompts.

## Installation

To install ALLTHECOOKIES using git, first clone the git repo as follows:

	git clone https://github.com/s0lst1c3/sentrygun.git

Then install dependencies using pip:

	pip install -r pip.req
