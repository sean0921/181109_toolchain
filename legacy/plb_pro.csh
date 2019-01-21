#!/usr/bin/env csh

set ps = ./output/Plb_pro.ps
set cpt = dep.cpt
set eqlist1 = EHBlev1.list
set eqlist2 = EHBlev2.list
set eqlist3 = EHBlev3.list
set grd1 = ETOPO1_Bed_g_gmt4.grd
set cpt2 = topo_plb.cpt
set grd = SeaTopo.grd
set sha = SeaTopoShad.grd

grd2cpt $grd -Z -S-8000/8000/100 -Cocean > $cpt2

gmtset PAPER_MEDIA A1
gmtset FRAME_WIDTH 0.05i
psbasemap -JM9i -R120/126/11/16 -Ba1f0.5WSne -P -K -X1.2i -Y2i > $ps
grdimage $grd1 -JM -R -C$cpt2 -O -K >> $ps
grdimage $grd -Ctopo_w.cpt -JM -R -I$sha -K -O >> $ps
pscoast -JM -R -Ba1f0.5wens -Dh -G180 -W1.5 -O -K >> $ps
makecpt -Cseis -T0/200/2.5 > $cpt
#-Lf125.4/15.8/15.7/100 
psxy Fault.dat -R -JM -W5/0/0/255 -K -O -MX >> $ps
psxy trench_Tai_Phi.gmt -R -JM -W10/0/0/255 -K -O -MX >> $ps
psxy fsym.gmt -R -JM -W3/0/0/255 -G0/0/255 -L -V -K -O -MX >> $ps

#yr mon dy hr mn sec lon lat mag dep
#1   2   3  4  5  6   7   8   9  10

awk '{if($10<6 && $9<=200) print $7,$8,$9,$10/25}' $eqlist3 | psxy -R -JM -Sc -W0.1/0 -C$cpt -O -K >> $ps
awk '{if($10>=6 && $9<=200) print $7,$8,$9,$10/7}' $eqlist3 | psxy -R -JM -Sa -W2/0 -C$cpt -O -K >> $ps
awk '{if($10<6 && $9<=200) print $7,$8,$9,$10/25}' $eqlist2 | psxy -R -JM -Sc -W0.1/0 -C$cpt -O -K >> $ps
awk '{if($10>=6 && $9<=200) print $7,$8,$9,$10/7}' $eqlist2 | psxy -R -JM -Sa -W2/0 -C$cpt -O -K >> $ps
awk '{if($10<6 && $9<=200) print $7,$8,$9,$10/25}' $eqlist1 | psxy -R -JM -Sc -W0.1/0 -C$cpt -O -K >> $ps
awk '{if($10>=6 && $9<=200) print $7,$8,$9,$10/7}' $eqlist1 | psxy -R -JM -Sa -W2/0 -C$cpt -O -K >> $ps

echo 126.5 14.6 0.2  | psxy -N -R -JM -Sc -W4/0 -O -K >> $ps
echo 126.5 14.8 0.25 | psxy -N -R -JM -Sc -W4/0 -O -K >> $ps
echo 126.5 15.1 0.8571428| psxy -N -R -JM -Sa -W4/0 -O -K >> $ps
echo 126.5 14.2 0.7  | psxy -N -R -JM -St -W8/0 -O -K >> $ps
#echo 126.5 16 -90 0.2| psxy -N -R -JM -Sv -W2/0 -O -K >>$ps


pstext -R -J -N -G0 -K -O <<!>> $ps
126.9 14.6 12 0 2 6 M=4
126.9 14.8 12 0 2 6 M=5
126.9 15.1 12 0 2 6 M=6
126.9 14.35 12 0 2 6 Masbate
126.9 14.2 12 0 2 6 City Hall
!

gmtset HEADER_FONT_SIZE 15
pscoast -JM -R -Ba1f0.5wens -Tf125.5/15.5/1/2 -Lf125.5/15/2/40 -Dh -W1.5 -O -K >> $ps
psscale -C$cpt -D24.3/5/10/0.4 -S -Ba50f10:"focal depth (km)": -I -O -K >> $ps
#psscale -C$cpt2 -D27.5/5/10/0.4 -S -I-8000/0 -Ba2000f1000:"elevation": -I -O -K >>$ps

set lin1ax = 122.5
set lin1ay = 12
set lin1bx = 124.93
set lin1by = 14.8

set lin2ax = 123
set lin2ay = 11.6
set lin2bx = 125.5
set lin2by = 14.4

set lin3ax = 123.6
set lin3ay = 11.1
set lin3bx = 126
set lin3by = 14

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

echo 122.5  12   1 | psxy -N -R -JM -Sc -G0/255/0 -W0.1/0 -O -K >> $ps
echo 124.93 14.8 1 | psxy -N -R -JM -Sc -G0/255/0 -W0.1/0 -O -K >> $ps
echo 123    11.6 1 | psxy -N -R -JM -Sc -G0/255/0 -W0.1/0 -O -K >> $ps
echo 125.5  14.4 1 | psxy -N -R -JM -Sc -G0/255/0 -W0.1/0 -O -K >> $ps
echo 123.6  11.1 1 | psxy -N -R -JM -Sc -G0/255/0 -W0.1/0 -O -K >> $ps
echo 126    14   1 | psxy -N -R -JM -Sc -G0/255/0 -W0.1/0 -O -K >> $ps
echo 123.6212097 12.3716146 0.7| psxy -N -R -JM -St -G255 -W8/0 -O -K >> $ps


pstext -R -J -N -N -G0 -K -O <<!>> $ps
122.5  12   16 0 2 6 A
124.93 14.8 16 0 2 6 A\'
123    11.6 16 0 2 6 B
125.5  14.4 16 0 2 6 B\'
123.6  11.1 16 0 2 6 C
126    14   16 0 2 6 C\'
!

#lon lat dep mag123.1 12.7 -6 10
#dis     dep mag124.1 11.7 -6 10


psxy -R -J -O <<!>> $ps
!
