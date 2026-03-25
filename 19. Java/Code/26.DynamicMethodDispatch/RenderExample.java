class Shape2 {
    void draw() {
        System.out.println("Drawing a Shape");
    }
}

class Circle2 extends Shape2 {
    void draw() {
        System.out.println("Drawing a Circle");
    }
}

class Square2 extends Shape2 {
    void draw() {
        System.out.println("Drawing a Square");
    }
}

class Triangle2 extends Shape2 {
    void draw() {
        System.out.println("Drawing a Triangle");
    }
}

class RenderExample {
    // ONE method that works for ALL shapes
    static void render(Shape2 s) {
        s.draw();   // Dynamic dispatch decides which draw() to call
    }

    public static void main(String args[]) {
        render(new Circle2());     // Drawing a Circle
        render(new Square2());     // Drawing a Square
        render(new Triangle2());   // Drawing a Triangle

        // If someone adds "class Hexagon extends Shape2"
        // this render() method works WITHOUT any changes!
    }
}
