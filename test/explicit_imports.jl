##################################################################################
# This file is part of StateSpaceEcon.jl
# BSD 3-Clause License
# Copyright (c) 2020-2026, Bank of Canada
# All rights reserved.
##################################################################################

# Import hygiene checks, https://github.com/JuliaTesting/ExplicitImports.jl
using ExplicitImports

@testset "ExplicitImports" begin
    test_explicit_imports(StateSpaceEcon;
        # TODO: names used through `using X` without being listed
        no_implicit_imports=false,
        # TODO: rand! and @blasfunc are accessed via modules that do not own them.
        # libblastrampoline is owned by libblastrampoline_jll, which is not a dependency.
        all_qualified_accesses_via_owners=(ignore=(:rand!, Symbol("@blasfunc"), :libblastrampoline),),
        # use of non-public names is checked later
        all_explicit_imports_are_public=false,
        all_qualified_accesses_are_public=false,
    )
end
