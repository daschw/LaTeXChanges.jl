using Documenter, LaTeXChanges

makedocs(;
    modules=[LaTeXChanges],
    format=Documenter.HTML(),
    pages=[
        "Home" => "index.md",
    ],
    repo="https://github.com/daschw/LaTeXChanges.jl/blob/{commit}{path}#L{line}",
    sitename="LaTeXChanges.jl",
    authors="Daniel Schwabeneder",
    assets=String[],
)

deploydocs(;
    repo="github.com/daschw/LaTeXChanges.jl",
)
