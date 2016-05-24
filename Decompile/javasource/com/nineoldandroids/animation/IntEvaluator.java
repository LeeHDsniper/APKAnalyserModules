package com.nineoldandroids.animation;

public class IntEvaluator
  implements TypeEvaluator<Integer>
{
  public IntEvaluator() {}
  
  public Integer evaluate(float paramFloat, Integer paramInteger1, Integer paramInteger2)
  {
    int i = paramInteger1.intValue();
    return Integer.valueOf((int)(i + (paramInteger2.intValue() - i) * paramFloat));
  }
}
