#!/bin/bash

rm dist_vmod_tri.out dist_tri_*.dat

vmd2 -dispdev text -e dist_vmod_tri.tcl > dist_vmod_tri.out

echo "frame distance mode" > dist_tri_ab.dat
echo "frame distance mode" > dist_tri_ac.dat
echo "frame distance mode" > dist_tri_bc.dat

for mode in {7..30}; do

	cat dist_tri_ab_$mode.dat >> dist_tri_ab.dat
	cat dist_tri_ac_$mode.dat >> dist_tri_ac.dat
	cat dist_tri_bc_$mode.dat >> dist_tri_bc.dat

done

rm dist_tri_ab_*.dat dist_tri_ac_*.dat dist_tri_bc_*.dat
