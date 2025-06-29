import ffi/dom
import shared.{Dom, Fight, FightId, Menu, MenuId}

pub fn new() {
  let #(instructions, one, two, three, four) = dom.get_elements()
  Dom(instructions:, one:, two:, three:, four:)
}

pub fn transition(state: shared.Model, new_mod: shared.ModId) {
  let swap = fn() {
    dom.visibility(state.dom.instructions)
    dom.visibility(state.dom.one)
    dom.visibility(state.dom.two)
    dom.visibility(state.dom.three)
    dom.visibility(state.dom.four)
  }
  case state.mod, new_mod {
    Menu, FightId -> swap()
    Fight(_), MenuId -> swap()
    _, _ -> panic
  }
}

pub fn instruct(element, str) {
  dom.write(element, str)
}
