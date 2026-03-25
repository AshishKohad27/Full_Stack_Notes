abstract class Animal {
    // Abstract method — DECLARED (no body)
    abstract void sound();

    // Regular method — DEFINED (has body)
    void breathe() {
        System.out.println("Breathing...");
    }
}

class Dog extends Animal {
    // MUST define sound()
    void sound() {
        System.out.println("Bark!");
    }
}

class Cat extends Animal {
    // MUST define sound()
    void sound() {
        System.out.println("Meow!");
    }
}

class AbstractBasics {
    public static void main(String args[]) {
        // Animal a = new Animal();   // ERROR — cannot instantiate abstract class

        Dog d = new Dog();
        d.sound();     // Bark!
        d.breathe();   // Breathing...

        Cat c = new Cat();
        c.sound();     // Meow!
        c.breathe();   // Breathing...

        // Polymorphism with abstract class
        Animal a = new Dog();
        a.sound();     // Bark!
    }
}
