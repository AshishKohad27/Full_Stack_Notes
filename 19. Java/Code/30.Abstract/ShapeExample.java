abstract class Shape {
    String color;

    // Abstract class CAN have constructor
    Shape(String color) {
        this.color = color;
    }

    // Abstract method — child MUST define
    abstract double area();

    // Regular method — child inherits as-is
    void display() {
        System.out.println(color + " shape, Area = " + area());
    }
}

class Circle extends Shape {
    double radius;

    Circle(String color, double radius) {
        super(color);
        this.radius = radius;
    }

    double area() {
        return 3.14 * radius * radius;
    }
}

class Rectangle extends Shape {
    double length, width;

    Rectangle(String color, double length, double width) {
        super(color);
        this.length = length;
        this.width = width;
    }

    double area() {
        return length * width;
    }
}

class ShapeExample {
    public static void main(String args[]) {
        Circle c = new Circle("Red", 5);
        c.display();    // Red shape, Area = 78.5

        Rectangle r = new Rectangle("Blue", 4, 6);
        r.display();    // Blue shape, Area = 24.0

        // Polymorphism with abstract class
        Shape s = new Circle("Green", 3);
        s.display();    // Green shape, Area = 28.26
    }
}
