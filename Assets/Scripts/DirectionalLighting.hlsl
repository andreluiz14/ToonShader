void GetMainLight_float(float3 worldPos, out half3 Direction, out half3 Color, out half Atten, out half ShadowAtten) 
{
#ifdef SHADERGRAPH_PREVIEW
	Direction = half3(0.5, 0.5, 0);
	Color = 1;
	Atten = 1;
	ShadowAtten = 1;
#else
	Light light = GetMainLight();
	Direction = light.direction;
	Color = light.color;
	Atten = light.distanceAttenuation;
	ShadowAtten = light.shadowAttenuation;
#endif
}
void GetLamberDiffuse_half(half3 lightDir, half3 normal, half atten, half shadowAtten, out half Diffuse, out half Attenuation)
{
	Attenuation = atten * shadowAtten;
	Diffuse = saturate(dot(normal, lightDir)) * Attenuation;
}
void DirectSpecular_half(half3 specular, half smoothness, half3 direction, half3 color,  half3 worldNormal, half3 worldView, out half3 Out)
{
	#ifdef SHADERGRAPH_PREVIEW
		Out = 0;
	#else
	smoothness = exp2(10 * smoothness +1);
	worldNormal = normalize(worldNormal);
	worldView = SafeNormalize(worldView);
	Out = LightingSpecular(color, direction, worldNormal, worldView, half4(specular, 0), smoothness);
	#endif
}
half3 LightingSpecular_half(half3 lightColor, half3 lightDir, half3 normal, half3 viewDir, half4 specular, half smoothness)
{
	float3 halfVec = SafeNormalize(float3(lightDir) + float3(viewDir));
	half NdotH = saturate(dot(normal, halfVec));
	half modifier = pow(NdotH, smoothness);
	half3 specularReflection = specular.rgb * modifier;
	return lightColor * specularReflection;
}