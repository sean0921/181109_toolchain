set ps = ./output/profile.ps
set eqlist1 = EHBlev1.list
set eqlist2 = EHBlev2.list
set eqlist3 = EHBlev3.list
set cpt = dep.cpt

gmtset PAPER_MEDIA A1

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

awk '{print $7,$8,$9,$10}' $eqlist3 | project  -C$lin1ax/$lin1ay -E$lin1bx/$lin1by -Lw -W-50/50 -Fpz -Q  > tmp3
awk '{if($3<6)print $1,$2,$3/25}' tmp3 | psxy -Jx0.023i/-0.014i -Sc -R0/400/0/200 -W0.1/0 -G20/20/220 -Ba50f25:"distance (km)":/a20f10WnSe:"@-@depth (km)": -X2i -Y15i -K  > $ps
awk '{if($3>6) print $1,$2,$3}' tmp3 | psxy -Jx0.023i/-0.014i -Sa1 -R0/400/0/200 -W0.1/0 -G20/20/220 -B -X0i -Y0i -O -K  >> $ps

awk '{print $7,$8,$9,$10}' $eqlist2 | project  -C$lin1ax/$lin1ay -E$lin1bx/$lin1by -Lw -W-50/50 -Fpz -Q  > tmp2
awk '{if($3<6)print $1,$2,$3/25}' tmp2 | psxy -Jx0.023i/-0.014i -Sc -R0/400/0/200 -W0.1/0 -G20/220/20 -Ba50f25:"distance (km)":/a20f10WnSe:"@-@depth (km)": -X0i -Y0i -O -K  >> $ps
awk '{if($3>6) print $1,$2,$3}' tmp2 | psxy -Jx0.023i/-0.014i -Sa1 -R0/400/0/200 -W0.1/0 -G20/220/20 -B -X0i -Y0i -O -K  >> $ps

awk '{print $7,$8,$9,$10}' $eqlist1 | project  -C$lin1ax/$lin1ay -E$lin1bx/$lin1by -Lw -W-50/50 -Fpz -Q  > tmp1
awk '{if($3<6)print $1,$2,$3/25}' tmp1 | psxy -Jx0.023i/-0.014i -Sc -R0/400/0/200 -W0.1/0 -G220/20/20 -Ba50f25:"distance (km)":/a20f10WnSe:"@-@depth (km)": -X0i -Y0i -O -K  >> $ps
awk '{if($3>6) print $1,$2,$3}' tmp1 | psxy -Jx0.023i/-0.014i -Sa1 -R0/400/0/200 -W0.1/0 -G220/20/20 -B -X0i -Y0i -O -K  >> $ps

echo 123.6 12.3 -6 10| project  -C$lin1ax/$lin1ay -E$lin1bx/$lin1by -Lw -W-150/150 -Fpz -Q  > sta1
awk '{print $1,$2,$3}' sta1 | psxy -Jx0.023i/-0.014i -N -St0.7 -R0/400/0/200 -W8/0 -G255 -B -X0i -Y0i -O -K  >> $ps
pstext -R -J -N -G0 -K -O <<!>> $ps
0 -20 20 0 2 6 A
400 -20 20 0 2 6 A\'
!
#print arrow of Trench
echo 124.7 14.5 -28 90 1|project -C$lin2ax/$lin2ay -E$lin2bx/$lin2by -Lw -W-150/150 -Fpz -Q > fau1
awk '{print $1,$2,$3,$4}' fau1 | psxy -Jx0.023i/-0.014i -N -Sv -R0/400/0/200 -W2/0 -G255 -B -X0i -Y0i -O -K  >> $ps
pstext -R -J -N -G0 -K -O <<!>> $ps
370 -40 20 0 2 6 Trench
!
rm tmp*
rm sta*
rm fau*

##################################################################################

awk '{print $7,$8,$9,$10}' $eqlist3 | project  -C$lin2ax/$lin2ay -E$lin2bx/$lin2by -Lw -W-50/50 -Fpz -Q  > tmp3
awk '{if($3<6)print $1,$2,$3/25}' tmp3 | psxy -Jx0.023i/-0.014i -Sc -R0/400/0/200 -W0.1/0 -G20/20/220 -Ba50f25:"distance (km)":/a20f10WnSe:"@-@depth (km)": -X0i -Y-4i -O -K  >> $ps
awk '{if($3>=6) print $1,$2,$3}' tmp3 | psxy -Jx0.023i/-0.014i -Sa1 -R0/400/0/200 -W0.1/0 -G20/20/220 -B -X0i -Y0i -O -K  >> $ps

awk '{print $7,$8,$9,$10}' $eqlist2 | project  -C$lin2ax/$lin2ay -E$lin2bx/$lin2by -Lw -W-50/50 -Fpz -Q  > tmp2
awk '{if($3<6)print $1,$2,$3/25}' tmp2 | psxy -Jx0.023i/-0.014i -Sc -R0/400/0/200 -W0.1/0 -G20/220/20 -Ba50f25:"distance (km)":/a20f10WnSe:"@-@depth (km)": -X0i -Y0i -O -K  >> $ps
awk '{if($3>=6) print $1,$2,$3}' tmp2 | psxy -Jx0.023i/-0.014i -Sa1 -R0/400/0/200 -W0.1/0 -G20/220/20 -B -X0i -Y0i -O -K  >> $ps

awk '{print $7,$8,$9,$10}' $eqlist1 | project  -C$lin2ax/$lin2ay -E$lin2bx/$lin2by -Lw -W-50/50 -Fpz -Q  > tmp1
awk '{if($3<6)print $1,$2,$3/25}' tmp1 | psxy -Jx0.023i/-0.014i -Sc -R0/400/0/200 -W0.1/0 -G220/20/20 -Ba50f25:"distance (km)":/a20f10WnSe:"@-@depth (km)": -X0i -Y0i -O -K  >> $ps
awk '{if($3>=6) print $1,$2,$3}' tmp1 | psxy -Jx0.023i/-0.014i -Sa1 -R0/400/0/200 -W0.1/0 -G220/20/20 -B -X0i -Y0i -O -K  >> $ps

echo 123.6 12.3 -6 10| project -C$lin2ax/$lin2ay -E$lin2bx/$lin2by -Lw -W-150/150 -Fpz -Q > sta2
awk '{print $1,$2,$3}' sta2 | psxy -Jx0.023i/-0.014i -N -St0.7 -R0/400/0/200 -W8/0 -G255 -B -X0i -Y0i -O -K  >> $ps
pstext -R -J -N -G0 -K -O <<!>> $ps
0 -20 20 0 2 6 B
400 -20 20 0 2 6 B\'
!
#print arrow of Trench
echo 125.08 13.93 -28 90 1|project -C$lin2ax/$lin2ay -E$lin2bx/$lin2by -Lw -W-150/150 -Fpz -Q > fau2
awk '{print $1,$2,$3,$4}' fau2 | psxy -Jx0.023i/-0.014i -N -Sv -R0/400/0/200 -W2/0 -G255 -B -X0i -Y0i -O -K  >> $ps
pstext -R -J -N -G0 -K -O <<!>> $ps
345 -40 20 0 2 6 Trench
!
rm tmp*
rm sta*
rm fau*

##################################################################################
awk '{print $7,$8,$9,$10}' $eqlist3 | project  -C$lin3ax/$lin3ay -E$lin3bx/$lin3by -Lw -W-50/50 -Fpz -Q  > tmp3
awk '{if($3<6)print $1,$2,$3/25}' tmp3 | psxy -Jx0.023i/-0.014i -Sc -R0/400/0/200 -W0.1/0 -G20/20/220 -Ba50f25:"distance (km)":/a20f10WnSe:"@-@depth (km)": -X0i -Y-4i -O -K  >> $ps
awk '{if($3>=6) print $1,$2,$3}' tmp3 | psxy -Jx0.023i/-0.014i -Sa1 -R0/400/0/200 -W0.1/0 -G20/20/220 -B -X0i -Y0i -O -K  >> $ps

awk '{print $7,$8,$9,$10}' $eqlist2 | project  -C$lin3ax/$lin3ay -E$lin3bx/$lin3by -Lw -W-50/50 -Fpz -Q  > tmp2
awk '{if($3<6)print $1,$2,$3/25}' tmp2 | psxy -Jx0.023i/-0.014i -Sc -R0/400/0/200 -W0.1/0 -G20/220/20 -Ba50f25:"distance (km)":/a20f10WnSe:"@-@depth (km)": -X0i -Y0i -O -K  >> $ps
awk '{if($3>=6) print $1,$2,$3}' tmp2 | psxy -Jx0.023i/-0.014i -Sa1 -R0/400/0/200 -W0.1/0 -G20/220/20 -B -X0i -Y0i -O -K  >> $ps

awk '{print $7,$8,$9,$10}' $eqlist1 | project  -C$lin3ax/$lin3ay -E$lin3bx/$lin3by -Lw -W-50/50 -Fpz -Q  > tmp1
awk '{if($3<6)print $1,$2,$3/25}' tmp1 | psxy -Jx0.023i/-0.014i -Sc -R0/400/0/200 -W0.1/0 -G220/20/20 -Ba50f25:"distance (km)":/a20f10WnSe:"@-@depth (km)": -X0i -Y0i -O -K  >> $ps
awk '{if($3>=6) print $1,$2,$3}' tmp1 | psxy -Jx0.023i/-0.014i -Sa1 -R0/400/0/200 -W0.1/0 -G220/20/20 -B -X0i -Y0i -O -K  >> $ps


echo 123.6 12.3 -6 10| project -C$lin3ax/$lin3ay -E$lin3bx/$lin3by -Lw -W-150/150 -Fpz -Q > sta3
awk '{print $1,$2,$3}' sta3 | psxy -Jx0.023i/-0.014i -N -St0.7 -R0/400/0/200 -W8/0 -G255 -B -X0i -Y0i -O -K  >> $ps
pstext -R -J -N -G0 -K -O <<!>> $ps
0 -20 20 0 2 6 C
400 -20 20 0 2 6 C\'
!
#print arrow of Trench
echo 125.41 13.3 -28 90 1|project -C$lin3ax/$lin3ay -E$lin3bx/$lin3by -Lw -W-150/150 -Fpz -Q > fau3
awk '{print $1,$2,$3,$4}' fau3 | psxy -Jx0.023i/-0.014i -N -Sv -R0/400/0/200 -W2/0 -G255 -B -X0i -Y0i -O -K  >> $ps
pstext -R -J -N -G0 -K -O <<!>> $ps
315 -40 20 0 2 6 Trench
!
rm tmp*
rm sta*
rm fau*

echo 80  300 0.5 | psxy -N -R -J -Sc -W1/0 -G220/20/20 -O -K >> $ps
echo 180 300 0.5 | psxy -N -R -J -Sc -W1/0 -G20/220/20 -O -K >> $ps
echo 280 300 0.5 | psxy -N -R -J -Sc -W1/0 -G20/20/220 -O -K >> $ps
pstext -R -J -N -G0 -K -O <<!>> $ps
120  300 20 0 2 6 Level 1
220 300 20 0 2 6 Level 2
320 300 20 0 2 6 Level 3
!
#echo 126.5 14   0.16 | psxy -N -R -JM -Sc -W0.1/0 -O -K >> $ps

psxy -R -J -O <<!>> $ps
!
