/*:
 [Previous](@previous)

 # State Machines

 See the [GameplayKit Guide](https://developer.apple.com/library/content/documentation/General/Conceptual/GameplayKit_Guide/StateMachine.html#//apple_ref/doc/uid/TP40015172-CH7-SW1) for more information
 */

import GameplayKit

//: ![Inheritance-Based Architecture](Dispenser_2x.png)

/*:
 In GameplayKit, a state machine is an instance of the **`GKStateMachine`** class. For each state, you define the actions that occur while in that state, or when transitioning into or out of that state, by creating a custom subclass of **`GKState`**. At any one time, a state machine has exactly one current state. When you perform per-frame update logic for your game objects (for example, from within the update: method of a SpriteKit scene or the renderer:updateAtTime: method of a SceneKit render delegate), call the updateWithDeltaTime: method of the state machine, and it in turn calls the same method on its current state object. When your game logic requires a change in state, call the state machine’s enterState: method to choose a new state.
 */

//: ![Reference Enemy States](state_machine_2_2x.png)

/*:
 ----
 # Supporting Classes
 */
/// Example Game object
class Game {
    // Some game object implementation
}

/// Example Entity Object
class EnemyEntity: GKEntity {
    // Enemy entity implementation
}

/*:
 ----
 # Base State Class
 */
/// Base class for Enemy States
class EnemyState: GKState {
    weak var game: Game?
    var entity: EnemyEntity

    init(withGame game: Game, entity: EnemyEntity) {
        self.game = game
        self.entity = entity
        super.init()
    }
}

/*: 
 ----
 # State Class Implementations
 */

class EnemyChaseState: EnemyState {
    override func didEnter(from previousState: GKState?) {
        // TODO: Implement any necessary changes with state
    }

    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass is EnemyFleeState.Type
    }
}

class EnemyFleeState: EnemyState {
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass is EnemyDefeatedState.Type || stateClass is EnemyChaseState.Type
    }
}

class EnemyRespawnState: EnemyState {
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return true
    }
}

class EnemyDefeatedState: EnemyState {
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass is EnemyRespawnState.Type
    }
}

/*:
 The state machine calls a state object’s didEnterWithPreviousState: method when that state becomes the machine’s current state. In the Flee state, this method uses the game’s SpriteComponent class to change the appearance of the enemy character. (See the Entities and Components chapter for discussion of this class.) This method also chooses a random location in the game level for the enemy to flee toward.

 The updateWithDeltaTime: method is called for every frame of animation (ultimately, from the update: method of the SpriteKit scene displaying the game). In this method, the Flee state continually recalculates a route to its target location and sets the enemy character moving along that route. (For a deeper discussion of this method’s implementation, see the Pathfinding chapter.)

 You can enforce preconditions or invariants in your state classes by having each class override the isValidNextState: method. In this game, the Respawn state is a valid next state only for the Defeated state—not the Chase or Flee state. Therefore, the code in the EnemyRespawnState class can safely assume that any side effects of the Defeated state have already occurred.


 ----

 
 # Create and Drive a State Machine
 
 After you define **`GKState`** subclasses, you can use them to create a state machine. In the Maze game, an **`AAPLIntelligenceComponent`** object manages a state machine for each enemy character. (To learn more about the component-based architecture in this game, see the Entities and Components chapter.) Setting up a state machine is simply a matter of creating and configuring an instance of each state class, then creating a **`GKStateMachine`** instance that uses those objects.

 */

//: [Next](@next)
