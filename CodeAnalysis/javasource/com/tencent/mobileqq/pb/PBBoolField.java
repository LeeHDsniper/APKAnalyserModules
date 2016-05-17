package com.tencent.mobileqq.pb;

import java.io.IOException;

public final class PBBoolField
  extends PBPrimitiveField<Boolean>
{
  public static final PBBoolField __repeatHelper__ = new PBBoolField(false, false);
  private boolean value = false;
  
  public PBBoolField(boolean paramBoolean1, boolean paramBoolean2)
  {
    set(paramBoolean1, paramBoolean2);
  }
  
  public void clear(Object paramObject)
  {
    if ((paramObject instanceof Boolean)) {}
    for (value = ((Boolean)paramObject).booleanValue();; value = false)
    {
      setHasFlag(false);
      return;
    }
  }
  
  public int computeSize(int paramInt)
  {
    if (has()) {
      return CodedOutputStreamMicro.computeBoolSize(paramInt, value);
    }
    return 0;
  }
  
  protected int computeSizeDirectly(int paramInt, Boolean paramBoolean)
  {
    return CodedOutputStreamMicro.computeBoolSize(paramInt, paramBoolean.booleanValue());
  }
  
  protected void copyFrom(PBField<Boolean> paramPBField)
  {
    paramPBField = (PBBoolField)paramPBField;
    set(value, paramPBField.has());
  }
  
  public boolean get()
  {
    return value;
  }
  
  public void readFrom(CodedInputStreamMicro paramCodedInputStreamMicro)
    throws IOException
  {
    value = paramCodedInputStreamMicro.readBool();
    setHasFlag(true);
  }
  
  protected Boolean readFromDirectly(CodedInputStreamMicro paramCodedInputStreamMicro)
    throws IOException
  {
    return Boolean.valueOf(paramCodedInputStreamMicro.readBool());
  }
  
  public void set(boolean paramBoolean)
  {
    set(paramBoolean, true);
  }
  
  public void set(boolean paramBoolean1, boolean paramBoolean2)
  {
    value = paramBoolean1;
    setHasFlag(paramBoolean2);
  }
  
  public void writeTo(CodedOutputStreamMicro paramCodedOutputStreamMicro, int paramInt)
    throws IOException
  {
    if (has()) {
      paramCodedOutputStreamMicro.writeBool(paramInt, value);
    }
  }
  
  protected void writeToDirectly(CodedOutputStreamMicro paramCodedOutputStreamMicro, int paramInt, Boolean paramBoolean)
    throws IOException
  {
    paramCodedOutputStreamMicro.writeBool(paramInt, paramBoolean.booleanValue());
  }
}
