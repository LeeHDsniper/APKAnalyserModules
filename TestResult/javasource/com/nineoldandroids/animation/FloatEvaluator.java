package com.nineoldandroids.animation;

public class FloatEvaluator
  implements TypeEvaluator<Number>
{
  public FloatEvaluator() {}
  
  public Float evaluate(float paramFloat, Number paramNumber1, Number paramNumber2)
  {
    float f = paramNumber1.floatValue();
    return Float.valueOf((paramNumber2.floatValue() - f) * paramFloat + f);
  }
}
