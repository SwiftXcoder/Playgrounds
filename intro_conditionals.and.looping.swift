import UIKit
import Foundation

// Set your variables
var temp:Float = 21
var relativeHumidity : Float = 95.5


/*  Conditionals...
    Good old if statement first. 
    if the temperature is bigger than 0 and less than 16...
    if the temperature is bigger than 16 and less than 25...
*/

if temp > 0 && temp < 16 {
    print("a bit nippy today")
}

if temp > 16 && temp < 25 {
    print ("Nice warm day today")
}


// Check if the temperature is okay for gardening
// Utilise 'else' if temperature is greater than or equal to 16, plant your crops
// otherwise warn your use it's still a bit cold out.
if temp >= 16 {
    print ("Okay to plant your peas")
} else {
    print ("Don't plant your seeds just yet. It's \(temp)˚C and \(relativeHumidity)% humidity.")
}


/*  switch/case statements
    rather than multiple 'if' statements it may be easier to use switch/case
    in this example, see if value of temp is between 0 and 15, then output accordingly.
    do this for all ranges of temperature.
    NOTE: The list has to be 'exhaustive' meaning all eventualities must be covered.
    Easiest way to achieve this is with a 'default' at the end, a catch-all condition.
*/
switch temp {
case 0...15:
    print ("cold")
case 16...25:
    print ("warm")
case 26...35:
    print ("hot!")
case 36...50:
    print ("Danger!")
default:
    print ("Turned out nice again")
}


// Looping....


// Generate 6 random numbers and print them
// Best practice is to define some variables and use those in the for loop
// that way, if you need to change anything in the future, change 
// the variables and leave the code alone
var randomNumber : Int
var maximumNumbers = 6
var maximumRandomValue : UInt32 = 60

for i in 1...maximumNumbers {
    randomNumber = Int(arc4random_uniform(maximumRandomValue))
    print ("Ball number \(i) is \(randomNumber+1)")
}

// While a condition is true, 'do' a loop
// BEWARE - it's easy to generate an infinite loop
// here for example, we're counting from 100 down to 0
// if we didn't do 'i--' decrement the value of i it would go on forever
var i = 100
while i > 0 {
    print ("The value of i is \(i)")
    i--
    }

