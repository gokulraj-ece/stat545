.PHONY: all clean
.DELETE_ON_ERROR:
.SECONDARY:

all: hw_07-automating-data-analysis-pipeline.md hw_07-automating-data-analysis-pipeline.html

clean: 
				rm -f gapminder.tsv
				rm -f le_vs_year.png le_vs_year_lin_fit.png  gap_sort_conti_le.tsv
				rm -f asia_best_worst_countries.tsv americas_best_worst_countries.tsv africa_best_worst_countries.tsv europe_best_worst_countries.tsv
				rm -f asia_best_worst_le.png americas_best_worst_le.png africa_best_worst_le.png europe_best_worst_le.png
				rm -f hw_07-automating-data-analysis-pipeline.md hw_07-automating-data-analysis-pipeline.html

gapminder.tsv: 00_download-data.R
				Rscript $<

le_vs_year.png le_vs_year_lin_fit.png gap_sort_conti_le.tsv: 01_plot-reorder-sort.R gapminder.tsv
				Rscript $<

asia_best_worst_countries.tsv americas_best_worst_countries.tsv africa_best_worst_countries.tsv europe_best_worst_countries.tsv: 02_fit-lin-reg.R gap_sort_conti_le.tsv
				Rscript $<

asia_best_worst_le.png americas_best_worst_le.png africa_best_worst_le.png europe_best_worst_le.png: 03_generate-plot.R asia_best_worst_countries.tsv americas_best_worst_countries.tsv africa_best_worst_countries.tsv europe_best_worst_countries.tsv
				Rscript $<

hw_07-automating-data-analysis-pipeline.md: hw_07-automating-data-analysis-pipeline.rmd le_vs_year.png le_vs_year_lin_fit.png asia_best_worst_le.png americas_best_worst_le.png africa_best_worst_le.png europe_best_worst_le.png
				Rscript -e "knitr::knit('$<')"

hw_07-automating-data-analysis-pipeline.html: hw_07-automating-data-analysis-pipeline.rmd le_vs_year.png le_vs_year_lin_fit.png asia_best_worst_le.png americas_best_worst_le.png africa_best_worst_le.png europe_best_worst_le.png
				Rscript -e "rmarkdown::render('$<')"
				