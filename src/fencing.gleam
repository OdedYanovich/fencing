import ffi/interop

pub fn main(state, key) {
  let state =
    state
    + case key {
      "k" -> 3
      "j" -> -1
      _ -> 0
    }
  interop.update_counter(state)
  state
}

pub fn init() {
  0
}
