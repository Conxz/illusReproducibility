library(stringr)
library(metafor)
options(stringsAsFactors = FALSE)
par(mar=c(4,4,1,2))

setwd('G:/OwnCloud/DataShare/IntrinsicReproducibility/Paper/PNAS/R1/additional_analysis/')
data_dir = 'G:/OwnCloud/DataShare/IntrinsicReproducibility/out/'
dataset_info_file = 'P:/workspaces/lg-ENIGMA-Lateralization/CorticalAsymmetry/IntrinsicReproducibility/doc/dataset_info.csv'

out_dir = './out/'
sumout_dir = './meta/'


area_list = c("bankssts","caudalanteriorcingulate","caudalmiddlefrontal","_cuneus", "entorhinal", 
              "fusiform","inferiorparietal", "inferiortemporal","isthmuscingulate", "lateraloccipital",
              "lateralorbitofrontal","lingual", "medialorbitofrontal","middletemporal", "parahippocampal",
              "paracentral","parsopercularis","parsorbitalis", "parstriangularis", "pericalcarine",
              "postcentral", "posteriorcingulate", "precentral", "precuneus", "rostralanteriorcingulate",
              "rostralmiddlefrontal", "superiorfrontal", "superiorparietal", "superiortemporal", 
              "supramarginal", "frontalpole", "temporalpole", "transversetemporal", "insula")

csv_file_list = c('Asy_L_SurfArea_asy.csv', 'Asy_L_Thickness_asy.csv', 
                  paste(area_list, '_asy_thick.csv', sep=''),
                  paste(area_list, '_asy_area.csv', sep=''))
#csv_file_list = c('Asy_L_SurfArea_asy.csv', 'Asy_L_Thickness_asy.csv') # for new plots

dataset_info = read.csv(dataset_info_file)
for (dataset_index in 1:length(dataset_info$Dataset)){
  dataset = dataset_info$Dataset[dataset_index]
  for (i in 1:length(csv_file_list)){
    csv_file = paste(data_dir, csv_file_list[i], sep='/')
    print(csv_file)
    csv_dat = read.csv(csv_file) # re-read data each time, so the line below is working.
    csv_dat = csv_dat[csv_dat$Dataset!=dataset,]
    
    res = rma(yi=yi, vi=vi, data = csv_dat) # run the meta analysis with random effect modelling. 
    res_stats = c(csv_file_list[i], res$k, res$tau2, res$se.tau2, res$I2, res$H2, res$k.eff, res$QE, res$QEp, res$b[1], res$se, res$zval, res$pval, res$ci.lb, res$ci.ub)
    if (i==1){
      all_res_stats = res_stats
    }else{
      all_res_stats = rbind(all_res_stats, res_stats)
    }
    
    svg_file = str_replace(paste(out_dir, csv_file_list[i], sep='/'), '.csv', paste('_forest_excl_',dataset,'.svg', sep=''))
    svg(svg_file, width = 8, height = 12)
    position_y = sum(!is.na(csv_dat$yi))+2
    
    forest(res, xlim=c(-2.5, 2.5), slab = 1:dim(csv_dat)[1]) # for new plots
    
    text(-2.5, position_y, "Dataset", pos=4, cex=0.6)
    text( 2.5, position_y, "Observed SMD [95% CI]", pos=2, cex=0.6)
    dev.off()
  }
  
  all_res_stats = as.data.frame(all_res_stats)
  colnames(all_res_stats) = c('Region', 'DOF', 'Tau2', 'Tau2SE', 'I2', 'H2', 'Qdf', 'Q', 'Qp','estimate','se','zval','pval','ci.lb','ci.ub')
  csv_file = paste(sumout_dir, paste('sum_asy_meta_excl_', dataset,'.csv',sep=''), sep='/')
  write.csv(all_res_stats, file = csv_file, row.names = FALSE)
  print(paste('csv file saved for',csv_file))
}



