# COMP5111 (Spring 2021) Assignment 1 - TA Implementation

## Contents

This TA implementation includes:
- Scripts to use Randoop to generate tests
- Statement/Branch/Line coverage measurement with Soot.

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

Checkout to `assignment1-TA_implementation` branch:
```bash
git checkout assignment1-TA_implementation
```

Generate tests using Randoop:
```bash
./scripts/randoop.sh
```

Run tests and measure coverage:
```bash
./scripts/run-tests.sh
```
Note that `run-tests.sh` script execute the main class `comp5111.assignment.Assignment1`, which takes the following 
positional arguments: 
- CoverageType: `0` for Statement; `1` for Branch; `2` for Line coverage
- Junit test suite class: e.g., `comp5111.assignment.cut.Regression_0_Test`
- Classes in CUT to instrument and measure coverage ...