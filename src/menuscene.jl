include("menuverts.jl")
include("libbckend.jl")


function menuPre()
    mainMen()
end

function mainMen()
    pointGen(
        mMenButs.verts,
        mMenButs.ind,
        GL_STATIC_DRAW)
        
    glVertexAttribPointer(0,3, GL_FLOAT, false, 0, C_NULL)
    glEnableVertexAttribArray(0)
       
    glVertexAttribPointer(1,3, GL_FLOAT , false, 0, C_NULL)
    glEnableVertexAttribArray(1)
       
    glVertexAttribPointer(2,2, GL_FLOAT , false, 0, C_NULL)
    glEnableVertexAttribArray(2)
end
