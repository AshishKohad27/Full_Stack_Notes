class Animal2 {
    void eat() {
        System.out.println("Eating");
    }
}

class Dog2 extends Animal2 {
    void bark() {
        System.out.println("Barking");
    }
}

class Cat2 extends Animal2 {
    void meow() {
        System.out.println("Meowing");
    }
}

class Downcasting {
    public static void main(String args[]) {

        // Step 1: Upcast first
        Animal2 a = new Dog2();
        a.eat();              // works
        // a.bark();          // ERROR — can't see Dog methods

        // Step 2: Downcast to access child methods
        Dog2 d = (Dog2) a;   // manual cast
        d.bark();             // NOW works
        d.eat();              // also works

        // --- Dangerous Downcasting ---
        Animal2 a2 = new Cat2();

        // Dog2 d2 = (Dog2) a2;   // CRASH! ClassCastException — Cat is NOT Dog

        // --- Safe Downcasting with instanceof ---
        if (a2 instanceof Dog2) {
            Dog2 d2 = (Dog2) a2;
            d2.bark();
        } else {
            System.out.println("a2 is NOT a Dog");
        }

        if (a2 instanceof Cat2) {
            Cat2 c = (Cat2) a2;
            c.meow();          // safe!
        }

        // --- instanceof checks ---
        System.out.println(a instanceof Dog2);      // true
        System.out.println(a instanceof Animal2);   // true
        System.out.println(a2 instanceof Dog2);     // false
        System.out.println(a2 instanceof Cat2);     // true
    }
}
