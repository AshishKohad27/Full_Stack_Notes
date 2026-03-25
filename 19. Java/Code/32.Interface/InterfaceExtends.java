// Interface extends Interface chain

interface Machine {
    void turnOn();
    void turnOff();
}

interface Computer4 extends Machine {
    void process(String task);
    // inherits turnOn() + turnOff() from Machine
}

interface Portable2 {
    void carryAround();
}

// Interface extends MULTIPLE interfaces
interface SmartDevice extends Computer4, Portable2 {
    void voiceCommand(String command);
    // inherits: turnOn(), turnOff(), process(), carryAround()
}

class SmartLaptop implements SmartDevice {
    public void turnOn()              { System.out.println("Smart Laptop ON"); }
    public void turnOff()             { System.out.println("Smart Laptop OFF"); }
    public void process(String task)  { System.out.println("Processing: " + task); }
    public void carryAround()         { System.out.println("Carrying smart laptop"); }
    public void voiceCommand(String cmd) { System.out.println("Voice: " + cmd); }
}

// --- Same method in two interfaces ---

interface Printer {
    void start();
    void print(String text);
}

interface Scanner2 {
    void start();    // same method name as Printer!
    void scan(String doc);
}

class AllInOne implements Printer, Scanner2 {
    public void start() {
        System.out.println("All-in-One device starting...");
    }

    public void print(String text) {
        System.out.println("Printing: " + text);
    }

    public void scan(String doc) {
        System.out.println("Scanning: " + doc);
    }
}

class InterfaceExtends {
    public static void main(String args[]) {

        // --- Interface chain ---
        System.out.println("--- Interface extends Interface ---");

        Machine m = new SmartLaptop();
        m.turnOn();
        m.turnOff();

        Computer4 c = new SmartLaptop();
        c.turnOn();
        c.process("Coding");

        SmartDevice sd = new SmartLaptop();
        sd.turnOn();
        sd.process("AI Training");
        sd.carryAround();
        sd.voiceCommand("Open browser");

        // --- Same method in two interfaces ---
        System.out.println("\n--- Same method, two interfaces ---");

        AllInOne device = new AllInOne();
        device.start();
        device.print("Report");
        device.scan("ID Card");

        // Works through both interface references
        Printer p = new AllInOne();
        p.start();

        Scanner2 s = new AllInOne();
        s.start();    // same start() — one definition serves both
    }
}
