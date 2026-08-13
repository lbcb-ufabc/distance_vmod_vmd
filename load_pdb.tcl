set id [mol new step1_pdbreader.psf]

for {set mode 7} {$mode <= 16} {incr mode} {
    cd disp-along-mode$mode
        
    for {set i 0} {$i <= 80} {incr i} {
        set r_n -4.0
        set r_n [expr {$r_n + 1*($i/10.0)}]
        set r_n_formatado [format "%.1f" $r_n]
        mol addfile "mini_$r_n_formatado.pdb" waitfor all molid $id; 
    }
          
    cd ..
}
