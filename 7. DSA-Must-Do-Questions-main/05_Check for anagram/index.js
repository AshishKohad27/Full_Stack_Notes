function anagram(str1, str2) {
    str1 = str1.split(""); // N
    str1 = str1.sort(); //N*log(n);
    // console.log('str1:', str1);
    str2 = str2.split(""); // N
    str2 = str2.sort(); //N*log(n);
    // console.log('str2:', str2);

    let p1 = 0;
    let p2 = 0;
    while (p1 < str1.length && p2 < str2.length) {
        if (str1[p1] !== str2[p2]) {
            console.log("No")
            return
        }
        p1++;
        p2++;
    }
    console.log("Yes");
}
anagram("abcd", "dacb");
anagram("abcd", "abcb");
anagram("ashish", "hsihsa");