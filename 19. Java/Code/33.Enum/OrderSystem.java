enum OrderStatus {
    PLACED("Order has been placed") {
        OrderStatus next() { return CONFIRMED; }
    },
    CONFIRMED("Order is confirmed") {
        OrderStatus next() { return SHIPPED; }
    },
    SHIPPED("Order has been shipped") {
        OrderStatus next() { return DELIVERED; }
    },
    DELIVERED("Order delivered successfully") {
        OrderStatus next() { return DELIVERED; }
    };

    String description;

    OrderStatus(String description) {
        this.description = description;
    }

    abstract OrderStatus next();

    void display() {
        System.out.println(this.name() + " → " + description);
    }
}

class Order {
    int orderId;
    OrderStatus status;

    Order(int orderId) {
        this.orderId = orderId;
        this.status = OrderStatus.PLACED;
    }

    void moveToNext() {
        this.status = status.next();
        System.out.println("Order #" + orderId + " → " + status);
    }

    void showStatus() {
        System.out.print("Order #" + orderId + " : ");
        status.display();
    }
}

class OrderSystem {
    public static void main(String args[]) {

        Order order = new Order(101);

        order.showStatus();    // PLACED
        order.moveToNext();    // → CONFIRMED
        order.moveToNext();    // → SHIPPED
        order.moveToNext();    // → DELIVERED
        order.showStatus();    // DELIVERED
    }
}
