package it.sephiroth.android.library.exif2;

public class Rational
{
  private final long mDenominator;
  private final long mNumerator;
  
  public Rational(long paramLong1, long paramLong2)
  {
    mNumerator = paramLong1;
    mDenominator = paramLong2;
  }
  
  public boolean equals(Object paramObject)
  {
    boolean bool = true;
    if (paramObject == null) {}
    do
    {
      return false;
      if (this == paramObject) {
        return true;
      }
    } while (!(paramObject instanceof Rational));
    paramObject = (Rational)paramObject;
    if ((mNumerator == mNumerator) && (mDenominator == mDenominator)) {}
    for (;;)
    {
      return bool;
      bool = false;
    }
  }
  
  public long getDenominator()
  {
    return mDenominator;
  }
  
  public long getNumerator()
  {
    return mNumerator;
  }
  
  public String toString()
  {
    return mNumerator + "/" + mDenominator;
  }
}
