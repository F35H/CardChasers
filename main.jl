using GLFW

GLFW.glfwInit() #Move to Library Init File

GLFW.glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3)
GLFW.glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3)

GLFW.glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW.glfw_OPENGL_CORE_PROFILE)

GLFW.glfwWindowHint(GLFW_RESIZABLE, GLFW.glfw_FALSE)

GLFW.glfwWindowHint(GLFW_SAMPLES, 16)

GLFW.glfwWindowHint(GLFW_DOUBLEBUFFER, GLFW.glfw_TRUE)

GLFW.glfwWindowHint(GLFW_RED_BITS, 8)
GLFW.glfwWindowHint(GLFW_GREEN_BITS, 8)
GLFW.glfwWindowHint(GLFW_BLUE_BITS, 8)
GLFW.glfwWindowHint(GLFW_ALPHA_BITS, 8)

GLFW.glfwWindowHint(GLFW_DEPTH_BITS, 24)
GLFW.glfwWindowHint(GLFW_STENCIL_BITS, 8)

GLFW.glfwWINDOWHINT(GLFW_REFRESH_RATE, 60)

window = GLFW.CreateWindow(800, 800, "GLFW.jl")
GLFW.MakeContextCurrent(window)

# Loop until the user closes the window
while !GLFW.WindowShouldClose(window)

	# Render here

	# Swap front and back buffers
	GLFW.SwapBuffers(window)

	# Poll for and process events
	GLFW.PollEvents()
end

GLFW.DestroyWindow(window)
exit()
