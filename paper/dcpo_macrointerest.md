---
output: 
  bookdown::pdf_document2:
    fig_caption: yes
    keep_tex: yes
    keep_md: yes
    toc: no
    number_sections: yes
    latex_engine: xelatex
    pandoc_args: --lua-filter=multibib.lua
title: Macrointerest Across Countries
date: "November 09, 2024"
editor_options: 
  markdown: 
    wrap: sentence
  chunk_output_type: console
tables: true # enable longtable and booktabs
citation_package: natbib
citeproc: false
fontsize: 12pt
indent: true
linestretch: 1.5 # double spacing using linestretch 1.5
bibliography:
  text: dcpo-macrointerest.bib
  app: dcpo-macrointerest-app.bib
biblio-style: apsr
citecolor: black
linkcolor: black
endnote: no
header-includes:
      - \usepackage{array}
      - \usepackage{caption}
      - \usepackage{float}
      - \usepackage{placeins}
      - \usepackage{graphicx}
      - \usepackage{siunitx}
      - \usepackage{colortbl}
      - \usepackage{xcolor}
      - \usepackage{multirow}
      - \usepackage{hhline}
      - \usepackage{calc}
      - \usepackage{tabularx}
      - \usepackage{threeparttable}
      - \usepackage{wrapfig}
      - \usepackage{fullpage}
      - \usepackage{lscape} #\usepackage{lscape} better for printing, page displayed vertically, content in landscape mode, \usepackage{pdflscape} better for screen, page displayed horizontally, content in landscape mode
      - \newcommand{\blandscape}{\begin{landscape}}
      - \newcommand{\elandscape}{\end{landscape}}
      - \usepackage{titlesec}
      - \titleformat*{\section}{\normalsize\bfseries}
      - \titleformat*{\subsection}{\normalsize\itshape}
      - \usepackage{titling} #use \maketitle repeatedly  
      - \renewcommand{\topfraction}{.85} # Adjust LaTeX placement rules per
      - \renewcommand{\textfraction}{.15}
      - \renewcommand{\floatpagefraction}{.66}
      - \setcounter{topnumber}{3}
      - \setcounter{bottomnumber}{3}
      - \setcounter{totalnumber}{4}
      - \renewcommand{\bottomfraction}{.80} # https://bookdown.org/yihui/rmarkdown-cookbook/figure-placement.html
      - \usepackage{tabularray}
      - \usepackage{siunitx}
---

\pagenumbering{gobble}

# Authors {.unnumbered}

Yue Hu, ORCID: <https://orcid.org/0000-0002-2829-3971>, Associate Professor, Department of Political Science, Tsinghua University, [yuehu\@tsinghua.edu.cn](mailto:yuehu@tsinghua.edu.cn){.email}

\vspace{1cm}

\noindent Frederick Solt, ORCID: <https://orcid.org/0000-0002-3154-6132>, Associate Professor, Department of Political Science, University of Iowa, [frederick-solt\@uiowa.edu](mailto:frederick-solt@uiowa.edu){.email}

\pagebreak

```{=tex}
\renewcommand{\baselinestretch}{1}
\selectfont
\maketitle
\renewcommand{\baselinestretch}{1.5}
\selectfont
```

```{=tex}
\begin{abstract}
The extent to which the public takes an interest in politics has long been argued to be foundational to democracy, but the want of appropriate data has prevented cross-national and longitudinal analysis. This letter takes advantage of recent advances in latent-variable modeling of aggregate survey responses and a comprehensive collection of survey data to generate dynamic comparative estimates of macrointerest, that is, aggregate political interest, for over a hundred countries over the past four decades. These macrointerest scores are validated with other aggregate measures of political interest and of other types of political engagement. A cross-national and longitudinal analysis of macrointerest in advanced democracies reveals that along with election campaigns and inclusive institutions, it is good economic conditions, not bad times, that spur publics to greater interest in politics. 
\end{abstract}
```
\pagebreak

\pagenumbering{arabic}









The public's interest in politics has long been argued to be fundamental to democracy, the foundation for the widespread civic engagement needed to hold elected officials accountable to citizen demands [see, e.g., @Almond1963]. 
<!-- Recent research highlights the substantial influence of political interests in shaping how people process political information, develop attitudes, and respond to political inquiries [@MillerEtAl2023].  -->
More than just boosting engagement, political interest critically determines the quality of political decisions and behaviors, influencing factors like time spent, information collection and utilization, and critical assessment of partisan claims [see, e.g., @LaneEtAl2022].
In light of the growing threats to democracy seen in many countries, measuring the levels and trends of aggregate political interest---macrointerest---and understanding their sources is therefore crucially important [see, e.g., @Foa2016, 10-11]. 

A recent contribution, @Peterson2022, measures macrointerest over time in the United States, but similar data allowing for large-scale cross-sectional time-series assessments have as yet been unavailable.
Although many surveys ask respondents across countries how interested they are in politics, differences in question wording and in response categories have limited scholars' ability to pool the data together, and even in the absence of these issues, in most countries the questions have not been asked sufficiently frequently to provide annual time series.

This letter takes advantage of recent advances in latent-variable modeling of cross-national aggregate survey responses and a comprehensive collection of survey data to generate dynamic comparative estimates of aggregate political interest for over a hundred countries over the past four decades.
It shows that these cross-national macrointerest scores perform well in validation tests.
Finally, as a demonstration of their utility, the letter presents a new test of theories on the circumstances that induce the publics of advanced democracies to take more interest in politics.
The results support arguments that, in these countries, election campaigns, inclusive institutions, and good economic conditions, not bad times, spur greater political interest.






# Cross-National Macrointerest: The Source Data {.unnumbered}

National and cross-national surveys have asked questions on political interest often over the past four decades, but the resulting data are both sparse, that is, unavailable for many countries and years, and incomparable, generated by many different survey items.
In all, 54 such survey items were asked in no fewer than five country-years in countries surveyed at least twice; these items were drawn from 396 different survey datasets (see online Appendix\nobreakspace{}\@ref(surveys)).

Together, the survey items in the source data were asked in 127 different countries in at least three time points over the 41 years from 1982 to 2023, yielding a total of 2,738 country-year-item observations.
Observations for every year in each country surveyed would number 5,207, and a complete set of country-year-items would encompass 281,178 observations.
Compared to this hypothetical complete set of country-year-items, the available data are very, very sparse.
More optimistically, there are 1,821 country-years in which there is at least _some_ information about the public's interest in politics, that is, some 57% of the 3,220 country-years spanned by these data.
Still, the multitude of different survey items makes these data incomparable and difficult to use together.

![(\#fig:itemcountry)Countries and Years with the Most Observations in the Source Data](dcpo_macrointerest_files/figure-latex/itemcountry-1.pdf) 

In the top left panel of Figure\nobreakspace{}\@ref(fig:itemcountry), the twelve countries with the most country-year-item observations are displayed.
Germany, with 122 observations, is the best represented country in these source data, followed by the United Kingdom, Spain, the United States, and the Netherlands.
At the other end of the scale, there are seven countries---Azerbaijan, Cambodia, Kosovo, Kyrgyzstan, Liberia, Myanmar (Burma), and Puerto Rico---that have only the bare minimum three observations needed to be included in the source dataset at all.
In the top right panel are the dozen countries with the most observed years; this group is similar to that on the left, but with Ireland and Greece adding to the list and Finland and Sweden dropping off.
The bottom panel shows the number of countries observed in each year.
Coverage across countries reached its apex in 2008, when respondents in 89 countries were asked at least one item about their interest in politics.
The next section describes how this sparse and incomparable survey data was used together with a latent variable model to generate complete time series of macrointerest scores that are comparable across countries.


# Estimating Cross-National Macrointerest {.unnumbered}

Several recent studies have developed latent variable models of aggregate survey responses based on cross-national survey data [see @Claassen2019; @Caughey2019; @McGann2019; @Kolczynska2020].
To estimate the public's interest in politics across countries and over time, this work employs the latest of these methods that is appropriate for data that are both incomparable and sparse, the Dynamic Comparative Public Opinion (DCPO) model elaborated in @Solt2020c.
@Solt2020c demonstrates that the DCPO model provides a better fit to survey data than the models put forward by @Claassen2019 or @Caughey2019.
The @McGann2019 model depends on dense survey data unlike the sparse data on interest in politics described in the preceding section.
@Kolczynska2020 is the very most recent of these five works and builds on each of the others, but the MRP approach developed in that piece is suitable not only when the available survey data are dense but also when ancillary data on population characteristics are available, so it is similarly inappropriate to this application.
The dyad ratio algorithm employed in @Peterson2022, of course, leverages only over time variation within a single country and not variation across countries, making it a poor choice for generating cross-national estimates [see @Caughey2019, p. 686].^[
Appendix\nobreakspace{}\@ref(peterson) compares our estimates for the United States with the estimates presented in @Peterson2022.]
The DCPO model is a population-level two-parameter ordinal logistic item response theory model with country-specific item-bias terms.
For a comprehensive description of the DCPO model, see Appendix\nobreakspace{}\@ref(dcpo) and @Solt2020c [, 3-8]; the focus here is on how it deals with the two principal issues raised by the source data, incomparability and sparsity.

The DCPO model accounts for incomparability using three sets of parameters.
First, it incorporates the _difficulty_ of each question's responses, that is, how much interest in politics is indicated by a given response. 
This is most evident with respect to response categories: to say that one is "very interested" in politics, for example, is to exhibit more interest than to say that one is "somewhat interested" or "not very interested."
Here, difficulty is permitted to vary with question wording and the survey project as well.
Second, the DCPO model accounts for each question's _dispersion_, its noisiness with regard to our latent trait.
The lower the dispersion, the better that changes in responses to the question map onto changes in macrointerest.
Third, to provide for the possibility that translation issues or cultural differences result in the same question being interpreted differently in different countries, the model estimates _country-specific bias_ parameters that shift the difficulty of all responses for a particular question in a particular country.
Together, the model's difficulty, dispersion, and country-specific bias parameters work to generate comparable estimates of the latent variable of macrointerest from the available but incomparable source data.^[
For how other data issues, such as sample representation, may affect the estimated outcome, see Appendix\nobreakspace{}\@ref(dcpo).]

To address sparsity in the source data---unpolled or thinly surveyed years in each country---DCPO uses simple local-level dynamic linear models, i.e., random-walk priors, for each country.
That is, within each country, each year's value of macrointerest is modeled as the previous year's estimate plus a random shock.
These dynamic models smooth the estimates of macrointerest over time and allow estimation even in years for which little or no survey data is available, albeit at the expense of greater measurement uncertainty.









The model was estimated using the `DCPOtools` package for R [@Solt2019], running four chains for 1,000 iterations each and discarding the first half as warmup, leaving 2,000 samples.
The $\hat{R}$ diagnostic had a maximum value of 1.01, indicating that the model converged. <!-- macrointerest Rhat confirmed -->
The dispersion parameters of the survey items indicate that all of them load well on the latent variable (see Appendix\nobreakspace{}\@ref(surveys)).
The result is estimates, in all 3,220 country-years spanned by the source data, of the mean political interest of the public, that is, macrointerest.


# Validating Cross-National Macrointerest {.unnumbered}

That we can generate estimates of macrointerest does not automatically mean that they are suitable for analysis. 
As is the case for any new measure, validation tests of cross-national latent variables are crucially important [see, e.g., @Hu2023].
Figures\nobreakspace{}\@ref(fig:internalval)\nobreakspace{} and\nobreakspace{}\@ref(fig:extval1) provide evidence of this measure's validity with tests of convergent validation and construct validation.
Convergent validation refers to tests of whether a measure is empirically associated with alternative indicators of the same concept [@Adcock2001, 540].
In Figure\nobreakspace{}\@ref(fig:internalval), the macrointerest scores are compared to responses to individual source-data survey items that were used to generate them; this provides an 'internal' convergent validation test [for an example in a similar context, see @Caughey2019, p. 686].



![(\#fig:internalval)Internal Convergent Validation: Correlations Between Macrointerest and Individual Source-Data Survey Items](dcpo_macrointerest_files/figure-latex/internalval-1.pdf) 





![(\#fig:extval1)Construct Validation: Correlations Between Macrointerest and Other Aspects of Political Engagement](dcpo_macrointerest_files/figure-latex/extval1-1.pdf) 

On the left, macrointerest scores are plotted against the percentage of respondents across all country-years who offered the two most interested responses on the European Social Survey's four-point item, "How interested are you in politics?"
The middle panel shows responses to the question with the most data-rich cross-section, "How interested would you say you personally are in politics?" in the ISSP's 2004 Citizenship module.
Finally, the right panel evaluates how well the macrointerest scores capture change over time by focusing on the item with the largest number of observations for a single country in the source data, which asked respondents to Germany's ALLBUS, "How interested in politics are you?"
In all three cases, the correlations, estimated taking into account the uncertainty in the measures, are strong.

Construct validation refers to demonstrating, for some _other_ concept believed causally related to the concept a measure seeks to represent, that the measure is empirically associated with measures of that other concept [@Adcock2001, 542].
Figure\nobreakspace{}\@ref(fig:extval1) depicts the relationships between macrointerest and three survey items from the WVS and EVS on other aspects of political engagement that are expected to have causal relationships with political interest [see @Kittilson2010, 995]: in the left panel, following political news on television, radio, and newspapers; in the center panel, discussing politics with friends; and on the right, feeling politics is important to one's life.
These relationships are all positive and are moderate to strong.
This cross-national latent variable of macrointerest performs well in validation tests.


# Testing Theories of Macrointerest Cross-Nationally {.unnumbered}
The best developed theories of macrointerest concern the advanced democracies, and even among these relatively similar countries, macrointerest varies greatly.
Figure\nobreakspace{}\@ref(fig:ts) examines levels and trends in macrointerest in advanced democratic countries by displaying the changes of the public's expressed interest in politics over time in the thirty-seven democracies of the OECD (Appendix \@ref(trajectory) presents these macrointerest data for all available countries).
While macrointerest scores approach and often exceed .6 in countries such as Denmark and Canada, in Chile they scarcely cross .25.
And although the public's political interest has held fairly steady over decades in many countries, in Czechia it dropped nearly half of the variable's entire theoretical range over the 1990s and 2000s before rebounding slightly since 2010, and increases of roughly a quarter of that range can be seen in, among others, Germany. 
There are considerable differences in the extent to which the public professes interest in politics both across countries and over time.

![(\#fig:ts)Macrointerest Scores Over Time Within OECD Democracies \label{ts}](dcpo_macrointerest_files/figure-latex/ts-1.pdf) 

What accounts for these differences?
The literature offers a range of arguments for how the political context may influence the public's interest in politics.
Perhaps the most straightforward is that publics grow more interested in politics at election time.
Campaigns and elections attract media coverage and increase the information available to the public on the issues being contested, leading to increased interest in politics [see, e.g., @Larsen2022].
Macrointerest within a country should be expected to be higher, therefore, in years in which national elections take place than in years without elections.

A second argument is that political institutions that share power, rather than concentrate it, yield politics that are more interesting and engaging.
Building on @Lijphart1999 and @Powell2000, @Kittilson2010 [, 992] argues that power-sharing institutions---parliamentarism, federalism, and proportional electoral rules---"send signals of inclusiveness to citizens, generating greater political engagement" while power-concentrating institutions "may generate perceptions of exclusion and deter involvement."
Macrointerest should be higher in countries with parliamentary and federal systems than in those without those features, and it should decline as the disproportionality between votes cast and seats won increases.

A third claim deals with the public's demand for accountability.
@Peterson2022 [, 203] argues "when there is information that something has gone wrong\ldots then voters should be more likely to attend to the actions of elected officials," but when "there is evidence of success\ldots voters should not waste their energies."
If democracy is a principal-agent problem with elected officials acting as self-interested agents and the public as their lazy but vengeful principal, then macrointerest should rise when times are bad and decline as conditions improve.

A final set of theories---each well established---contradicts the third.
Modernization theory holds that the public's interest will increase as the national economy grows and household incomes expand [see, e.g., @Inglehart2005].
Unemployment has long been argued to not to motivate but to depress political interest [see, e.g., @Rosenstone1982, 26].
And the relative power theory holds that greater income inequality, by increasingly concentrating political power in the hands of the wealthy, allows them greater power to shape the political agenda in ways that discourage the broader public from taking interest [see, e.g., @Solt2008].
In each of these circumstances, macrointerest is argued to increase in good, not bad, economic conditions [see also @Stimson2015; @Peterson2022, 206].

Data to test these hypotheses are drawn from several sources.
The Democratic Electoral Systems (DES) dataset updated in @Bormann2022 provides information about the timing of elections, yielding a dichotomous variable coded one in election years and zero when no election was held.
The three institutional variables are measured as in @Kittilson2010.
Data on parliamentarism, a dichotomous variable coded one in pure parliamentary systems and zero otherwise, is sourced from the DES.
Federalism is likewise dichotomous, coded one in countries with strong federal systems [see @Lijphart1999] and zero in all others.
Proportionality in the electoral system is measured using the Gallagher least-squares index of disproportionality, which measures the disparity between parties' vote shares and their seat shares [@Gallagher1991, 40-41; @Gallagher2023].
The context of good and bad economic conditions was measured with data on GDP per capita, national GDP growth, and unemployment from OECD.Stat [@OECD2023] and on the Gini index of disposable income inequality from the Standardized World Income Inequality Database [@Solt2020].















The resulting dataset comprises the thirty-seven OECD democracies, each observed in twenty-one (Mexico) to forty (Ireland, Italy, the United Kingdom, and the United States) consecutive years (mean: 33.7 years, median: 33 years).
Even among these relatively data-rich countries, our measure of macrointerest provides much more data than would otherwise be available: the richest single survey for these cases, the European Social Survey, covers only 18% of these country-years, does not provide annual data, and of course excludes entirely the nine OECD members in the Americas and around the Pacific Rim (see Appendix\nobreakspace{}\@ref(ESScomparison)).

@Shor2007 demonstrates that such pooled time series are best analyzed using a Bayesian multilevel model including varying intercepts for each country and each year. 
The former help account for heteroskedasticity across space due to, e.g., omitted variable bias, while permitting the inclusion of time-invariant predictors such as parliamentarism and federalism.
The latter take into account 'time shocks' that operate on all countries simultaneously [@Shor2007, 171-172].
Further, the 'within-between random effects' specification is employed, meaning each of the time-varying predictors is decomposed into its time-invariant country mean and the difference between each country-year value and this country mean; this specification is superior to fixed effects and other commonly used TSCS specifications for addressing omitted variable bias and endogeneity [@Bell2015].
The time-varying difference variables capture the short-term effects of the predictors, while the time-invariant country-mean variables reflect their---often different---long-run, "historical" effects [@Bell2015, 137].
Moreover, as we employ a Bayesian analysis, it is straightforward to incorporate the measurement uncertainty in the data for both macrointerest and income inequality directly into the model, with the estimated values of these variables treated as random draws from distributions with unknown true means but known standard deviations [@McElreath2016, 425-431; see also @Kurz2023, 15.1.2].
The model was estimated using the `brms` R package [@Burkner2017].

![(\#fig:resplot)Predicting Macrointerest in OECD Democracies \label{model}](dcpo_macrointerest_files/figure-latex/resplot-1.pdf) 


Figure\nobreakspace{}\@ref(fig:resplot) displays the results.^[
Appendix\nobreakspace{}\@ref(resultstable) provides a tabular version.]
Consistent with the argument that campaigns bring attention-grabbing information to the public, macrointerest in election years is found to be 0.8 points (95% credible interval: 0.2 to 1.4 points) higher than in years without elections.
This accords with previous research finding small but well-estimated increases in political interest in election years [see, e.g., @Larsen2022].

The hypothesis that power-sharing institutions yield more public interest in politics is also supported.
Macrointerest is estimated to be 5.9 (95% c.i.: 3.6 to 8.2) points higher in countries with parliamentary systems.
The point estimate for the difference in macrointerest between countries with and without federalism is estimated be 6.6 points, with 95.8% of the posterior distribution greater than zero.
And although disproportionality is not estimated to have long-run effects that consistently distinguish countries with more or less proportional electoral results, _changes_ in disproportionality appear to have an immediate negative effect: a two-standard-deviation increase in the Gallagher index yields 0.7 points less macrointerest (95% c.i.: -1.4 to -0.1).

Regarding the debate on whether macrointerest is invigorated or instead discouraged by bad times, the evidence of our cross-national analysis of the impact of economic conditions falls on the side of the latter.
Supporting modernization theory, increases in per capita GDP have a positive short-term effect on aggregate political interest, with a two-standard-deviation increase associated with 1.3 (95% c.i.: 0.2 to 2.4) points more macrointerest.
The point estimate for the long-term, historical effect as evidenced by differences in mean levels across countries is found to be 4.9 points, albeit with only 90.6% of the posterior distribution greater than zero.
As predicted by relative power theory, the long-term effects of income inequality are strongly negative, with a two-standard-deviation difference across countries associated with 6.4 points less macrointerest (95% c.i.: -12.6 to -0.6 points).
Year-to-year changes in income inequality are found to make little difference---it would seem that, from one perspective, the influence of the wealthy over the political agenda does not change on such a short time scale, and from the other, that the public does not react to worsening conditions in the distribution of income with greater interest in its agents' actions.
The results with regard to growth in the national economy and with regard to unemployment similarly do not provide strong evidence of either negative or positive effects.
Still, taken as a whole, this evidence indicates that at least with regard to economic conditions, it is good times, not bad ones, that yield more macrointerest.


# Conclusions {.unnumbered}

Macrointerest, despite its theoretical importance, has as yet drawn only limited empirical attention.
This oversight largely reflects the paucity of available data to measure this important concept.
The cross-national macrointerest dataset presented here addresses this issue, providing annual time series across more than a hundred countries and allowing more and better tests of the wide range of theories that implicate the public's interest in politics.
For example, while the cross-sectional analysis in @Kittilson2010 [, 997-999] finds that, among the three inclusive institutions it considered, only the disproportionality of electoral results influenced political interest and engagement, the pooled time-series analysis presented here indicates parliamentarism, federalism, and proportionality all yield greater macrointerest as that work theorizes.
And although the single-country study in @Peterson2022 [, 219] concludes that bad times prompt increased macrointerest, this evidence shows the opposite, that at least with regard to economy it is _good_ conditions that lead the public to take interest in politics.
By drawing on information about _both_ differences across countries _and_ change over time, it appears these data on cross-national macrointerest provide a firmer basis for drawing sound conclusions.
The cross-national macrointerest dataset is available on the Harvard Dataverse for use in the further investigation of these and other theories on the causes and consequences of aggregate political interest as well as its relationships with other aspects of political engagement.


\pagebreak

# References {.unnumbered}

::: {#refs-text}
:::

\pagebreak

# (APPENDIX) Supplementary material {-} 

```{=tex}
\renewcommand{\baselinestretch}{1}
\selectfont
\maketitle
\selectfont
```
```{=tex}
\pagenumbering{arabic}
\renewcommand*{\thepage}{A\arabic{page}}
```
```{=tex}
\setcounter{figure}{0}
\renewcommand*{\thefigure}{A\arabic{figure}}
```
```{=tex}
\setcounter{table}{0}
\renewcommand*{\thetable}{A\arabic{table}}
```
```{=tex}
\vspace{-.5in}
\begin{center}
\begin{Large}
Supplementary material
\end{Large}
\end{center}
```



# Survey Items Used to Estimate Macrointerest {#surveys}

National and cross-national surveys have often included questions tapping interest in politics over the past four decades, but the resulting data are both sparse, that is, unavailable for many countries and years, and incomparable, generated by many different survey items.
In all, we identified 54 such survey items that were asked in no fewer than five country-years in countries surveyed at least twice; these items were drawn from 396 different survey datasets.
These items are listed in Table \@ref(tab:itemsTb) below, along with the dispersion ($\alpha$) and difficulty ($\beta$) scores estimated for each from the DCPO model.
Lower values of dispersion indicate questions that better identify publics with a higher level of trust from those with lower. 
Items have one less difficulty score than the number of response categories. 

In accordance with the advice offered by @Hu2022 to avoid data-entry errors by automating data collection, the `DCPOtools` R package [@Solt2019] was used to compile the responses to these questions.
The current version of the software facilitates the entire practical data generation process: from facilitating the acquisition of original survey datasets and converting them into R standard format for quicker loading; through standardizing country names, identifying survey years, and extracting the desired survey items; to restructuring the resulting data for analysis with the DCPO model. 
The primary objective is to limit manual interventions, thereby maximizing reproducibility and reducing the error potential inherent in human-operated data preparation tasks.
The survey dataset codes listed in Table \@ref(tab:itemsTb) correspond to those used in that package; Table \@ref(tab:surveyInfo) lists the codes of each individual survey with the citation of each dataset.

Together, the survey items in the source data were asked in 127 different countries in at least two time points over 41 years, from 1982 to 2023, yielding a total of 2,738 country-year-item observations.^[
A few surveys---`ees1989`, `issp1990`, and `evs_combo`---include Northern Ireland but do not provide a sampling weight to include those respondents in the United Kingdom as a whole. 
For clarity, we removed them from the estimation. 
The estimated trends and conclusions do not change by including or excluding the small amount of data on Northern Ireland.]
The number of items observed in the source data for each country-year is plotted in Figures\nobreakspace{}\@ref(fig:obs)\nobreakspace{}and\nobreakspace{}\@ref(fig:obs2) below.
The macrointerest scores of country-years with more observed items are likely to be estimated more precisely.
The estimates for country-years with fewer (or no) observed items rely more heavily (or entirely) on the random-walk prior and are therefore less certain.



\begingroup\fontsize{7}{9}\selectfont

\begin{longtable}[t]{>{\raggedright\arraybackslash}p{7em}>{\raggedright\arraybackslash}p{4em}>{\raggedright\arraybackslash}p{13em}>{\raggedright\arraybackslash}p{16em}>{\raggedright\arraybackslash}p{4em}>{\raggedright\arraybackslash}p{8em}>{\raggedright\arraybackslash}p{8em}}
\caption{(\#tab:itemsTb)Survey Items Used to Estimate Macrointerest}\\
\toprule
Survey
Item
Code & Country-Years & Question Text & Response Categories & Dispersion & Difficulties & Survey Dataset Codes*\\
\midrule
\endfirsthead
\caption[]{(\#tab:itemsTb)Survey Items Used to Estimate Macrointerest \textit{(continued)}}\\
\toprule
Survey
Item
Code & Country-Years & Question Text & Response Categories & Dispersion & Difficulties & Survey Dataset Codes*\\
\midrule
\endhead

\endfoot
\bottomrule
\multicolumn{7}{l}{\rule{0pt}{1em}\textsuperscript{*} Survey dataset codes correspond to those used in the DCPOtools R package (Solt, Hu, and Tai 2019).}\\
\endlastfoot
\cellcolor{gray!10}{int4\textbackslash{}\_wvs} & \cellcolor{gray!10}{282} & \cellcolor{gray!10}{How interested would you say you are in politics?} & \cellcolor{gray!10}{1 Very interested / 2 Somewhat interested  / 3 Not very interested  / 4 Not at all interested} & \cellcolor{gray!10}{0.70} & \cellcolor{gray!10}{-0.57, 0.83, 2.64} & \cellcolor{gray!10}{wvs}\\
int4\textbackslash{}\_lb & 263 & How interested are you in politics? & 1 Very interested / 2 Fairly interested  / 3 A little interested  / 4 Not at all interested & 1.02 & -0.75, 1.15, 3.13 & lb\\
\cellcolor{gray!10}{int4\textbackslash{}\_ess} & \cellcolor{gray!10}{256} & \cellcolor{gray!10}{How interested  are you in politics?} & \cellcolor{gray!10}{1 Very interested / 2 Quite interested / 3 Hardly interested / 4 Not at all interested} & \cellcolor{gray!10}{0.63} & \cellcolor{gray!10}{-0.39, 1.00, 2.62} & \cellcolor{gray!10}{ess, ress}\\
int4\textbackslash{}\_amb & 190 & How interested are you in politics? & 1 A lot / 2 Some / 3 Little / 4 None & 1.09 & -1.04, 0.96, 2.95 & amb\\
\cellcolor{gray!10}{eu4\textbackslash{}\_eb} & \cellcolor{gray!10}{168} & \cellcolor{gray!10}{Would you say that you are very interested, fairly interested, not very interested or not at all interested in European affairs?} & \cellcolor{gray!10}{1 Very interested / 2 Fairly interested / 3 Not very interested / 4 Not at all interested} & \cellcolor{gray!10}{0.70} & \cellcolor{gray!10}{-0.81, 0.76, 2.85} & \cellcolor{gray!10}{eb}\\
int4\textbackslash{}\_evs & 130 & How interested would you say you are in politics? & 1 Very interested  / 2  Somewhat interested  / 3  Not very interested  / 4  Not at all interested & 0.99 & -0.76, 0.93, 3.18 & evs\\
\cellcolor{gray!10}{int3\textbackslash{}\_eb} & \cellcolor{gray!10}{126} & \cellcolor{gray!10}{Let us talk about those issues in the news which interest you. For each issue I read out, tell me if you are very interested, moderately interested or not at all interested in it. Politics} & \cellcolor{gray!10}{1 Very interesting / 2 Moderately interesting / 3 Not at all interesting} & \cellcolor{gray!10}{0.81} & \cellcolor{gray!10}{-0.36, 1.98} & \cellcolor{gray!10}{eb}\\
int4\textbackslash{}\_ees & 116 & To what extent would you say you are interested in politics? & 1 A great deal / 2 To some extent / 3 Not much / 4 Not at all & 0.45 & -0.41, 0.78, 2.10 & ees\\
\cellcolor{gray!10}{int4\textbackslash{}\_issp} & \cellcolor{gray!10}{106} & \cellcolor{gray!10}{How interested would you say you personally are in politics?} & \cellcolor{gray!10}{1 Very interested  / 2  Fairly interested  / 3 Not very interested  / 4 Not at all interested} & \cellcolor{gray!10}{0.62} & \cellcolor{gray!10}{-0.54, 0.90, 2.63} & \cellcolor{gray!10}{issp}\\
int5\textbackslash{}\_issp & 101 & How interested would you say you personally are in politics? & 1 Very interested  / 2  Fairly interested  / 3  Somewhat interested / 4 Not very interested  / 5 Not at all interested & 0.70 & -0.89, 0.35, 1.61, 3.02 & issp\\
\cellcolor{gray!10}{int4\textbackslash{}\_afrob} & \cellcolor{gray!10}{100} & \cellcolor{gray!10}{How interested are you in politics and government?} & \cellcolor{gray!10}{1 Very interested / 2 Somewhat interested / 3 Now and then / 4 Not interested} & \cellcolor{gray!10}{0.58} & \cellcolor{gray!10}{-0.84, 0.35, 1.98} & \cellcolor{gray!10}{afrob}\\
int4\textbackslash{}\_eb & 74 & To what extent would you say you are interested in politics? & 1 A great deal / 2 To some extent / 3 Not much / 4 Not at all & 0.76 & -0.61, 0.94, 2.74 & eb\\
\cellcolor{gray!10}{int4\textbackslash{}\_asianb} & \cellcolor{gray!10}{63} & \cellcolor{gray!10}{How interested would you say you are in politics?} & \cellcolor{gray!10}{1 Not at all interested / 2 A little interested / 3 Somewhat interested / 4 Very interested} & \cellcolor{gray!10}{0.76} & \cellcolor{gray!10}{-0.57, 0.96, 2.93} & \cellcolor{gray!10}{asianb, sasianb}\\
int2\textbackslash{}\_eb & 59 & What sort of things in life interest you a lot? I am going to show you a list of things. which of these really interest you? Politics in [country] & 1 Mentioned / 2 Not mentioned & 1.32 & 2.46 & eb\\
\cellcolor{gray!10}{int2c\textbackslash{}\_eb} & \cellcolor{gray!10}{52} & \cellcolor{gray!10}{For each of the following propositions, please tell me if it rather corresponds or rather does not correspond to your attitude or your opinion. You are very interested in politics} & \cellcolor{gray!10}{1 Yes, rather / 2 No, rather does not} & \cellcolor{gray!10}{1.36} & \cellcolor{gray!10}{1.05} & \cellcolor{gray!10}{eb, feb}\\
int4\textbackslash{}\_cnep & 49 & Would you say that you are very, somewhat, not very or not at all interested in politics? & 0 Not at all interested / 1 Not very interested / 2 Somewhat interested / 3 Very interested & 0.59 & -0.61, 0.77, 2.38 & cnep\\
\cellcolor{gray!10}{int4\textbackslash{}\_arabb} & \cellcolor{gray!10}{35} & \cellcolor{gray!10}{Generally speaking, how interested would you say you are in politics?} & \cellcolor{gray!10}{1 Very interested / 2 Interested / 3 Little interested / 4 Not interested} & \cellcolor{gray!10}{0.58} & \cellcolor{gray!10}{-0.06, 1.29, 2.75} & \cellcolor{gray!10}{arabb}\\
int4\textbackslash{}\_neb & 31 & How interested are you in politics? & 1 Very interested / 2 Somewhat interested  / 3 Not very interested  / 4 Not at all interested & 1.03 & -0.57, 1.24, 3.60 & neb\\
\cellcolor{gray!10}{int5\textbackslash{}\_bsa} & \cellcolor{gray!10}{30} & \cellcolor{gray!10}{How much interest do you have in politics?} & \cellcolor{gray!10}{1 A great deal / 2 Quite a lot / 3 Some / 4 Not very much / 5 Not at all} & \cellcolor{gray!10}{1.21} & \cellcolor{gray!10}{-1.93, -0.02, 1.87, 3.88} & \cellcolor{gray!10}{bsa}\\
dom4\textbackslash{}\_eb & 29 & Would you say that you are very interested, fairly interested, not very interested or not at all interested in domestic affairs? & 1 Very interested / 2 Fairly interested / 3 Not very interested / 4 Not at all interested & 0.47 & -0.93, 0.25, 1.80 & eb\\
\cellcolor{gray!10}{int2a\textbackslash{}\_eb} & \cellcolor{gray!10}{28} & \cellcolor{gray!10}{Please tell me if you are fairly interested or not in each of the following topics? Politics} & \cellcolor{gray!10}{1 Interested / 2 Not interested} & \cellcolor{gray!10}{0.92} & \cellcolor{gray!10}{0.88} & \cellcolor{gray!10}{cceb, eb}\\
int4a\textbackslash{}\_eb & 28 & To what extent do the following topics interest you? Would you say you are very interested, fairly interested, not very interested or not at all interested in ...? Politics and economics in & 1 Very interested / 2 Fairly interested / 3 Not very interested / 4 Not at all interested & 0.82 & -1.36, 0.27, 2.19 & cceb, eb\\
\cellcolor{gray!10}{int2b\textbackslash{}\_eb} & \cellcolor{gray!10}{27} & \cellcolor{gray!10}{In which of the following news related issues are you most interested in...? Politics} & \cellcolor{gray!10}{0 Not mentioned / 1 Mentioned} & \cellcolor{gray!10}{0.90} & \cellcolor{gray!10}{1.37} & \cellcolor{gray!10}{eb}\\
eu4a\textbackslash{}\_eb & 27 & Some people follow what's going on in European Union politics, whether there's an election going on or not. Others aren't that interested. Would you say you follow what's going on in European Union politics: & 1 Most of the time / 2 From time to time / 3 Rarely / 4 Never or almost never & 1.21 & -1.86, 0.07, 2.71 & eb\\
\cellcolor{gray!10}{int5\textbackslash{}\_polit} & \cellcolor{gray!10}{26} & \cellcolor{gray!10}{How interested are you in politics?} & \cellcolor{gray!10}{1 Very strong / 2 Strong / 3 Somewhat / 4 Hardly / 5 Not at all} & \cellcolor{gray!10}{1.26} & \cellcolor{gray!10}{-2.65, -1.07, 1.63, 4.06} & \cellcolor{gray!10}{politbarometer}\\
int4b\textbackslash{}\_eb & 25 & For each of the following statements, please tell me if it applies to you often, sometimes, rarely or never. I am interested in what is going on in politics & 1 Often / 2 Sometimes / 3 Rarely / 4 Never & 0.64 & -0.88, 0.17, 1.36 & eb\\
\cellcolor{gray!10}{int4\textbackslash{}\_uspew} & \cellcolor{gray!10}{24} & \cellcolor{gray!10}{Some people seem to follow what's going on in government and public affairs most of the time, whether there's an election or not. Others aren't that interested. Would you say you follow what's going on in government and public affairs} & \cellcolor{gray!10}{1 Most of the time / 2 Some of the time / 3 Only now and then / 4 Hardly at all} & \cellcolor{gray!10}{0.84} & \cellcolor{gray!10}{-1.56, -0.25, 1.28} & \cellcolor{gray!10}{uspew}\\
int4a\textbackslash{}\_arabb & 23 & Generally speaking, how interested would you say you are in politics? & 1 Very interested / 2 Interested / 3 Uninterested / 4 Very uninterested & 1.12 & 0.26, 2.01, 3.97 & arabb\\
\cellcolor{gray!10}{int5\textbackslash{}\_allbus} & \cellcolor{gray!10}{20} & \cellcolor{gray!10}{How interested in politics are you?} & \cellcolor{gray!10}{1 Very strongly / 2 Strongly / 3 Middling / 4 Very little / 5 Not at all} & \cellcolor{gray!10}{1.10} & \cellcolor{gray!10}{-1.74, -0.01, 2.21, 3.90} & \cellcolor{gray!10}{allbus}\\
int4a\textbackslash{}\_ases & 18 & How interested are you in politics? & 1 Very interested / 2 Fairly interested / 3 Not very interested / 4 Not at all interested & 0.50 & -0.70, 0.66, 1.67 & ases\\
\cellcolor{gray!10}{int3a\textbackslash{}\_eb} & \cellcolor{gray!10}{16} & \cellcolor{gray!10}{In everyday life, we have to deal with many different problems and situations, where we feel more or less interested and confident. I am going to read you a number of statements. I am interested in what is going on in politics} & \cellcolor{gray!10}{1 Most of the time / 2 Some of the time / 3 Hardly any of the time} & \cellcolor{gray!10}{0.75} & \cellcolor{gray!10}{0.02, 1.53} & \cellcolor{gray!10}{eb}\\
int3\textbackslash{}\_afrob & 16 & How interested are you in public affairs? & 0 Not interested / 1 Somewhat interested / 2 Very interested & 0.72 & -0.80, 1.59 & afrob\\
\cellcolor{gray!10}{int5\textbackslash{}\_fsdeva} & \cellcolor{gray!10}{15} & \cellcolor{gray!10}{I am interested in politics and follow it actively} & \cellcolor{gray!10}{1 Strongly agree / 2 Agree to some extent / 3 Difficult to say / 4 Disagree to some extent / 5 Strongly disagree} & \cellcolor{gray!10}{0.69} & \cellcolor{gray!10}{-0.38, 0.67, 0.99, 2.32} & \cellcolor{gray!10}{fsdeva}\\
int4\textbackslash{}\_aes & 15 & How much interest do you usually have in what's going on in politics? & 1 A good deal / 2 Some / 3 Not much / 4 None & 0.76 & -1.63, 0.05, 1.91 & aes, nsss\\
\cellcolor{gray!10}{int4\textbackslash{}\_anes} & \cellcolor{gray!10}{13} & \cellcolor{gray!10}{Some people seem to follow} & \cellcolor{gray!10}{1 Hardly at all / 2 Now and then / 3 Some of the time / 4 Most of the time} & \cellcolor{gray!10}{0.97} & \cellcolor{gray!10}{-1.03, 0.54, 2.40} & \cellcolor{gray!10}{anes}\\
int4\textbackslash{}\_cid & 12 & In general, how interested are you in politics? & 1 Very interested / 2  Fairly interested / 3 Not very interested / 4 Not at all interested & 0.54 & -0.18, 1.09, 2.42 & cid\\
\cellcolor{gray!10}{int5\textbackslash{}\_icenes} & \cellcolor{gray!10}{12} & \cellcolor{gray!10}{Do you consider your interest in politics…} & \cellcolor{gray!10}{1 Very great / 2 Great / 3 Some / 4 Little / 5 None} & \cellcolor{gray!10}{0.80} & \cellcolor{gray!10}{-1.47, 0.32, 2.17, 3.54} & \cellcolor{gray!10}{icenes}\\
int4\textbackslash{}\_cces & 10 & Some people seem to follow what's going on in government and public affairs most of the time, whether there's an election going on or not. Others aren't that interested. Would you say you follow what's going on in government and public affairs most of the time, some of the time, only now and then, or hardly at all? & 1 Most of the time / 2 Some of the time / 3 Only now and then / 4 Hardly any of the time & 1.00 & -1.89, -0.54, 1.09 & cces\\
\cellcolor{gray!10}{int4\textbackslash{}\_itanes} & \cellcolor{gray!10}{10} & \cellcolor{gray!10}{How interested  are you in politics?} & \cellcolor{gray!10}{1 Very much / 2 Somewhat / 3 A little / 4 Not at all} & \cellcolor{gray!10}{0.08} & \cellcolor{gray!10}{-0.16, 0.72, 1.76} & \cellcolor{gray!10}{itanes}\\
int5\textbackslash{}\_pgss & 10 & How interested would you say you personally are in politics? & 1 Extremely interested / 2 Very much interested / 3 Fairly interested / 4 A little interested / 5 Not at all interested & 0.79 & -0.93, 0.37, 2.31, 3.65 & pgss\\
\cellcolor{gray!10}{int4\textbackslash{}\_nes} & \cellcolor{gray!10}{9} & \cellcolor{gray!10}{How interested are you in politics?} & \cellcolor{gray!10}{1 Very interested / 2 Fairly interested / 3 Not very interested / 4 Not at all interested} & \cellcolor{gray!10}{0.51} & \cellcolor{gray!10}{-0.49, 0.88, 2.59} & \cellcolor{gray!10}{anes, autnes, bes, ptvs}\\
int4\textbackslash{}\_dkes & 9 & How interested are you in politics? & 1 Very / 2 Somewhat / 3 Only a little / 4 Not at all & 0.56 & -0.58, 1.01, 2.44 & dkes\\
\cellcolor{gray!10}{int4\textbackslash{}\_snes} & \cellcolor{gray!10}{9} & \cellcolor{gray!10}{How interested would you say you personally are in politics?} & \cellcolor{gray!10}{1 Very interested / 2 Fairly interested / 3 Not very interested / 4 Not at all interested} & \cellcolor{gray!10}{0.73} & \cellcolor{gray!10}{-0.80, 1.04, 2.94} & \cellcolor{gray!10}{snes}\\
int4\textbackslash{}\_pew & 8 & Generally speaking, how much interest would you say you have in politics … & 1 No interest at all / 2 Only a little / 3 A fair amount / 4 A great deal & 1.10 & -1.18, 1.04, 3.13 & pew\\
\cellcolor{gray!10}{int3\textbackslash{}\_npes} & \cellcolor{gray!10}{8} & \cellcolor{gray!10}{How interested  are you in politics?} & \cellcolor{gray!10}{1 Very interested / 2 Fairly interested / 3 Not interested} & \cellcolor{gray!10}{0.31} & \cellcolor{gray!10}{0.48, 2.04} & \cellcolor{gray!10}{npes}\\
int4\textbackslash{}\_nores & 8 & In general, how interested are you in politics? & 1 Very interested / 2 Fairly interested  / 3 A little interested  / 4 Not at all interested & 0.60 & -0.89, 0.81, 2.53 & nores\\
\cellcolor{gray!10}{int4\textbackslash{}\_nzes} & \cellcolor{gray!10}{8} & \cellcolor{gray!10}{How interested would you say you personally are in politics?} & \cellcolor{gray!10}{1 Very interested / 2 Somewhat interested  / 3 Slightly / 4 Not at all} & \cellcolor{gray!10}{0.47} & \cellcolor{gray!10}{-0.95, 0.60, 1.97} & \cellcolor{gray!10}{nzes}\\
int5\textbackslash{}\_gles & 7 & Generally speaking, you are interested in politics & 1 Very strongly / 2 Fairly strongly / 3 Moderately / 4 Less strongly / 5 Not at all & 0.54 & -0.55, 0.50, 1.67, 2.82 & gles, ges\\
\cellcolor{gray!10}{int5\textbackslash{}\_nes} & \cellcolor{gray!10}{7} & \cellcolor{gray!10}{Some people are very interested in politics. Others are not interested at all. Are you very interested in politics, or are you not at all interested?} & \cellcolor{gray!10}{1 Very interested / 2 A lot / 3 More or less / 4 A little / 5 None} & \cellcolor{gray!10}{0.20} & \cellcolor{gray!10}{-0.82, 0.22, 1.23, 2.33} & \cellcolor{gray!10}{belgiumes, bes}\\
int11\textbackslash{}\_ces & 7 & How interested are you in politics generally? & 0 No interest at all / 123456789 / 10 A great deal of interest & 1.01 & -1.86, -1.46, -0.89, -0.35, 0.10, 0.87, 1.43, 2.26, 3.37, 4.14 & canadianes\\
\cellcolor{gray!10}{int4\textbackslash{}\_kobar} & \cellcolor{gray!10}{7} & \cellcolor{gray!10}{How interested are you in politics these days?} & \cellcolor{gray!10}{1 A lot / 2 Some / 3 Not much / 4 Not at all} & \cellcolor{gray!10}{0.71} & \cellcolor{gray!10}{-0.77, 0.70, 2.20} & \cellcolor{gray!10}{kobar}\\
int4a\textbackslash{}\_evs & 6 & How interested would you say you are in politics? & 1 I take an active interest in politics / 2 I am interested in politics but don't t / 3 My interest in politics is not greater / 4 I'm not interested in politics at all & 0.76 & -0.50, 0.93, 3.05 & evs\\
\cellcolor{gray!10}{int3\textbackslash{}\_polit} & \cellcolor{gray!10}{5} & \cellcolor{gray!10}{} & \cellcolor{gray!10}{} & \cellcolor{gray!10}{0.72} & \cellcolor{gray!10}{0.35, 2.44} & \cellcolor{gray!10}{politbarometer}\\
int4\textbackslash{}\_vpcpce & 5 & How interested are you in politics? & 1 Very interested / 2 Quite interested / 3 Only a little interested / 4 Not at all interested & 0.68 & -0.68, 1.19, 2.85 & vpcpce\\*
\end{longtable}
\endgroup{}



![(\#fig:obs)Source Data Observations by Country and Year](dcpo_macrointerest_files/figure-latex/obs-1.pdf) 

![(\#fig:obs2)Source Data Observations by Country and Year, cont.](dcpo_macrointerest_files/figure-latex/obs2-1.pdf) 

\pagebreak

# The DCPO Model {#dcpo}

A number of recent studies have developed latent variable models of aggregate survey responses based on cross-national survey data [see @Claassen2019; @Caughey2019; @McGann2019; @Kolczynska2020].
To estimate macrointerest across countries and over time, we employ the latest of these methods that is appropriate for data that is not only incomparable but also sparse, the Dynamic Comparative Public Opinion (DCPO) model elaborated in @Solt2020c.
The DCPO model is a population-level two-parameter ordinal logistic item response theory (IRT) model with country-specific item-bias terms.

DCPO models the total number of survey responses expressing at least as much macrointerest as response category $r$ to each question $q$ in country $k$ at time $t$, $y_{ktqr}$, out of the total number of respondents surveyed, $n_{ktqr}$, using the beta-binomial distribution:

\begin{equation}
a_{ktqr} = \phi\eta_{ktqr} \label{eq:bb_a}
\end{equation}
\begin{equation}
b_{ktqr} = \phi(1 - \eta_{ktqr}) \label{eq:bb_b}
\end{equation}
\begin{equation}
y_{ktqr} \sim \textrm{BetaBinomial}(n_{ktqr}, a_{ktqr}, b_{ktqr}) \label{eq:betabinomial}
\end{equation}

where $\phi$ represents an overall dispersion parameter to account for additional sources of survey error beyond sampling error and $\eta_{ktqr}$ is the expected probability that a random person in country $k$ at time $t$ answers question $q$ with a response at least as interested as response $r$.^[
The ordinal responses to question $q$ are coded to range from 1 (expressing the least political interest) to $R$ (expressing the most political interest), and $r$ takes on all values greater than 1 and less than or equal to $R$.]

This expected probability, $\eta_{ktqr}$, is in turn estimated as follows:

\begin{equation}
\eta_{ktqr} = \textrm{logit}^{-1}(\frac{\bar{\theta'}_{kt} - (\beta_{qr} + \delta_{kq})}{\sqrt{\alpha_{q}^2 + (1.7*\sigma_{kt})^2}}) \label{eq:dcpo}
\end{equation}

In this equation, $\beta_{qr}$ represents the difficulty of response $r$ to question $q$, that is, the degree of political the response expresses.  The $\delta_{kq}$ term represents country-specific item bias: the extent to which all responses to a particular question $q$ may be more (or less) difficult in a given country $k$ due to translation issues, cultural differences in response styles, or other idiosyncrasies that render the same survey item not equivalent across countries.^[
Estimating $\delta_{kq}$ requires repeated administrations of question $q$ in country $k$, so
when responses to question $q$ are observed in country $k$ in only a single year, the DCPO model sets $\delta_{kq}$ to zero by assumption, increasing the error of the model by any country-item bias that is present.
Questions that are asked repeatedly over time in only a single country pose no risk of country-specific item bias, so $\delta_{kq}$ in such cases are also set to zero.]
The dispersion of question $q$, its noisiness in relation to the latent variable, is $\alpha_{q}$. The mean and standard deviation of the unbounded latent trait of macrointerest are $\bar{\theta'}_{kt}$ and $\sigma_{kt}$, respectively.

Random-walk priors are used to account for the dynamics in $\bar{\theta'}_{kt}$ and $\sigma_{kt}$, and weakly informative priors are placed on the other parameters.^[
The dispersion parameters $\alpha_{q}$ are drawn from standard half-normal prior distributions, that is, the positive half of N(0, 1).
The first difficulty parameters for each question, $\beta_{q1}$, are drawn from standard normal prior distributions, and the differences between $\beta$s for each $r$ for the same question $q$ are drawn from standard half-normal prior distributions.
The item-bias parameters $\delta_{kq}$ receive normally-distributed hierarchical priors with mean 0 and standard deviations drawn from standard half-normal prior distributions.
The initial value of the mean unbounded latent trait for each country, $\bar{\theta'}_{k1}$, is assigned a standard normal prior, as are the transition variances $\sigma_{\bar{\theta'}}^2$ and $\sigma_{\sigma}^2$; the initial value of the standard deviation of the unbounded latent trait for each country, $\sigma_{k1}$, is drawn from a standard lognormal prior distribution.
The overall dispersion, $\phi$, receives a somewhat more informative prior drawn from a gamma(4, 0.1) distribution that yields values that are well scaled for that parameter.]
The dispersion parameters $\alpha_q$ are constrained to be positive and all survey responses are coded with high values indicating more political interest to fix direction.
The difficulty $\beta$ of "to some extent" (the third response on the four-point, "not at all" to "a great deal" scale) to the European Social Survey's question "To what extent would you say you are interested in politics?" is set to 1 to identify location, and for each question $q$ the difficulties for increasing response categories $r$ are constrained to be increasing.
The sum of $\delta_{kq}$ across all countries $k$ is set to zero for each question $q$:

\begin{equation}
\sum_{k = 1}^K \delta_{kq} = 0
\end{equation}

Finally, the logistic function is used to transform $\bar{\theta'}_{kt}$ to the unit interval and so give the bounded mean of macrointerest, $\bar{\theta}_{kt}$, which is our parameter of interest here [see @Solt2020c, 3-8].^[
Alternative approaches exist for transforming data to the unit interval.
For example, a probit transformation, that is, the cumulative distribution function (CDF) of the normal distribution is one option, one that facilitates the interpretation of the values of the resulting measure as percentiles.
The advantage of the logistic transformation compared to the probit transformation is its heavier tails, which allow for differences among very low and among very high values to be distinguished more clearly.]

The DCPO model accounts for the incomparability of different survey questions with two parameters.
First, it incorporates the _difficulty_ of each question's responses, that is, how much political interest is indicated by a given response. 
That each response evinces more or less of our latent trait is most easily seen with regard to the ordinal responses to the same question: indicating that one is "strongly interested" exhibits more political interest than stating one is "fairly interested," which is a more interested response that "not very interested," which in turn is more interested than "not at all."
But this is also true across questions.
For example, indicating that politics is among "the sort of things in life interest you a lot" likely expresses even more interest than agreeing that one is interested in politics "most of the time."
Second, the DCPO model accounts for each question's _dispersion_, its noisiness with regard to our latent trait.
The lower a question's dispersion, the better that changes in responses to the question map onto changes in macrointerest.
Together, the model's difficulty and dispersion estimates work to generate comparable estimates of the latent variable of macrointerest from the available but incomparable source data.

To address the sparsity of the source data---the fact that there are gaps in the time series of each country, and even many observed country-years have only one or few observed items---DCPO uses simple local-level dynamic linear models, i.e., random-walk priors, for each country.
That is, within each country, each year's value of macrointerest is modeled as the previous year's estimate plus a random shock.
These dynamic models smooth the estimates of macrointerest over time and allow estimation even in years for which little or no survey data is available, albeit at the expense of greater measurement uncertainty.

It is worth noting that not all sources of incomparability are likely to be fully addressed by the DCPO model.
To the extent that survey sample representation issues---such as from variations in population definitions (such as age range, minority inclusion, and territorial exclusions) and sample designs (like probability versus non-probability samples, and older surveys' reliance on quota or random route samples without enumeration)---vary across years for a single country and item (as is typically the case, as more recent surveys are more likely to be fully representative), the country-specific item bias terms will not remedy this problem.
And although survey weights are easily incorporated in the source data (and indeed the `DCPOtools` package does so automatically), not all available weights yield fully representative samples, and some surveys lack weights entirely.
Unlike the model employed by @Caughey2019, the DCPO model does not incorporate poststratification to correct for these issues.
While this does increase computational tractability and decrease data demands, the downside is clearly greater measurement uncertainty in the estimates in country-years where the data are relatively rich (via $\phi$) and potential bias in the estimates where data are more sparse.

\pagebreak
# Comparing Coverage of the Macrointerest Data and the ESS {#ESScomparison}

After creating the cross-sectional time-series of macrointerest, we tested theories of macrointerest formation in the thirty-seven advanced democracies of the OECD.
Figure \@ref(fig:cpOECD) visualizes the advantages of our macrointerest data over one of the largest and most-used datasets for studying political attitudes in the advanced democracies, the European Social Survey (ESS).
The observations covered by ESS are marked with the light rectangles, and the additional country-years the DCPO macrointerest data provide are marked dark.
By taking advantage of all of the available survey data on political interest, our macrointerest estimates allow the comparison to extend to the nine OECD members in the Americas, East Asia, and the Antipodes, and it also provides continuous time series in Europe that extend well beyond the available ESS data.
In all, the macrointerest data provide well over _five times_ as many country-years for analysis than are available in the ESS. 

![(\#fig:cpOECD)Data Availability: DCPO Macrointerest vs. ESS](dcpo_macrointerest_files/figure-latex/cpOECD-1.pdf) 

\vspace{-1in}
# Macrointerest Scores Over Time {#trajectory}


\begin{center}\includegraphics{dcpo_macrointerest_files/figure-latex/trajectory-1} \end{center}



\begin{center}\includegraphics{dcpo_macrointerest_files/figure-latex/trajectory-2} \end{center}



\begin{center}\includegraphics{dcpo_macrointerest_files/figure-latex/trajectory-3} \end{center}



\begin{center}\includegraphics{dcpo_macrointerest_files/figure-latex/trajectory-4} \end{center}



\pagebreak

# Tabular Version of Results Presented in Figure \@ref(fig:resplot) {#resultstable}
\FloatBarrier
\begin{table}
\centering
\caption{(\#tab:modelTB)Tabular Version of Results Presented Graphically in Figure 5}
\centering
\begin{tabular}[t]{lc}
\toprule
  & (1)\\
\midrule
Election Year & 0.788\\
 & {}[0.168, 1.417]\\
Parliamentarism & 5.921\\
 & {}[3.600, 8.178]\\
Federalism & 6.612\\
 & {}[-0.988, 13.779]\\
Disproportionality, Mean & -0.231\\
 & {}[-0.935, 0.475]\\
Disproportionality, Difference & -0.158\\
 & {}[-0.296, -0.019]\\
GDPpc, Mean & 0.169\\
 & {}[-0.077, 0.412]\\
GDPpc, Difference & 0.083\\
 & {}[0.011, 0.149]\\
GDP Growth, Mean & 0.889\\
 & {}[-1.599, 3.433]\\
GDP Growth, Difference & -0.016\\
 & {}[-0.146, 0.115]\\
Unemployment, Mean & -0.633\\
 & {}[-1.649, 0.392]\\
Unemployment, Difference & -0.016\\
 & {}[-0.139, 0.095]\\
Income Inequality, Mean & -0.511\\
 & {}[-1.003, -0.048]\\
Income Inequality, Difference & -0.051\\
 & {}[-0.296, 0.203]\\
\midrule
Num.Obs. & 1246\\
RMSE & 4.94\\
\bottomrule
\multicolumn{2}{l}{\rule{0pt}{1em}95-percent credible intervals are in brackets.}\\
\end{tabular}
\end{table}


\FloatBarrier

\pagebreak
# Comparison with @Peterson2022 {#peterson}

This study extends the pivotal concept of "macrointerest" from @Peterson2022, but it is not intended to replicate that paper: both the method and data employed diverge considerably between the two projects.
Still, a comparison of the macrointerest estimates generated for the United States in both projects is valuable.

Our work diverges methodologically by employing the Dynamic Comparative Public Opinion (DCPO) model instead of the dyad ratio algorithm, commonly referred to as "Wcalc," used by @Peterson2022 [, 208]. 
Apart from the primary rationale stated in the main text---that Wcalc is inherently tailored for generating public opinion time series within a single country rather than for cross-national comparison---there are also methodological and operational distinctions between these two approaches.

The dynamic ratio algorithm primarily seeks to uncover shared variance over time among various survey items.
Its process involves initially pairing these items, subsequently calculating the ratio for each unique pair, and then analyzing the distribution of these ratios. 
DCPO instead directly models the relationship between the latent variable and survey item responses using a Bayesian Item Response Theory (IRT) approach (for more on the differences between dyad ratios and IRT, see @McGann2014, which finds that a single-country IRT model provides a better fit to a collection of U.K. public opinion data meant to capture "policy mood" than the dyad ratio algorithm). 
The DCPO method provides a probabilistic framework, enabling the estimation of response probabilities contingent on both the level of the latent trait and specific characteristics of the survey items (for more details, see Appendix\nobreakspace{}\@ref(dcpo)).

Additionally, these methods adopt differing strategies for addressing missing data at certain time points. 
The dynamic ratio algorithm tackles this challenge by estimating values for unobserved series at each time point, basing these estimations on the calculated ratio of missing survey items to those observed in the corresponding period.
For the same issue, DCPO, on the other hand, employs dynamic linear models at the local level for each country, leveraging random-walk priors. 
This approach not only smooths the estimates of macrointerest over time but also facilitates estimation in years characterized by limited or absent survey data and simultaneously provides specific uncertainty estimates.

As @Peterson2022 [, 210] points out, to conduct the dyad ratio algorithm, researchers must first dichotomize each survey question by collapsing responses and (possibly, as in this case) excluding moderate opinions.
DCPO, on the other hand, incorporates an ordered logistic model and so does require the transformation of any of the original item responses.
It also produces credible intervals of the estimates from the Bayesian process, rather than relying on ex-post bootstrapping for uncertainty estimation.
DCPO additionally implements a logistic function to confine the outcome estimates within the unit interval. 

Finally, it is worth noting that the data employed in each paper differs.
The estimates of @Peterson2022 are based on sixteen series with observations in at least two quarters.
The data on which our macrointerest estimates for the United States are based on eleven series with at least five country-year observations across all countries.
These latter data are dated annually, and nearly all of them are drawn from cross-national surveys.
Only two series, drawn from the American National Election Survey and from surveys by the Pew Research Center, are included in both source-data datasets.
This is due partly to the minimum of five country-year observations we use, partly to the shorter time span covered by this project (because of the paucity of data for other countries in earlier decades), partly to our practice of using only surveys for which the entire survey dataset rather than only survey marginals is available to ensure survey weights are applied, partly to the omission of cross-national surveys by @Peterson2022, and partly to the combination of these factors.



\begin{figure}

{\centering \includegraphics{dcpo_macrointerest_files/figure-latex/peterson-plot-1} 

}

\caption{Comparison between DCPO and Wcalc}(\#fig:peterson-plot)
\end{figure}

In Figure \@ref(fig:peterson-plot), we compare the outcomes from these two methods during the years they overlap, from 1982 to 2014.
For the purpose of this comparison, the Wcalc scores of @Peterson2022 are first divided by 100 to place them on the unit interval and then shifted nearly a quarter-point downward, which yields identical scores on both series in their first common year, 1982.
Neither of these affect the shape of the Wcalc series; they work simply to overlay the two series for more straightforward comparison.

Two points stand out.
First, the credible intervals of the DCPO series are considerably broader than the bootstrapped intervals for the Wcalc series.
Whether these latter intervals are overconfident seems worth investigating by future users of this method, perhaps by cross-validation [cf. @Solt2020, 11].
Second, the two series are positively but not particularly strongly related; the bivariate correlation is just R = 0.40.
The surge in macrointerest after the September 11, 2001 attacks documented in @Peterson2022 [, 217], for example, is brief in the Wcalc series but longer-lasting in the DCPO series.
Conversely, the sharp upturn in the Wcalc macrointerest series that peaks in late 2013 does not appear in the DCPO series at all---it appears to be an artifact of the rather thin data in the Knowledge Networks series @Peterson2022 employs (see also @Peterson2022, Appendix C, which drops these observations as anomalous).

\begin{table}[!t]
\caption{(\#tab:pmsm)Replication of Peterson et al. (2022), Table 2, 1983-2014} 
\fontsize{12.0pt}{14.4pt}\selectfont
\begin{tabular*}{\linewidth}{@{\extracolsep{\fill}}lccc}
\toprule
  & Wcalc & Annual Wcalc & DCPO \\ 
\midrule\addlinespace[2.5pt]
Macrointerest (Lagged) & 0.844*** & 0.655** & 0.777*** \\ 
 & (0.050) & (0.206) & (0.185) \\ 
Trust (Lagged) & -0.097* & -0.214 & 0.114 \\ 
 & (0.044) & (0.145) & (0.126) \\ 
Trust (Difference) & -0.242* & -0.333 & -0.400 \\ 
 & (0.100) & (0.292) & (0.306) \\ 
Presidential Approval (Lagged) & 0.004 & 0.001 & 0.023 \\ 
 & (0.013) & (0.043) & (0.044) \\ 
Presidential Approval (Difference) & -0.008 & -0.018 & 0.078 \\ 
 & (0.020) & (0.045) & (0.049) \\ 
Consumer Sentiment (Lagged) & 0.001 & -0.009 & -0.043 \\ 
 & (0.012) & (0.039) & (0.041) \\ 
Consumer Sentiment (Difference) & 0.026 & 0.032 & 0.001 \\ 
 & (0.026) & (0.052) & (0.059) \\ 
Presidential Election & 0.440*** & 0.348 & -0.075 \\ 
 & (0.100) & (0.342) & (0.336) \\ 
September 11 & 2.228* & 2.215 & 5.094+ \\ 
{} & {(1.075)} & {(2.606)} & {(2.837)} \\ 
N & 128 & 32 & 32 \\ 
R2 & 0.846 & 0.730 & 0.636 \\ 
RSME & 1.26 & 1.54 & 1.62 \\ 
\bottomrule
\end{tabular*}
\begin{minipage}{\linewidth}
+ p < 0.1, * p < 0.05, ** p < 0.01, *** p < 0.001\\
\end{minipage}
\end{table}

The two series are further compared in Table \@ref(tab:pmsm).
The first column replicates the analysis of @Peterson2022, Table 2, using only the years from 1983 to 2014, that is, the span for which DCPO estimates of macrointerest are also available.
To preserve degrees of freedom, of the eight scandals and negative events, only the dummy variable for the attacks of September 11, 2001 (the only one to receive support in @Peterson2022) is included.
The findings of @Peterson2022 are reproduced in this truncated dataset.

In the second column, the @Peterson2022 Wcalc macrointerest data are aggregated to the annual level over the same period, that is, each year's value is the mean of the values of that year's quarters, and the independent variables were similarly annualized.
Over this time period and at this unit of analysis, macrointerest is predicted only by its lagged value: the coefficients for trust, presidential elections, and September 11 no longer reach statistical significance.
The DCPO macrointerest series for the United States yields similar results.
It would appear that it is the unit of analysis---years as opposed to quarters---rather than the macrointerest series, that yields different conclusions in the @Peterson2022 analysis.

\clearpage
\pagebreak




# References {.unnumbered}

::: {#refs-app}
:::


# Data availability statement  {.unnumbered}

Replication data for this paper can be found at [reference].
