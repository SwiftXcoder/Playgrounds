
/* OPTIONALS - Page 48 : Swift 2 for absolute beginners

If I omit the ? after 'Int' the compiler gives an error
that the variable cannot be used as it hasn't been initialised
there is no default value and Swift doesn't like it.
Rather than setting the variable to say 0, we can use optionals, which says
that the value can be 'nil' i.e. not set
*/

// Declare 'temperature' to be optional Int, i.e. no value assigned
var temperature : Int?

// Set the temperature value here. This is just a simple variable declaration
// but it could come from anywhere, e.g. internet, thermometer etc.
// Try changing this value, also commenting the line out.
// the point here is that 'temperature' MUST contain something
// otherwise no value is set and it may crash your program
temperature = 100

/* 1. FORCED UNWRAPPING AN OPTIONAL
Check that 'temperature' has a value i.e not nil
if it's something, then extract the value from the optional by adding ! at the end
so therefore, Int? would decalre an optional Int and temperature! would extract the 
value out of the optional. If we omit the ! we get 'Optional(43) degrees'
*/

if temperature != nil {
    print ("The temperature is \(temperature!) degrees")
} else {
    print ("Sorry we were unable to get the temperature")
}

/* 2. IMPLICITLY UNWRAPPED OPTIONALS
If we declare an optional variable and know it will always have a value
we are giving the program permission to unwrap the optional as we're sure there's a value
*/

var temperature: String! = "48 degrees" // This is an implicitly unwrapped optional declaration
var exportTemperature: String = temperature // No need for a !

/* 3. OPTIONAL BINDING
set a constant to be the temperature optional
and use it in an if statement, this means we don't need to force unwrap it like the previous code
Here, the ! after the variable is not needed because the "if let" statement tests it for us.
*/

if let whatIsTheTemperature = temperature {
    // value found, print the constant created above
    print ("The temperature is \(whatIsTheTemperature)")
} else {
    // no value in 'temperature' so abort
    print ("We are unable to get the temperature reading")
}








