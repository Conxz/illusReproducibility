# illusReproducibility
An illustration of reproducibility

[Preprint](https://www.biorxiv.org/content/10.1101/866301v1)
### Data and scripts for the main analyses
Generally, reproducibility was calculated using a leave-one-out strategy, to avoid sample overlap between testing dataset and the meta-analysis.
* ./run_asy_meta_LeaveOneOut.R, for the main with a leave-one-out procedure
* ./calc_IR_plot_LeaveOneOut.ipynb, for the mainanalysis with a leave-one-out procedure

All data used in this project are added in this repo now.
* ./doc/dataset_info.csv, information of each dataset	
* ./data, this folder includes all data files for the meta-analyses. The original datasets have been used in [Kong et al., 2018](https://doi.org/10.1073/pnas.1718418115), and are also available from the repo [neurohemi](https://github.com/Conxz/neurohemi).
* ./doc/sum_asy_meta.csv, the meta-analysis results with all datasets, also from [Kong et al., 2018](https://doi.org/10.1073/pnas.1718418115)
* ./meta, meta-analysis results with a leave-out-out strategy. (generated with run_asy_meta_LeaveOneOut.R)
* ./tmp

Data and R script for plotting brain maps used in the manuscript. 
* brainplot.R, R script for creating brain maps using ggseg
* ggseg.obs.csv, input file for the R script; asymmetry effects of surface area and thickness for each region

In R v3.6.0 and Python 3.7.4

### Old codes for the analysis with all datasets
The original analysis did not use the leave-one-out strategy. The results were indeed very similar, given the large number of datasets. 
* run_asy_meta.R, for the original analysis, which did not use the leave-one-out approach. 
* calc_IR_plot.ipynb, for the original analysis, which did not use the leave-one-out approach. 

### Reference
Kong, Xiang-Zhen, et al. "Mapping cortical brain asymmetry in 17,141 healthy individuals worldwide via the ENIGMA Consortium." Proceedings of the National Academy of Sciences 115.22 (2018): E5154-E5163.

