abstract class Animal {
    abstract void sound();
}

interface Greeting {
    void greet();
}

class Calculator {
    int calculate(int a, int b) {
        return a + b;
    }
}

class AnonymousClass {
    public static void main(String args[]) {

        // --- Anonymous class with abstract class ---
        Animal dog = new Animal() {
            void sound() {
                System.out.println("Bark!");
            }
        };

        Animal cat = new Animal() {
            void sound() {
                System.out.println("Meow!");
            }
        };

        dog.sound();   // Bark!
        cat.sound();   // Meow!

        // --- Anonymous class with interface ---
        Greeting english = new Greeting() {
            public void greet() {
                System.out.println("Hello!");
            }
        };

        Greeting hindi = new Greeting() {
            public void greet() {
                System.out.println("Namaste!");
            }
        };

        english.greet();   // Hello!
        hindi.greet();     // Namaste!

        // --- Anonymous class overriding regular class ---
        Calculator adder = new Calculator();
        System.out.println("Add: " + adder.calculate(5, 3));   // 8

        Calculator subtractor = new Calculator() {
            int calculate(int a, int b) {
                return a - b;
            }
        };
        System.out.println("Sub: " + subtractor.calculate(5, 3));   // 2

        Calculator multiplier = new Calculator() {
            int calculate(int a, int b) {
                return a * b;
            }
        };
        System.out.println("Mul: " + multiplier.calculate(5, 3));   // 15
    }
}
