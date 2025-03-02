# air-boltic

This data model aims at providing an overview of the business performance of Air Boltic, by providing a set of marts that provides data integrity and flexibility to the analysts.

The staging layer is built from the raw data and is meant to perform minimal transformations such as casting, renaming, dropping and enrichment of columns.
The intermediate layer is built from the staging layer and is meant to perform more complex transformations such as joins, aggregations and calculations to prepare the data for the marts.
The marts are the final layer and are meant to provide a set of reports and insights to the analysts. With more time, I'd have enrich them with more dimensions to enable analysts to perform more in-depth analysis. In particualar, add geographical models to assess the performances of the different markets
I would also provide a more in-depth test and documention at the staging and mart (input/output) levels. 
An incremental approach would have been used to save ressouces and computation power. 
Of course, the necessary files such as dbt_project.yml, profiles.yml would have been created.
We would also use a virtual environment to manage the dependencies.