#!/bin/bash
for i in {7..30}; do
  cd ./disp-along-mode$i
  mv mini_0.pdb mini_0.0.pdb
  mv mini_1.pdb mini_1.0.pdb
  mv mini_2.pdb mini_2.0.pdb
  mv mini_3.pdb mini_3.0.pdb
  mv mini_4.pdb mini_4.0.pdb
  mv mini_-1.pdb mini_-1.0.pdb
  mv mini_-2.pdb mini_-2.0.pdb
  mv mini_-3.pdb mini_-3.0.pdb
  mv mini_-4.pdb mini_-4.0.pdb
  cd ..
done
