let second = 0;
let minutes = 58;
let hours = 0;
let interval = 10; // seconds


setInterval(function () {
    second++;
    const displaySeconds = second <= 9 ? `0${second}` : second;
    const displayMinutes = minutes <= 9 ? `0${minutes}` : minutes;
    const displayHours = hours <= 9 ? `0${hours}` : hours;

    if (second >= 60) {
        second = 0;
        minutes++;
    }

    if (minutes >= 60) {
        minutes = 0;
        hours++;
    }

    let clock = `${displayHours}:${displayMinutes}:${displaySeconds}`
    console.log(clock);
}, interval)