# Final report checklist / common mistakes

Hi everyone, 

As you finalize your group project, we have compiled a check list of common mistakes that we have seen over previous semesters, and we hope you will be able to avoid this:

- Asking a question that doesn't need a predictive model to answer (e.g. predict what the weather was last week. Just look it up)
- Not loading data from a remote source
- Clearly justify your choices of variables or algorithms (e.g., KNN regression vs linear regression). Don't say
> We selected X and Y to predict Z.

I would want to see something like:
> We selected X and Y to predict Z. Our reasoning is that X is likely a good candidate for predicting Z because they are related through reason A. Y was selected based on our EDA as it seemed to be correlated to Z. If we would have had more time and resources we would also have like to explore features 1, 2, 3, but we decided to focus on a few feature to keep the project more manageable.

- Ignoring sensitivity to seed value. Forgetting to set.seed in ALL code cells with randomized processes (cross val, predict function, partitioning testing/training), which makes the result change every time we re-run the code
- Using categorical features as a KNN predictor (without binarizing them). Recall that in KNN we perform a distance calculation between neighbors, and we cannot perform mathematical calculation on a categorical variable such as color (e.g., red, blue, yellow). Instead, we need to create a dummy with a value of 0 and 1 for each color, so we can perform distance calculation 
- Data leakage: train or tune the model with test data or the whole dataset. You should never include test data in training/tuning as it violates the golden rule of machine learning
- Similarly, if you have time-series data, then split train-test must reserve the temporal order of data (do not shuffle it), otherwise you might end up with using a data from future to predict the past, which will overestimate the model accuracy
- All figures & table must have caption and be referenced to. If you just add a figure/table without discussing/referencing to it, we will deduct point. 
- Cluttered presentation: avoid using too many figures or print out a long data frame, use summary statistics table or print out just the first few rows, combine figures with facet_grid() or color by group, or similar methods
- Language: Avoid using causal phrases such as X leads to Y or Y is caused by X as predictions models are correlated in nature, not causation
- Discussion: talking about their findings and conclusions in general terms and not just having conclusion in jargon/code such as "our final model score was X", but instead saying "our final model score was X which means that ..."



**Past TA's suggestion for marking the proposal:**


Since project proposal grading is a section-specific thing, I thought it would be a good idea to list the things that I actively looked for when reading through proposal before. I've put the points in order of most important to least important (in my opinion), but I don't have a point deduction as I think that can be discussed amongst ourselves.

- They had some reasoning as to why they were going to use their chosen predictors. This justification could be domain knowledge from relevant articles, programmatically selecting good predictors (forward selection), through visualizations, or through logic.

  - By logic I mean if there were two attributes radius and diameter they just use one because both attributes encode for the same thing.

- The introduction gave the reader sufficient information to understand the dataset attributes/problem being tackled.

- The figures contained some explanation that helped the reader understand what they were suppose to gleam from the viz. I don't think it's enough for them to show a graph and not give a specific reason why they showed it.


 - They performed their data analysis on just the training dataset.
    - Some groups asked if they can perform preliminary data analysis on training dataset then remove specific columns from training and testing and I said it's fine.

- In the discussion, they explained why they got the accuracy/RMSPE they got instead of just reporting their accuracy/RMSPE, especially if the accuracy/RMSPE is poor (for heart disease, it seems to be around 60%, and I’ve been prompting groups to talk about how good their predictors are and how that might affect their analysis)

- Their predictive question is something that can be realistically done using DSCI 100 knowledge.

 - The proposal is "professionally" done. For example: "What is an example of an unprofessional proposal?"
    - An example of an unprofessional proposal is if they use bullet points to answer all the questions we ask for in the rubric.

 - Code is reproducible: they used set.seed and they avoided using relative path when reading in file (it's fine if they used download.file)

 - notebook is reasonably structured. Code blocks and markdown cells are interlaced together.
    - I don't like it when they put all their code in 1 huge code cell then all their explanations in anther huge markdown cell.

There's some other things  that I comment about that I don't think merits point deductions:
 - Using unnecessary import statements. (test.R, cleanup.R etc)
 - Not having the import statements at the top of the notebook (good practice)
 - Hard to read code (bad spacing, long 1 liners, etc etc)


Feel free to add anything that you think we should look out for as well as the points I listed are focused more towards the first half of the proposal requirements and ignore the Methods, conclusion parts.
