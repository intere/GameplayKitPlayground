/*: 
 # GameplayKit Playground

 We start with randomization
 
 See the [GameplayKit Guide](https://developer.apple.com/library/content/documentation/General/Conceptual/GameplayKit_Guide/RandomSources.html#//apple_ref/doc/uid/TP40015172-CH9-SW1) for more information
 */
//:----
import GameplayKit
import PlaygroundSupport

//:----
//: ## Create our Random Distribution
let random = GKRandomDistribution.d6()

//: Now we roll the dice
let rollSet = [random.nextInt(),random.nextInt(),random.nextInt(),random.nextInt(),random.nextInt(),random.nextInt(),random.nextInt()]
print(rollSet)

/*:
 The `GKRandomDistribution` class, by itself, produces a uniform distribution across a specified range—that is, every value between the specified minimum and maximum values is equally likely to occur. Use this class whenever you need a random number that falls within a specific range of numbers.  Dice are a common example of a uniform random distribution with a specific range, as seen in Figure 2-1.
 */
//: **Figure 2-1** A Uniform Random Distribution Simulates a Single Die Roll

//: ![Uniform Random Distribution](random_1_2x.png)
var rolls = [[Int]]()


/*: 
 The `GKGaussianDistribution` class models a Gaussian distribution, also known as a normal distribution, shown in Figure 2-2. In a normal distribution, a certain result—the mean—has the highest probability of occurring, and higher- or lower-valued results are less likely. This distribution is symmetric: results that are the same distance from the mean have the same probability of occurring, whether they are above or below the mean.
 */

for i in 0..<100 {
    rolls.append([random.nextInt(), random.nextInt()])
}

var doubles = 0
rolls.forEach {
    if $0[0] == $0[1] {
        doubles += 1
    }
}

print("We have \(doubles) doubles out of \(rolls.count) (\(Double(doubles)/Double(rolls.count)*100)%)")
print("We should be converging on \(Double(6)/Double(36)*100)%")

//: **Figure 2-2** A Gaussian Random Distribution is Equivalent to a Roll of Multiple Dice

//: ![Uniform Random Distribution](random_2_2x.png)
//: [Next](@next)
