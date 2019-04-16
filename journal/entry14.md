# Entry 14

## April 6

# Weekly - Cabal??

I'm trying to install a package from hackage called ChessIO that look like a really interesting Chess move generator and I'm having a lot of trouble installing `cabal`, which I don't even know if I should install.

The interface for `cabal` looks like a mess. They have two sets of interfaces, one `v1` legacy and one `v2` beta... which one am I supposed to use? Just using the default `cabal install` warns me that "ooh this is a legacy command, you really need to upgrade," but why am I recommended to opt-in to something labeled "beta"??

I used `brew` to install `cabal` and it looks like there's a pretty permanent error `cabal: Could not read index. Did you call 'checkForUpdates'?` which happens whenever I use any command, such as `update` or `get`.

I'm considering trying to switch to something else... but I don't know the relationship between any of the tools. Is `stack` a replacement for `cabal`? Or are they different things?

I had originally installed just `ghc` through `brew`, however it really looked like from my research that the `Haskell Platform` download was the way to go, so I uninstalled `brew`'s version of `ghc` and installed the `Haskell Platform` so hopefully `cabal` will work so I can install my dang package.

The issue `cabal: Could not read index. Did you call 'checkForUpdates'?` persisted, but I fixed it by:

- Removing the `~/.cabal` folder
- Only running `cabal new-update` (NOT `cabal update`)

Why not just make the `new-update` command the default? This is pretty ridiculous I have to remember to add `new-` to every command or else it won't work...

Now I get `cabal: symlink-bindir is not defined` after successfully installing `chessIO`...

I looked up a tutorial on `cabal` on Youtube, was highly impressed: https://youtu.be/a7R-2vtPLDM

Helped me out a lot. I output all the possible starting moves...

## Questions

- How do we install packages?
- What's the recommended way of installing packages?
