# LaTeXChanges

[![Build Status](https://travis-ci.com/daschw/LaTeXChanges.jl.svg?branch=master)](https://travis-ci.com/daschw/LaTeXChanges.jl)
[![Build Status](https://ci.appveyor.com/api/projects/status/github/daschw/LaTeXChanges.jl?svg=true)](https://ci.appveyor.com/project/daschw/LaTeXChanges-jl)
[![Codecov](https://codecov.io/gh/daschw/LaTeXChanges.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/daschw/LaTeXChanges.jl)
[![Coveralls](https://coveralls.io/repos/github/daschw/LaTeXChanges.jl/badge.svg?branch=master)](https://coveralls.io/github/daschw/LaTeXChanges.jl?branch=master)
[![Build Status](https://api.cirrus-ci.com/github/daschw/LaTeXChanges.jl.svg)](https://cirrus-ci.com/github/daschw/LaTeXChanges.jl)

The [LaTeX changes](https://ctan.org/pkg/changes) packages can be used to highlight modifications in a LaTeX manuscript using `\added{}`, `\deleted{}`, and `\replaced{}{}`.
This Julia package provides a small function to apply all the changes in a LaTeX file and generate a clean final source.

## Install

```julia
]add https://github.com/daschw/LaTeXChanges.jl
```

## Usage

```julia
using LaTeXChanges
apply_changes(input_file, output_file = input_file)
```
