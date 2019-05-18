# Entry 15

## April 13

# Weekly - Learning about Haskell's Past

Lots of the problems that I've been doing in Kattis require cursory knowledge of the functions in Prelude, as well as some of the more common data types like Data.Maybe, etc. Instead of focusing on concrete problems that reqiure figuring out that knowledge, I decided to research a little bit of the past of Haskell on Youtube to gain an appreciation for its origin and its development.

I watched a video entitled [Simon Peyton-Jones: Escape from the ivory tower: the Haskell journey](https://youtu.be/re96UgMk6GQ) which is a talk from one of the co-creators of the Haskell language. He outlines the journey the language took from an esoteric academic language into a Facebook-ready production language. I especially like his outline of why he thinks Haskell was successful. Languages, he holds, often hit one of two curves of adoption over time: single-user or few-user for a couple years, and then death, or; few-user for a couple years, and then wild and steady almost exponential curve of wildly popular adoption. Haskell hit a sweet spot between these two extremes. It gained moderate adoption at first, but growth plateaued as the group of academics became saturated. The academic-focused nature of the community drove a solid, unified vision that guided the language development nicely. It meant that most people were concerned with theoretical accuracy rather than usability. As time went on, however, that accuracy (with its applicability in parallelism, a topic becoming widely popular as CPU core counts increased) became an important and marketable aspect of the language. The plateau turned again into steady adoption, and Haskell, though not the most used language, at least ranks among the top 30 most used.

The speaker also mentions that at the very beginning, they had a problem. Since Haskell was completely side-effect free, it was useless as a computing device. There was no I/O, no printing, no networking, no database access... nothing useful for actual programs. This problem was impossible to solve without the magic of category theory. The speaker mentions a seminal paper that connected Monads from category theory to the theoretical basis of functional languages, and offered a solution to printing, the Maybe class, and side-effects in general. It was a break through, because without the Monad Haskell would be limited in usefulness, and perhaps have died in obscurity. Instead, it maintained its theoretical base while still providing much needed functionality to make it a contender as a widely adopted and production ready language.

All in all, the talk was fascinating and gave me an appreciation for the history of the language, and underscored the important problems of side effects that the Monad solution solved.