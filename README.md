Written in Julia v0.6.2.


The [Deferred Acceptance algorithm](https://en.wikipedia.org/wiki/Gale%E2%80%93Shapley_algorithm#:~:text=In%20mathematics%2C%20economics%2C%20and%20computer,as%20solving%20both%20the%20college) finds stable matching from submitted rank ordered lists from the two sides: proposers and acceptors. This algorithm can be used for many applications. **For example**, the algorithm can generate one-to-one matching to create stable matches for dates, roommates. Additionally the algorithm can generate many-to-one matching to allocate students to schools.

This algorithm has additional feature of imposing additional constraints for the acceptors. If the acceptor has diversity concerns/requirements that are separate from the preference ranking such as quotas for certain racial or socioeconomic groups for schools to receive government aids, then the algorithm will generate the optimal match that satisfies the requirements.  

Let us use an example from a Jane Austen era where male suitors were expected to propose to the ladies.

There are male proposers:
Fitzwilliam Darcy prefers Elizabeth Bennet and remains single otherwise.
John Willoughby prefers Sopha Gray then Marianne Dashwood and remains single otherwise.
Colonel Brandon prefers Mraianne Dashwood and remains single otherwise.

There are female acceptors:
Marianne Dashwood prefers John Willoughby to Colonel Brandon and remains single otherwise.
Sophia Gray prefers John Willoughby and remains single otherwise.
Elizabeth Bennet prefers Fitzwilliam Darcy and remains single otherwise.


### Inputs
The algorithm takes a vector of proposers and a list of acceptors. Then, two matrices of size #proposers x #acceptors corresponding to the names in the list:

List of proposers: ["Fitzwilliam Darcy", "John Willoughby", "Colonel Brandon"]
List of acceptors: ["Marianne Dashwood", "Sophia Gray", "Elizabeth Bennet"]

Matrix 1: Preference Rankings for Acceptors (in the order of the list above) from the Proposers:
| Elizabeth Bennet | | |
| Sophia Grey| Marianne Dashwood ||
| Marianne Dashwood | | |

Matrix 2: Preference Rankings for Acceptors from the Proposers:
| John Willoughby | Colonel Brandon | |
| John Willoughby | | |
| Fitzwilliam Darcy | | |

### Outputs/Solutions

The output will result in:

| Fitzwilliam Darcy | Elizabeth Bennet |
| John Willoughby | Sophia Grey |
| Colonel Brandon | Marianne Dashwood |
