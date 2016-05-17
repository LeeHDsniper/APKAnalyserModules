package com.tencent.mobileqq.pb;

import java.io.IOException;

public final class PBStringField
  extends PBPrimitiveField<String>
{
  public static final PBStringField __repeatHelper__ = new PBStringField("", false);
  private String value = "";
  
  public PBStringField(String paramString, boolean paramBoolean)
  {
    set(paramString, paramBoolean);
  }
  
  public void clear(Object paramObject)
  {
    if ((paramObject instanceof String)) {}
    for (value = ((String)paramObject);; value = "")
    {
      setHasFlag(false);
      return;
    }
  }
  
  public int computeSize(int paramInt)
  {
    if (has()) {
      return CodedOutputStreamMicro.computeStringSize(paramInt, value);
    }
    return 0;
  }
  
  protected int computeSizeDirectly(int paramInt, String paramString)
  {
    return CodedOutputStreamMicro.computeStringSize(paramInt, paramString);
  }
  
  protected void copyFrom(PBField<String> paramPBField)
  {
    paramPBField = (PBStringField)paramPBField;
    set(value, paramPBField.has());
  }
  
  public String get()
  {
    return value;
  }
  
  public void readFrom(CodedInputStreamMicro paramCodedInputStreamMicro)
    throws IOException
  {
    value = paramCodedInputStreamMicro.readString();
    setHasFlag(true);
  }
  
  protected String readFromDirectly(CodedInputStreamMicro paramCodedInputStreamMicro)
    throws IOException
  {
    return paramCodedInputStreamMicro.readString();
  }
  
  public void set(String paramString)
  {
    set(paramString, true);
  }
  
  public void set(String paramString, boolean paramBoolean)
  {
    value = paramString;
    setHasFlag(paramBoolean);
  }
  
  public void writeTo(CodedOutputStreamMicro paramCodedOutputStreamMicro, int paramInt)
    throws IOException
  {
    if (has()) {
      paramCodedOutputStreamMicro.writeString(paramInt, value);
    }
  }
  
  protected void writeToDirectly(CodedOutputStreamMicro paramCodedOutputStreamMicro, int paramInt, String paramString)
    throws IOException
  {
    paramCodedOutputStreamMicro.writeString(paramInt, paramString);
  }
}
