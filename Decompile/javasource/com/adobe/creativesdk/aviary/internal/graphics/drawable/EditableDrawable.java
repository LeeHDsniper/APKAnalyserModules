package com.adobe.creativesdk.aviary.internal.graphics.drawable;

public abstract interface EditableDrawable
{
  public abstract void beginEdit();
  
  public abstract void endEdit();
  
  public abstract boolean getStrokeEnabled();
  
  public abstract CharSequence getText();
  
  public abstract int getTextColor();
  
  public abstract float getTextSize();
  
  public abstract int getTextStrokeColor();
  
  public abstract boolean isEditing();
  
  public abstract boolean isTextHint();
  
  public abstract void setBounds(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4);
  
  public abstract void setOnSizeChangeListener(OnSizeChange paramOnSizeChange);
  
  public abstract void setText(CharSequence paramCharSequence);
  
  public abstract void setText(String paramString);
  
  public abstract void setTextColor(int paramInt);
  
  public static abstract interface OnSizeChange
  {
    public abstract void onSizeChanged(EditableDrawable paramEditableDrawable, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4);
  }
}
