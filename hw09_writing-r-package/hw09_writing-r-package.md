Writing an R package
================
Gokul Raj Suresh Kumar
2016-12-06

Writing an R package
--------------------

### foofactors

The package can be found at <https://github.com/gokulraj-ece/foofactors>

The documentation related to the package can be found in the `README` file in the above link

#### Extensions made to `foofactors` developed by Jenny Bryan

-   function `is_char_factor` to determine factors that should be character

-   function `desc_reord` to reorder the levels of a factor in descending order using `dplyr::desc`

-   added assertions to validate function inputs

-   documented all exported functions

-   included three unit tests for every exported function

-   passed `check()` without errors

-   pushed the package to a public Github repo

#### Reflections

-   Interesting assignment, the process was a bit tedious overall but something really valuable to be aware of

#### Attribution

-   Jenny Bryan's [foofactors package](https://github.com/jennybc/foofactors) laid the foundation on which this assignment was built upon

-   Jenny Bryan's [Build your first R package](http://stat545.com/cm109_packages.html) was of major help, provided all the information needed to complete this assignment

-   Jenny Bryan's [writing functions in R](http://stat545.com/block011_write-your-own-function-03.html#use-testthat-for-formal-unit-tests) for formal unit tests
