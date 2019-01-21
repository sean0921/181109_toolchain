#!/usr/bin/env csh

mkdir -p ./output

set ps = ./output/focal.ps
set cpt = dep.cpt
#cpt 0~200
set eqlist = 
set eqlist1 = EHBlev1.list
set eqlist2 = EHBlev2.list
set eqlist3 = EHBlev3.list
set grd = SeaTopo.grd
set sha = SeaTopoShad.grd
set cpt2 = topo_plb.cpt
set focal = CMTfocal.gmt
set foc1 = tmp1focal.gmt
set foc2 = tmp2focal.gmt
set foc3 = tmp3focal.gmt

gmtset PAPER_MEDIA A2
gmtset FRAME_WIDTH 0.05i
gmtset HEADER_FONT_SIZE 15
psbasemap -JM9i -R121/127/10.2/15.2 -Ba1f0.5WSne -P -K -X1.2i -Y2i > $ps
grdimage $grd -Ctopo_w.cpt -J -R -I$sha -O -K >> $ps
pscoast -J -R -Ba1f0.5wens -Dh -G220 -W1.5 -O -K >> $ps
psxy Fault.dat -R -J -W5/0/0/255 -MX -O -K >> $ps
psxy trench_Tai_Phi.gmt -R -J -W10/0/0/255 -MX -O -K >> $ps
psxy fsym.gmt -R -J -W3/0/0/255 -G0/0/255 -L -V -MX -O -K >> $ps

awk '{print $7,$8,$9,$10/20}' $eqlist3 | psxy -R -J -Sc -W1/0 -C$cpt -O -K >> $ps
awk '{print $7,$8,$9,$10/20}' $eqlist2 | psxy -R -J -Sc -W1/0 -C$cpt -O -K >> $ps
awk '{print $7,$8,$9,$10/20}' $eqlist1 | psxy -R -J -Sc -W1/0 -C$cpt -O -K >> $ps

#awk '{print $1,$2,$10,$3,$4,$5,$10/8}' $focal | psmeca -R -JM -Sa1 -L3 -W0.1/0 -G200 -O -K >> $ps
awk '{if($5>-160 && $5<-20)print $1,$2,$10,$3,$4,$5,$10/8}' $focal | psmeca -R -JM -Sa1 -L3 -W0.1/0 -G0/110/255 -O -K >> $ps
awk '{if($5>160)print $1,$2,$10,$3,$4,$5,$10/8}' $focal | psmeca -R -JM -Sa1 -L3 -W0.1/0 -G225/225/0 -O -K >> $ps
awk '{if($5<-160)print $1,$2,$10,$3,$4,$5,$10/8}' $focal | psmeca -R -JM -Sa1 -L3 -W0.1/0 -G225/225/0 -O -K >> $ps
awk '{if($5>20 && $5<160)print $1,$2,$10,$3,$4,$5,$10/8}' $focal | psmeca -R -JM -Sa1 -L3 -W0.1/0 -G255/0/0 -O -K >> $ps
awk '{if($5>-20 && $5<20)print $1,$2,$10,$3,$4,$5,$10/8}' $focal | psmeca -R -JM -Sa1 -L3 -W0.1/0 -G225/225/0 -O -K >> $ps

set lin1ax = 122.5
set lin1ay = 12
set lin1bx = 124.93
set lin1by = 14.8

set lin2ax = 123
set lin2ay = 11.6
set lin2bx = 125.5
set lin2by = 14.4

set lin3ax = 123.5
set lin3ay = 11.2
set lin3bx = 126.07
set lin3by = 14

set lin4ax = 124
set lin4ay = 10.8
set lin4bx = 126.64
set lin4by = 13.6

psxy -R -JM -W10/0/225/0 -O -K <<!>> $ps
$lin1ax $lin1ay
$lin1bx $lin1by
!
psxy -R -JM -W10/0/225/0 -O -K <<!>> $ps
$lin2ax $lin2ay
$lin2bx $lin2by
!

psxy -R -JM -W10/0/225/0 -O -K <<!>> $ps
$lin3ax $lin3ay
$lin3bx $lin3by
!

psxy -R -JM -W10/0/225/0 -O -K <<!>> $ps
$lin4ax $lin4ay
$lin4bx $lin4by
!

echo 122.5  12   1 | psxy -N -R -JM -Sc -G0/255/0 -W0.1/0 -O -K >> $ps
echo 124.93 14.8 1 | psxy -N -R -JM -Sc -G0/255/0 -W0.1/0 -O -K >> $ps
echo 123    11.6 1 | psxy -N -R -JM -Sc -G0/255/0 -W0.1/0 -O -K >> $ps
echo 125.5  14.4 1 | psxy -N -R -JM -Sc -G0/255/0 -W0.1/0 -O -K >> $ps
echo 123.5  11.2 1 | psxy -N -R -JM -Sc -G0/255/0 -W0.1/0 -O -K >> $ps
echo 126.07 14   1 | psxy -N -R -JM -Sc -G0/255/0 -W0.1/0 -O -K >> $ps
echo 124    10.8 1 | psxy -N -R -JM -Sc -G0/255/0 -W0.1/0 -O -K >> $ps
echo 126.64 13.6 1 | psxy -N -R -JM -Sc -G0/255/0 -W0.1/0 -O -K >> $ps


pstext -R -J -N -N -G0 -K -O <<!>> $ps
122.5  12   16 0 2 6 A
124.93 14.8 16 0 2 6 A\'
123    11.6 16 0 2 6 B
125.5  14.4 16 0 2 6 B\'
123.5  11.2 16 0 2 6 C
126.07 14   16 0 2 6 C\'
124    10.8 16 0 2 6 D
126.64 13.6 16 0 2 6 D\'
!

#psxy -R -J -W5/0 -G255 -O -K <<!>> $ps
#121.05 13.4
#121.05 15.15
#122    15.15
#122    13.4
#121.05 13.4
#!
psxy -R -J -W5/0 -G255 -O -K <<!>> $ps
122.05 14
122.05 15.15
123.1  15.15
123.1  14
122.05 14
!


#pscoast -J -R -Ba1f0.5wens -Tf121.53/14.72/1/2 -Lf121.53/14.22/15/80 -Dh -W0/255 -#O -K >> $ps

echo 122.2 14.97 5 0 45 90 3  |  psmeca -R -N -JM -Sa1 -L3 -W0.1/0 -G255/0/0 -O -K >> $ps
echo 122.2 14.72 5 0 45 -90 3 |  psmeca -R -N -JM -Sa1 -L3 -W0.1/0 -G0/110/255 -O -K >> $ps
echo 122.2 14.47 5 0 90 0 3   |  psmeca -R -N -JM -Sa1 -L3 -W0.1/0 -G255/255/0 -O -K >> $ps
echo 122.2 14.22 0.7 | psxy -N -R -JM -St -G255 -W12/0 -O -K >> $ps

pstext -R -J -N -G0 -K -O <<!>> $ps
122.66 14.97 12 0 2 6   reverse fault  
122.65 14.72 12 0 2 6   normal fault   
122.68 14.47 12 0 2 6 strike-slip fault
122.68 14.27 12 0 2 6      Masbate     
122.68 14.17 12 0 2 6     City Hall    
!

echo 123.6212097 12.3716146 0.7| psxy -N -R -JM -St -G255 -W12/0 -O -K >> $ps

gmtset FRAME_WIDTH 0.01i
psbasemap -R121/121.9/13.3/15 -JM1.5i -Tf121.45/14.6/1/2 -Lf121.45/14.15/15/80 -X0.1 -Y11.9 -B6 -G255 -O -K >>$ps

psscale -D2/2/2.5/0.2h -Ba100f50:"@-Depth (km)@-": -C$cpt -O -K >>$ps




psxy -R -J -O <<!>> $ps
!
