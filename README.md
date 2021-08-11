# CTM test

[![Elixir CI](https://github.com/shmink/ctm/actions/workflows/elixir.yml/badge.svg)](https://github.com/shmink/ctm/actions/workflows/elixir.yml)

I approached the test by doing a straightfoward lookup to the database for the names of the merchants. As is obvious from the start however not all descriptions are the same for each merchant as for example DVLA has 4 differrent examples of descriptions.

I implemented a kind of fuzzy search which was a lot of fun. I think I got that part to where I'm happy with it right now based on the data set. Given more time and more data it would be interesting to see what changes and optimisations could be added.

You might also see a bit of configuration within the project that I end up using on my personal projects. Just quality of life things.

### Running the project

Nothing out of the ordinary, just `docker-compose up` for the database.

I did run into some issue with hex an ssl ciphers if I recall correctly. Not sure what changes have been made to elixir/hex since I last used it but `mix local.hex` seemed to fix it for me.
