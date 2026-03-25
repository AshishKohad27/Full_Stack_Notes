// PROBLEM: Trying to build Computer + Developer system with ABSTRACT classes

abstract class Computer {
    abstract void turnOn();
    abstract void turnOff();
    abstract void process(String task);
}

abstract class CodeWriter {
    abstract void writeCode(String language);
    abstract void deploy(String env);
}

class Laptop extends Computer {
    void turnOn()  { System.out.println("Laptop ON"); }
    void turnOff() { System.out.println("Laptop OFF"); }
    void process(String task) { System.out.println("Laptop processing: " + task); }
}

class Desktop extends Computer {
    void turnOn()  { System.out.println("Desktop ON"); }
    void turnOff() { System.out.println("Desktop OFF"); }
    void process(String task) { System.out.println("Desktop processing: " + task); }
}

// PROBLEM: Developer wants to extend BOTH Computer and CodeWriter
// class Developer extends Computer, CodeWriter { }   // ❌ ERROR! Can't extend two classes

// FORCED WORKAROUND: Developer can only extend CodeWriter, must manually handle Computer
class Developer extends CodeWriter {
    String name;
    Computer machine;

    Developer(String name, Computer machine) {
        this.name = name;
        this.machine = machine;
    }

    void writeCode(String language) {
        System.out.println(name + " is writing " + language + " code");
    }

    void deploy(String env) {
        System.out.println(name + " deploys to " + env);
    }

    void startWork() {
        machine.turnOn();
    }

    void endWork() {
        machine.turnOff();
    }
}

class AbstractProblem {
    public static void main(String args[]) {
        Computer laptop = new Laptop();
        Developer dev = new Developer("Amit", laptop);

        dev.startWork();
        dev.writeCode("Java");
        dev.deploy("production");
        dev.endWork();

        // This WORKS but it's limited:
        // - Developer is locked to extending CodeWriter only
        // - Can't add more abstract parents (Portable, Upgradeable)
        // - If CodeWriter changes, Developer must change too
        //
        // With INTERFACES, Developer can implement CodeWriter, Deployable,
        // Portable, Upgradeable — ALL at once, with no limitations!
        //
        // SEE: DeveloperSystem.java for the INTERFACE solution
    }
}
