JEKYLL_VERSION=latest

# limitations: installed packages are not retained across instantiations
# This could be fixed by building a new local Docker image with "jekyll build". 
# User would have to re-build image when there is a new version.

build: 
	docker run --rm --volume="$(PWD):/srv/jekyll" -it jekyll/jekyll:$(JEKYLL_VERSION) jekyll build

serve:
	# View in http://localhost:3000 when build is complete
	docker run -p 3000:4000 --rm --volume="$(PWD):/srv/jekyll" -it jekyll/jekyll:$(JEKYLL_VERSION) jekyll serve --watch --drafts
