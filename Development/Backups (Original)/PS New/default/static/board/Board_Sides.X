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


Frame board_side_left_new {
 

 FrameTransformMatrix relative {
  1.000000,0.000000,0.000000,0.000000,0.000000,1.000000,0.000000,0.000000,0.000000,0.000000,1.000000,0.000000,0.000000,0.000000,0.000000,1.000000;;
 }

 ObjectMatrixComment object {
  1.000000,0.000000,0.000000,0.000000,0.000000,1.000000,0.000000,0.000000,0.000000,0.000000,1.000000,0.000000,0.000000,0.000000,0.000000,1.000000;;
 }

 Mesh mesh_b {
  8;
  -122.590656;-8.813958;-101.899078;,
  -121.878886;-5.420208;-101.899110;,
  -121.878886;-5.420210;611.60384;,
  -122.590656;-8.813958;611.60378;,
  -120.649075;-5.842918;-101.899078;,
  -120.649075;-5.842920;611.60384;,
  -119.690086;-7.532186;-101.899046;,
  -119.690086;-7.532186;611.60378;;
  6;
  3;0,2,1;,
  3;2,0,3;,
  3;1,5,4;,
  3;5,1,2;,
  3;4,7,6;,
  3;7,4,5;;

  MeshNormals normals {
   8;
   -0.978706;0.205266;0.000000;,
   -0.493840;0.869553;0.000000;,
   -0.493830;0.869558;0.000000;,
   -0.978706;0.205266;0.000000;,
   0.638665;0.769485;0.000000;,
   0.638668;0.769483;0.000000;,
   0.869639;0.493688;0.000000;,
   0.869639;0.493688;0.000000;;
   6;
   3;0,2,1;,
   3;2,0,3;,
   3;1,5,4;,
   3;5,1,2;,
   3;4,7,6;,
   3;7,4,5;;
  }

  MeshTextureCoords tc0 {
   8;
   0.000000;1.000000;,
   0.308429;1.000000;,
   0.308429;0.000000;,
   0.000000;0.000000;,
   0.691571;1.000000;,
   0.691571;0.000000;,
   1.000000;1.000000;,
   1.000000;0.000000;;
  }

  DeclData {
   1;
   1;0;5;1;;
   16;
   1000486848,
   1065270161,
   1050600208,
   1065270161,
   1050600208,
   1005444736,
   1000486848,
   1005444736,
   1060146808,
   1065270161,
   1060146808,
   1005444736,
   1065270160,
   1065270161,
   1065270160,
   1005444736;
  }

  MeshMaterialList mtls {
   1;
   6;
   0,
   0,
   0,
   0,
   0,
   0;

   Material Dflt_Material {
    0.588000;0.588000;0.588000;1.000000;;
    5.000000;
    0.900000;0.900000;0.900000;;
    0.000000;0.000000;0.000000;;
   }
  }
 }
}

Frame board_side_left_new001 {
 

 FrameTransformMatrix relative {
  1.000000,0.000000,0.000000,0.000000,0.000000,1.000000,0.000000,0.000000,0.000000,0.000000,1.000000,0.000000,0.000000,0.000000,0.000000,1.000000;;
 }

 ObjectMatrixComment object {
  1.000000,0.000000,0.000000,0.000000,0.000000,1.000000,0.000000,0.000000,0.000000,0.000000,1.000000,0.000000,0.000000,0.000000,0.000000,1.000000;;
 }

 Mesh mesh_b {
  8;
  122.590656;-8.813950;-101.899078;,
  122.590656;-8.814011;611.60378;,
  121.878886;-5.420263;611.60384;,
  121.878886;-5.420198;-101.899110;,
  120.649075;-5.842974;611.60384;,
  120.649075;-5.842909;-101.899078;,
  119.690086;-7.532239;611.60378;,
  119.690086;-7.532177;-101.899046;;
  6;
  3;0,2,1;,
  3;2,0,3;,
  3;3,4,2;,
  3;4,3,5;,
  3;5,6,4;,
  3;6,5,7;;

  MeshNormals normals {
   8;
   0.978706;0.205266;0.000000;,
   0.978706;0.205266;0.000000;,
   0.493830;0.869558;0.000000;,
   0.493840;0.869553;0.000000;,
   -0.638668;0.769483;0.000000;,
   -0.638665;0.769485;0.000000;,
   -0.869639;0.493688;0.000000;,
   -0.869639;0.493688;0.000000;;
   6;
   3;0,2,1;,
   3;2,0,3;,
   3;3,4,2;,
   3;4,3,5;,
   3;5,6,4;,
   3;6,5,7;;
  }

  MeshTextureCoords tc0 {
   8;
   0.000000;1.000000;,
   0.000000;0.000000;,
   0.308429;0.000000;,
   0.308429;1.000000;,
   0.691571;0.000000;,
   0.691571;1.000000;,
   1.000000;0.000000;,
   1.000000;1.000000;;
  }

  DeclData {
   1;
   1;0;5;1;;
   16;
   1000486848,
   1065270161,
   1000486848,
   1005444736,
   1050600208,
   1005444736,
   1050600208,
   1065270161,
   1060146808,
   1005444736,
   1060146808,
   1065270161,
   1065270160,
   1005444736,
   1065270160,
   1065270161;
  }

  MeshMaterialList mtls {
   1;
   6;
   0,
   0,
   0,
   0,
   0,
   0;

   Material Dflt_Material {
    0.588000;0.588000;0.588000;1.000000;;
    5.000000;
    0.900000;0.900000;0.900000;;
    0.000000;0.000000;0.000000;;
   }
  }
 }
}