import { Pizza } from "../interface/pizza";

export class CheesePizza implements Pizza {
  type: string = "cheese";

  prepare() {
    console.log("prepare");
  }

  bake() {
    console.log("bake");
  }

  cut() {
    console.log("cut");
  }

  box() {
    console.log("box");
  }
}
