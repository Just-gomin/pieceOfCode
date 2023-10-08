import { Pizza } from "../interface/pizza";

export class PepperoniPizza implements Pizza {
  type: string = "pepperoni";
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
