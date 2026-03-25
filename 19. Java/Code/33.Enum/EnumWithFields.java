enum Size {
    SMALL(30),
    MEDIUM(40),
    LARGE(50),
    XL(60);

    int chest;

    Size(int chest) {
        this.chest = chest;
    }

    String getLabel() {
        return this.name() + " (Chest: " + chest + " inches)";
    }
}

enum Operation {
    ADD {
        int apply(int a, int b) { return a + b; }
    },
    SUBTRACT {
        int apply(int a, int b) { return a - b; }
    },
    MULTIPLY {
        int apply(int a, int b) { return a * b; }
    },
    DIVIDE {
        int apply(int a, int b) { return a / b; }
    };

    abstract int apply(int a, int b);
}

class EnumWithFields {
    public static void main(String args[]) {

        // --- Enum with fields ---
        System.out.println("--- Sizes ---");
        for (Size s : Size.values()) {
            System.out.println(s.getLabel());
        }

        Size mySize = Size.LARGE;
        System.out.println("My size: " + mySize.chest + " inches");

        // --- Enum with abstract method ---
        System.out.println("\n--- Operations ---");
        int a = 10, b = 3;
        for (Operation op : Operation.values()) {
            System.out.println(op + ": " + op.apply(a, b));
        }
    }
}
