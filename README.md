# illusReproducibility
An illustration of reproducibility

### Data and scripts for the main analyses
Generally, reproducibility was calculated using a leave-one-out strategy, to avoid sample overlap between testing dataset and the meta-analysis. 
* run_asy_meta_LeaveOneOut.R, for the confirmation analysis with a leave-one-out procedure
* calc_IR_plot_LeaveOneOut.ipynb, for the confirmation analysis with a leave-one-out procedure

All data used in this project are added in this 
LICENSE				data				run_asy_meta.R
README.md			doc				run_asy_meta_LeaveOneOut.R
brainplot.R			ggseg.obs.csv			tmp
calc_IR_plot.ipynb		meta
calc_IR_plot_LeaveOneOut.ipynb	orig_meta_plus_rr.csv

Data and R script for plotting brain maps used in the manuscript. 
* brainplot.R, R script for creating brain maps using ggseg
* ggseg.obs.csv, input file for the R script; asymmetry effects of surface area and thickness for each region

### Codes for the analysis with all datasets
The original analysis did not use the leave-one-out strategy. The results were indeed very similar, given the large number of datasets. 
* run_asy_meta.R, for the original analysis, which did not use the leave-one-out approach. 
* calc_IR_plot.ipynb, for the original analysis, which did not use the leave-one-out approach. 

In R v3.6.0 and Python 3.7.4

