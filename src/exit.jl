function errExit()
  global fstream
  
  flush(fstream)
  close(fstream)
end

function mainExit()
  errExit()
  
  GLFW.DestroyWindow(win)
end