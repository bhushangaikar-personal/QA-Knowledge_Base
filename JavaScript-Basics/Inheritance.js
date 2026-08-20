import Employee from "./Classes.js";

class Pet extends Employee
{
    constructor(firstName,lastName)
    {
        super(firstName,lastName)
    }
    get location()
    {
        return "Bihar"
    } 
}

let pet1 = new Pet("Hui","Chui")
pet1.fullName()
console.log("Access property of class", pet1.age)
console.log("Access property of class", pet1.location)
console.log("Access property of class", pet1.state)