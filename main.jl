using GLFW
using GLTF
using ModernGL
using CSyntax

using Logging
using Dates

include("src/globVar.jl")
include("src/fileIO.jl")

using .errVar
using .glfwVar

include("src/exit.jl")
include("src/init.jl")

mainInit()
modelLoad("test.gltf")
#=
# render
while !GLFW.WindowShouldClose(win)
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)
    glUseProgram(program)
    glBindVertexArray(vao)
    glDrawArrays(GL_TRIANGLES, 0, 3)
    # check and call events
    GLFW.PollEvents()
    # swap the buffers
    GLFW.SwapBuffers(win)
end

mainExit()
=#