set n_mode 30
set mode 7

for {set mode 7} {$mode <= $n_mode} {incr mode} {
    cd disp-along-mode$mode
    set id [ mol new ../step1_pdbreader.psf ]

    set out_ab [open "../dist_tetra_ab_$mode.dat" w+]
    set out_bd [open "../dist_tetra_bd_$mode.dat" w+]
    set out_cd [open "../dist_tetra_cd_$mode.dat" w+]
    set out_ca [open "../dist_tetra_ca_$mode.dat" w+]
    set out_bc [open "../dist_tetra_bc_$mode.dat" w+]
    set out_ad [open "../dist_tetra_ad_$mode.dat" w+]
    
    set trp176_a [atomselect top "resid 176 and name CA and segname PROA"]
    set trp176_b [atomselect top "resid 176 and name CA and segname PROB"]
    set trp176_c [atomselect top "resid 176 and name CA and segname PROC"]
    set trp176_d [atomselect top "resid 176 and name CA and segname PROD"]
    
    set id_trp176_a [lindex [$trp176_a get index] 0]
    set id_trp176_b [lindex [$trp176_b get index] 0]
    set id_trp176_c [lindex [$trp176_c get index] 0]
    set id_trp176_d [lindex [$trp176_d get index] 0]

    for {set i 0} {$i < 40} {incr i} {
        set r_n -4.0
        set r_n [expr {$r_n + ($i/10.0)}]
        puts $i
    
        set rn_formatado [format "%.1f" $r_n]
        mol addfile "mini_$rn_formatado.pdb" waitfor all molid $id;
    
        set num_frames [molinfo $id get numframes]
    
        set ab [measure bond [list $id_trp176_a $id_trp176_b] frame $num_frames]
        puts $out_ab "$rn_formatado $ab $mode"     
        
        
        set bd [measure bond [list $id_trp176_b $id_trp176_d] frame $num_frames]
        puts $out_bd "$rn_formatado $bd $mode"
        
        
        set dc [measure bond [list $id_trp176_c $id_trp176_d] frame $num_frames]
        puts $out_cd "$rn_formatado $dc $mode"
        
        
        set ca [measure bond [list $id_trp176_c $id_trp176_a] frame $num_frames]
        puts $out_ca "$rn_formatado $ca $mode"
        
        
        set bc [measure bond [list $id_trp176_b $id_trp176_c] frame $num_frames]
        puts $out_bc "$rn_formatado $bc $mode"
        
        
        set ad [measure bond [list $id_trp176_a $id_trp176_d] frame $num_frames]
        puts $out_ad "$rn_formatado $ad $mode"
    }

    close $out_ab
    close $out_bd
    close $out_cd
    close $out_ca
    close $out_bc
    close $out_ad

    mol delete $id
    cd ..
}

quit
