using LaTeXChanges
using Test

test = joinpath(@__DIR__, "test.tex")
test_clean = joinpath(@__DIR__, "test_clean.tex")
test_applied = joinpath(@__DIR__, "test_applied.tex")

apply_changes(test, test_applied)

@testset "LaTeXChanges.jl" begin
    @test readlines(test_clean) == readlines(test_applied)
end
