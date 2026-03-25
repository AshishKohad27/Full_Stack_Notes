class Shape {
    void draw() {
        System.out.println("Drawing a Shape");
    }
}

class Circle extends Shape {
    void draw() {
        System.out.println("Drawing a Circle");
    }
}

class Square extends Shape {
    void draw() {
        System.out.println("Drawing a Square");
    }
}

class Triangle extends Shape {
    void draw() {
        System.out.println("Drawing a Triangle");
    }
}

class DynamicDispatch {
    public static void main(String args[]) {

        Shape s;   // parent reference

        s = new Circle();
        s.draw();   // Drawing a Circle

        s = new Square();
        s.draw();   // Drawing a Square

        s = new Triangle();
        s.draw();   // Drawing a Triangle
    }
}
