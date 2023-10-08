import { Pizza } from "../interface/pizza";

export class ClamPizza implements Pizza {
  type: string = "clam";
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
