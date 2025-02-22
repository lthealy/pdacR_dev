% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/heatmap.3.R
\name{heatmap.3}
\alias{heatmap.3}
\title{Better heatmap functionality
Obtained from :
https://github.com/obigriffith/biostar-tutorials/blob/master/Heatmaps/heatmap.3.R}
\usage{
heatmap.3(
  x,
  Rowv = TRUE,
  Colv = if (symm) "Rowv" else TRUE,
  distfun = dist,
  hclustfun = hclust,
  dendrogram = c("both", "row", "column", "none"),
  symm = FALSE,
  scale = c("none", "row", "column"),
  na.rm = TRUE,
  revC = identical(Colv, "Rowv"),
  add.expr,
  breaks,
  symbreaks = max(x < 0, na.rm = TRUE) || scale != "none",
  col = "heat.colors",
  colsep,
  rowsep,
  sepcolor = "white",
  sepwidth = c(0.05, 0.05),
  cellnote,
  notecex = 1,
  notecol = "cyan",
  na.color = par("bg"),
  trace = c("none", "column", "row", "both"),
  tracecol = "cyan",
  hline = median(breaks),
  vline = median(breaks),
  linecol = tracecol,
  margins = c(5, 5),
  ColSideColors,
  RowSideColors,
  side.height.fraction = 0.3,
  cexRow = 0.2 + 1/log10(nr),
  cexCol = 0.2 + 1/log10(nc),
  labRow = NULL,
  labCol = NULL,
  key = TRUE,
  keysize = 1.5,
  density.info = c("none", "histogram", "density"),
  denscol = tracecol,
  symkey = max(x < 0, na.rm = TRUE) || symbreaks,
  densadj = 0.25,
  main = NULL,
  xlab = NULL,
  ylab = NULL,
  lmat = NULL,
  lhei = NULL,
  lwid = NULL,
  ColSideColorsSize = 1,
  RowSideColorsSize = 1,
  KeyValueName = "Value",
  ...
)
}
\description{
Better heatmap functionality
Obtained from :
https://github.com/obigriffith/biostar-tutorials/blob/master/Heatmaps/heatmap.3.R
}
