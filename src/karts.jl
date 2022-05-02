using FileIO

<<<<<<< HEAD
struct Vertex
=======
mutable struct Vertex
>>>>>>> 5f9517fcfc507bc9c83bc0ca5755ab4a4d01f653
  pos::AbstractVector
  norm::AbstractVector
  texC::AbstractVector
  tan::AbstractVector
  bitan::AbstractVector
end

<<<<<<< HEAD
struct Texture
=======
mutable struct Texture
>>>>>>> 5f9517fcfc507bc9c83bc0ca5755ab4a4d01f653
  id::UInt
  type::AbstractString
  path::AbstractString
end 
 
<<<<<<< HEAD
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
=======
 mutable struct Mesh
   verts::AbstractVector{Vertex}  
   indices::AbstractVector{UInt}  
   verts::AbstractVector{Texture}  
   VAO::UInt
   
   Mesh()  
>>>>>>> 5f9517fcfc507bc9c83bc0ca5755ab4a4d01f653
