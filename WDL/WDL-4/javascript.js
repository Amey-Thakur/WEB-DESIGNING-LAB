/**
 * Author: Amey Thakur
 * GitHub: https://github.com/Amey-Thakur
 * Repository: https://github.com/Amey-Thakur/WEB-DESIGNING-LAB
 * Description: JavaScript Logic for Interest Calculator (Experiment 4)
 * 
 * This script contains functions to calculate Simple Interest (SI) 
 * and Compound Interest (CI) based on user input.
 */

/**
 * Calculates Simple Interest (SI)
 * Formula: SI = (P * R * T) / 100
 */
function myFunction1() {
  // Get values from input fields
  var p = document.getElementById('sprincipal').value;
  var r = document.getElementById('srate').value;
  var t = document.getElementById('syear').value;

  // Mathematical logical steps
  var inr = p * r * t;
  var inrst = inr / 100;

  // Display the result in the corresponding paragraph tag
  document.getElementById('SI').innerHTML = "<span class='color-class'>Simple Interest is ₹" + inrst + "</span>";
}

/**
 * Calculates Compound Interest (CI)
 * Formula: A = P(1 + r/n)^(nt)
 */
function myFunction2() {
  // Get values from input fields
  var p = document.getElementById('cprincipal').value;
  var r = document.getElementById('crate').value;
  var t = document.getElementById('cyear').value;
  var n = document.getElementById('cnd').value;

  // Calculation logic
  var r1 = r / 100;    // Convert rate to decimal
  var nbr = r1 / n;    // Rate divided by compounding per year
  var x = (1 + nbr);   // Base part of the power function
  var nt = n * t;      // Total number of compounding periods

  // Calculate total amount using Math.pow
  var xnt = Math.pow(x, nt);
  var cmpndint = p * xnt;

  // Format to 2 decimal places for currency accuracy
  var z = cmpndint.toFixed(2);

  // Display the result
  document.getElementById('CI').innerHTML = "<span class='color-class'>Compound Interest is ₹" + z + "</span>";
}
