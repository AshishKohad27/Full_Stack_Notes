function listOfPrimeNumbers(N) {
    let flag = true;

    for (let i = 2; i < N ** 0.5; i++) {
        if (N % i === 0) {
            flag = false;
            break;
        }
    }

    if (!flag) {
        console.log('Not Prime Number------------------------', N);
    } else {
        console.log('Prime Number----------------------------', N)
    }
}

let arr = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 40, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97];

for (let i = 0; i < arr.length; i++) {
    listOfPrimeNumbers(arr[i]);
}
// console.log(47%2)

setCookie();
setCookie(cname, cvalue, exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
    var expires = "expires=" + d.toUTCString();
    document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}
function getCookie(cname) {
    var name = cname + "="; var decodedCookie = decodeURIComponent(document.cookie); var
        ca = decodedCookie.split(';'); for (var i = 0; i < ca.length; i++) {
            var c = ca[i]; while (c.charAt(0) == ' ') {
                c = c.substring(1);
            } if (c.indexOf(name) == 0) { return c.substring(name.length, c.length); }
        } return "";
}
function checkCookie() {
    var cookieNotice = getCookie("cookie_notice_accepted"); if (cookieNotice === "") {
        //Display your cookie notice HTML here 
        document.getElementById("cookie-notice").style.display = "block";
    }
}
function acceptCookie() {
    setCookie("cookie_notice_accepted", "true", 365);
    document.getElementById("cookie-notice").style.display = "none";
}
checkCookie();