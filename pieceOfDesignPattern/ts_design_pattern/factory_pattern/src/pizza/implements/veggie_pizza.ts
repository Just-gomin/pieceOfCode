import { Pizza } from "../interface/pizza";

export class VeggiePizza implements Pizza {
  type: string = "veggie";
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
