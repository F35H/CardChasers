<<<<<<< HEAD
function modelLoad(file::AbstractString)
  mdl = GLTF.load("models/" * "$file")
  println("models/" * "$file")
 
  for b in mdl.buffers
    mdlBuff = [
      read("models/" * b.uri)]
  end 
  
  oc = occursion()
  ff = findfirst()
  srchName(x, key) =  x[
    ff(oc(key, x.name)),x]
   
  mdlPos = srchName(mdl.accessors, "positions") 
  mdlInd = srchName(mdl.accessors, "indices") 
  mdlTex = srchName(mdl.accessors, "texcoords") 
  mdlNorm = srchName(mdl.accessors, "normals") 
  
  posBV = mdl.bufferViews[mdlPos.bufferView]
  indBV = mdl.bufferViews[mdlInd.bufferView]
  texBV = mdl.bufferViews[mdlTex.bufferView]
  normBV = mdl.bufferViews[mdlNorm.bufferView]
  
  posBuff = mdlBuff[posBV.buffer]
  indBuff = mdlBuff[posBV.buffer]
  texBuff = mdlBuff[posBV.buffer]
  normBuff = mdlBuff[posBV.buffer]
  
  posVBO = GLuinit(0) 
  indVBO = GLuint(0)
  texVBO = GLuint(0)
  
  @c glGenBuffers(1, &posVBO)
  @c glGenBuffers(1, &indVBO)
  @c glGenBuffers(1, &texVBO)
  @c glGenBuffers(1, &normVBO)
  
  glBindBuffer(posBV.target, posVBO)
  glBindBuffer(indBV.target, indVBO)
  glBindBuffer(texBV.target, texVBO)
  glBindBuffer(normBV.target, normVBO)

  glBufferData(posBV.target,
     posBV.bytelength, C_NULL, GL_STATIC_DRAW)
  glBufferData(indBV.target,
     indBV.bytelength, C_NULL, GL_STATIC_DRAW)
  glBufferData(texBV.target,
     texBV.bytelength, C_NULL, GL_STATIC_DRAW)
  glBufferData(normBV.target,
     normBV.bytelength, C_NULL, GL_STATIC_DRAW)

  @c glBufferSubData(posBV.target, 0, posBV.byteLength, 
    &posBuff[posBV.byteOffset])      
  @c glBufferSubData(indBV.target, 0, indBV.byteLength, 
    &indBuff[indBV.byteOffset])      
  @c glBufferSubData(texBV.target, 0, texBV.byteLength, 
    &texBuff[texBV.byteOffset])      
  @c glBufferSubData(normBV.target, 0, normBV.byteLength, 
    &normBuff[normBV.byteOffset])      
    
  vao = GLuint(0)
  @c glGenVertexArrays(1, &vao)
  glBindVertexArray(vao)
  
  glBindBuffer(posBV.target, posVBO)  
  glBindBuffer(texBV.target, texVBO)  
  glBindBuffer(normBV.target, normVBO)
    
  glVertexAttribPointer(0, 3, pos.componentType, pos.normalized, 
    posBV.byteStride, Ptr{Cvoid}(pos.byteOffset))  
  glVertexAttribPointer(1, 3, tex.componentType, pos.normalized, 
    texBV.byteStride, Ptr{Cvoid}(pos.byteOffset))  
  glVertexAttribPointer(2, 3, norm.componentType, pos.normalized, 
    normBV.byteStride, Ptr{Cvoid}(pos.byteOffset))      
  
  return (vao, indBV, indVBO)
end
     
=======
include("globVar.jl")

using Logging
using Dates



  
>>>>>>> 5f9517fcfc507bc9c83bc0ca5755ab4a4d01f653

function errPrint(lvl::Int, msg::AbstractString)
  if(lvl == 0)
    @info "$(Dates.now()) | $msg"
    return end
  if(lvl == 1)
    @warn "$(Dates.now()) | $msg"
    return end
  if(lvl == 2)
    @error "$(Dates.now()) | $msg"
    return end
end


