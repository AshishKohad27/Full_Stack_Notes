class Animal {
    final void breathe() {
        System.out.println("Breathing...");
    }

    void sound() {
        System.out.println("Some sound");
    }
}

class Dog extends Animal {
    // void breathe() { }    // ERROR: cannot override final method

    void sound() {
        System.out.println("Bark!");
    }
}

class FinalMethod {
    public static void main(String args[]) {
        Dog d = new Dog();
        d.breathe();   // Breathing...  (final — can't override)
        d.sound();     // Bark!         (overridden)
    }
}
