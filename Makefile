BOOKMARKS = /Users/rant/Library/Application\ Support/BraveSoftware/Brave-Browser/**/Bookmarks
bookmarks.json:
	cat $(BOOKMARKS) | jq -s > $@

# Note: you can append to the README.md by not "cleaning"
README.md: $(TITLE).mjs.md
	cat $? >> $@

%.mjs.json: #bookmarks.json
	cat bookmarks.json | jq -f filter.jq | jq -s > $@

%.mjs.md: $(TITLE).mjs.json
	zx $(basename $? .json)

$(TITLE).md: $(RENDERER)
	zx $? > $@

$(SCHEME)\://$(DOMAIN)/$(URI)?$(PARAMS):
	echo $@

ACCESS_TOKEN=MTQzNjA3NTIzNDgwOTk1ODQwMC1hWW5xZFd6UktzS2N6Um1XbFRZS3BlWmNRRGdiYXc6TmFXYlJnYUxUYnduaEE4SXgyTWY2aXcxOWtWQXNyaUpydEpjQ2lPT3JJa3JUCg==
USERNAME=_public_rant

TWITTER = https\://api.twitter.com/2/users/by/username/$(USERNAME)
test: $(TWITTER)

$(TWITTER):
	@curl $@ -H "Authorization: Basic $(ACCESS_TOKEN)"

basic:
