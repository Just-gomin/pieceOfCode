import { Pizza } from "../interface/pizza";

export class GreekPizza implements Pizza {
  type: string = "greek";
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
