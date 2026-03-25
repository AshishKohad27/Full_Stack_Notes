// --- Compile-Time Polymorphism (Overloading) ---

class Calculator {
    int add(int a, int b)           { return a + b; }
    int add(int a, int b, int c)    { return a + b + c; }
    double add(double a, double b)  { return a + b; }
}

// --- Runtime Polymorphism (Overriding) ---

class Animal {
    void sound() {
        System.out.println("Animal makes a sound");
    }
}

class Dog extends Animal {
    void sound() {
        System.out.println("Dog: Bark Bark!");
    }
}

class Cat extends Animal {
    void sound() {
        System.out.println("Cat: Meow Meow!");
    }
}

// --- Real World Example ---

class Payment {
    void pay(int amount) {
        System.out.println("Paying " + amount);
    }
}

class CreditCard extends Payment {
    void pay(int amount) {
        System.out.println("Paid " + amount + " via Credit Card");
    }
}

class UPI extends Payment {
    void pay(int amount) {
        System.out.println("Paid " + amount + " via UPI");
    }
}

class Cash extends Payment {
    void pay(int amount) {
        System.out.println("Paid " + amount + " via Cash");
    }
}

class Polymorphism {
    public static void main(String args[]) {

        // 1. Compile-Time Polymorphism (Overloading)
        System.out.println("--- Compile-Time (Overloading) ---");
        Calculator calc = new Calculator();
        System.out.println(calc.add(2, 3));        // 5
        System.out.println(calc.add(2, 3, 4));     // 9
        System.out.println(calc.add(2.5, 3.5));    // 6.0

        // 2. Runtime Polymorphism (Overriding)
        System.out.println("\n--- Runtime (Overriding) ---");
        Animal a1 = new Dog();
        Animal a2 = new Cat();
        a1.sound();  // Dog: Bark Bark!
        a2.sound();  // Cat: Meow Meow!

        // 3. Real World - Payment System
        System.out.println("\n--- Payment System ---");
        Payment payments[] = { new CreditCard(), new UPI(), new Cash() };

        for (Payment payment : payments) {
            payment.pay(1000);
        }
    }
}
