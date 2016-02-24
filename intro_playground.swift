// Introduction to Swift, various bits shown here for syntax etc.

import Cocoa
import Foundation

// Constant declarations
let versionNumber = 1.0
let maxIterations = 25
let LOG_DIR = "/var/log"
let ROOT_UID = 0

// Variable declarations, count is set to 0 and inferred as an integer
// programNeedsToEnd is declared as a type Bool
var count = 0
var programNeedsToEnd : Bool
var multipliedNumbers : Int = 99
var quantityOfItems = 165
var unitPrice = 25.74
var totalItemsTimesPrice = Double(quantityOfItems) * unitPrice
var total = 0
//var nameOfComputer = "MacBook Pro"


if count == 0 {
    print("Nothing here")
} else {
    print("We're off")
}

programNeedsToEnd = true


if programNeedsToEnd {
    print ("Game over")
}

/*
    test various values with a switch/case statement
    default is the obligatory catch all at the bottom
*/

switch quantityOfItems {
case 0:
    print("There is nothing available")
    
case 1...9:
    print ("Less then 10 items ordered")
    
case 12:
    print("A dozen items have been ordered")
    
case 100:
    print ("One tonne of items are on the way")

default:
    print("All values nominal")
}


for i in 1...quantityOfItems {
    total = total + i
}

// Simple function no parameters or retrun values
func myFunction () {
    print("This is a very simple function")
}

// Function called "helloPerson" with one parameter "name"
// by default this parameter is a constant in Swift
func helloPerson (name : String) {
    print("Hello, \(name)")
}

helloPerson ("Stanley")


// Function 'whichPlanet' pass a parameter called name
// if name is Mark then return the 'Earth' value
// but if it's anything else return another value
func whichPlanet (name: String) -> String {
    print("Hello, \(name)")
    if name == "Abe" {
        return "You're from Planet Earth"
    } else {
        return "You're from Planet Quargon 4"
    }
    
}

print (whichPlanet ("Abe"))
print (whichPlanet ("Flash"))

// ARRAYS - .count to list the items
// can also use .append .insert .isEmpty etc.
// refer to the array of computers declared above
// and a constant array of computer names (unlikely to change)
// enclosing in squre brackets means it's an array

let computerList : [String]
computerList = ["MacBook","iMac","Mac Mini","Mac Pro","MacBook Air","MacBook Pro"]

// Look at the 3rd item
computerList[2]
computerList

print("Apple make \(computerList.count) different models of the Mac")

for item in computerList {
    print(item)
}


/* DICTIONARIES - must have a key and a value
type can differ between key and value but the lists themselves 
must stay as the same type e.g. key can be all INT and values can be all STRING
First we declare our dictionary containing the keys and values
then we print out an item referencing the key only
*/

var macModelsDict = ["MBK":"MacBook", "MBA":"MacBook Air", "MBP":"MacBook Pro", "IMA":"iMac", "PRO":"Mac Pro", "MIN":"Mac Mini"]

// Create a new empty dictionary of Int:String
var products : [Int:String]

// Also create a more useful dictionary of error codes and meanings
// Note that it's constants, not likely to change that often
// The entries here are on separate lines, just for clarity, but are separated by a comma
let errorCodes = [
    70:"No such directory",
    71:"User is not permitted to run this command.",
    72:"File or folder does not exist",
    73:"File or folder is owned by root or under SIP",
    74:"DNS name does not match IP address (or vice versa)",
    75:"OS X needs to bs v10.10 or greater",
    76:"Files expected but not found (76)"
]

var userName = "admin"

if userName != "admin" {
    print (errorCodes[71])
} else {
    print ("User is administrator, proceed with caution!")
}

// Create a tuple containing mixed values
var macModelsAndPrices = ("MBK","Macbook",1499)

print (macModelsDict["PRO"])

// Can also insert or update...

macModelsDict["IPAD"] = "iPad"
macModelsDict["PPC"] = "PowerPC G5 Tower"
macModelsDict.updateValue("iMac with Retina Display", forKey: "IMA")

print (macModelsDict["IMA"])

// Playground can view the entire dictionary
macModelsDict

// remove a key/value item from the dictionary
macModelsDict["PPC"] = nil


// Print the amount using .count and then for-in the dictionary
// to display the contents of both key and value.
// (do a check first...)

if macModelsDict.isEmpty {
    print ("The dictionary of Mac models is empty")
}

print("There are currently \(macModelsDict.count) models of Mac")

// Step through the macModelsDict dictionary and output all the values
// just like an array but we use a tuple after the 'for'
// this can be named anything but must correlate inside the loop
for (key, value) in macModelsDict {
    print(" \(key) is the model code for \(value)")
}


// Function for returning Mac model, code and price using tuples
func getMacPrice(macname : String) -> (String, String, Double) {
    
    let whichMac = macModelsDict[(macname)]
    
    return (whichMac!,"Hello",99)
}


// Using Enumerations to define a specific data type structure for a variable
// in this case a data type called "DeviceType" which can be 3 devices or no preference
enum DeviceType {
    case Laptop
    case Desktop
    case Tablet
    case NoPreference
}

var macBookChoice : DeviceType
macBookChoice = .Laptop


/*
CLASSES - Define a simple class here
properties first, just to variables, name and memory
then methods - one function in this case that outputs the name and amount of ram
and two initialisers - either can be called
1) is the default, so if nothing is passed when instantiated, the values are "no computer: and "ram not known"
2) is initialiser with a parameter - in this case a string called name - 
self.name etc refers to the vars in properties already defined
*/

class TypeOfComputer {
    // properties defined here
    var computerName : String
    var computerMemory : String
    
    // methods defined here
    func description() -> String {
        return("This computer is a \(computerName) and has \(computerMemory) GB of RAM")
    }
    
    // default initialiser
    init() {
        computerName = "No computer set"
        computerMemory = "RAM not known"
    }
    
    // initialiser with parameters
    init(name : String, memory : String) {
        self.computerName = name
        self.computerMemory = memory
    }
}



// instantiate the new object for computer
var iMac = TypeOfComputer()
var macMini = TypeOfComputer()
var macPro = TypeOfComputer()

iMac.computerName = "iMac with Retina Display"
iMac.computerMemory = "16"
macMini.computerName = "Mac Mini"
macMini.computerMemory = "4GB"

/*
Three variables are instantiated from the same class
first one simply prints the value of macMini with the default initialiser
second one creates a variable : imacComputer using default initialiser
third one creates a variable macProComputer using the initialiser with parameters
*/
print(macMini.description())
var iMacComputer = iMac.description()
var macProComputer = TypeOfComputer(name: "Mac Pro", memory: "32 GB")

print(macProComputer.description())

/* INHERITANCE
Create a subclass from the initial "TypeOfComputer" class
*/

class SuperComputer : TypeOfComputer {
    
}

var crayOne = SuperComputer(name: "Cray One Weather Predictor", memory: "1024 GB")

print(crayOne.description())





