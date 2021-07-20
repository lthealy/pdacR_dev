# pdacR

Find our webtool live [here!](http://pdacR.bmi.stonybrook.edu)
## Building the package

To build the package locally, clone the repo using:

```
git clone https://github.com/rkawalerski/pdacR.git
```

Then install dependencies using `install.dependencies.R` in the `R` directory.
The package should then be able to be built using your favorite build method.

From command line, in the directory containing your cloned repo:
```
R CMD build pdacR
```
Or using the RStudio build pane as explained [here](https://support.rstudio.com/hc/en-us/articles/200486488-Developing-Packages-with-RStudio).

Parsed datasets can be found in the `data` directory, with corresponding raw data in `inst/extdata`

## Using the RShiny app

To host a local instance of the app, run `pdacR::pdacShiny()`

### Persistent Options

#### Filtering your dataset

Once you've selected a checkbox under "Filter samples by", options will appear beneath the "load new dataset" textbox in the bottom left of the screen. Checking a box in this list will remove all samples with that label from all analyses.

#### Picking your genes

To visualize gene expression, first select your gene sets of interest from the 'gene sets to use' column. You can manually add genes using the "User selected genes" text boxes to the right. You can input multiple genes separated by commas or spaces, and they will be treated as one "set". Be sure to click the correct "user selected genes" checkbox in "gene sets to use" to include your signature! These gene sets can be used heatmapping, visualizing correlations, performing dimensionality reduction, and coloring differential expression plots.

### Heatmapping and Clustering

After picking your dataset and genes of interest, click the "Select" button to generate the heatmap. You will see that all non-selected genesets disappear, and a heatmap is generated consisting of selected genes. Genes that belong to a particular gene set will be indicated with a black bar to the left of the heatmap. Once you have generated the heatmap, you can deselect certain sets by unchecking the relevant check box. Doing so will remove genes that are unique to that set from the heatmap. This is helpful if you want to look at only the overlap of two gene sets. 

### Cartesian

Here you will see two new options, "X Y Projection" and "How points should be colored". 

To generate a signature for coloration, use the "Expression Signature" dropdown menus on the right of the GUI. These will default to the user selected genes, but can be changed to any of our curated gene lists.

To alter categorical coloration by sample info, use the "X-axis label -or- Color" dropbox in the same region. Be careful picking something like "ID", as generating individual colors for each dot can cause issues!

### Survival

First, choose your method of analysis from the "Method" column on the left-most side of the GUI. Then, if your data has more than one survival metric, select which you will use from "Survival Factors."

To perform survival analysis, you will then use the right-most column labeled "Sample Tracks". You may check up to two boxes, and the GUI will separate your plots by how they intersect. If the factor you choose is numeric, a slider bar will appear in the top right of the GUI. Use this bar to quantile your data. Warning! Avoid extremes, as you will weaken your sample size.

To see the impact a gene or geneset has on survival, select them in the "Expression signature" dropdown menus and select the corresponding checkbox under "Sample Tracks."

### Differential Expression (DE)

To perform DE, you must pick 1 gene set and 1 "Sample Track". In the top right corner, radio buttons will appear so you may pick your comparison (multi-level comparisons will be provided in a future release). Our pre-provided data sets already select the appropriate method of DE analysis based on the mode of experimentation. You may select your own in "Experiment Type" before clicking the "Run Diff Expr" button. Dots colored red are members of the geneset you selected (multiple gene set coloration will be provided in a future release)

## Loading New Data

In order to load data into the package, the data sets must be part of an installed package on the user's R instance. Under "Data sets to use" in the left-most column, you will see a text entry box labeled "Add private data". Below, we detail how to appropriately format your data files for ease of loading

### GUI Data structure

The preferred format for data input is an object of class _list_ containing four named objects:
* $ex: Can be a _matrix_ or _data.frame_ with each column representing a sample and each row representing a gene
* $sampInfo: A _data.frame_ with each row corresponding to a sample (it is important that column _n_ in $ex and row _n_ in $sampInfo refer to the same sample!)
* $featInfo: A _data.frame_ with each row corresponding to a row in $ex (it is important that row _g_ in $ex and row _g_ in $featInfo refer to the same gene! The minimum required column is SYMBOL for gene names (eg: KRT17, TFF2)
* $metadata: A _list_ that tells the application about the status of the expression data. log.transformed is a boolean that tells the application if the data has already been transformed to prevent over normalization

Note: This structure is very similar to the `SummarizedExperiment` class. We have provided a helper function {`R/Convert_GUI_data.R`} to facilitate appropriate formatting. 
For examples, please refer to some of the included sample .RData objects in `data/`

### Package Formatting

Private data packages _**must have been built and installed**_ to their local instance before being uploaded to the GUI. **Loading a package will append all private data sets and private gene lists to selectable menus.** To do so, PackageName/data/ must contain _at least one_ of the following objects:
* data_set_list.RData: a _data.frame_ with columns _labels_ (how the data will appear) and _variablenames_ (the name of the saved .RData object as it would be loaded in memory). Each .RData object should match the format detailed above
* gene_set_list.RData: A _list_ of character vectors. The name of each entry in the list will be appended to our select gene sets column. **Note: These currently only integrate well as gene SYMBOL, if you use Entrez or ensembl IDs, they will not be comparable across our public data sets or in conjunction with our gene sets**
* Any .RData you'd like to load in, using the above _list_ format

## Contributions

We welcome community investigators to issue pull requests or open issues to help improve the functionality of this tool for PDAC data centralization and ease of use.
Inquiries can be sent to richard.moffitt @ stonybrookmedicine.edu

## More information
More information on pdacR and its Shiny app can be found here:

```
< Publication link here >
```

Analyses relevant to the paper are located in `inst/analysis`

## License

All source code in this repository, with extensions `.R` and `.Rmd`, is available under an MIT license. All are welcome to use and repurpose this code.

**The MIT License (MIT)**

Copyright (c) 2016 Richard A. Moffitt

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.