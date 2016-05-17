package com.tencent.mobileqq.pb;

import java.io.IOException;

public final class PBFloatField
  extends PBPrimitiveField<Float>
{
  public static final PBFloatField __repeatHelper__ = new PBFloatField(0.0F, false);
  private float value = 0.0F;
  
  public PBFloatField(float paramFloat, boolean paramBoolean)
  {
    set(paramFloat, paramBoolean);
  }
  
  public void clear(Object paramObject)
  {
    if ((paramObject instanceof Float)) {}
    for (value = ((Float)paramObject).floatValue();; value = 0.0F)
    {
      setHasFlag(false);
      return;
    }
  }
  
  public int computeSize(int paramInt)
  {
    if (has()) {
      return CodedOutputStreamMicro.computeFloatSize(paramInt, value);
    }
    return 0;
  }
  
  protected int computeSizeDirectly(int paramInt, Float paramFloat)
  {
    return CodedOutputStreamMicro.computeFloatSize(paramInt, paramFloat.floatValue());
  }
  
  protected void copyFrom(PBField<Float> paramPBField)
  {
    paramPBField = (PBFloatField)paramPBField;
    set(value, paramPBField.has());
  }
  
  public float get()
  {
    return value;
  }
  
  public void readFrom(CodedInputStreamMicro paramCodedInputStreamMicro)
    throws IOException
  {
    value = paramCodedInputStreamMicro.readFloat();
    setHasFlag(true);
  }
  
  protected Float readFromDirectly(CodedInputStreamMicro paramCodedInputStreamMicro)
    throws IOException
  {
    return Float.valueOf(paramCodedInputStreamMicro.readFloat());
  }
  
  public void set(float paramFloat)
  {
    set(paramFloat, true);
  }
  
  public void set(float paramFloat, boolean paramBoolean)
  {
    value = paramFloat;
    setHasFlag(paramBoolean);
  }
  
  public void writeTo(CodedOutputStreamMicro paramCodedOutputStreamMicro, int paramInt)
    throws IOException
  {
    if (has()) {
      paramCodedOutputStreamMicro.writeFloat(paramInt, value);
    }
  }
  
  protected void writeToDirectly(CodedOutputStreamMicro paramCodedOutputStreamMicro, int paramInt, Float paramFloat)
    throws IOException
  {
    paramCodedOutputStreamMicro.writeFloat(paramInt, paramFloat.floatValue());
  }
}
