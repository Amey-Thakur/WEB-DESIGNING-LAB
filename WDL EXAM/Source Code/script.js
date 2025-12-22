/*
 * =========================================================================================
 *  Author: Amey Thakur
 *  GitHub: https://github.com/Amey-Thakur
 *  Repository: https://github.com/Amey-Thakur/WEB-DESIGNING-LAB
 *  Description: JavaScript logic for calculating Simple and Compound Interest.
 * =========================================================================================
 */

/**
 * Calculates Simple Interest (SI) based on user input.
 * Formula: SI = (P * R * T) / 100
 */
function myFunction1() {
    // Retrieve input values from the DOM
    var p = document.getElementById('sprincipal').value; // Principal Amount
    var r = document.getElementById('srate').value;      // Interest Rate (%)
    var t = document.getElementById('syear').value;      // Time in Years

    // Calculate total interest amount
    var inr = p * r * t;
    var inrst = inr / 100;

    // Display the result in the dedicated output paragraph
    document.getElementById('SI').innerHTML = "<span class='color-class'>Simple Interest is " + inrst + "</span>";
}

/**
 * Calculates Compound Interest (CI) based on user input.
 * Formula: A = P(1 + r/n)^(nt)
 */
function myFunction2() {
    // Retrieve input values from the DOM
    var p = document.getElementById('cprincipal').value; // Principal Amount
    var r = document.getElementById('crate').value;      // Annual Interest Rate (%)
    var t = document.getElementById('cyear').value;      // Time in Years
    var n = document.getElementById('cnd').value;        // Number of times interest compounded per year

    // Convert annual rate percentage to decimal
    var r1 = r / 100;

    // Intermediate calculation: (1 + r/n)
    var nbr = r1 / n;
    var x = (1 + nbr);

    // Total number of compounding periods (n * t)
    var nt = n * t;

    // Final balance calculation: P * (1 + r/n)^(nt)
    var xnt = Math.pow(x, nt);
    var cmpndint = p * xnt;

    // Round the result to 2 decimal places for financial accuracy
    var z = cmpndint.toFixed(2);

    // Display the result in the dedicated output paragraph
    document.getElementById('CI').innerHTML = "<span class='color-class'>Compound Interest is " + z + "</span>";
}
