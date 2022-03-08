
using GLFW
using FreeType
using WAV

function init()
    global GLFW
    global FreeType
    
    GLFW.WindowHint(GLFW.CONTEXT_VERSION_MAJOR, 3)
    GLFW.WindowHint(GLFW.CONTEXT_VERSION_MINOR, 3)

    GLFW.WindowHint(GLFW.OPENGL_PROFILE, GLFW.OPENGL_CORE_PROFILE)

    GLFW.WindowHint(GLFW.RESIZABLE, false)

    GLFW.WindowHint(GLFW.SAMPLES, 16)

    GLFW.WindowHint(GLFW.DOUBLEBUFFER, true)

    GLFW.WindowHint(GLFW.RED_BITS, 8)
    GLFW.WindowHint(GLFW.GREEN_BITS, 8)
    GLFW.WindowHint(GLFW.BLUE_BITS, 8)
    GLFW.WindowHint(GLFW.ALPHA_BITS, 8)

    GLFW.WindowHint(GLFW.DEPTH_BITS, 24)
    GLFW.WindowHint(GLFW.STENCIL_BITS, 8)

    GLFW.WindowHint(GLFW.REFRESH_RATE, 60)
    
    global window = GLFW.CreateWindow(1000, 800, "Card Chasers")
    global library = Ref{FT_Library}()
    
    error = FT_Init_FreeType(library)
    if (error != 0)
        return false
    elseif (window == false)
        return false
    end 
    
    GLFW.MakeContextCurrent(window)
    return true
end 

function mainLoop()
    global GLFW
    global window

    # Loop until the user closes the window
    while !GLFW.WindowShouldClose(window)

    # Render here

    # Swap front and back buffers
    GLFW.SwapBuffers(window)

    # Poll for and process events
    GLFW.PollEvents()
    end
end

function endLoop()
    global GLFW
    global window

    GLFW.DestroyWindow(window)
    exit()
end
