interface Computer3 {
    void turnOn();
    void turnOff();
}

interface CodeEditor {
    void openEditor();
    void writeCode(String language);
}

interface Deployable {
    void deploy(String environment);
}

class Laptop3 implements Computer3 {
    public void turnOn()  { System.out.println("Laptop ON"); }
    public void turnOff() { System.out.println("Laptop OFF"); }
}

class Desktop3 implements Computer3 {
    public void turnOn()  { System.out.println("Desktop ON"); }
    public void turnOff() { System.out.println("Desktop OFF"); }
}

class Developer implements CodeEditor, Deployable {
    String name;
    Computer3 machine;   // can be Laptop OR Desktop

    Developer(String name, Computer3 machine) {
        this.name = name;
        this.machine = machine;
    }

    public void openEditor() {
        System.out.println(name + " opens VS Code");
    }

    public void writeCode(String language) {
        System.out.println(name + " is writing " + language + " code");
    }

    public void deploy(String environment) {
        System.out.println(name + " deploys to " + environment);
    }

    void startWork() {
        machine.turnOn();
        openEditor();
    }

    void endWork() {
        machine.turnOff();
    }
}

class DeveloperSystem {
    public static void main(String args[]) {

        Computer3 laptop = new Laptop3();
        Computer3 desktop = new Desktop3();

        Developer dev1 = new Developer("Amit", laptop);
        Developer dev2 = new Developer("Priya", desktop);

        // Amit on laptop
        dev1.startWork();
        dev1.writeCode("Java");
        dev1.deploy("production");
        dev1.endWork();

        System.out.println("===");

        // Priya on desktop
        dev2.startWork();
        dev2.writeCode("Python");
        dev2.deploy("staging");
        dev2.endWork();
    }
}
