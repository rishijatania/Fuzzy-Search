# Fuzzy-Search

A fuzzy search algorithm for finding duplicate entries in a csv file

### Getting Started

The repository has a generic Spring boot MVC application that takes .csv file as an input, parses it and displays Duplicate and non-duplicate rows found within the file. 

* Uses Levenshtein Distance as the first filter to get matching rows
* Uses Double Metaphone to finally filter out the result into multiple set of duplicates and a single set of non duplicate values

### Assumtions Made

Some assumtions that were made on the business logic are:

* No column in the input csv is given preference over the other
* For Levenshtein distance, two fields should have less than 60% changes to be considered as match (this is tranlated to 0.4 * length of each column value)
* Atleast 60% of the total number of columns should be matched with the above treshold for the row to be considered as a match (this is tranlated to 0.6 * number of columns)
* Metaphone uses only string values to be matched, for this characters other than string are discarded and empty fields are considered as not matched
* The application is generic and should work with any well formed csv with any given header and values



## Running the application locally

There are several ways to run a Spring Boot application on your local machine. One way is to execute the `main` method in the `com.fuzzy.search.FuzzySearchApplication` class from your IDE.

Alternatively you can use the [Spring Boot Maven plugin](https://docs.spring.io/spring-boot/docs/current/reference/html/build-tool-plugins-maven-plugin.html) like so:

```shell
mvn spring-boot:run
```

To change the treshold values --field.treshold=0.4 --column.treshold=0.6 can be used with executing the jar files as command line parameters

### Design & Considerations
* Csv is converted to a List of hashmaps to represnt the csv rows with column header and values.
* To maintain Code reusability nothing is harcoded including the header values, tresholds, output table, etc...
