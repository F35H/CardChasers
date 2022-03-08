include("src/libbckend.jl")


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
