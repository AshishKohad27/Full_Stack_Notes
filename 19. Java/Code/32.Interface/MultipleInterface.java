interface Computer2 {
    void turnOn();
    void process(String task);
}

interface Portable {
    void carryAround();
    int getBatteryLife();
}

interface Upgradeable {
    void upgradeRAM(int gb);
    void upgradeStorage(int gb);
}

// Laptop implements ALL THREE
class Laptop2 implements Computer2, Portable, Upgradeable {
    public void turnOn()              { System.out.println("Laptop booting up..."); }
    public void process(String task)  { System.out.println("Processing: " + task); }
    public void carryAround()         { System.out.println("Putting laptop in backpack"); }
    public int getBatteryLife()        { return 8; }
    public void upgradeRAM(int gb)    { System.out.println("RAM upgraded to " + gb + "GB"); }
    public void upgradeStorage(int gb){ System.out.println("Storage upgraded to " + gb + "GB"); }
}

// Desktop implements only Computer2 and Upgradeable (NOT Portable)
class Desktop2 implements Computer2, Upgradeable {
    public void turnOn()              { System.out.println("Desktop powering on..."); }
    public void process(String task)  { System.out.println("Processing: " + task + " (high performance)"); }
    public void upgradeRAM(int gb)    { System.out.println("Desktop RAM → " + gb + "GB"); }
    public void upgradeStorage(int gb){ System.out.println("Desktop storage → " + gb + "GB"); }
}

class MultipleInterface {
    public static void main(String args[]) {

        Laptop2 l = new Laptop2();
        l.turnOn();
        l.carryAround();
        l.upgradeRAM(16);

        System.out.println("---");

        // Different interface types as reference
        Portable p = new Laptop2();
        p.carryAround();          // works
        // p.turnOn();            // ERROR — Portable doesn't have turnOn()

        Computer2 c = new Desktop2();
        c.turnOn();
        c.process("Rendering");
    }
}
