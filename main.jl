include("src/exit.jl")
include("src/init.jl")

using GLFW
using ModernGL
using CSyntax

mainInit()

# hard-coded shaders
const vert_source = """
#version 410 core
in vec3 vp;
void main(void)
{
    gl_Position = vec4(vp, 1.0);
}"""
const frag_source = """
#version 410 core
out vec4 frag_colour;
void main(void)
{
    frag_colour = vec4(0.5, 0.0, 0.5, 1.0);
}"""

# compile shaders
vert_shader = glCreateShader(GL_VERTEX_SHADER)
glShaderSource(vert_shader, 1, Ptr{GLchar}[pointer(vert_source)], C_NULL)
glCompileShader(vert_shader)
frag_shader = glCreateShader(GL_FRAGMENT_SHADER)
glShaderSource(frag_shader, 1, Ptr{GLchar}[pointer(frag_source)], C_NULL)
glCompileShader(frag_shader)

# create and link shader program
program = glCreateProgram()
glAttachShader(program, vert_shader)
glAttachShader(program, frag_shader)
glLinkProgram(program)

# vertex data
points = GLfloat[ 0.0,  0.5, 0.0,
                  0.5, -0.5, 0.0,
                 -0.5, -0.5, 0.0]

# create buffers located in the memory of graphic card
vbo = GLuint(0)
@c glGenBuffers(1, &vbo)
glBindBuffer(GL_ARRAY_BUFFER, vbo)
glBufferData(GL_ARRAY_BUFFER, sizeof(points), points, GL_STATIC_DRAW)

# create VAO
vao = GLuint(0)
@c glGenVertexArrays(1, &vao)
glBindVertexArray(vao)
glBindBuffer(GL_ARRAY_BUFFER, vbo)
glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 0, C_NULL)
glEnableVertexAttribArray(0)

# set background color to gray
glClearColor(0.2, 0.2, 0.2, 1.0)

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
