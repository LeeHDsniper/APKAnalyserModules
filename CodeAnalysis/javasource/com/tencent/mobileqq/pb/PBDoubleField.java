package com.tencent.mobileqq.pb;

import java.io.IOException;

public final class PBDoubleField
  extends PBPrimitiveField<Double>
{
  public static final PBDoubleField __repeatHelper__ = new PBDoubleField(0.0D, false);
  private double value = 0.0D;
  
  public PBDoubleField(double paramDouble, boolean paramBoolean)
  {
    set(paramDouble, paramBoolean);
  }
  
  public void clear(Object paramObject)
  {
    if ((paramObject instanceof Double)) {}
    for (value = ((Double)paramObject).doubleValue();; value = 0.0D)
    {
      setHasFlag(false);
      return;
    }
  }
  
  public int computeSize(int paramInt)
  {
    if (has()) {
      return CodedOutputStreamMicro.computeDoubleSize(paramInt, value);
    }
    return 0;
  }
  
  protected int computeSizeDirectly(int paramInt, Double paramDouble)
  {
    return CodedOutputStreamMicro.computeDoubleSize(paramInt, paramDouble.doubleValue());
  }
  
  protected void copyFrom(PBField<Double> paramPBField)
  {
    paramPBField = (PBDoubleField)paramPBField;
    set(value, paramPBField.has());
  }
  
  public double get()
  {
    return value;
  }
  
  public void readFrom(CodedInputStreamMicro paramCodedInputStreamMicro)
    throws IOException
  {
    value = paramCodedInputStreamMicro.readDouble();
    setHasFlag(true);
  }
  
  protected Double readFromDirectly(CodedInputStreamMicro paramCodedInputStreamMicro)
    throws IOException
  {
    return Double.valueOf(paramCodedInputStreamMicro.readDouble());
  }
  
  public void set(double paramDouble)
  {
    set(paramDouble, true);
  }
  
  public void set(double paramDouble, boolean paramBoolean)
  {
    value = paramDouble;
    setHasFlag(paramBoolean);
  }
  
  public void writeTo(CodedOutputStreamMicro paramCodedOutputStreamMicro, int paramInt)
    throws IOException
  {
    if (has()) {
      paramCodedOutputStreamMicro.writeDouble(paramInt, value);
    }
  }
  
  protected void writeToDirectly(CodedOutputStreamMicro paramCodedOutputStreamMicro, int paramInt, Double paramDouble)
    throws IOException
  {
    paramCodedOutputStreamMicro.writeDouble(paramInt, paramDouble.doubleValue());
  }
}
