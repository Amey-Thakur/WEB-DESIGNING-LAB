function myFunction1(){
  var p = document.getElementById('sprincipal').value;
  var r = document.getElementById('srate').value;
  var t = document.getElementById('syear').value;
  var inr = p*r*t;
  var inrst = inr/100;
  document.getElementById('SI').innerHTML=  "<span class='color-class'>Simple Interest is "+inrst+"</span>";
}

function myFunction2(){
  var p = document.getElementById('cprincipal').value;
  var r = document.getElementById('crate').value;
  var t = document.getElementById('cyear').value;
  var n = document.getElementById('cnd').value;
  var r1 = r/100;
  var nbr = r1/n;
  var x = (1+nbr);
  var nt = n*t;
  var xnt = Math.pow(x,nt);
  var cmpndint = p*xnt;
  var z = cmpndint.toFixed(2);
  document.getElementById('CI').innerHTML=  "<span class='color-class'>Compound Interest is "+z+"</span>";
}
