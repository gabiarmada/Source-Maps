# Source-Maps


## Introduction
`Source-Maps` is an interactive shiny app used to display EPA NEI (National Emissions Inventory) data collected from 2011, 2014, and 2017 in Virginia. The shiny app output is a Virginia counties heat map based on user-specified data inputs for `Source Emissions Category` and `Year`. This app focuses on Sulfur Dioxide emissions (SO2). 

## Installation 
Clone the `Source-Maps` repository by clicking the green `code` button and downloading the .zip file. You can also use 
```
gh repo clone gabiarmada/Source-Maps
```

### Get EPA NEI data 
To obtain the same datasets, go to the EPA NEI database [here](https://www.epa.gov/air-emissions-inventories/national-emissions-inventory-nei). Under the **Data and Documentation** tab, select the year of interest. Scroll down to the **Data Queries** section and enter the following information: <br/> 
* **National/ State/ County or Tribe**: *State*
* **Geographic Aggregation**: *Virginia* 
* **Pollutant**: *Sulfur Dioxide - SO2*
* Leave all other options as default and submit. Download and save query as a .csv file. 

## How to use 
`Source-Maps` uses [map_NEI( )](https://github.com/gabiarmada/Source-Maps/blob/main/map_NEI.R) to generate Virginia heat map outputs by source emissions type. This function is still in its development phase.  

## Credits 
Trajan Smeeth @ts-deva contributed to the development of `map_NEI()`. 