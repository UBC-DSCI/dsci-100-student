# DSCI 100 function reference sheet for Python

This reference sheet contains the key objects that we use in DSCI 100,
and a brief syntax example for each of the main packages.
During the closed book exams,
you will still have access to this page,
so get familiar with it already now.
If you think there is something missing from here,
please let us know and we can consider adding it.

## Data wrangling (`pandas`)

A typical data frame construction and operation would look something like this:

```python
import pandas as pd

df = pd.DataFrame({
    'column1': [1, 2, 3, 4],
    'column2': [2, 2, 8, 10],
    'column3': ['a', 'a', 'b', 'b'],
})

(
    df
    .dropna()
    .loc[
        df['column2'] < 10,
        ['column2', 'column3']
    ]
    .assign(column4=df['column2'] * 2)
    .rename(columns={'column3': 'letter'})
    .groupby('letter')
    .agg(['mean', 'std'])
)
```

`pandas` functions, prefix with `pd.`

| DataFrame  | A two-dimensional, heterogeneous tabular data structure with labeled axes     |
| Series     | A one-dimensional labeled array capable of holding data of various types      |
| crosstab   | Compute a cross-tabulation of two (or more) factors, e.g. a confusion matrix. |
| to_csv     | Write a DataFrame to a CSV                                                    | file
| concat     | Concatenate pandas objects along a particular axis                            |
| read_csv   | Read data from a CSV file                                                     |
| read_excel | Read data from an Excel file                                                  |
| read_html  | Parse HTML tables from a web page and return a list of DataFrames             |

Data frame methods, prefix with the name of the data frame (e.g. `df.`)

| Name           | Description                                                                   |
|----------------|-------------------------------------------------------------------------------|
| abs            | Convert to absolute value                                                     |
| agg            | Perform multiple aggregations                                                 |
| apply          | Apply a function to every column or row in the df                             |
| assign         | Create a new column                                                           |
| astype         | Convert the data type of a column                                             |
| describe       | Calculate common descriptive statistics                                       |
| drop           | Remove the specified row(s) or column(s)                                      |
| dropna         | Remove the rows that contains NULL/NA values                                  |
| groupby        | Group rows together if share value in the specified column                    |
| contains       | For searching for a str within the values of a df column                      |
| isin           | Determine whether a value is present in a column                              |
| iloc           | Select rows and columns by their integer positions                            |
| info           | Print a concise summary of a df                                               |
| loc            | Filter rows and select columns at the same time                               |
| max            | Return the maximum value of the columns                                       |
| mean           | Return the mean value of the columns                                          |
| melt           | Unpivot a df from wide to long format                                         |
| merge          | Merge data frames or series                                                   |
| min            | Return the minimum value of the columns                                       |
| nlargest       | Return top n rows after sorting the df by a column's highest value            |
| nsmallest      | Return top n rows after sorting the df by a column's smallest value           |
| pivot          | Turn df from long to wide                                                     |
| quantile       | Return the value at the specified quantile                                    |
| query          | Filter a data frame based on row condition query, similar to [].              |
| range          | Specify a sequence of values                                                  |
| rename         | Rename columns in a df                                                        |
| replace        | Replace specific values to desired new values                                 |
| reset_index    | Reset the index of the df to a numerical range                                |
| round          | Round values in a df                                                          |
| sample         | Return a random sample of n rows from a df                                    |
| shape          | Find the number of rows and cols of the df                                    |
| sort_values    | Order the rows of a df by the values of certain col                           |
| str.startswith | Test if the start of each str element in a column matches a pattern           |
| sum            | Return the sum of the values over the requested axis                          |
| tail           | Return a specified number of rows from the end of the df                      |
| unique         | See all unique values in a column                                             |
| value_counts   | Return a Series containing the frequency of each distinct value in the column |


Data base methods, perform on a database connection or a table

| Name                | Description                                                                |
|---------------------|----------------------------------------------------------------------------|
| ibis.sqlite.connect | Connect to a database                                                      |
| list_tables         | List all tables in the database                                            |
| table               | Connect to a specific table in a database                                  |
| order_by            | The same as `sort_values` for a data frame                                 |
| execute             | Execute a database table operation to yield a data frame from the database |

## Visualization (`altair`)

A typical chart syntax would look something like this:

```python
import altair as alt

alt.Chart(df).mark_point().encode(
    x='column1',
    y=alt.Y('column2').title('Column 2')
).properties(
    height=100
).facet(
    'column3',
    columns=1
)
```

| Name                       | Description                                                                                                |
|----------------------------|------------------------------------------------------------------------------------------------------------|
| Chart                      | Specity the data used for the chart                                                                        |
| Color, X, Y, ...           | Helpers for modifying the corresponding encoding, eg. adding a title                                       |
| axis                       | Modify the axis format of a single axis                                                                    |
| configure_axis             | Modify the axis format of all axes                                                                         |
| mark_point, mark_line, ... | Represent the data with the corresponding graphical mark                                                   |
| bin                        | Group the values of a column into bins (buckets)                                                           |
| count                      | The total count of observations in the group                                                               |
| datum                      | A special encoding that creates data points directly instead of using a data frame                         |
| facet                      | Create multiple views of a dataset where each panel contains a different subset                            |
| disable_max_rows           | Disable the default maximum row limit for displaying data, which simplifies working with large data frames |
| encode                     | Specify how data columns are encoded as visual channels (x, y, color, etc)                                 |
| & (ampersand)              | Concatenating charts vertically                                                                            |
| \| (pipe)                  | Concatenating charts horizontally                                                                          |
| +                          | Layer multiple charts on top of each other                                                                 |
| legend                     | Modify the legend format and properties for the chart                                                      |
| properties                 | Set various properties and configurations for the chart                                                    |
| resolve_scale              | Control if scales are shared or independent between charts                                                 |
| save                       | Save the chart to a file                                                                                   |
| scale                      | Modify scale properties for encoding channels in the chart                                                 |
| stack                      | Control if marks (e.g. bars of areas) should stack on top of each other                                    |
| title                      | Add a title to the axis                                                                                    |

## Machine learning (`scikit-learn`)

A typical scikit-learn pipeline would look something like this:

```python
from sklearn.compose import column_transformer
from sklearn.model_selection import train_test_split, GridSearchCV
from sklearn.neighbors import KNeighborsClassifier
from sklearn.pipeline import make_pipeline
from sklearn.preprocessing import StandardScaler


# Split the data
train, test = train_test_split(df, train_size=0.75)
X_train = train.drop(columns='column3')
y_train = train['column3']
X_test = test.drop(columns='column3')
y_test = test['column3']

# Create the pipeline
preprecessor = make_column_transformer(
    (StandardScaler(), ["column1", "column2"]),
    remainder='passthrough',
)
knn = KNeighborsClassifier(n_neighbors=3)
pipe = make_pipeline(preprecessor, knn)

# Tune the model
parameter_grid = {
    "kneighborsclassifier__n_neighbors": range(1, 2),
}
tune_grid = GridSearchCV(
    estimator=pipe,
    param_grid=parameter_grid,
    cv=2
)
tune_grid.fit(X_train, y_train)

# Report performance
tune_grid.score(X_test, y_test)

# Predict on unseen data
new_obs = pd.DataFrame({'column1': [0], 'column2': [3.5]})
tune_grid.predict(new_obs)
```

| Name                    | Description                                                                                                  |
|-------------------------|--------------------------------------------------------------------------------------------------------------|
| fit                     | Fit/train the model                                                                                          |
| predict                 | Predict the values of unseen data                                                                            |
| StandardScaler          | Rescale the range of the data                                                                                |
| GridSearchCV            | Perform an exhaustive search over a hyperparameter grid to find the best combination using cross-validation. |
| KMeans                  | Initialize a K-Means clustering algorithm for grouping data points into clusters based on similarity.        |
| KNeighborsClassifier    | Initialize a k-Nearest Neighbors classifier for classification tasks.                                        |
| LinearRegression        | Initialize a Linear regression model for predicting continuous target values from input features.            |
| SimpleImputer           | Initialize a Imputation transformer for handling missing data using simple strategies.                       |
| StandardScaler          | Initialize a Scaler for standardizing features by subtracting the mean and scaling to unit variance.         |
| best_params_            | Attribute in GridSearchCV containing the best hyperparameters found during the grid search.                  |
| coef_                   | Attribute in linear models (e.g., LinearRegression) containing the estimated coefficients of features.       |
| cross_validate          | Function for evaluating a model's performance using cross-validation and returning multiple scores.          |
| cv_results_             | Attribute in GridSearchCV containing detailed results from cross-validation grid search.                     |
| euclidean_distances     | Compute pairwise Euclidean distances between points in two datasets.                                         |
| feature_selection       | Module containing functions for feature selection techniques.                                                |
| get_params              | Method to retrieve the hyperparameters of an estimator.                                                      |
| inertia_                | Attribute in KMeans indicating the sum of squared distances from samples to their cluster centers.           |
| intercept_              | Attribute in linear models (e.g., LinearRegression) containing the intercept term of the model.              |
| make_column_selector    | Function for creating a column selector for transformers in a ColumnTransformer.                             |
| make_column_transformer | Function for creating a composite transformer for feature preprocessing.                                     |
| make_pipeline           | Function for creating a composite estimator (pipeline) with specified preprocessing and model steps.         |
| mean_squared_error      | Function to calculate the mean squared error between true and predicted values for regression tasks.         |
| named_steps             | Attribute in a Pipeline object providing access to individual steps by name.                                 |
| predict                 | Method used to make predictions on new data samples for various estimators.                                  |
| score                   | Method for calculating the accuracy or performance metric of a classifier or regressor.                      |
| set_config              | Function to configure global scikit-learn settings and behavior.                                             |
| train_test_split        | Function for splitting a dataset into training and testing sets for model evaluation.                        |


## Other

| Name                                 | Description                                                                                                             |
|--------------------------------------|-------------------------------------------------------------------------------------------------------------------------|
| [print(num**2) for num in range(10)] | A list comprehension to loop through the given range and perform an operation (here printing the square of the numbers) |
| append                               | Add elements to the end of a list or array                                                                              |
| enumerate                            | Generate indices and values from an iterable                                                                            |
| print                                | Display text or variable values to the console                                                                          |
| np.arange                            | Create an array with regularly spaced values                                                                            |
| np.array                             | Create a NumPy array from a list or other iterable                                                                      |
| np.seed                              | Seed the random number generator for reproducibility                                                                    |
| np.sqrt                              | Calculate the square root of a numeric value or array                                                                   |
