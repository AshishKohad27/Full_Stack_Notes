// Constructor Example
// - What if we want to assign value when the object is created
// - default value

class Animal {
    String name;
    int age;

    // Default constructor - assigns default values
    public Animal() {
        name = "Unknown";
        age = 0;
        System.out.println("Default Constructor called");
    }

    // Parameterized constructor - assigns values when object is created
    public Animal(String name, int age) {
        this.name = name;
        this.age = age;
        System.out.println("Parameterized Constructor called");
    }

    public void display() {
        System.out.println(name + " : " + age);
    }
}

class Constructor {
    public static void main(String args[]) {

        // Using default constructor
        Animal a1 = new Animal();
        a1.display();

        // Using parameterized constructor - assign values at creation time
        Animal a2 = new Animal("Dog", 5);
        a2.display();

        Animal a3 = new Animal("Cat", 3);
        a3.display();
    }
}
