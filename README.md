# web
This repo contains the html generation code for the frontend of the worldscholars website.
The website uses a serverless model, with (oddly enough) Haskell on the frontend and javascript on the backend.
The serverless functions are stored in a private repo.

## TODOS

items marked in *italics* are at least partially non-programming tasks, and should be delegated

High priority 

- [ ] Add grade to exam summary (need to reimplement SAT scoring algorithm on serverless fxn)
- [ ] Allow users to specify a username on sign up
- [ ] Add button to generate fitbit graph as html and add to s3 bucket with restricted permissions
- [ ] On exam summary page, pull appropriate fitbit graph html and embed (demo is already live on /hr.html)

Lower priority

- [ ] add blog (and connect to FB/twitter?)
- [ ] *Make .ico of logo*
- [ ] Add test suite
- [ ] https certificate (no longer requires move to non-github web server)
- [ ] change width to scale to % of screen (this is a problem on large displays) (only if it is possible to scale font size to screen as well)
- [ ] Add mailing list signup link on homepage
- [ ] Add testimonials to About page (?)

## Getting started

to install and build

$ cabal update
$ cabal sandbox init
$ cabal install

to build and deploy the html, use the makefile with the various deployment scripts


