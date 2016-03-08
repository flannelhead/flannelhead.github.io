# flannelhead.github.io
My personal blog and project page, proudly generated by [Hakyll](https://jaspervdj.be/hakyll/).

## Repository layout
The Hakyll source files reside in the `src` branch of this repo. The `master` branch contains the actual generated static page. This branch is added as a submodule in the `_site` folder where Hakyll generates the static files.

## Scripts
There are several utility scripts:

* `site` runs the site generator with the arguments supplied by the user, ensuring the generator itself is up-to-date.
* `clean` removes the generated files and the Hakyll cache in a submodule-aware manner.
* `deploy` pushes the generated site to upstream.

## Dependencies
To build this, you need [Stack](http://docs.haskellstack.org/en/stable/README.html) which is recommended for Haskell development anyway.

