var bigInt = require("big-integer");
var f_n_v_2 = bigInt(1);
var f_n_v_1 = bigInt(1);
var f_n = f_n_v_1.plus(f_n_v_2);
var n = 3;

while (f_n.toString().length < 1000) {
    f_n_v_2 = f_n_v_1;
    f_n_v_1 = f_n;
    f_n = f_n_v_1.plus(f_n_v_2);
    ++n;
}

console.log(n);

