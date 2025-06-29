let elements = ["instructions",
	"one",
	"two",
	"three",
	"four",
].map((element) => document.getElementById(element));
export function visibility(element) {
	elements[element].classList.toggle("hidden")
}
export function get_elements() {
	return [...elements.keys()]
}

export function write(element, text) {
	elements[element].textContent = text;
}
