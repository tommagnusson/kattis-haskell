# Entry 11

## March 25

# In Class Time - Kattis

I'm going to use this time to research a number of Haskell implementations of Chess engines/chess games.

I think it's a good idea to see how other people implement chess in order to find a nice way of doing it for myself.

Some of the resources I've been looking at:

- [Reddit Thread](https://www.reddit.com/r/haskell/comments/2f9w0p/is_it_practical_to_write_a_strong_chess_engine_in/)
- [Basic Chess CLI in Haskell](https://github.com/OlivierNicole/haskell-chess)
- [Haskell Chess Engine with Bitboards](https://github.com/zbkruturaj/haskell-chess-engine)
- [Old Haskell Wiki entry with nice tasks defined](https://wiki.haskell.org/Learning_Haskell_with_Chess)

I think I have to make a decision about readability versus performance. There seem to be some complicated, optimized ways of storing boards using low-level bit representations for the spaces on the board (8x8 board = 64 spaces, times 3 bits per space = 192 bits per board).

The pro of this approach is speed. For chess engines, computing lots of moves ahead requires lots of memory, so the fewer bits the chess boards representing states of the game after a given move, the faster my algorithm can work on generating moves. The downside seems to be that it risks getting obscure and difficult to debug. I think trying to approach building chess the most natural way possible outweighs the performance gains of bitboards.

There is a famous saying in computer science: future optimizations are the root of all evil. In this case, I think bit boards is a form of future optimization, and therefore I won't pursue it until I need to. I think correctly implementing chess will be tough enough.

Special considerations in the rules of Chess that will be tricky to implement:

- Castling (Unomved rook and king can move and swap places)
- En Passant pawn capture (side capture if first move of pawn passes an enemy piece)
- Double move option for an unmoved pawn
- Can't put king into check
- Can't move pieces pinned by check
- Exchanging pawn for any piece at the end of the opposite side of the board
  - In terms of computing good moves, the only valid pieces that could be picked are queen or knight (knights move where queens can't, and queens can move as any other piece can except knights)

I think I'll focus on creating the the data type `Piece` for my module so that I'll have a starting point, without having to pay attention to these special cases yet.

## Questions

- What is the best way to set up modules, and how do files relate to modules?
- How do we work with lower-level bits and bytes?
