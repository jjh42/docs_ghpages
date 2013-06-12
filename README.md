# docs.ghpages

This is a small library to add an extra task to the Elixir `mix`
tool `docs.ghpages`. This will build the docs and push them
to the branch `gh-pages` of the `origin` git remote.

This is useful if you are hosting your Elixir app or library on github
as this will publish the documentation on the 
[github pages](https://help.github.com/categories/20/articles)
for your repo.

Note that the documents are removed, rebuilt from scratch and pushed
with `--force` to the `gh-pages` so any changes inside the `docs` folder
will be destroyed (which is usually fine if you're autogenerating the `docs`).

# Help

Open an issue.

