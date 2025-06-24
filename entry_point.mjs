import { init, main } from "./build/dev/javascript/fencing/fencing.mjs";
let state = init();
addEventListener("keydown", (event) => {
	if (event.repeat) return;
	state = main(state, event.key);
});
