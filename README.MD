## Welcome to my Computer Architecture Page
---
### ASSEMBLY 

Contains assembly level (MIPS-32 and X86) code for various algorithms such as : 
- Inplace iterative mergesort (O(nlogn))
- Matrix multiplication
- Extended Euclids Division Algorithm

To run MIPS files install *spim* and run
```
spim -f <name_of_assembly file>
```
---
### DRAM_CACHE

Contains architecture level simulations on a simulator called **Champsim**</br>
The following are instructions to run the simulator</br>
* Navigate to the `/champsim/Champsim` folder, and run:
```
./build_champsim.sh [branch_pred] [l1i_pref] [l1d_pref] [l2c_pref] [llc_pref] [llc_repl] [num_core]
```
Here, the options are for the L1I, L1D, L2, LLC prefetchers and the LLC replacement policy and the number of cores. To use the default set them as `no`. Else, use the specific name of the prefetcher/policy you need. Here is an example of a basic command: 
```
./build_champsim.sh bimodal no no no no lru 1
```
* Now, we need to run the `run_champsim.sh` file:
```
./run_champsim.sh [BINARY] [N_WARM] [N_SIM] [TRACE] [OPTION]
```
  * The binary is inside the bin folder, just provide the name of the binary(don't give the absolute path) 
  * N_WARM and N_SIM are in units of 10M 
  * The trace __should be__ inside the traces folder, just provide the name of the trace(don't give the absolute path) 
  * Look at `run_champsim.sh` to tweak and make your own changes

I have made a best offset prefetcher at the L2C cache level based on INRIA's [paper](https://hal.inria.fr/hal-01165600/document)</br>
I have also implemented cache replacement policies such as **least frequently used**, **least recently used**, **first in first out** and **random eviction**. </br>

---
## VHDL_SIMULATION

Contains VHDL simulations of various gates, multiplexers, flip flops and the more interesting **run length encoder** that encodes data and compresses it at the michroarchitectural level
