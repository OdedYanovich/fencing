let counter = document.getElementById("counter");
export function updateCounter(c) {
	counter.textContent = c;
}
const scene = document.getElementById("scene")
const ctx = scene.getContext("2d")
function resizeCanvas() {
	scene.width = window.innerWidth;
	scene.height = window.innerHeight;
	setColor(0, 0, 0)
	ctx.fillRect(0, 0, window.innerWidth, window.innerHeight)

}
window.addEventListener("resize", resizeCanvas);
resizeCanvas();

export function draw(path) {
	ctx.fill(path);
}
export function setColor(r, g, b) {
	ctx.fillStyle = "rgb(" + r + " " + g + " " + b + ")"
}
export function startDrawing(x, y) {
	const path = new Path2D;
	path.moveTo(x, y);
	return path
}
export function lineTo(path, x, y) { path.lineTo(x, y); return path }

export function arcTo(path, x1, y1, x2, y2, radius) { path.arcTo(x1, y1, x2, y2, radius) }
export function screenWidth() {
	return window.innerWidth;
}

export function screenHeight() {
	return window.innerHeight;
}
export function drawRectangle(x, y, width, height) { ctx.fillRect(x, y, width, height) }
