# COMP5111 (Spring 2021) Assignment 2 - TA Implementation

## Contents

This TA implementation includes:
- Scripts to use Evosuite to generate tests
- Statement-level fault localization.
    - supporting `ochiai`, `tarantula`, `jaccard`, `ample` algorithm.

## Prerequisites

- Java: `1.8`
- Maven: `^3.8.0`
- Unix-based OS: `MacOS` or `Linux`

Note: The source code should work on Windows, but the scripts are not. You may need to write your own scripts on 
Windows.

## Usage

Clone this repo:
```bash
git clone https://github.com/CastleLab/COMP5111-assignment-Student-Version.git && cd COMP5111-assignment-Student-Version
```

Checkout to `assignment2-TA_implementation` branch:
```bash
git checkout assignment2-TA_implementation
```

Generate tests using Randoop:
```bash
./scripts/evosuite.sh
```
This script runs Evosuite five times, and generate five test suites in `src/test/evosuite[0-4]`.

Run fault localization:
```bash
./scripts/run-fl.sh
```
Note that `run-fl.sh` script execute the main class `comp5111.assignment.Assignment2`, which takes the following 
positional arguments: 
- Fault localization algorithm: `ochiai`, `tarantula`, `jaccard`, `ample`
- Junit test suite class: e.g., `comp5111.assignment.cut.ToolBox_FaultRevealing3_ESTest`
- Classes in CUT to instrument ...

## Grading-related

The grading of task 2 and bonus task uses the test suite located at `src/test/asg2-grade`.