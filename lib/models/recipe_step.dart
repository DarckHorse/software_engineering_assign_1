class RecipeStep {
  String text;
  int time;

  RecipeStep(text, time) {
    //add any rules to reject invalid values
    //for example, reject negative gram amounts
    if (text == null)
      throw ArgumentError("Invalid step text");
    else if (text == "")
      throw ArgumentError("Invalid step text");
    else
      this.text = text;

    if (time == null)
      throw ArgumentError("Invalid step time");
    else if (time <= 0)
      throw ArgumentError("Invalid step time");
    else
      this.time = time;
  }
}
