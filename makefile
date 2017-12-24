

default:
	cabal install
	.cabal-sandbox/bin/world-scholars

full:
	cabal install
	.cabal-sandbox/bin/world-scholars
	rm ../WorldScholars.github.io/*.html
	cp -r html/* ../WorldScholars.github.io

deploy: full
	cd ../WorldScholars.github.io
	git add .
	git commit -am 'autocommit'
	git push
	cd ../web
	
	
