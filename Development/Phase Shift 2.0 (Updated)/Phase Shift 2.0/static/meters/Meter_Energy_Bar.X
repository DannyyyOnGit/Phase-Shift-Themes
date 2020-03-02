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

template TextureFilename {
 <a42790e1-7810-11cf-8f52-0040333594a3>
 STRING filename;
}


Frame life_meter {
 

 FrameTransformMatrix relative {
  1.000000,0.000000,0.000000,0.000000,0.000000,1.000000,0.000000,0.000000,0.000000,0.000000,1.000000,0.000000,0.000000,0.000000,0.000000,1.000000;;
 }

 ObjectMatrixComment object {
  1.000000,0.000000,0.000000,0.000000,0.000000,1.000000,0.000000,0.000000,0.000000,0.000000,1.000000,0.000000,0.000000,0.000000,0.000000,1.000000;;
 }

 Mesh mesh_l {
  10;
  20.672614;15.400907;-55.813274;,
  40.942666;14.988301;-55.813274;,
  40.942666;14.988301;-46.048272;,
  20.672614;15.400907;-46.048272;,
  61.181536;13.747054;-55.813274;,
  61.181536;13.747054;-46.048272;,
  81.358035;11.679085;-55.813274;,
  81.358035;11.679085;-46.048272;,
  101.441024;8.787578;-55.813274;,
  101.441024;8.787578;-46.048272;;
  8;
  3;0,2,1;,
  3;2,0,3;,
  3;1,5,4;,
  3;5,1,2;,
  3;4,7,6;,
  3;7,4,5;,
  3;6,9,8;,
  3;9,6,7;;

  MeshNormals normals {
   10;
   0.020351;0.999793;0.000000;,
   0.040792;0.999168;0.000000;,
   0.040792;0.999168;0.000000;,
   0.020351;0.999793;0.000000;,
   0.081604;0.996665;0.000000;,
   0.081604;0.996665;0.000000;,
   0.122260;0.992498;0.000000;,
   0.122260;0.992498;0.000000;,
   0.142508;0.989794;0.000000;,
   0.142508;0.989794;0.000000;;
   8;
   3;0,2,1;,
   3;2,0,3;,
   3;1,5,4;,
   3;5,1,2;,
   3;4,7,6;,
   3;7,4,5;,
   3;6,9,8;,
   3;9,6,7;;
  }

  MeshTextureCoords tc0 {
   10;
   0.000000;1.000000;,
   0.250000;1.000000;,
   0.250000;0.000000;,
   0.000000;0.000000;,
   0.500000;1.000000;,
   0.500000;0.000000;,
   0.750000;1.000000;,
   0.750000;0.000000;,
   1.000000;1.000000;,
   1.000000;0.000000;;
  }

  DeclData {
   1;
   1;0;5;1;;
   20;
   973263360,
   1065344816,
   1040212460,
   1065344825,
   1040212468,
   973300736,
   973263360,
   973291520,
   1048584328,
   1065344834,
   1048584328,
   973309952,
   1052774418,
   1065344842,
   1052774418,
   973318144,
   1056964510,
   1065344851,
   1056964510,
   973327360;
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
    1.000000;
    0.010000;0.010000;0.010000;;
    1.000000;1.000000;1.000000;;

    TextureFilename Diffuse {
     "meter_energy_bar_mask.png";
    }
   }
  }
 }
}