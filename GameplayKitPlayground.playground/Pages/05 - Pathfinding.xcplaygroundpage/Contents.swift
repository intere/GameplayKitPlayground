//: [Previous](@previous)

import GameplayKit

/*:
 # Pathfinding
 You describe a graph using the **`GKGraph`** class and related APIs, which offer three ways to model navigable areas.
 * As a continuous space interrupted by obstacles. Use the **`GKPolygonObstacle`** class to model impassable areas, the **`GKGraphNode2D`** class to model locations of interest within open spaces, and the **`GKObstacleGraph`** class to create graphs containing both. Figure 6-2 illustrates this format, which can be found in many 2D action, adventure, and puzzle games, as well as 3D games in which gameplay-relevant movement is strictly 2D.
 */

//: ![Figure 6-2 Finding a path around obstacles](obstacle_pathfinder_2x.png)


/*:
 When building games with SpriteKit, you can generate a collection of **`GKPolygonObstacle`** objects based on the contents of a scene or node. With this technique, you can define navigable regions using methods you might already be using for other game mechanics. For example, you can design a level with the SpriteKit Scene Editor in Xcode and use physics bodies to mark regions that the player (or other game entities) cannot pass through, then use the **`obstaclesFromNodePhysicsBodies`: method to generate **`GKPolygonObstacle`** objects marking impassable regions.
 */

/*:
 * As a discrete two-dimensional grid, where the only valid locations are those with integer coordinates. Use the **`GKGridGraph`** and **`GKGridGraphNode`** classes to create grid-based graphs. Figure 6-3 illustrates this format, which appears in many classic arcade games, board games, and tactical role-playing games.

 */

//: ![Figure 6-3 Finding a path through a grid](grid_pathfinder_2x.png)

/*:
 In some such games, character movement appears to be continuous, but for purposes of game logic all positions are constrained to an integer grid.

 * As a collection of discrete locations and the connections between them. Use the **`GKGraphNode`** class to model nodes and connections with no associated geometry information, then use the GKGraph class to work with the graph as a whole. This style works well for games in which entities move between distinctly marked spaces but their actual location within a space is irrelevant to gameplay. Figure 6-4 illustrates this format, which works well for certain types of board games and strategy games.

 */

//: ![Figure 6-4 Finding a path in an arbitrary graph](arbitrary_pathfinder_2x.png)

/*:
 The connections between nodes are directed—that is, a connection from Node A to Node B indicates only that one can navigate from Node A to Node B. For navigation from Node B to Node A to also be possible, a separate connection from Node B to Node A must also exist.
 
 * After you create a graph, you can use that **`GKGraph`** object to connect new nodes based on their relationships to existing nodes in the graph, remove nodes from the graph regardless of their relationships to existing nodes, and most importantly, find paths from one node in the graph to another.
 
*/


//: [Next](@next)
