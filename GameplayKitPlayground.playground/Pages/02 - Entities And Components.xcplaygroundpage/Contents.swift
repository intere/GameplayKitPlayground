//: [Previous](@previous)

/*:
 # Entities and Components
 GameplayKit offers an architecture that helps you plan for better reusability from the start, separating the concerns that have to do with different aspects of your game.
 
 In this architecture, an entity is a general type for objects relevant to your game. Entities can represent objects that are crucial to gameplay, such as player and enemy characters, or objects that merely exist in the game world without interacting with the player, such as animated decorations in a level. Entities can even be conceptual or UI elements of your game, such as a system that decides when and where to add new enemy characters to a level or a system for managing equipment worn by the player character.

 An entity gets its functionality by being a container for components. A component is an object that handles a specific, limited aspect of any entity’s appearance or behavior. Because a component’s scope of functionality is limited and not tied to a specific entity, you can reuse the same components across multiple entities.

 
 See the [GameplayKit Guide](https://developer.apple.com/library/content/documentation/General/Conceptual/GameplayKit_Guide/EntityComponent.html#//apple_ref/doc/uid/TP40015172-CH6-SW1) for more information
 */



/*:
 ----
 ## Inheritance-Based Architecture Hinders Game Design Evolution
 As you refine your game, you might choose to add more kinds of enemies and towers or add new capabilities to your game objects. For example, you might add enemies that fire back at the towers. However, this presents a problem—the new ShootingEnemy class can’t reuse the targeting and firing code from the Tower class because it doesn’t inherit from that class. To attempt to solve this problem, you might move that code into the GameObject class so that you can use it in both the Tower and ShootingEnemy classes.

*/

//: ![Inheritance-Based Architecture](entity_component_3_2x.png)

/*:
 However, if your game design continues evolve along these lines, eventually one root class holds nearly all of the functionality for each of its subclasses and each subclass provides little functionality of its own. This situation results in code that is complex and hard to maintain, as the root class implementation needs to check which subclass identity it’s using before it can do anything, and new features must be carefully fit in among the various conditional behaviors of the root class.

 ----

 ## Composition-Based Architecture Makes Evolving Game Design Easy
 
 Instead of organizing a game’s object model in terms of what each game object is, the Entity-Component pattern encourages you to think about what each game object does. In this example, you can make components for each bit of functionality that might be expected of a base, an enemy, or a tower. One component might handle visual representations; another might handle targeting and firing; another might handle movement; still another might track how much damage has been sustained and update a UI element accordingly; and so on. Create a new subclass of GKComponent for each unique area of functionality.

 Then, rather than creating classes for each kind of game object, use the GKEntity class as a generic container for components. For example (as shown in the Figure below), one GKEntity instance could represent a tower, so it contains visual and firing components. Another GKEntity instance could represent an enemy, so it contains visual and movement components. To add an enemy that can shoot, simply add both the movement and firing components to the same entity.

 */

//: ![Inheritance-Based Architecture](entity_component_4_2x.png)

/*:
 ## Building Games with Entities & Components

 On its own, the Entity-Component design pattern is simply a way to organize your code. GameplayKit extends this pattern to incorporate another concept common to game development—periodic updates. Combining these concepts provides a useful architecture for building games.

 */


//: [Next](@next)
