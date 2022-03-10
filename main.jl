include("src/menuscene.jl")

#=
    Notes: 
    Remember to update libbckend with error update
=#

function julia_main()::Cint
    if(init())
        mainLoop()
        endLoop()
    else 
        println("Init Error")
    end
    return 0
end

julia_main()
