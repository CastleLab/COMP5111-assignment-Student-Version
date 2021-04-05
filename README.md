# COMP5111 (Spring 2021) Assignment 2

## Deadline: April 6, 2021 - 23:55

### Have Questions?
1. If you have questions, please first check our [FAQ](Assignment2_FAQ.md).
2. If your problem is not solved, you are recommended to create `Issues` in this repository.
   Issues shall be replied by the TA within 24 hrs.
3. If you want to discuss with other classmates, you can go to `Discussions` of this repository.
   Note that this repository is `ONLY` for programming assignment.
   Your reading reports and related discussions should be put on CANVAS.
3. If you don't want your question to be visible to other classmates, you can send an email to the TA.


## Assignment Objectives

The objectives of this assignment are three-fold.
1. You will get familiar with search-based testing techniques through a state-of-the-art testing tool Evosuite. 
   You are required to use Evosuite to improve the test suite that you constructed in assignment 1. 
   The newly constructed test cases should help improve test coverage for effective fault detection.
2. You will implement a fault localization tool on top of Soot. 
   Your tool should be able to locate our injected faults and eventually fix them.
3. You will extend the test suite to improve the ranking of fault localization, understanding the limitations of automatically generated tests and the noises that may induce to fault localization. Through the practice, you will appreciate the characteristics of tests that favor fault localization.

## Assignment Material

### Class Under Test (CUT)

The CUT in this assignment is the same with assignment 1.
The class contains injected faults.

### Fault-Revealing Tests

We provide six test suites, which contains failing tests revealing the faults in the CUT.
The fault-revealing test suites can be found in `./src/test/fault-revealing-randoop[0-2]` and `./src/test/fault-revealing-evosuite[0-2]`.
Three of them are generated using `Randoop` and the other three are generated using `Evosuite`. 

### Environment

- Linux/Mac/Windows
- Java SDK 8
- Eclipse, 2020.12 version

### Libraries

- [Evosuite 1.0.6](https://www.evosuite.org/new-1-0-6-release/)
- [Soot 4.2.1](https://repo1.maven.org/maven2/org/soot-oss/soot/4.2.1/soot-4.2.1-jar-with-dependencies.jar)
- [JUnit 4.12](https://repo1.maven.org/maven2/junit/junit/4.12/junit-4.12.jar), with [hamcrest-1.3](https://repo1.maven.org/maven2/org/hamcrest/hamcrest-core/1.3/hamcrest-core-1.3.jar) (only needed if you get errors)

If you use `maven`, these dependencies have already been declared in `pom.xml`.
In case you want to use `jar` file of the libraries directly, we have already included them in `lib/`.

## Assignment Tasks

### Task 1: Test Case Generation with Evosuite (25%).

#### Requirements
- Use Evosuite to construct **5 test suites** for CUT. 
  The 5 test suites should achieve higher test coverage than those generated in assignment 1.
- Each test suite should achieve as high coverage as possible. 
You may try different Evosuite parameters to improve coverage.
  
#### Submissions

The 5 test suites generated by you, i.e., the folder `evosuite0`, `evosuite1`, `evosuite2`, `evosuite3`, and `evosuite4` in `src/test`.

For **each suite**, please submit **a screenshot** showing the line coverage and **a screenshot** for branch coverage, as we did in assignment 1. 
In total, you need to submit a folder containing **10 screenshots**. Each screenshot should be properly named to identify the corresponding line coverage or branch coverage. 
The submission should also include a **readme file** that records the commands (including the parameters) used by you to generate each test suite.

#### Grading Scheme:

1. *Test suites and readme files* (5%): Each test suite accounts for `1%` if it can be successfully executed.
2. *Line coverage* (10%): Score = (average line coverage of your test suites / highest average line coverage achieved by your classmates) * 10%
3. *Branch coverage* (10%): Score = (average branch coverage of your test suites / highest average branch coverage achieved by your classmates) * 10%

### Task 2: Fault Localization based on Soot (50%).

In this task, you need to design and implement an effective fault localization algorithm by yourself.

To help you with this task, we provide you with six test suites, located in `./src/test/fault-revealing-randoop[0-2]` and `./src/test/fault-revealing-evosuite[0-2]`.
The program will fail on some tests of these suites. 
Note that we need at least one failure for fault localization. 
You need to use these six given test suites for fault localization.
Through this exercise, you will appreciate that generated tests contain noises affecting the effectiveness of fault localization.

#### Requirements
- Instrument CUT with soot to collect necessary information during the running of tests.
- Run the **six fault-revealing test suites** we provide.
- Implement the classic fault localization algorithm **Ochiai** to compute the fault likelihood of each statement and generate a report for fault localization.

#### Notes
[This](reference_a2.pdf) research paper describes the **Ochiai** algorithm and can point you to the original papers of the algorithm.

Based on the report, you can check the source code and locate the faults. 
There are multiple bugs injected in the subject program and each of them is in single line. 
It is possible that some test suite cannot reveal all injected faults, but each fault is revealed by at least one test suite. 
You need to locate and fix them as many as bugs as you can.

#### Ranking of Suspicious Statements
The ranking of a statement with suspicious score $a$ should be computed  as $\frac{N+M+1}{2}$, where N is the number of statements whose suspicious scores are higher than $a$ and M is the number of statements whose suspicious scores are higher than or equal to $a$. For example, if a sequence of suspicious scores is (0.9, 0.8, 0.8, 0.8, 0.8, 0.7) their rankings are (1, 3, 3, 3, 3, 6), respectively.

#### Submissions

1. The source code of your program. 
   You can re-use your code in assignment 1. 
   Scripts to run your program and readme are required.
2. The spectrum reports of potential faulty statements running against **each** of the six test suits provided by us. 
   In total, you need to submit 6 reports. 
   Please name each of them in the format `spectrum_fl_ochiai_randoop[0-2].[csv|tsv]` and `spectrum_fl_ochiai_evosuite[0-2].[csv|tsv]`.
   Each spectrum report should in `csv` or `tsv` format and each line is in the format of "method signature,statement,suspicious score,ranking" or "method signature[TAB]statement[TAB]suspicious score[TAB]ranking".
   The report should be sorted according the descending order of suspicious scores.
   If multiple statements have the same scores, please sort them according to the alphabetical order of method signature and statement.
   The method signature could be obtained using Soot API [getMethod()](https://www.sable.mcgill.ca/soot/doc/soot/Body.html#getMethod()).
3. The reports of the faults found and fixed by you. 
   For each fault, you should create a `.txt` file and name it in the format `fault_[line-number].txt`, where `line-number` is the line number of the fault. 
   In each text file, please
    - Put down its location in source code; 
    - The corresponding fixing patch;
    - The rationale that it is a fault;
    - Its suspicious score and ranking in the reports generated by you.

#### Grading Scheme:

1. *Correctness of your program* (30%): We will check your implementation, and the report generated by your program.
2. *Fault Localization* (20%): If you successfully locate and fix M of our N injected faults. Your mark will be M/N*20%

### Task 3: Test Suite Extension (25%).

You may find that the top-ranked suspicious statements reported by your program are not real faults. 
In such circumstances, you may consider to enrich the test suite by adding manually-written ones. Through this exercise, you will appreciate the approach of collaborative fault localization, i.e., localizing faults through human-machine collaboration.

#### Requirements
- Extend each of the six given test suites to improve the fault-localization results in Task 2 by adding new tests. 
- You are not allowed to delete tests in the six given test suites. You can use the same set of manually-written tests to extend each of the given test suites.
- Your set of manually-written tests must not contain duplicates, which take the same test input and exercise the same code coverage.
- `Ochiai` ranking function should be used in ranking suspicious statements. 

#### Submissions

1. The six refined test suite (in java file).
   Put them in `./src/test/refined-[randoop|evosuite][0-2]` folder.
2. The spectrum reports of potential faulty statements running against the refined test suites. 
   In total, you need to submit six reports. Please name each of them in the format 
   `spectrum_fl_ochiai_refined_[randoop|evosuite][0-2].[csv|tsv]`.
3. A short report explaining your strategy to design test cases and compare the results before and after refinement.

#### Grading Scheme:
*Effectiveness of test cases* (25%). 
Your grade in this task is related to both your average ranking (as mentioned in Task 2) of each injected fault (the higher, the better), and the average number of manually-written tests you add in each test suite (the fewer, the better).

Your score of each faulty statement `s` is: Score<sub>s</sub> = (25% / 6N) * (`your ranking` - `default ranking`) / (`default ranking` - `highest ranking among classmates`), where N is the total number of injected faulty statements, and `default ranking` is the ranking based on the provided test suite.

Suppose `NT` represents the average number of manually-written tests that you have added to each of the given six test suite. 
The total grade is given by ΣScore<sub>s</sub> *  (`largest NT among classmates` - `your NT` + 1) / (`largest NT among classmates` - `smallest NT among classmates`)

**NOTE** We will run your refined test suites using our fault localization tool with `Ochiai` ranking function. 
So your score on task 2 will not be affected by the correctness of your implementation. 

### Bonus Task (12%)

Besides Ochiai, there are other fault localization algorithms. 
[This](reference_a2.pdf) research paper describes includes the other 3 algorithms: Tarantula, Jaccard, and AMPLE. 
You are encouraged to implement them as well.

#### Submissions:

1. The source code of your implementation.
2. The spectrum reports of potential faulty statements running against the fault-revealing test suits provided by us. 
   Since there are 3 algorithms, in total, you are required to submit 18 reports (6 test suites * 3 algorithms). 
   Please rename each of them using the format `spectrum_fl_[algorithm-name]_[randoop|evosuite][0-2].[csv|tsv]`

#### Grading Scheme: 
*Correctness of each algorithm*: We will check your implementation, and the report 
generated by your program. 
Each algorithm accounts for 4%.


## Assignment 2 Submission 

- You are required to submit your assignment to [CANVAS](https://canvas.ust.hk/courses/36243/assignments/142331).
- Please put all your code, screenshot, readme and etc. into a single folder and compress it to `comp5111asg02.zip`

The recommended folder structure is:

1. Put your code into `${PROJECT_ROOT}/src/main/java/`
2. If you do not use Java build tools, put the libraries jar files that your code depends on into `${PROJECT_ROOT}/lib/`
3. A `README` explaining how to run your code. 
   Put your running scripts (if you need) under `${PROJECT_ROOT}/scripts`
4. Put your screenshot into `${PROJECT_ROOT}/screenshots`
5. Put the test suites generated by you into `${PROJECT_ROOT}/src/test/evosuite[0-4]`, and the test suite refined by you into `${PROJECT_ROOT}/src/test/refined-[randoop|evosuite][0-2]`.
6. Put your fault-localization report into the folder that contains the corresponding test suite, e.g., `spectrum_fl_ochiai_randoop0.[csv|tsv]` in `./src/test/fault-revealing-randoop0`.
7. Put the reports of the faults found and fixed by you in `${PROJECT_ROOT}/faults`.
8. Put the explanation of your test case refinement strategy in `${PROJECT_ROOT}/src/test/refined-[randoop|evosuite][0-2]`.

