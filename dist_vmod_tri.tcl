set n_mode 30
set mode 7

for {set mode 7} {$mode <= $n_mode} {incr mode} {
    cd disp-along-mode$mode
    set id [ mol new ../step1_pdbreader.psf ]

    set out_ab [open "../dist_tri_ab_$mode.dat" w+]
    set out_ac [open "../dist_tri_ac_$mode.dat" w+]
    set out_bc [open "../dist_tri_bc_$mode.dat" w+]

    set trp177_a [atomselect top "resid 177 and name CA and segname PROA"]
    set trp177_b [atomselect top "resid 177 and name CA and segname PROB"]
    set trp177_c [atomselect top "resid 177 and name CA and segname PROC"]
    
    set id_trp177_a [lindex [$trp177_a get index] 0]
    set id_trp177_b [lindex [$trp177_b get index] 0]
    set id_trp177_c [lindex [$trp177_c get index] 0]

    for {set i 0} {$i < 40} {incr i} {
        set r_n -4.0
        set r_n [expr {$r_n + ($i/10.0)}]
        puts $i
    
        set rn_formatado [format "%.1f" $r_n]
        mol addfile "mini_$rn_formatado.pdb" waitfor all molid $id;
    
        set num_frames [molinfo $id get numframes]
    
        set ab [measure bond [list $id_trp177_a $id_trp177_b] frame $num_frames]
        puts $out_ab "$rn_formatado $ab $mode"     
        
        
        set ac [measure bond [list $id_trp177_a $id_trp177_c] frame $num_frames]
        puts $out_ac "$rn_formatado $ac $mode"
        
        
        set bc [measure bond [list $id_trp177_b $id_trp177_c] frame $num_frames]
        puts $out_bc "$rn_formatado $bc $mode"

    }

    close $out_ab
    close $out_ac
    close $out_bc

    mol delete $id
    cd ..
}

quit
