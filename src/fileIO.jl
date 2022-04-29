include("globVar.jl")

using Logging
using Dates



  

function errPrint(lvl::Int, msg::AbstractString)
  if(lvl == 0)
    @info "$(Dates.now()) | $msg"
    return end
  if(lvl == 1)
    @warn "$(Dates.now()) | $msg"
    return end
  if(lvl == 2)
    @error "$(Dates.now()) | $msg"
    return end
end


