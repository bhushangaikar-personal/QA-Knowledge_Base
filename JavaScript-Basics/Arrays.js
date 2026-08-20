let a1 = [10,11,12,13,14]
console.log("Length of array:", a1.length)
console.log("Print array:", a1)
console.log("Third element of array:", a1[2])
a1[3]=17
console.log("Reassignment of element of array:", a1[3])
console.log("Print array:", a1)
a1[0]=18
console.log("Reassignment of element of array:", a1[3])
console.log("Print array:", a1)
a1.push(8)
console.log("Append element", a1)
a1.push(3)
console.log("Append element", a1)
a1.pop()
console.log("Remove element at the end", a1)
a1.unshift(3)
console.log("Add element at the beginning", a1)

console.log("Index of element 17:", a1.indexOf(17))

console.log("Check if element is present:", a1.includes(18))
console.log("Check if element is not present:", a1.includes(28))

console.log("Print super array:", a1)
let a2 = a1.slice(0,4)
console.log("Print sub array:", a2)

console.log("For loop iterating over array elements...")
for(i=0;i<a1.length;i++)
    console.log("Index:",i,",Value:",a1[i])

console.log("For loop summing up all array elements...")
let sum=0
for(i=0;i<a1.length;i++)
{
    sum = sum + a1[i]
}
console.log("Sum of array elements:", sum)

console.log("Sum using Reduce filter map...")
let total=a1.reduce((sum,total)=>sum+total,0)
console.log(total)

console.log("Create a new array with even numbers from a1 using For loop...")
var a3=[]
for(i=0;i<a1.length;i++)
{
    if(a1[i]%2==0)
        a3.push(a1[i])
}
console.log("Print original array:", a1)
console.log("Print new array:", a3)

console.log("Print only odd numbers using Filter...")
let a4=a1.filter(a1=>a1%2!=0)
console.log("Print original array:", a1)
console.log("Print new array:", a4)

console.log("Map new array with existing array...")
let a6=a1.map(a1=>a1*2)
console.log("Mapped new array:", a6)
console.log("Sum of Mapped array elements:", a6.reduce((sum,val)=>sum+val,0))

let a7=a1.filter(a1=>a1%2!=0).map(a1=>a1*2).reduce((sum,val)=>sum+val,0)
console.log("Sum of even numbered and doubled array:", a7)

let fruits=["banana","orange","apple","mango"]
console.log("Sorted string array", fruits.sort())

let scores=[27,3,9,57,81,44]
console.log("Sorted number array using function", scores.sort(function(a,b){return a-b}))
console.log("Sorted number array using bubble sort", scores.sort((a,b)=>a-b))

console.log("Reverse Sorted number array using function", scores.sort(function(a,b){return b-a}))
console.log("Reverse Sorted number array using bubble sort", scores.sort((a,b)=>b-a))