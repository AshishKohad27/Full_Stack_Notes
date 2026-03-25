class Calc {
    public int add(int n1, int n2) {
        return n1 + n2;
    }
}

class AdvCalc extends Calc {
    public int add(int n1, int n2) {
        return n1 + n2 + 10;
    }
}

class Hello {
    public static void main(String args[]) {

        AdvCalc obj = new AdvCalc();
        int r1 = obj.add(5, 10); // if we have same method child method get override parent method

        System.out.println(r1); // r1 = 25

    }
}
