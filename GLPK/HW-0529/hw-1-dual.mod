
/* hw-dual.mod */

var y1 >= 0;
var y2 >= 0;
var y3 >= 0;

maximize z : 18*y1 + 31*y2 + 25*y3;
s.t. A: 0.18*y1 + 0.43*y2 + 0.31*y3 <= 5;
s.t. B: 0.31*y1 + 0.25*y2 + 0.37*y3 <= 7.5;
s.t. C: 0.12*y1 + 0.12*y2 + 0.37*y3 <= 3.75;
s.t. D: 0.18*y1 + 0.5*y2 + 0.12*y3 <= 2.5;

end;