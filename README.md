# DSCI 310: Reproducible and trustworthy workflows for data science

## Time and Place
- Lecture: SCARF 209, Tues/Thurs 9:00-10:30
- Tutorial: ORCH 4074, Fri 9:00-10:00 

## Course Description
Data science methods to automate the running and testing of code and analytic reports, manage data analysis software dependencies, package and deploy software for data analysis, and collaborate with others using version control.

**Pre-reqs:** DSCI 100 and either (a) one of CPSC 203, CPSC 210, CPEN 221 or (b) one of MATH 210, ECON 323 and one of CPSC 107, CPSC 110.

*See the Faculty of Science Credit Exclusion Lists: www.calendar.ubc.ca/vancouver/index.cfm?tree=12,215,410,414*

**Long Version:** Data Science skills and tools are increasingly in demand across a large variety of disciplines. DSCI 310 aims to further students’ existing data science knowledge with reproducible and trustworthy workflows in the areas of creating and deploying data analysis, reports, and software. Particular focus will be placed on teaching the skills and tools currently used in academic research and industry settings. 

Without deliberate and conscious effort towards project organization, tool choice, and workflows, complex and large data science projects can quickly grow out-of-hand and become irreproducible and untrustworthy. This course will focus on reproducible and trustworthy workflows for writing computer scripts, analytic reports and data analysis pipelines, as well as packaging, automated testing and deployment of software written for data analysis. An emphasis is also placed on how to collaborate effectively with others using version control tools, such as Git and GitHub. Such workflows act to mitigate chaos and maximize transparency, reproducibility, and productivity. 

While the course will be based on the use of the two leading languages in data science, Python and R, and related current tools (conda, Docker, Git, GitHub, Jupyter, etc.), the concepts and skills taught in the course aim to be discipline and tool agnostic, focussing on the importance of reproducible and trustworthy workflows for data analysis and the implications of failing to implement these when performing a data analysis.

Students who have completed this course will be able to complete complex data analysis projects with minimal technical debt – meaning that others can transparently follow how the analysis was done, reproduce the analysis for themselves if desired, and easily pickup on, and further extend the analysis in new areas. Strategies for collaboration on data science projects will also be emphasized.

## Dealing With COVID-19

**In-Person Section: please see Canvas for rules we are implementing this semester to limit the spread of COVID-19.**

The [COVID-19 pandemic](https://www.who.int/emergencies/diseases/novel-coronavirus-2019/events-as-they-happen)
has affected us all in different ways. It's okay to not be okay, and you should
never hesitate to reach out to me if you need support. Just ask! UBC also has
[great student support resources](https://students.ubc.ca/covid19) related to
COVID-19 (and otherwise).

Also, please keep in mind that running a course during a pandemic is a new
experience for your teaching team. The way this course usually runs (with a lot
of close interaction between students and instructors) is not safe when we are
trying to limit the spread of COVID-19. So a lot of how we run things in-class
will be a bit "experimental," and we will have to adjust on the fly; please do
not hesitate to provide feedback on how we can improve your learning
experience. 

## Textbook
TBD

## Hardware & Software
Students are required to bring a laptop to both lectures and tutorials. Students
who do not own a laptop, chromebook, or tablet may be able to 
[loan a laptop from the UBC library](https://services.library.ubc.ca/computers-technology/technology-borrowing/). 

## Learning Outcomes
By the end of the course, students will be able to:

- Read data using computation from various sources (local and remote plain text files, spreadsheets and databases)
- Wrangle data from their original format into a fit-for-purpose format.
- Identify the most common types of research/statistical questions and map them to the appropriate type of data analysis.
- Create, and interpret, meaningful tables from wrangled data.
- Create, and interpret, impactful figures from wrangled data.
- Collaborate with others using version control.
- Apply, and interpret the output of simple classifier and regression models.
- Make and evaluate predictions using a simple classifier and a regression model.
- Apply, and interpret the output of, a simple clustering algorithm.
- Distinguish between in-sample prediction, out-of-sample prediction, and cross-validation.
- Calculate a point estimate in the context of statistical inference and explain how that relates to the population quantity being estimated.
- Accomplish all of the above using workflows and communication strategies that are sensible,
clear, reproducible, and shareable.

## Teaching Team

*Note that your TAs are students too; they may have class 
right before their office hours, and they may run a few 
minutes late. Please be patient!*

| Position | Name  | Email | Office Hours | Office Location |
|-------|-------|--------------|-----------------|----------------|
| Instructor | Trevor Campbell | trevor[-at-]stat.ubc.ca | Thursday 5-6pm | Zoom |
| TA | TBD |  | TBD | TBD |

## Assessment
TBD

### Course breakdown

| Deliverable	| Grade |	Learning objectives addressed |
|-------------|-------|-------------------------------|
|Lecture worksheets	| 5% |	1, 2, 4, 5 |
|Project proposal |	10%	| 3, 6 |
|Project milestone 1	| 10%	| 3, 4, 6 |
|Mid-term Exam |	10%	 | 1, 2, part of 4 |
|Project milestone 2	| 10%	| 3, 4, 5, 6 |
|Individual peer review	5%	| 2 |
|Final project	| 20%	| 3, 4, 5, 6 |
|Teamwork	| 10% |	6 |
|Final Exam	| 20%	| 1, 2, 4, 5 |

### Group project breakdown

| Deliverable | Percent Grade |
|-------------|---------------|
| Proposal | 3 |
| Final report | 11 |
| Team work | 5 |
| Group contract | 1 |

## Schedule
TBD

## Policies

### Late Registration
Students who register for the class late have 1 week from their registration date on Canvas to complete all prior assignments.

### Late Assignments / Quiz Absence
Students **must be present** at the invigilation venue (in class, on Zoom,
examination centre, etc) to take quizzes; otherwise they will be considered to
have missed the quiz and will be assigned a grade of zero. 

Students who will miss a quiz **must provide a self-declaration prior to the
quiz** and make arrangements (e.g., schedule an oral make-up quiz) with the
Instructor. Failing to present a declaration within a reasonable timeframe
before the quiz will result in a grade of zero. 

There will be **no extensions for the lecture and tutorial worksheets**; late
assignments will receive a grade of zero. Instead, we will drop the lowest
grade on tutorials and worksheets for the semester. 

For all other assignments and the course project, a **late submission will
receive a 50% penalty**.

### Autograder Policy
Many of the questions in assignments are graded automatically by software. The
grading computer has exactly the same hardware setup as the server that
students work on. No assignment, when completed, should take longer than 5
minutes to run on the server. The autograder will automatically stop (time out)
for each student assignment after a maximum of 5 minutes; **any ungraded
questions at that point will receive a score of 0.**

Students are responsible for making sure their assignments are *reproducible*,
and run from beginning to end on the autograding computer. In particular,
**please ensure that any data that needs to be downloaded is done so by the
assignment notebook with the correct filename to the correct folder.** A common
mistake is to manually download data when working on the assignment, making the
autograder unable to find the data and often resulting in an assignment grade
of 0.

In short: whatever grade the autograder returns after 5 minutes (assuming the
teaching team did not make an error) is the grade that will be assigned.

### Re-grading
If you have concerns about the way your work was graded, please contact the TA
who graded it within one week of having the grade returned to you. After this
one-week window, we may deny your request for re-evaluation. Also, please keep
in mind that your grade may go up or down as a result of re-grading. Please see
Canvas for instructions on submitting re-grade requests.

### Device/Browser
TBD

### Missed Final Exam 
Students who miss the final quiz must report to their faculty advising office
within 72 hours of the missed exam, and must supply supporting documentation.
Only your faculty advising office can grant deferred standing in a course. You
must also notify your instructor prior to (if possible) or immediately after
the exam. Your instructor will let you know when you are expected to write your
deferred exam. Deferred exams will ONLY be provided to students who have
applied for and received deferred standing from their faculty.

### Academic Concession Policy
Please see [UBC's concession policy](http://www.calendar.ubc.ca/vancouver/index.cfm?tree=3,329,0,0) for
detailed information on dealing with missed coursework, quizzes, and exams
under circumstances of an acute and unanticipated nature.

### Academic Integrity 
The academic enterprise is founded on honesty, civility, and integrity. As
members of this enterprise, all students are expected to know, understand, and
follow the codes of conduct regarding academic integrity. At the most basic
level, this means submitting only original work done by you and acknowledging
all sources of information or ideas and attributing them to others as required.
This also means you should not cheat, copy, or mislead others about what is
your work. Violations of academic integrity (i.e., misconduct) lead to the
breakdown of the academic enterprise, and therefore serious consequences arise
and harsh sanctions are imposed. For example, incidences of plagiarism or
cheating may result in a mark of zero on the assignment or exam and more
serious consequences may apply if the matter is referred to the President’s
Advisory Committee on Student Discipline. Careful records are kept in order to
monitor and prevent recurrences.

A more detailed description of academic integrity, including the University’s
policies and procedures, may be found in the Academic Calendar at
http://calendar.ubc.ca/vancouver/index.cfm?tree=3,54,111,0.

### Plagiarism
Students must correctly cite any code or text that has been authored by someone
else or by the student themselves for other assignments. Cases of plagiarism
may include, but are not limited to:

- the reproduction (copying and pasting) of code or text with none or minimal reformatting (e.g., changing the name of the variables)
- the translation of an algorithm or a script from a language to another 
- the generation of code by automatic code-generation software 

An "adequate acknowledgement" requires a detailed identification of the (parts of the) code or text reused and a full citation of the original source code that has been reused.

The above attribution policy applies only to assignments. **No code or text may be copied (with or without attribution) from any source during a quiz or exam. Answers must always be in your own words. At a minimum, copying will result in a grade of 0 for the related question.**

**Repeated plagiarism of any form could result in larger penalties, including failure of the course.** 

## Attribution

Parts of this syllabus (particularly the policies) have been copied and derived from the [UBC MDS Policies](https://ubc-mds.github.io/policies/).

