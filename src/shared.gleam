import gleam/dynamic

pub type Model {
  Model(mod: Mod, dom: Dom)
}

pub type Mod {
  Menu
  Fight(body: FightBody)
}

pub type FightBody {
  FightBody(level: List(String), combo: String, score: Int)
}

pub type ModId {
  MenuId
  FightId
}

pub type Element =
  Int

pub type Dom {
  Dom(
    instructions: Element,
    one: Element,
    two: Element,
    three: Element,
    four: Element,
  )
}
