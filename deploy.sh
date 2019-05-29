
rm html/* && \
cabal v1-run && 
cp -r html/* ../WorldScholars.github.io/ && 
cd ../WorldScholars.github.io/ && 
git add . && 
git commit -am 'autocommit' && 
cd ../web
