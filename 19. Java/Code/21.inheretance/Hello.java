class Hello {
    public static void main(String args[]) {
        
        // now below method not accessible
        // Calc obj = new Calc();
        // int r1 = obj.add(5,7);
        // int r2 = obj.sub(5,7);
        
        // AdvCalc obj = new AdvCalc();
        // int r1 = obj.add(5,7);
        // int r2 = obj.sub(5,7);
        // int r3 = obj.mul(5,7);
        // int r4 = obj.div(5,7);

        ScientificCal obj = new ScientificCal();
        int r1 = obj.add(5,7);
        int r2 = obj.sub(5,7);
        int r3 = obj.mul(5,7);
        int r4 = obj.div(5,7);
        int r5 = obj.power(4,2);
        System.out.println(r1+" "+r2+" "+r3+" "+r4+" "+r5);


    }
}