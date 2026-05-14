v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -150 -350 -150 -240 {lab=#net1}
N -510 -350 -150 -350 {lab=#net1}
N -330 -210 -190 -210 {lab=in}
N -330 -80 -190 -80 {lab=in}
N -150 -180 -150 -110 {lab=out}
N -430 -140 -430 -110 {lab=in}
N -330 -210 -330 -80 {lab=in}
N -430 -140 -330 -140 {lab=in}
N -150 -210 -50 -210 {lab=#net1}
N -50 -350 -50 -210 {lab=#net1}
N -150 -350 -50 -350 {lab=#net1}
N -510 -350 -510 -170 {lab=#net1}
N -510 -110 -510 50 {lab=0}
N -510 50 -150 50 {lab=0}
N -150 -50 -150 40 {lab=0}
N -150 40 -150 50 {lab=0}
N -150 -80 -50 -80 {lab=0}
N -50 -80 -50 50 {lab=0}
N -150 50 -50 50 {lab=0}
N -430 -50 -430 50 {lab=0}
N -480 50 -480 70 {lab=0}
N -150 -150 -50 -150 {lab=out}
C {sky130_fd_pr/nfet_01v8.sym} -170 -80 0 0 {name=M1
W=1
L=0.15
nf=1 
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} -170 -210 0 0 {name=M2
W=1
L=0.15
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {vsource.sym} -430 -80 0 0 {name=V2 value=0 savecurrent=false}
C {vsource.sym} -510 -140 0 0 {name=V1 value=1.8 savecurrent=false}
C {lab_pin.sym} -430 -140 0 0 {name=p1 sig_type=std_logic lab=in}
C {gnd.sym} -480 70 0 0 {name=l1 lab=0}
C {code.sym} 10 -90 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value=".lib /foss/pdks/sky130A/libs.tech/ngspice/sky130.lib.spice tt

.param mc_mm_switch=0
.param mc_pr_switch=1
"}
C {lab_pin.sym} -50 -150 2 0 {name=p2 sig_type=std_logic lab=out}
C {code_shown.sym} 30 60 0 0 {name=spice only_toplevel=false value="
.option wnflag=0
.option savecurrent
.control
save all
dc v2 0 1.8 0.01
plot in out
op
.endc
"}
