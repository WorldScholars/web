# web
to be later renamed worldscholar.github.io when ready to be online

## Getting started

to install and build

$ cabal update
$ cabal sandbox init
$ cabal install

to build the html

$ .cabal-sandbox/bin/world_scholars 

cabal run ; cp -r html/* ../WorldScholars.github.io/ ; cd ../WorldScholars.github.io/ ; gitsend ; cd ../web
