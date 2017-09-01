# web
to be later renamed worldscholar.github.io when ready to be online

## TODOS

items marked with * are at least partially non-programming tasks


- [ ] https certificate (requires move to non-github web server)
- [X] move 'Meet the team' to People page
- [X] make people tab a link
- [X] Fix Fionas title (Director of Operations)
- [X] Fix Fionas Picture
- [ ] Make .ico of logo
- [ ] Add testimonials to About page
- [ ] * create social media pages
- [ ] update social media icon links in header
- [ ] change width to scale to % of screen (this is a problem on large displays) (only if it is possible to scale font size to screen as well)
- [X] add 'Program' dropdown tab with upcoming (Feb 2018) and past
- [ ] * Make video trailer for Feb 2018 (<1 min) (animation infographic -> shots of teaching -> message from Executive Team), (ideally no frame - maybe cannot use youtube embed)
- [ ] * Overview paragraph for Feb 2018
- [ ] * Schedule for Feb 2018
- [ ] * Details on Lectures (Tu & Th)
- [ ] * Details on Workshops (M-F)
- [ ] * Details on Evening program (M,W,F)
- [ ] Apply now tab
- [ ] * application portal (embed from google forms)
- [ ] make mailing list (ip tracking for location)
- [ ] Add mailing list signup link on Feb 2018 page
- [ ] Add mailing list signup link on homepage




## Getting started

to install and build

$ cabal update
$ cabal sandbox init
$ cabal install

to build the html

$ .cabal-sandbox/bin/world_scholars 

cabal run ; cp -r html/* ../WorldScholars.github.io/ ; cd ../WorldScholars.github.io/ ; gitsend ; cd ../web


