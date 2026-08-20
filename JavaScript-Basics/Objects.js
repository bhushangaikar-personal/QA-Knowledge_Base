import Employee from './Classes.js'
// Object is a collection of properties

let employee = {
    firstName: 'Bhushan',
    lastName: 'Gaikar',
    age: 24,
    fullName : function()
    {   
        console.log(this.firstName+this.lastName)
    }
}

console.log("Access object value using .", employee.firstName)
console.log("Access object value using []", employee['lastName'])

employee.firstName="Tejas"
console.log("Updated object value .", employee.firstName)

employee.gender="Male"
console.log("New object property", employee.gender)
console.log("New object", employee)

delete employee.gender
console.log("New object after deletion of new prop", employee)

if('gender' in employee)
    console.log("Property exists")
else
    console.log("Property does not exist")

if('firstName' in employee)
    console.log("Property exists")
else
    console.log("Property does not exist")

console.log("Printing all object property key values")
for(let key in employee)
    console.log(key, ":", employee[key])

employee.fullName()

let alepo = new Employee("Who","When")
console.log("Access property of class", alepo.age)
console.log("Access property of class", alepo.location)
console.log("Access property of class", alepo.state)
alepo.fullName()