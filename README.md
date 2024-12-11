# Analysis on Determinants of Body Weight

## Overview

This repository utilizes data from the 2012 U.S. Army Anthropometric Survey (ANSUR II) to investigate the relationships between body weight and key anthropometric and demographic variables among female personnel. The primary goal is to quantify how specific body measurements, such as waist and thigh circumferences, alongside demographic factors like age and military component, contribute to variations in body weight.

The analysis employs Bayesian regression modeling to explore these relationships in depth, emphasizing the predictive power of anthropometric variables. The findings provide valuable insights for tailoring military health programs, optimizing fitness assessments, and improving the design of personalized equipment for female soldiers. This repository includes all necessary data, R scripts, and documentation to enable reproduction of the study's results and further exploration of the implications for operational readiness and health monitoring in military contexts.

Aspects of the file structure and coding were adapted from https://github.com/RohanAlexander/starter_folder/tree/main.


## File Structure

The repo is structured as:

-   `data/00-simulated_data` contains the simulated data for the purpose of understanding the cleaned dataset a priori.
-   `data/01-raw_data` contains the raw data as obtained from https://data.world/datamil/ansur-ii-female.
-   `data/02-analysis_data` contains the cleaned dataset that was constructed in `scirpts/02-clean_data`.
-   `model` contains fitted models. 
-   `other` contains relevant resources, including supplementary literature, descriptions of dataset features, and notes on interactions with large language models (LLMs)
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download, clean, visualize, and analyse the data.


## Statement on LLM usage

ChatGPT-4o was utilized to assist with R code development, statistical concept clarification, and drafting documentation, including explanations for methods, results, and reproducibility workflows. Full interaction history is documented in other/llm_usage/usage.txt.

