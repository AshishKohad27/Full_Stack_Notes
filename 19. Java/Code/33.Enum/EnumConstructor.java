// --- Enum constructor runs when class loads ---

enum Fruit {
    APPLE, BANANA, MANGO;

    Fruit() {
        System.out.println("Constructor called for: " + this.name());
    }
}

// --- Multiple constructors (overloaded) ---

enum Drink {
    WATER(),
    COLA("Cola", 150),
    JUICE("Orange Juice", 120),
    COFFEE("Coffee", 80);

    String name;
    int calories;

    Drink() {
        this.name = "Plain Water";
        this.calories = 0;
    }

    Drink(String name, int calories) {
        this.name = name;
        this.calories = calories;
    }

    void display() {
        System.out.println(name + " → " + calories + " cal");
    }
}

// --- Enum with getter (proper encapsulation) ---

enum Employee {
    DEVELOPER("Amit", 80000),
    MANAGER("Priya", 120000),
    INTERN("Rahul", 20000);

    private String name;
    private int salary;

    Employee(String name, int salary) {
        this.name = name;
        this.salary = salary;
    }

    String getName()   { return name; }
    int getSalary()    { return salary; }

    void display() {
        System.out.println(getName() + " → Rs." + getSalary());
    }
}

class EnumConstructor {
    public static void main(String args[]) {

        // --- Constructor runs for all constants at load time ---
        System.out.println("--- Fruit (constructor demo) ---");
        Fruit f = Fruit.APPLE;
        // All 3 constructors already ran above
        System.out.println("Accessed: " + f);

        // --- Multiple constructors ---
        System.out.println("\n--- Drinks (overloaded constructors) ---");
        for (Drink d : Drink.values()) {
            d.display();
        }

        // --- Getter ---
        System.out.println("\n--- Employees (getter) ---");
        for (Employee e : Employee.values()) {
            e.display();
        }

        Employee dev = Employee.DEVELOPER;
        System.out.println("Name: " + dev.getName());
        System.out.println("Salary: " + dev.getSalary());
    }
}
