import dom
import ffi/interop
import fight
import shared.{type Model, Fight, FightBody, FightId, Menu, Model}

pub fn update(state: Model, user_action) -> Model {
  interop.set_color(0, 0, 0)
  interop.draw_rectangle(0, 0, interop.screen_width(), interop.screen_height())

  case state.mod {
    Fight(fight) -> {
      let #(combo, score) = case fight.attack(fight.combo, user_action) {
        fight.Continue(combo) -> #(combo, fight.score)
        fight.Success -> #(fight.get_combo(fight.level), fight.score + 1)
        fight.Failure -> #(fight.get_combo(fight.level), fight.score - 1)
      }
      dom.instruct(state.dom.instructions, combo)
      case fight.score > 4 {
        False -> FightBody(level: fight.level, combo:, score:) |> Fight
        True -> Menu
      }
    }
    Menu -> {
      let level = fn(id) {
        let level = fight.level(id)
        let combo = fight.get_combo(level)
        dom.transition(state, FightId)
        dom.instruct(state.dom.instructions, combo)
        FightBody(level, combo, 0) |> Fight
      }
      case user_action {
        "d" -> level(1)
        "f" -> level(2)
        "g" -> level(3)
        "h" -> level(4)
        "j" -> level(5)
        _ -> Menu
      }
    }
  }
  |> Model(dom: state.dom)
}

pub fn init() -> Model {
  interop.set_color(0, 0, 0)
  interop.draw_rectangle(0, 0, interop.screen_width(), interop.screen_height())
  Model(Menu, dom.new())
}
