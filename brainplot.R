# plot effect sizes and reproducibility in brain space.
library(ggseg)

plot_data_all = read.csv('./ggseg.obs.csv')

# Specify the column of interet, and color ranges below
plot_col = 'Thickness..Effect'
scale_min = 0
scale_max = 1

plot_data = data.frame(
  area = as.character(unlist(plot_data_all['area'])),
  hemi = gsub('lh','left',as.character(unlist(plot_data_all['hemi']))),
  effect = as.double(unlist(plot_data_all[plot_col])),
  stringsAsFactors = FALSE)

pscale_fill = scale_fill_gradient(low = "red", high = "yellow", name = 'viewer_legend', 
                                  limits = c(scale_min, scale_max))

ggseg(.data=plot_data,position = 'stacked',show.legend=F,
      atlas='dkt', hemi='left',
      mapping=aes(fill=effect)) + 
  pscale_fill + 
  theme_void() 


