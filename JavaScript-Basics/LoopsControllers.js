const flag = true
console.log('If condition with condition matched')
if(flag)
{
    console.log('This expression is true')
}
else
{
    console.log('This expression is false')
}

console.log('If condition with condition unmatched')
if(!flag)
{
    console.log('This expression is true')
}
else
{
    console.log('This expression is false')
}

console.log('While loop for number increment')
let i=0
while(i<5)
{
   i++
   console.log(i)
}

console.log("Do while with no match")
var p = 100
do
{ 
   i++
   console.log(p) 
}while(i>500);

console.log("For loop for number increment")
let j=0
for(j=0;j<3;j++)
{
    console.log(j)
}

console.log("For loop for getting numbers multiple of 2 & 5 in 1-20")
let o
for(o=1;o<21;o++)
{
    if(o%2==0 && o%5==0)
    {
    console.log(o)
    }
}

console.log("For loop for getting numbers multiple of 2 or 5 in 1-10")
let k
for(k=1;k<11;k++)
{
    if(k%2==0 || k%5==0)
    {
    console.log(k)
    }
}

console.log("For loop for getting first 3 numbers multiple of 2 or 5 in 1-10")
let d
let n = 0
for(d=1;d<11;d++)
{
    if(d%2==0 || d%5==0)
    {
        n++
    console.log(d)
    }
    if (n==3)
        break
}
