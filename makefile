

default:
	cabal install
	rm html/*
	.cabal-sandbox/bin/world-scholars

full:
	cabal install
	rm html/*
	.cabal-sandbox/bin/world-scholars
	cp -r html/* ../WorldScholars.github.io
