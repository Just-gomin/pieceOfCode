import {
  Pizza,
  CheesePizza,
  GreekPizza,
  PepperoniPizza,
  ClamPizza,
  VeggiePizza,
} from "../pizza/index";

interface PizzaFactory {
  createPizza(type: string): Pizza;
}

class NYPizzaFactory implements PizzaFactory {
  createPizza(type: string): Pizza {
    let pizza: Pizza;

    if (type === "cheese") {
      pizza = new CheesePizza();
    } else if (type === "greek") {
      pizza = new GreekPizza();
    } else if (type === "veggie") {
      pizza = new VeggiePizza();
    } else {
      throw Error("No Menu");
    }

    return pizza;
  }
}

class ChicagoPizzaFactory implements PizzaFactory {
  createPizza(type: string): Pizza {
    let pizza: Pizza;

    if (type === "cheese") {
      pizza = new CheesePizza();
    } else if (type === "pepperoni") {
      pizza = new PepperoniPizza();
    } else if (type === "clam") {
      pizza = new ClamPizza();
    } else {
      throw Error("No Menu");
    }

    return pizza;
  }
}

class CaliforniaPizzaFactory implements PizzaFactory {
  createPizza(type: string): Pizza {
    let pizza: Pizza;

    if (type === "cheese") {
      pizza = new CheesePizza();
    } else if (type === "greek") {
      pizza = new GreekPizza();
    } else if (type === "veggie") {
      pizza = new VeggiePizza();
    } else {
      throw Error("No Menu");
    }

    return pizza;
  }
}

class PizzaStore {
  constructor(private factory: PizzaFactory) {}

  order(type: string) {
    let pizza: Pizza;

    pizza = this.factory.createPizza(type);

    pizza.prepare();
    pizza.bake();
    pizza.cut();
    pizza.box();

    return pizza;
  }
}

// ------------------------------------------------------------
/**
 * Problem
 *
 * 피자 가게 지점이 여러지역에 생기게 됐고, 각 지역의 피자 스타일을 살리기 위해 Factory를 여러개 생성했습니다.
 * 하지만 각각의 팩토리에서 create 함수를 구현하며 프렌차이즈이지만 동일한 피자에 대해 지역마다 맛이 달라졌습니다.
 */
const nyPizzaFactory = new NYPizzaFactory();
const nyPizzaStore = new PizzaStore(nyPizzaFactory);
nyPizzaStore.order("veggie");

const chicagoPizzaFactory = new ChicagoPizzaFactory();
const chicagoPizzaStore = new PizzaStore(chicagoPizzaFactory);
chicagoPizzaStore.order("pepperoni");

const californiaPizzaFactory = new CaliforniaPizzaFactory();
const californiaPizzaStore = new PizzaStore(californiaPizzaFactory);
californiaPizzaStore.order("greek");
// ------------------------------------------------------------
