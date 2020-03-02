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


Frame multiplier_meter {
 

 FrameTransformMatrix relative {
  1.000000,0.000000,0.000000,0.000000,0.000000,1.000000,0.000000,0.000000,0.000000,0.000000,1.000000,0.000000,0.000000,0.000000,0.000000,1.000000;;
 }

 ObjectMatrixComment object {
  1.000000,0.000000,0.000000,0.000000,0.000000,1.000000,0.000000,0.000000,0.000000,0.000000,1.000000,0.000000,0.000000,0.000000,0.000000,1.000000;;
 }

 Mesh mesh_m {
  10;
  -102.384384;8.779486;-55.813274;,
  -82.301651;11.673006;-55.813274;,
  -82.301651;11.673006;-46.048272;,
  -102.384384;8.779486;-46.048272;,
  -62.125357;13.742998;-55.813274;,
  -62.125357;13.742998;-46.048272;,
  -41.886592;14.986272;-55.813274;,
  -41.886592;14.986272;-46.048272;,
  -21.616581;15.400909;-55.813274;,
  -21.616581;15.400909;-46.048272;;
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
   -0.142607;0.989779;0.000000;,
   -0.122359;0.992486;0.000000;,
   -0.122359;0.992486;0.000000;,
   -0.142607;0.989779;0.000000;,
   -0.081704;0.996657;0.000000;,
   -0.081704;0.996657;0.000000;,
   -0.040892;0.999164;0.000000;,
   -0.040892;0.999164;0.000000;,
   -0.020451;0.999791;0.000000;,
   -0.020451;0.999791;0.000000;;
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