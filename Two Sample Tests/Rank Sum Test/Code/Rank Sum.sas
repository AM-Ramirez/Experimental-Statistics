*Rank Sum Example;
data example;
input reason $ rate;
datalines;                                                                                                                                                                                                                   
N 18.8
N 20.0
N 20.1
N 20.9
N 20.9
N 21.4
T 22.0
N 22.7
N 22.9
T 23.0
T 24.5
T 25.8
T 30.0
T 37.6
T 38.5
;
run;  

proc npar1way data=example wilcoxon;
class reason;
var rate;
exact HL wilcoxon;
run;

* 90% HL interval;
proc npar1way data=example wilcoxon alpha=.1;
class reason;
var rate;
exact HL wilcoxon;
run;
