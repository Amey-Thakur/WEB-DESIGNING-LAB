/*
    Author: Amey Thakur
    GitHub: https://github.com/Amey-Thakur
    Repository: https://github.com/Amey-Thakur/WEB-DESIGNING-LAB
    Description: External JavaScript for Interest Calculator (javascript.js)
    Task: Logic for Simple and Compound Interest calculation.
*/

/* Function to Calculate Simple Interest */
function myFunction1() {
  var p = document.getElementById('sprincipal').value;
  var r = document.getElementById('srate').value;
  var t = document.getElementById('syear').value;

  // Basic Interest Logic: (P * R * T) / 100
  var inr = p * r * t;
  var inrst = inr / 100;

  // Output Result
  document.getElementById('SI').innerHTML = "<span class='color-class'>Simple Interest is " + inrst + "</span>";
}

/* Function to Calculate Compound Interest */
function myFunction2() {
  var p = document.getElementById('cprincipal').value;
  var r = document.getElementById('crate').value;
  var t = document.getElementById('cyear').value;
  var n = document.getElementById('cnd').value;

  // Rate per decimal
  var r1 = r / 100;
  var nbr = r1 / n;
  var x = (1 + nbr);
  var nt = n * t;
  var xnt = Math.pow(x, nt);

  // Total Amount Calculation
  var cmpndint = p * xnt;
  var z = cmpndint.toFixed(2);

  // Output Result
  document.getElementById('CI').innerHTML = "<span class='color-class'>Compound Interest is " + z + "</span>";
}
