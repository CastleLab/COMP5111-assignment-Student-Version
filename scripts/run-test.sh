#!/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
cd "$DIR"/.. || exit

arguments='0 '
arguments=$arguments'comp5111.assignment.cut.Regression_0_Test '
arguments=$arguments'comp5111.assignment.cut.ToolBox '
arguments=$arguments'comp5111.assignment.cut.ToolBox$ArrayTools '
arguments=$arguments'comp5111.assignment.cut.ToolBox$CharSequenceTools '
arguments=$arguments'comp5111.assignment.cut.ToolBox$CharTools '
arguments=$arguments'comp5111.assignment.cut.ToolBox$LocaleTools '
arguments=$arguments'comp5111.assignment.cut.ToolBox$RegExTools '
arguments=$arguments'comp5111.assignment.cut.ToolBox$StringTools'

mvn clean compile exec:java -Dexec.mainClass="comp5111.assignment.Assignment1" \
  -Dexec.args="$arguments"
