

default:
	cabal install
	.cabal-sandbox/bin/world-scholars

full:
	cabal install
	rm -f html/*
	.cabal-sandbox/bin/world-scholars
	cp -r html/* ../WorldScholars.github.io
	cp -r gnu_js ../WorldScholars.github.io
	cp -r custom_js ../WorldScholars.github.io

deploy: full
	git commit -am 'autocommit' && \
        git push && \
	cd ../WorldScholars.github.io && \
	git pull && \
	git add . && \
	git commit -am 'autocommit' && \
	git push && \
	cd ../web
	
	
