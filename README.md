# illusReproducibility
An illustration of reproducibility

### Codes for main analyses
Generally, reproducibility was calculated using a leave-one-out strategy, to avoid sample overlap between testing dataset and the meta-analysis. 
* run_asy_meta_LeaveOneOut.R, for the confirmation analysis with a leave-one-out procedure
* calc_IR_plot_LeaveOneOut.ipynb, for the confirmation analysis with a leave-one-out procedure

The original analysis did not use the leave-one-out strategy given the large number of datasets. The results were indeed very similar. 
* run_asy_meta.R, for the original analysis, which did not use the leave-one-out approach. 
* calc_IR_plot.ipynb, for the original analysis, which did not use the leave-one-out approach. 

In R v3.6.0 and Python 3.7.4

