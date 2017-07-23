//: [Previous](@previous)

/*:
 # The Minmax Strategist
 [Link](https://developer.apple.com/library/content/documentation/General/Conceptual/GameplayKit_Guide/Minmax.html#//apple_ref/doc/uid/TP40015172-CH2-SW1)
 
 Many games that have been popular since long before the days of video gaming—especially board games such as backgammon, chess, Tic-Tac-Toe, and Go—are essentially games of logic. A player succeeds in playing such games by planning the best possible move at every opportunity, taking into account the possible moves of the opposing player (or players). These kinds of games can be exciting to play whether the opponent is another person or a computer player.
 
 In GameplayKit, a strategist is a simple form of artificial intelligence that you can employ to create a computer opponent for these types of games. The **`GKMinmaxStrategist`** class and supporting APIs implement a minmax strategy for playing games that have many (if not all) of the following characteristics:
 
 * **Sequential.** Each player must act in order—that is, the players take turns.
 * **Adversarial.** For one player to win, the other player (or players) must lose. The game design assumes that on each turn, a player will make a move that puts that player closer to winning, or the other players closer to losing.
 * **Deterministic.** Players can plan their moves confident in the assumption that the move will occur as planned—that is, player actions are not subject to chance.
 * **Perfect information.** All information crucial to the outcome of the game is visible to all players at all times. For example, a game of chess is won or lost based on the positions of the pieces on the board, and both players can see the positions of all pieces at all times. If there existed a chess variant where each player held in secret a hand of cards, with each card corresponding to a possible move, that variant would not be a perfect information game because the possible actions for one player would not be known to the other player.
 
 It’s possible to use the minmax strategist with games (or elements in more complex games) that don’t fit all of the above characteristics, provided that you can translate your game design into a consistent description that’s compatible with the GameplayKit API. For example, in a single-player game (lacking an adversary), you can use the strategist to suggest optimal moves. Or, in a game where some elements remain hidden until revealed through gameplay, the strategist can plan moves within the constraints of available information. In general, though, the strategist produces more optimal gameplay (that is, comes closer to winning or tying every game) if your gameplay model fits more of these characteristics.

 */

//: ![Connect 4](minmax_2x.png)

/*:
 ----
 # Using the Minmax Strategist in Your Game
 You use an instance of the **`GKMinmaxStrategist`** class to implement the minmax strategist in your game. This class uses the gameplay model you’ve defined to reason about the state of the game, offering suggestions for the “best” next move for a player to take at any time. However, before the **`GKMinmaxStrategist`** class can reason about your gameplay model, you must describe that model in standardized terms that GameplayKit can understand. You do this by adopting the **`GKGameModel`**, **`GKGameModelUpdate`**, and **`GKGameModelPlayer`** protocols.
 
 Three key protocols define the interface GameplayKit uses to reason about the state of your game.

 * The **`GKGameModel`** protocol applies to objects that represent a distinct state of your gameplay model. In the FourInARow example, the AAPLBoard class is a good candidate for adopting this protocol.
 * The **`GKGameModelPlayer`** protocol is an abstraction of the objects that represent players in your game. In the example, the AAPLPlayer class works well for this case.
 * The **`GKGameModelUpdate`** protocol is for objects that describe a transition between two game states. In the example, there is no such object—the addChip method performs the transition. In this case, adopting the **`GKGameModelUpdate`** protocol requires creating a new class.
 */





//: [Next](@next)
