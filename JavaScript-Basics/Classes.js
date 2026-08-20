export default class Employee
{
    age = 25
    state = "Maharashtra"
    get location()
    {
        return "India"
    }
    constructor(firstName,lastName)
    {
        this.firstName=firstName
        this.lastName=lastName
    }
    fullName()
    {
        console.log(this.firstName+this.lastName)
    }
}

/*let emp = new Employee("Hi","Hey")
console.log("Access property of class", emp.age)
console.log("Access property of class", emp.location)
console.log("Access property of class", emp.state)
emp.fullName()

let emp1 = new Employee("Go","Bye")
console.log("Access property of class", emp1.age)
console.log("Access property of class", emp1.location)
console.log("Access property of class", emp1.state)
emp1.fullName()
*/