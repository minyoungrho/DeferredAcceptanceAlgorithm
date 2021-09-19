Written in Julia v0.6.2.


The [Deferred Acceptance algorithm](https://en.wikipedia.org/wiki/Gale%E2%80%93Shapley_algorithm#:~:text=In%20mathematics%2C%20economics%2C%20and%20computer,as%20solving%20both%20the%20college) finds stable matching from submitted rank ordered lists from the two sides: proposers and acceptors. This algorithm can be used for many applications. **For example**, the algorithm can generate one-to-one matching to create stable matches for dates, roommates. Additionally the algorithm can generate many-to-one matching to allocate students to schools.

This algorithm has additional feature of imposing additional constraints for the acceptors. If the acceptor has diversity concerns/requirements that are separate from the preference ranking such as quotas for certain racial or socioeconomic groups for schools to receive government aids, then the algorithm will generate the optimal match that satisfies the requirements.  
