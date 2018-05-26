

default:
	cabal install
	.cabal-sandbox/bin/world-scholars

full:
	cabal install
	rm -f html/*
	.cabal-sandbox/bin/world-scholars
	rm -f ../WorldScholars.github.io/*.html
	cp -r html/* ../WorldScholars.github.io

deploy: full
	git commit -am 'autocommit' && \
        git push && \
	cd ../WorldScholars.github.io && \
	git pull && \
	git add . && \
	git commit -am 'autocommit' && \
	git push && \
	cd ../web
	
	
