function fib(x) {
    if (x == 0) {
        return 1;
    } else if (x == 1) {
        return 1;
    } else {
        return fib(x-1) + fib(x-2);
    }
}
var i = 0;
var a = 0;
var last = fib(i);
while (last < 4000000) {
  if (last % 2 == 0) {
    a += last;
  }
  last = fib(++i);
}
console.log(a);