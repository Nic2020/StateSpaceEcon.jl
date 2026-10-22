##################################################################################
# This file is part of StateSpaceEcon.jl
# BSD 3-Clause License
# Copyright (c) 2020-2026, Bank of Canada
# All rights reserved.
##################################################################################

# Package quality checks, https://github.com/JuliaTesting/Aqua.jl
using Aqua

@testset "Aqua" begin
    Aqua.test_all(StateSpaceEcon;
        # TODO: indexing an MVTSeries with an empty tuple of model variables matches
        # both the StateSpaceEcon and the TimeSeriesEcon methods (simdata.jl)
        ambiguities=(broken=true,),
        # TODO: NoFinalCondition and HasFinalCondition are exported but not defined
        undefined_exports=(broken=true,),
        # TODO: used only in the tests
        stale_deps=(ignore=[:DelimitedFiles, :JLD2, :Suppressor],),
        # TODO: SuiteSparse has no version, so it cannot have a compat entry
        deps_compat=(ignore=[:SuiteSparse],),
        # StateSpaceEcon extends Base indexing of MVTSeries with model variables, and
        # transform/inverse_transform for matrices; these types are from the sibling packages
        piracies=(treat_as_own=[TimeSeriesEcon.MVTSeries, ModelBaseEcon.Model],),
    )
end
