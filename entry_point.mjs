import { init, update } from "./build/dev/javascript/fencing/fencing.mjs";

let state = init();
addEventListener("keydown", (event) => {
	if (event.repeat) return;
	state = update(state, event.key);
});
