// Arrays
var vaccines: [String] = ["Covid", "Polyo"]
print(vaccines)

vaccines.append(contentsOf: ["MMR"])
print(vaccines)

vaccines.remove(at: 0)
vaccines.removeLast()

print(vaccines)

// boucle
for x in (0...10){
    print(x)
}

for element in vaccines {
    print(element)
}

var xy = 18

while xy < 18 {
    print("je ne suis pas encoer à 18")
    xy += 1
}


// Dictionnary
var famille: [String: Int] = [
    "papa": 58,
    "maman": 50,
]

print(famille)





