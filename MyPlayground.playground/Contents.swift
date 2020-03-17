// Enum - Enumeration

enum AppleProuducts: String {
    case iPhone
    case iPad
    case macbook
    case watch
}


enum PizzaCategory: String {
    case classic
    case specialty
    case glutenFree
}

let specialtyPizza = PizzaCategory.specialty
let myFavoritePizza: PizzaCategory = .classic

print(myFavoritePizza)


struct Pizza {
    let name: String
    let cost: Double
    let category: PizzaCategory
    
}

let myPizza = Pizza(name: "49-er", cost: 12.99, category: .classic)

print("I would like to order a \(myPizza.name)")


class PizzaPlace { // Blue print of a pizza place object
    var name: String
    var address: String
    private(set) var pizzas: [Pizza]
    
    // Create Initializer
    
    init(name: String, address: String) {
        self.name = name
        self.address = address
        self.pizzas = []
        
    }
    
    func add(pizza: Pizza) {
        pizzas.append(pizza)
    }
}

let johnnyPizzaPlace = PizzaPlace(name: "Johnny's Pizza", address: "123 Delicious Ave")

let hawaiianClassic = Pizza(name: "Hawaiian Classic", cost: 12.99, category: .classic)
let chickenAlfredo = Pizza(name: "Call Me Mr. Alfredo", cost: 15.99, category: .specialty)
let margarita = Pizza(name: "Margarita Seniorita", cost: 16.99, category: .glutenFree)

johnnyPizzaPlace.add(pizza: hawaiianClassic)
johnnyPizzaPlace.add(pizza: chickenAlfredo)
johnnyPizzaPlace.add(pizza: margarita)

print(johnnyPizzaPlace.pizzas)

// Difference between Value Types and Reference Types

// Struct = Value Type
struct Ticket {
    var name: String
}

var ticket = Ticket(name: "Bob")
print(ticket.name)

var ticketCopy = ticket

ticketCopy.name = "Johnny"
print("ticket: \(ticket.name)")
print("ticketCopy: \(ticketCopy.name)")

func changeTicketName(ticket: Ticket) {
    var updatedTicket = ticket
    updatedTicket.name = "John"
    print("updatedTicket: \(updatedTicket.name)")
}

print("Ticket: \(ticket.name)")
changeTicketName(ticket: ticket)
print("Ticket: \(ticket.name)")


// Reference Types: class

class City {
    var name: String
    var population: Int
    
    init(name: String, population: Int){
    self.name = name
    self.population = population
    }
}

let rochester = City(name: "Rochester, NY", population: 208_000)

let roc = rochester
roc.name = "ROC"
print("rochester: \(rochester.name)")
print("roc: \(roc.name)")

func increasePopulation(city: City) {
    city.population = city.population + 1
}

print("Rochester population: \(rochester.population)")
increasePopulation(city: rochester)
print("Rochester population: \(rochester.population)")

print(roc.population)


struct Person {
    var name: String
    var age: Double
}

var me = Person(name: "Johnny", age: 28)
me.age  = 29

print(me.age)

class Person2 {
    var name: String
    var age: Double
    
    init(name: String, age: Double) {
        self.name = name
        self.age = age
    }
}

let me2 = Person2(name: "Johnny", age: 28)
me2.age = 29
print(me2.age)

class Vacuum {
    var isOn: Bool
    var isPluggedIn: Bool
    var rugHeight: Int
    var isSelfDriving: Bool
    var attachments: [String]
    
    init(isSelfDriving: Bool = false, attachments: [String] = []) {
        self.isOn   = false
        self.isPluggedIn = false
        self.rugHeight = 5
        self.isSelfDriving = isSelfDriving
        self.attachments = attachments
    }
}

let sharkVacuum = Vacuum(isSelfDriving: false, attachments: ["Dusting Brush", "Crevice Tool"])

let roombaVacuum = Vacuum(isSelfDriving: true)
print(roombaVacuum.attachments)

// Optionals

// if your work is close and you don't own a car:
var myCar: String? = nil

// I changed jobs and now I do have a car
myCar = "Subaru"

// I get into an accident and total my car
myCar = nil

// I got insurance money to get another car
myCar = "Tesla"

// I have 4 kids and have to get rid of tesla
myCar = "Toyota Sienna"


let weight = Int("185")
print(weight)

// if let statement to unwrap an optional value
let subtotalString = "58.95"


func calculateTip(totalString: String) {
    if let subtotal = Float(totalString) {
        let tip = subtotal * 0.20
        let total = subtotal + tip
        print("Total: \(total)\n\tsubtotal: \(subtotal)\n\ttip: \(tip)")
    }else {
        print("\(totalString) is not a valid amount")
    }
}

calculateTip(totalString: "200")
calculateTip(totalString: "abc")

var yearsOld: Int? = 35

if yearsOld != nil {
    let approximateDaysOld = 365 * yearsOld!
    print("Wow! You are \(approximateDaysOld) days old.")
}

if let yearsOld = yearsOld {
    let approximateDaysOld = 365 * yearsOld
    print("Wow! You are \(approximateDaysOld) days old.")
}else {
    print("You don't have an age.")
}
