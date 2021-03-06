#!/usr/bin/env csh

mkdir -p ./output

set ps = ./output/Plb_loc.ps
set cpt = dep.cpt
set eqlist1 = EHBlev1.list
set eqlist2 = EHBlev2.list
set eqlist3 = EHBlev3.list
#set grd = ETOPO1_Bed_g_gmt4.grd
set cpt2 = topo_plb.cpt
set grd = SeaTopo.grd
set sha = SeaTopoShad.grd

#grd2cpt $grd -Z -S-8000/8000/100 -Cocean > $cpt2

gmtset PAPER_MEDIA A2
gmtset FRAME_WIDTH 0.05i
psbasemap -JM9i -R120/126/11/16 -Ba1f0.5WSne -P -K -X1.2i -Y2i > $ps
grdimage $grd -Ctopo_w.cpt -JM -R -I$sha -K -O >> $ps
pscoast -JM -R -Ba1f0.5wens -Dh -G220 -W1.5 -O -K >> $ps
makecpt -Cseis -T0/200/2.5 > $cpt
psxy Fault.dat -R -JM -W5/0/0/255 -K -O -MX >> $ps
psxy trench_Tai_Phi.gmt -R -JM -W10/0/0/255 -K -O -MX >> $ps
psxy fsym.gmt -R -JM -W3/0/0/255 -G0/0/255 -L -V -K -O -MX >> $ps


#yr mon dy hr mn sec lon lat mag dep
#1   2   3  4  5  6   7   8   9  10

awk '{if($10<6 && $9<=200) print $7,$8,$9,$10/25}' $eqlist3 | psxy -R -JM -Sc -W0.1/0 -C$cpt -O -K >> $ps
awk '{if($10>=6 && $9<=200) print $7,$8,$9,$10/7}' $eqlist3 | psxy -R -JM -Sa -W0.1/0 -C$cpt -O -K >> $ps

awk '{if($10<6 && $9<=200) print $7,$8,$9,$10/25}' $eqlist2 | psxy -R -JM -Sc -W0.1/0 -C$cpt -O -K >> $ps
awk '{if($10>=6 && $9<=200) print $7,$8,$9,$10/7}' $eqlist2 | psxy -R -JM -Sa -W0.1/0 -C$cpt -O -K >> $ps

awk '{if($10<6 && $9<=200) print $7,$8,$9,$10/25}' $eqlist1 | psxy -R -JM -Sc -W0.1/0 -C$cpt -O -K >> $ps
awk '{if($10>=6 && $9<=200) print $7,$8,$9,$10/7}' $eqlist1 | psxy -R -JM -Sa -W0.1/0 -C$cpt -O -K >> $ps

gmtset HEADER_FONT_SIZE 15
pscoast -JM -R -Ba1f0.5wens -Tf125.5/15.5/1/2 -Lf125.5/15/2/40 -Dh -W1.5 -O -K >> $ps

echo 126.5 14   0.16 | psxy -N -R -JM -Sc -W0.1/0 -O -K >> $ps
echo 126.5 14.2 0.20 | psxy -N -R -JM -Sc -W0.1/0 -O -K >> $ps
echo 126.5 14.5 0.8571428    | psxy -N -R -JM -Sa -W0.1/0 -O -K >> $ps

pstext -R -J -N -G0 -K -O <<!>> $ps
126.9 14   12 0 2 6 M=4
126.9 14.2 12 0 2 6 M=5
126.9 14.5 12 0 2 6 M=6
!

psscale -C$cpt -D24.3/5/10/0.4 -S -Ba50f10:"depth": -I -O -K >> $ps
#psscale -C$cpt2 -D27.5/5/10/0.4 -S -Ba2000f1000:"elevation": -I -O -K >> $ps

psxy -R -J -O <<!>> $ps
!
