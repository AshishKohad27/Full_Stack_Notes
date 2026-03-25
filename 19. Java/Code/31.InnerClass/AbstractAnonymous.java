abstract class Notification {
    String to;

    Notification(String to) {
        this.to = to;
    }

    // Abstract — each type defines its own
    abstract void send();

    // Concrete — same for all, inherited
    void log() {
        System.out.println("Notification sent to " + to);
    }
}

class AbstractAnonymous {
    public static void main(String args[]) {

        // Anonymous class + abstract class — no separate file needed

        Notification email = new Notification("amit@gmail.com") {
            void send() {
                System.out.println("Email sent to " + to);
            }
        };

        Notification sms = new Notification("9876543210") {
            void send() {
                System.out.println("SMS sent to " + to);
            }
        };

        Notification push = new Notification("user123") {
            void send() {
                System.out.println("Push notification sent to " + to);
                System.out.println("   Priority: HIGH");
            }
        };

        // Polymorphism + Abstract + Anonymous — all together
        Notification all[] = { email, sms, push };

        for (Notification n : all) {
            n.send();
            n.log();
            System.out.println("---");
        }
    }
}
