using FileIO

struct Vertex
  pos::AbstractVector
  norm::AbstractVector
  texC::AbstractVector
  tan::AbstractVector
  bitan::AbstractVector
end

struct Texture
  id::UInt
  type::AbstractString
  path::AbstractString
end 
 
 struct Mesh
   vertices::AbstractVector{Vertex}  
   indices::AbstractVector{UInt}  
   textures::AbstractVector{Texture}  
   VAO::UInt
   
   function Mesh(verts::AbstractVector{Vertex},
     ind::AbstractVector{UInt},
     textr::AbstractVector{Texture})
     
     vertices = verts   
     indices = ind
     textures = textr   
     
     setUp()
   end