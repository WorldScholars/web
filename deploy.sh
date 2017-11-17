
rm html/* && \
cabal run && 
cp -r html/* ../WorldScholars.github.io/ && 
cd ../WorldScholars.github.io/ && 
git add . && 
git commit -am 'autocommit' && 
cd ../web
