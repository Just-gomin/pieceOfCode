import {
  Pizza,
  CheesePizza,
  GreekPizza,
  PepperoniPizza,
  ClamPizza,
  VeggiePizza,
} from "../pizza/index";

/**
 * 문제가 있는 피자 가게 코드
 */
class PizzaStoreWithProblem {
  order(type: string) {
    let pizza: Pizza;

    // ------------------------------------------------------------
    /**
     * Problem
     *
     * 이 부분은 인스턴스를 만드는 구상 클래스를 선택하는 부분으로,
     * 피자 가게에서 메뉴가 변경되면 해당 부분의 코드를 계속해서 고쳐야합니다.
     */
    if (type === "cheese") {
      pizza = new CheesePizza();
    } else if (type === "greek") {
      pizza = new GreekPizza();
    } else if (type === "pepperoni") {
      pizza = new PepperoniPizza();
    } else if (type === "clam") {
      pizza = new ClamPizza();
    } else if (type === "veggie") {
      pizza = new VeggiePizza();
    } else {
      throw Error("No Menu");
    }
    // ------------------------------------------------------------

    pizza.prepare();
    pizza.bake();
    pizza.cut();
    pizza.box();

    return pizza;
  }
}
