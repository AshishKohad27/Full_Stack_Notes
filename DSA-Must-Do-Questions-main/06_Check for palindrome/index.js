function Palindrome(str) {
    let p1 = 0;
    let p2 = str.length - 1;
    while (p1 <= p2) {
        if (str[p1] !== str[p2]) {
            console.log("No");
            return;
        }
        p1++;
        p2--;
    }
    console.log("Yes");
}

Palindrome("malayalam");
Palindrome("masai");
Palindrome("a");
Palindrome("racecar");
