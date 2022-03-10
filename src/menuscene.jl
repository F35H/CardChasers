include("menuverts.jl")
include("libbackend.jl")

module mMenuScene()
    function mainMen()
        using ModernGL
        using mMenButs
        
        @pointGen(verts,ind,GL_STATIC_DRAW)
       
        ModernGL.glVertexAttribPointer(0,3,ModernGL.GL_FLOAT,false, 0, C_NULL)
        ModernGL.glEnableVertexAttribArray(0)
       
        ModernGL.glVertexAttribPointer(0,3,ModernGL.GL_FLOAT,false, 0, C_NULL)
        ModernGL.glEnableVertexAttribArray(1)
       
        ModernGL.glVertexAttribPointer(0,3,ModernGL.GL_FLOAT,false, 0, C_NULL)
        ModernGL.glEnableVertexAttribArray(2)
        
    end
end
