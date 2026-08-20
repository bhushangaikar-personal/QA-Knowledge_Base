let day="Tuesday "
console.log("Length of string", day.length)

let subday = day.slice(0,4)
console.log("Sub-string", subday)

console.log("2nd character", day[1])
console.log("Split string",  day.split("s"))

console.log("Split string first element",  day.split("s")[0])
console.log("Split string second element",  day.split("s")[1])

console.log("Length of second element",  day.split("s")[1].length)
console.log("Length of second element after trim",  day.split("s")[1].trim().length)

let date="23"
let date1="27"
console.log("Diff of string variables", parseInt(date1)-parseInt(date))
let int = parseInt(date1)-parseInt(date)
console.log(int, typeof(int))
let string = int.toString()
console.log(string, typeof(string))

let newday=day + "is Today"
console.log("Concanited string", newday)

let val1=newday.indexOf("day")
console.log("Index of day string", val1)
let val2=newday.indexOf("day",val1+1)
console.log("Next index of day string", val2)

let count=0
let value=newday.indexOf("day")
while(value!== -1)
{
    count++
    value=newday.indexOf("day",value+1)
}
console.log("No of times string occured:" , count)