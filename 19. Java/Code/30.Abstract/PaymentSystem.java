abstract class Payment {
    String userName;
    double amount;

    Payment(String userName, double amount) {
        this.userName = userName;
        this.amount = amount;
    }

    // Every payment type MUST implement this differently
    abstract void processPayment();

    // Common for all — defined once, inherited by all
    void receipt() {
        System.out.println("Receipt: " + userName + " paid Rs." + amount);
    }
}

class CreditCard extends Payment {
    String cardNumber;

    CreditCard(String userName, double amount, String cardNumber) {
        super(userName, amount);
        this.cardNumber = cardNumber;
    }

    void processPayment() {
        System.out.println("Processing credit card " + cardNumber);
        System.out.println("Rs." + amount + " charged to card");
    }
}

class UPI extends Payment {
    String upiId;

    UPI(String userName, double amount, String upiId) {
        super(userName, amount);
        this.upiId = upiId;
    }

    void processPayment() {
        System.out.println("Processing UPI payment to " + upiId);
        System.out.println("Rs." + amount + " sent via UPI");
    }
}

class Cash extends Payment {
    Cash(String userName, double amount) {
        super(userName, amount);
    }

    void processPayment() {
        System.out.println("Rs." + amount + " received in cash");
    }
}

class PaymentSystem {
    public static void main(String args[]) {

        Payment payments[] = {
            new CreditCard("Amit", 5000, "1234-5678"),
            new UPI("Priya", 2000, "priya@upi"),
            new Cash("Rahul", 500)
        };

        for (Payment p : payments) {
            p.processPayment();
            p.receipt();
            System.out.println("---");
        }
    }
}
