interface Computer {
    void turnOn();
    void turnOff();
    void process(String task);
}

class Laptop implements Computer {
    public void turnOn() {
        System.out.println("Laptop: Opening lid, booting up...");
    }

    public void turnOff() {
        System.out.println("Laptop: Closing lid, shutting down...");
    }

    public void process(String task) {
        System.out.println("Laptop processing: " + task);
    }
}

class Desktop implements Computer {
    public void turnOn() {
        System.out.println("Desktop: Press power button, fans spinning...");
    }

    public void turnOff() {
        System.out.println("Desktop: Saving state, powering off...");
    }

    public void process(String task) {
        System.out.println("Desktop processing: " + task + " (with full power!)");
    }
}

class InterfaceBasics {
    public static void main(String args[]) {
        Computer c1 = new Laptop();
        Computer c2 = new Desktop();

        c1.turnOn();
        c1.process("Writing code");
        c1.turnOff();

        System.out.println("---");

        c2.turnOn();
        c2.process("Gaming");
        c2.turnOff();
    }
}
