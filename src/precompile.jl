precompile(Tuple{typeof(DistributedNext.remotecall),Function,Int,Module,Vararg{Any, 100}})
precompile(Tuple{typeof(DistributedNext.procs)})
precompile(Tuple{typeof(DistributedNext.finalize_ref), DistributedNext.Future})
# This is disabled because it doesn't give much benefit
# and the code in Distributed is poorly typed causing many invalidations
# TODO: Maybe reenable now that Distributed is not in sysimage.
#=
    precompile_script *= """
    using Distributed
    addprocs(2)
    pmap(x->iseven(x) ? 1 : 0, 1:4)
    @distributed (+) for i = 1:100 Int(rand(Bool)) end
    """
=#
