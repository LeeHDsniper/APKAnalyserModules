package org.apache.http.message;

import org.apache.http.annotation.NotThreadSafe;

@NotThreadSafe
public class ParserCursor
{
  private final int lowerBound;
  private int pos;
  private final int upperBound;
  
  public ParserCursor(int paramInt1, int paramInt2)
  {
    if (paramInt1 < 0) {
      throw new IndexOutOfBoundsException("Lower bound cannot be negative");
    }
    if (paramInt1 > paramInt2) {
      throw new IndexOutOfBoundsException("Lower bound cannot be greater then upper bound");
    }
    lowerBound = paramInt1;
    upperBound = paramInt2;
    pos = paramInt1;
  }
  
  public boolean atEnd()
  {
    return pos >= upperBound;
  }
  
  public int getLowerBound()
  {
    return lowerBound;
  }
  
  public int getPos()
  {
    return pos;
  }
  
  public int getUpperBound()
  {
    return upperBound;
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append('[');
    localStringBuilder.append(Integer.toString(lowerBound));
    localStringBuilder.append('>');
    localStringBuilder.append(Integer.toString(pos));
    localStringBuilder.append('>');
    localStringBuilder.append(Integer.toString(upperBound));
    localStringBuilder.append(']');
    return localStringBuilder.toString();
  }
  
  public void updatePos(int paramInt)
  {
    if (paramInt < lowerBound) {
      throw new IndexOutOfBoundsException("pos: " + paramInt + " < lowerBound: " + lowerBound);
    }
    if (paramInt > upperBound) {
      throw new IndexOutOfBoundsException("pos: " + paramInt + " > upperBound: " + upperBound);
    }
    pos = paramInt;
  }
}
