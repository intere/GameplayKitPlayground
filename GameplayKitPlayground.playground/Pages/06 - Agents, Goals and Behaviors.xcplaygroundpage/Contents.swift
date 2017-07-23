//: [Previous](@previous)

import GameplayKit

/*:
 In many kinds of games, entities move in real time and with some degree of autonomy. For example, a game might allow the player to tap or click to move a character to a desired location, and the character will automatically walk around obstacles to reach that location. Enemy characters might move to attack, planning to intercept the player character ahead of its current position. Ally characters might fly in formation with the player character, maintaining their distance from the player character and a parallel direction of flight. In all of these cases, each entity’s movement might also be constrained to realistic limits, so that the game characters still move and change direction realistically.
 */

/*:

 The Agent system in GameplayKit provides a way to efficiently implement autonomous movement. An agent represents a game entity that moves in 2D space according to realistic constraints: its size, position, and velocity, and its resistance to changes in velocity. (Note that although an agent’s movement is based on a physical model, agents are not governed by SpriteKit or SceneKit physics simulations.) An agent’s behavior is determined by goals that motivate its movement.
 */

/*:
 A goal represents a distinct motivation that can influence an agent’s movement over time. The following figures show some examples of goals:
 */

//: ![Figure 7-1 A goal to move toward a specific location](agent_seek_2x.png)

//: ![Figure 7-2 A goal to avoid obstacles](agent_avoid_2x.png)

//: ![Figure 7-3 A goal to flock together with other agents](agent_flock_2x.png)

//: ![FIgure 7-4 A goal to follow a path along a sequence of points](agent_follow_path_2x.png)

/*:
 A behavior ties together one or more goals to drive an agent’s movement. For example, a behavior might combine a goal that moves to a target point with a goal that avoids obstacles along the way. When you combine multiple goals in a behavior, you can assign a weight to each that determines its relative influence.

*/

//: [Next](@next)
