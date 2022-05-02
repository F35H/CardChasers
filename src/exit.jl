<<<<<<< HEAD
=======
include("globVar.jl")

using .errVar
using .glfwVar

>>>>>>> 5f9517fcfc507bc9c83bc0ca5755ab4a4d01f653
function errExit()
  global fstream
  
  flush(fstream)
  close(fstream)
end

function mainExit()
  errExit()
  
  GLFW.DestroyWindow(win)
end