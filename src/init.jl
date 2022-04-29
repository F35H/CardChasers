include("fileIO.jl")

using .errVar
using .glfwVar

function errInit()
  global fstream
  
  try
    mkdir("txt")
    catch
    finally        
      logNum = length(
        readdir("txt"))
      logNum += 1
      
      if (logNum > 9)
        for f in readdir("txt")
          rm("txt/" * f) 
        end
        
        return errInit() 
      end    
       
      file = "txt/errLog"
      file = string(file,"$logNum")
      file = string(file, ".txt")
      
      fstream = open(file, "a+")
      logger = SimpleLogger( fstream )
      global_logger(logger) end
end

function systmInit()
  @static if Sys.isapple()
    errPrint(0, "Macintosh System") 
    GLFW.WindowHint(GLFW.CONTEXT_VERSION_MAJOR, 4)
    GLFW.WindowHint(GLFW.CONTEXT_VERSION_MINOR, 1)
    GLFW.WindowHint(GLFW.OPENGL_PROFILE, GLFW.OPENGL_CORE_PROFILE)
    GLFW.WindowHint(GLFW.OPENGL_FORWARD_COMPAT, GL_TRUE)
  else
    GLFW.DefaultWindowHints()
    errPrint(0, "Not Apple")  end
end

function winInit()
  global win

  win = GLFW.CreateWindow(640, 480, "Hello Triangle")
  if (win == C_NULL)
    errPrint(2, "Failed to open window, ending program")
    mainExit() end 
  
  GLFW.MakeContextCurrent(win)
end

function infoInit()
  renderer = unsafe_string(glGetString(GL_RENDERER))
  version = unsafe_string(glGetString(GL_VERSION))
  errPrint(0, "Renderder: $renderer")
  errPrint(0, "OpenGL version: $version")
  
  glEnable(GL_DEPTH_TEST)
  glDepthFunc(GL_LESS)
end

function mainInit()
  errInit()
  systmInit()
  winInit()
  infoInit()
end





