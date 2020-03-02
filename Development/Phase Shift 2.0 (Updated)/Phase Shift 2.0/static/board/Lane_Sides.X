xof 0303txt 0032
template Frame {
 <3d82ab46-62da-11cf-ab39-0020af71e433>
 [...]
}

template Matrix4x4 {
 <f6f23f45-7686-11cf-8f52-0040333594a3>
 array FLOAT matrix[16];
}

template FrameTransformMatrix {
 <f6f23f41-7686-11cf-8f52-0040333594a3>
 Matrix4x4 frameMatrix;
}

template ObjectMatrixComment {
 <95a48e28-7ef4-4419-a16a-ba9dbdf0d2bc>
 Matrix4x4 objectMatrix;
}

template Vector {
 <3d82ab5e-62da-11cf-ab39-0020af71e433>
 FLOAT x;
 FLOAT y;
 FLOAT z;
}

template MeshFace {
 <3d82ab5f-62da-11cf-ab39-0020af71e433>
 DWORD nFaceVertexIndices;
 array DWORD faceVertexIndices[nFaceVertexIndices];
}

template Mesh {
 <3d82ab44-62da-11cf-ab39-0020af71e433>
 DWORD nVertices;
 array Vector vertices[nVertices];
 DWORD nFaces;
 array MeshFace faces[nFaces];
 [...]
}

template MeshNormals {
 <f6f23f43-7686-11cf-8f52-0040333594a3>
 DWORD nNormals;
 array Vector normals[nNormals];
 DWORD nFaceNormals;
 array MeshFace faceNormals[nFaceNormals];
}

template Coords2d {
 <f6f23f44-7686-11cf-8f52-0040333594a3>
 FLOAT u;
 FLOAT v;
}

template MeshTextureCoords {
 <f6f23f40-7686-11cf-8f52-0040333594a3>
 DWORD nTextureCoords;
 array Coords2d textureCoords[nTextureCoords];
}

template VertexElement {
 <f752461c-1e23-48f6-b9f8-8350850f336f>
 DWORD Type;
 DWORD Method;
 DWORD Usage;
 DWORD UsageIndex;
}

template DeclData {
 <bf22e553-292c-4781-9fea-62bd554bdd93>
 DWORD nElements;
 array VertexElement Elements[nElements];
 DWORD nDWords;
 array DWORD data[nDWords];
}

template ColorRGBA {
 <35ff44e0-6c7c-11cf-8f52-0040333594a3>
 FLOAT red;
 FLOAT green;
 FLOAT blue;
 FLOAT alpha;
}

template ColorRGB {
 <d3e16e81-7835-11cf-8f52-0040333594a3>
 FLOAT red;
 FLOAT green;
 FLOAT blue;
}

template Material {
 <3d82ab4d-62da-11cf-ab39-0020af71e433>
 ColorRGBA faceColor;
 FLOAT power;
 ColorRGB specularColor;
 ColorRGB emissiveColor;
 [...]
}

template MeshMaterialList {
 <f6f23f42-7686-11cf-8f52-0040333594a3>
 DWORD nMaterials;
 DWORD nFaceIndexes;
 array DWORD faceIndexes[nFaceIndexes];
 [Material <3d82ab4d-62da-11cf-ab39-0020af71e433>]
}


Frame side_glows_new {
 

 FrameTransformMatrix relative {
  1.000000,0.000000,0.000000,0.000000,0.000000,1.000000,0.000000,0.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-0.466330,0.000000,1.000000;;
 }

 ObjectMatrixComment object {
  1.000000,0.000000,0.000000,0.000000,0.000000,1.000000,0.000000,0.000000,0.000000,0.000000,1.000000,0.000000,0.000000,0.000000,0.000000,1.000000;;
 }

 Mesh mesh_s {
  12;
  122.698496;-9.760479;-101.899411;,
  122.698496;-9.760480;611.64576;,
  121.305600;-9.759444;611.64576;,
  121.305613;-9.759443;-101.899411;,
  -122.698483;-9.760479;-101.899411;,
  -122.698483;-9.760480;611.64576;,
  -124.650714;-9.759444;611.64576;,
  -124.650701;-9.759443;-101.899411;,
  124.650726;-9.761514;-101.899411;,
  124.650714;-9.761516;611.64576;,
  -121.305587;-9.761514;-101.899411;,
  -121.305600;-9.761516;611.64576;;
  8;
  3;0,2,1;,
  3;2,0,3;,
  3;4,6,5;,
  3;6,4,7;,
  3;8,1,9;,
  3;1,8,0;,
  3;10,5,11;,
  3;5,10,4;;

  MeshNormals normals {
   12;
   0.000637;1.000000;0.000000;,
   0.000637;1.000000;0.000000;,
   0.000744;1.000000;0.000000;,
   0.000744;1.000000;0.000000;,
   0.000637;1.000000;0.000000;,
   0.000637;1.000000;0.000000;,
   0.000531;1.000000;0.000000;,
   0.000531;1.000000;0.000000;,
   0.000531;1.000000;0.000000;,
   0.000531;1.000000;0.000000;,
   0.000744;1.000000;0.000000;,
   0.000744;1.000000;0.000000;;
   8;
   3;0,2,1;,
   3;2,0,3;,
   3;4,6,5;,
   3;6,4,7;,
   3;8,1,9;,
   3;1,8,0;,
   3;10,5,11;,
   3;5,10,4;;
  }

  MeshTextureCoords tc0 {
   12;
   0.500002;1.000000;,
   0.499998;0.000000;,
   -0.000000;0.000000;,
   0.000004;1.000000;,
   0.500002;1.000000;,
   0.499998;0.000000;,
   -0.000000;0.000000;,
   0.000004;1.000000;,
   1.000000;1.000000;,
   0.999996;0.000000;,
   1.000000;1.000000;,
   0.999996;0.000000;;
  }

  DeclData {
   1;
   1;0;5;1;;
   24;
   1056964637,
   1065342178,
   1056964637,
   994013952,
   1056174280,
   994013952,
   1056174280,
   1065342178,
   1056964637,
   1065342178,
   1056964637,
   994013952,
   1056174280,
   994013952,
   1056174280,
   1065342178,
   1057359830,
   1065342178,
   1057359830,
   994013952,
   1057359830,
   1065342178,
   1057359830,
   994013952;
  }

  MeshMaterialList mtls {
   1;
   8;
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0;

   Material Dflt_Material {
    1.000000;1.000000;1.000000;1.000000;;
    10.000000;
    0.900000;0.900000;0.900000;;
    1.000000;1.000000;1.000000;;
   }
  }
 }
}