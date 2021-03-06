uniform float uTime;
uniform float uSize;
uniform float uPixelRatio;
uniform float uMove;

varying vec2 vUv;
varying vec4 vColor;

attribute vec4 aColor;
attribute float aPuissance;
attribute float aPositionZ;

void main()
{
    vec4 modelPosition = modelMatrix * vec4(position, 1.0);
    modelPosition.z += (sin(modelPosition.y * 2.5 - uTime) * 0.07) + (uMove * (aPositionZ * 3.0)) * (- aPuissance * (uMove)) 
    + (sin(modelPosition.x * 2.5 - uTime) * 0.07) + (uMove * (aPositionZ * 3.0)) * (- aPuissance * (uMove));

    vec4 viewPosition = viewMatrix * modelPosition;
    vec4 projectionPosition = projectionMatrix * viewPosition;

    gl_Position = projectionPosition;
    gl_PointSize = uSize * 1.5 * uPixelRatio;

    vUv = uv;
    vColor = aColor;
}