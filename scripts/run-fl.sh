#!/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
cd "$DIR"/.. || exit

flAlgorithm='ochiai' # algorithms: ochiai, tarantula, jaccard, ample
testSuite='comp5111.assignment.cut.ToolBox_FaultRevealing3_ESTest' # test suite in src/test/asg2-grade

arguments="$flAlgorithm "
arguments=$arguments"$testSuite "
arguments=$arguments'comp5111.assignment.cut.ToolBox '
arguments=$arguments'comp5111.assignment.cut.ToolBox$ArrayTools '
arguments=$arguments'comp5111.assignment.cut.ToolBox$CharSequenceTools '
arguments=$arguments'comp5111.assignment.cut.ToolBox$CharTools '
arguments=$arguments'comp5111.assignment.cut.ToolBox$LocaleTools '
arguments=$arguments'comp5111.assignment.cut.ToolBox$RegExTools '
arguments=$arguments'comp5111.assignment.cut.ToolBox$StringTools'

mvn clean compile exec:java -Dexec.mainClass="comp5111.assignment.Assignment2" \
  -Dexec.args="$arguments"
