homework 2
.lib '/home/ff/ee141/MODELS/gpdk090_mos.sp' TT_S1V
.subckt inverter in out

vdd vdd 0 1.2
m0 out in vdd vdd gpdk090_pmos1v L=100e-9 W=240e-9 AD=69.6e-15 AS=69.6e-15 PD=1.16e-6 PS=1.16e-6 M=1
m1 out in 0 0 gpdk090_nmos1v L=100e-9 W=120e-9 AD=69.6e-15 AS=69.6e-15 PD=1.16e-6 PS=1.16e-6 M=1
.ends
VIN in 0 PULSE 0 1.2 2ps 2ps 2ps 1ns 2ns

x1 in a inverter M=1
x2 a b inverter M=3
*x3 b c inverter M=9
*x4 c out inverter M=27
*x5 in d inverter M=1
*x6 d e inverter M=3
*x7 e f inverter M=9
*x8 f out inverter M=27
*ca b d 2f
*cb b e 40f
.options post=2 nomod
.op 

.tran .1ns 10ns
.measure tran tp1 trig v(b) val=0.6 rise=1 targ v(c) val=0.6 
+ fall=1


.end
