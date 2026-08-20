// Usual function
function add(a,b)
{
    return(a+b)
}
console.log("Sum using function call", add(2,3))

// Anonymous function
let sumof = function(c,d)
{
    return c+d
}

let sumofn = (c,d)=>c+d

console.log("Sum using anonymous function1 call", sumof(2,3))
console.log("Sum using anonymous function2 call", sumof(2,3))

// Scope of keywords
var hi = "Morning"
    console.log("Variable before function:", hi)
function test()
{
    var hi = " Evening"
    console.log("Variable inside function:", hi)
}
console.log("Variable after function:", hi)

if(1==1)
{
    var hi = "Afternoon"
}

console.log("Variable after condition:", hi)