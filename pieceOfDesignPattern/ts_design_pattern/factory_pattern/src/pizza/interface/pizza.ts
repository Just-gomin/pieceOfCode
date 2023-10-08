export interface Pizza {
  type: string;

  prepare: Function;

  bake: Function;

  cut: Function;

  box: Function;
}
