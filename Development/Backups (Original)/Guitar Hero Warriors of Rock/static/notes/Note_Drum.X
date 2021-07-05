xof 0303txt 0032
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

template TextureFilename {
 <a42790e1-7810-11cf-8f52-0040333594a3>
 STRING filename;
}

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

template MeshMaterialList {
 <f6f23f42-7686-11cf-8f52-0040333594a3>
 DWORD nMaterials;
 DWORD nFaceIndexes;
 array DWORD faceIndexes[nFaceIndexes];
 [Material <3d82ab4d-62da-11cf-ab39-0020af71e433>]
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


Material Material__35 {
 0.588000;0.588000;0.588000;1.000000;;
 3.200000;
 0.000000;0.000000;0.000000;;
 0.000000;0.000000;0.000000;;

 TextureFilename {
  "Note_Cymbal_Yellow.png";
 }
}

Frame Box001 {
 

 FrameTransformMatrix {
  1.000000,0.000000,0.000000,0.000000,0.000000,0.783052,-1.153453,0.000000,0.000000,0.413679,0.280837,0.000000,-0.004659,6.091053,-1.709155,1.000000;;
 }

 Mesh  {
  16;
  -22.500000;0.000000;-22.500000;,
  22.500000;0.000000;-22.500000;,
  -22.500000;0.000000;22.500000;,
  22.500000;0.000000;22.500000;,
  -22.500000;1.000000;-22.500000;,
  22.500000;1.000000;-22.500000;,
  -22.500000;1.000000;22.500000;,
  22.500000;1.000000;22.500000;,
  -22.500000;0.000000;-22.500000;,
  22.500000;1.000000;-22.500000;,
  22.500000;0.000000;-22.500000;,
  -22.500000;1.000000;-22.500000;,
  22.500000;1.000000;22.500000;,
  22.500000;0.000000;22.500000;,
  -22.500000;1.000000;22.500000;,
  -22.500000;0.000000;22.500000;;
  12;
  3;0,3,2;,
  3;3,0,1;,
  3;4,7,5;,
  3;7,4,6;,
  3;8,9,10;,
  3;9,8,11;,
  3;10,12,13;,
  3;12,10,9;,
  3;13,14,15;,
  3;14,13,12;,
  3;15,11,8;,
  3;11,15,14;;

  MeshNormals  {
   6;
   0.000000;-1.000000;0.000000;,
   0.000000;1.000000;0.000000;,
   0.000000;0.000000;-1.000000;,
   1.000000;0.000000;0.000000;,
   0.000000;0.000000;1.000000;,
   -1.000000;0.000000;0.000000;;
   12;
   3;0,0,0;,
   3;0,0,0;,
   3;1,1,1;,
   3;1,1,1;,
   3;2,2,2;,
   3;2,2,2;,
   3;3,3,3;,
   3;3,3,3;,
   3;4,4,4;,
   3;4,4,4;,
   3;5,5,5;,
   3;5,5,5;;
  }

  MeshMaterialList  {
   1;
   12;
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0;
   { Material__35 }
  }

  MeshTextureCoords  {
   16;
   0.839006;0.248879;,
   0.172270;0.248879;,
   0.839006;0.048672;,
   0.172270;0.048672;,
   0.172270;0.248879;,
   0.839006;0.248879;,
   0.172270;0.048672;,
   0.839006;0.048672;,
   1.226348;0.456749;,
   1.226348;0.456749;,
   1.226348;0.456749;,
   1.226348;0.456749;,
   2.226348;0.456749;,
   2.226348;0.456749;,
   2.226348;0.456749;,
   2.226348;0.456749;;
  }
 }
}