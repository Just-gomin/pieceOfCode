import {
  Pizza,
  CheesePizza,
  GreekPizza,
  PepperoniPizza,
  ClamPizza,
  VeggiePizza,
} from "../pizza/index";

/**
 * Pizza 객체를 생성하는 팩토리
 *
 * 클라이언트가 아주 많아질 수 있기 때문에,
 * 인스턴스 생성 부분을 분리시켜 구현을 변경할 때 한 군데에서 처리할 수 있도록 합니다.
 */
class SimplePizzaFactory {
  createPizza(type: string): Pizza {
    let pizza: Pizza;

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

    return pizza;
  }
}

/**
 * 피자 가게
 */
class PizzaStore {
  // 팩토리 주입
  constructor(private factory: SimplePizzaFactory) {}

  order(type: string) {
    let pizza: Pizza;

    // 팩토리를 사용한 피자 인스턴스 생성
    pizza = this.factory.createPizza(type);

    pizza.prepare();
    pizza.bake();
    pizza.cut();
    pizza.box();

    return pizza;
  }
}
