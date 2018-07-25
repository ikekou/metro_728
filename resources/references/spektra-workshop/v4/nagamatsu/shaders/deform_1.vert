uniform float time;

out struct Vert {
	vec4 posInWorld;
	vec4 posInProj;
	vec4 color;
	vec3 normalInWorld;
} vVert;
out float noiseFactor;
flat out int cameraIndex;

void main() {
	noiseFactor = TDPerlinNoise(P * 2. + time * 0.1) * 0.1 * (sin(time) + 1.0);
	vec4 worldSpacePos = TDDeform(P);

	vVert.posInWorld = worldSpacePos;
	vVert.posInProj = TDWorldToProj(worldSpacePos);
	vVert.color = TDInstanceColor(Cd);
	vVert.normalInWorld = TDDeformNorm(N);

	cameraIndex = TDCameraIndex();

}
