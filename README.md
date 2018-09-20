# Fruit Machine

We are going to create a virtual fruit machine. To make things easier instead of symbols we are going to use colours: black, white, green, yellow. COMPLETE

Each time a player plays our fruit machine we display four 'slots' each with a randomly selected colour in each slot. COMPLETE

If the colours in each slot are the same then the player wins the jackpot which is all of the money that is currently in the machine. COMPLETE

Implement a basic machine, along with the concept of a player who has a fixed amount of money to play the machine. COMPLETE

## Floats and prizes

We are now going to add a "float" to our fruit machine, this is an initial sum of money that the machine has. In addition we are going to implement a prize system. COMPLETE

If each slot has a different colour then the machine should pay out half the current money in the machine. COMPLETE

If a given play results in two or more adjacent slots containing the same colour then the machine should pay out a prize of 5 times the cost of a single play. COMPLETE

If the machine does not have enough money to pay a prize it should credit the player with a number of free plays equal to the difference between the full prize and the amount of money available. This does not affect a jackpot win. COMPLETE?


## Approach

I decided from the beginning that I would have 3 classes, a Player, a Machine, and a Game.

I made the Player responsible for their own wallet, which could be set on initialisation but not manually added to after creation. The Machine is responsible for its slots, spinning the slots, and understanding the various combinations of slots after a spin. The Game class is responsible for playing a game, and paying the right money to the player, as well as deducting the right amount of money from the machine.

I have currently implemented the free spins feature, however I am not sure of its intended use, as free spins seem to only be awarded if the machine no longer has enough money to pay. The free spins then become worthless as there is no money to win from the free spins. Perhaps in future iterations, I shall have the machine jackpot reset once it hits 0.

In future iterations, I would also like to implement the feature of custom bets, so that the Player is not limited to spending 1 credit per spin, thus allowing the 5 X bonus to have more significance. 
