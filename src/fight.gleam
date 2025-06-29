import gleam/list
import gleam/result
import gleam/string

pub type Combo {
  Combo(strength: Int, next: List(Int))
  Heal(strength: Int, next: List(Int))
}

// const levels2 = [
//   [Combo(1, [0, 1]), Combo(1, [0])],
//   [Combo(1, [0, 1]), Heal(1, [0, 1])],
//   [Combo(2, [0, 1]), Combo(1, [0, 1])],
//   [Combo(1, [1, 2]), Combo(1, [0, 1, 2]), Heal(1, [0, 1])],
//   [Combo(1, [0, 1, 2]), Combo(1, [0, 1, 2]), Combo(1, [0, 1, 2])],
// ]

const levels = [
  ["d", "fd"],
  ["df", "f", "j"],
  ["dfj", "fd", "j"],
  ["dfj", "fj", "jk", "kd"],
  ["temp"],
]

pub fn level(id) {
  let assert Ok(level) = list.range(1, 5) |> list.strict_zip(levels)
  let assert Ok(level) = level |> list.key_find(id)
  level
}

pub fn get_combo(level: List(String)) {
  level
  |> list.sample(1)
  |> list.first
  |> result.unwrap("")
}

pub fn attack(combo: String, user_action: String) {
  let #(current, others) = combo |> string.to_graphemes |> list.split(1)
  case current == [user_action] {
    True ->
      case others == [] {
        True -> Success
        False -> others |> list.fold("", fn(s, n) { s <> n }) |> Continue
      }
    False -> Failure
  }
}

pub type ComboResults {
  Continue(String)
  Success
  Failure
}
