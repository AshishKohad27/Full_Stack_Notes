class Animal {
    void eat() {
        System.out.println("Animal is eating");
    }
}

class Dog extends Animal {
    void bark() {
        System.out.println("Dog is barking");
    }
}

class Cat extends Animal {
    void meow() {
        System.out.println("Cat is meowing");
    }
}

class Upcasting {
    // ONE method works for ALL animals — thanks to upcasting
    static void feed(Animal a) {
        a.eat();
    }

    public static void main(String args[]) {

        // Upcasting — child to parent (automatic)
        Animal a1 = new Dog();   // Dog → Animal
        Animal a2 = new Cat();   // Cat → Animal

        a1.eat();    // works
        a2.eat();    // works
        // a1.bark(); // ERROR — Animal ref can't see Dog methods

        // Passing child objects to parent parameter
        feed(new Dog());   // upcasting happens automatically
        feed(new Cat());   // upcasting happens automatically
    }
}
