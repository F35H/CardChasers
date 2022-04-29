using FileIO

mutable struct Vertex
  pos::AbstractVector
  norm::AbstractVector
  texC::AbstractVector
  tan::AbstractVector
  bitan::AbstractVector
end

mutable struct Texture
  id::UInt
  type::AbstractString
  path::AbstractString
end 
 
 mutable struct Mesh
   verts::AbstractVector{Vertex}  
   indices::AbstractVector{UInt}  
   verts::AbstractVector{Texture}  
   VAO::UInt
   
   Mesh()  