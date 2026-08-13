#!/bin/bash

rm dist_vmod_tetra.out dist_tetra_*.dat

vmd2 -dispdev text -e dist_vmod_tetra.tcl > dist_vmod_tetra.out

echo "frame distance mode" > dist_tetra_ab.dat
echo "frame distance mode" > dist_tetra_bd.dat
echo "frame distance mode" > dist_tetra_cd.dat
echo "frame distance mode" > dist_tetra_ca.dat
echo "frame distance mode" > dist_tetra_bc.dat
echo "frame distance mode" > dist_tetra_ad.dat

for mode in {7..30}; do

	cat dist_tetra_ab_$mode.dat >> dist_tetra_ab.dat
	cat dist_tetra_bd_$mode.dat >> dist_tetra_bd.dat
	cat dist_tetra_cd_$mode.dat >> dist_tetra_cd.dat
	cat dist_tetra_ca_$mode.dat >> dist_tetra_ca.dat
	cat dist_tetra_bc_$mode.dat >> dist_tetra_bc.dat
	cat dist_tetra_ad_$mode.dat >> dist_tetra_ad.dat

done

rm dist_tetra_ab_*.dat dist_tetra_bd_*.dat dist_tetra_cd_*.dat dist_tetra_ca_*.dat dist_tetra_bc_*.dat dist_tetra_ad_*.dat 
