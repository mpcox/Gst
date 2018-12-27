# G&prime;<sub>ST</sub>

The R code presented here calculates the G&prime;<sub>ST</sub> estimator used in:

Tumonggor MK, TM Karafet, B Hallmark, JS Lansing, H Sudoyo, MF Hammer and MP Cox. 2013. [The Indonesian archipelago: an ancient genetic highway linking Asia and the Pacific](https://doi.org/10.1038/jhg.2012.154). *Journal of Human Genetics* 58: 165-173.

Tumonggor MK, TM Karafet, S Downey, JS Lansing, P Norquest, H Sudoyo, MF Hammer and MP Cox. 2014. [Isolation, contact and social behavior shaped genetic diversity in West Timor](https://doi.org/10.1038/jhg.2014.62). *Journal of Human Genetics* 59: 494-503.

The G&prime;<sub>ST</sub> estimator was developed by:

Hedrick PW. 2005. [A standardized genetic differentiation measure](https://doi.org/10.1111/j.0014-3820.2005.tb01814.x). *Evolution* 59: 1633-1638.

Specifically, the code implements equation 4b in Hedrick (2005):

<img src="Hedrick_Equation4b.jpg" width="250"/>




The [example code](admixture_estimator.R), written in base R, shows an analysis of Asian-Papuan admixture in the Rindi population of Sumba in eastern Indonesia.

While a wide range of genetic data can be used with this code, it is primarily intended to be used with Ancestry Informative Markers (AIMs), which carry substantial information about genetic ancestry.  The basic data structures required by the code are vectors of markers, the number of alleles (not individuals) screened for each marker, and the marker allele frequency relative to the reference population (here, defined as the Asian variant):

|       | Marker 1 | Marker 2  | ... | Marker *n* |
| :--- | :---: | :---: | :---: | :---: |
| Marker | SNP1_chr2_3996214 | SNP2_chr7_152691894 | ... | SNP39_chr22_1984584 |
| Number of Genotypes | 20 | 20 | ... | 20 |
| Reference Allele Frequency | 0.85 | 0.85 | ... | 0.60 |

The same information is required for two proxy parental populations.  In the example code, Han Chinese and Papua New Guinea Highlanders are used as the proxy Asian and Papuan parental populations, respectively.

The code calculates the admixture estimator of Chakraborty *et al* (1992). However, the admixture estimates returned can be quite sensitive to the dataset, especially for small sample sizes. To place statistical bounds on this uncertainty, the code generates random allele frequency densities by pulling samples of observed size *n* from the observed frequency profile. These simulated densities are generated for both proxy parental populations and the admixed population, and Monte Carlo simulation is used to infer both the admixture proportion and estimated variance.

The code returns mean and median estimates of the admixture proportion (relative to the parental reference population), together with assymetric 95% confidence intervals.

> Note: This code was designed for small numbers of ancestry informative markers and will not scale well. For very large numbers of markers (e.g., from SNP genotyping arrays), alternative approaches might be preferable.
