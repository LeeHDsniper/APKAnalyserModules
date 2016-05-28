package com.adobe.creativesdk.aviary.internal.headless.filters;

import android.graphics.PointF;
import android.util.Log;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaPointParameter;
import java.io.Serializable;
import org.json.JSONException;
import org.json.JSONObject;

public class MoaJavaToolStrokeResult
  implements Serializable, Cloneable
{
  private long n_ptr = 0L;
  
  public MoaJavaToolStrokeResult()
  {
    this(nativeCtor());
  }
  
  MoaJavaToolStrokeResult(long paramLong)
  {
    Log.i("MoaJavaToolStrokeResult", "MoaJavaToolStrokeResult(" + paramLong + ")");
    n_ptr = paramLong;
  }
  
  static native long nativeClone(long paramLong);
  
  static native long nativeCtor();
  
  static native void nativeDispose(long paramLong);
  
  static native int nativeGetBrushMode(long paramLong);
  
  static native int nativeGetColorSelected(long paramLong);
  
  static native float nativeGetOffsetPointX(long paramLong);
  
  static native float nativeGetOffsetPointY(long paramLong);
  
  static native void nativeSetBrushMode(long paramLong, int paramInt);
  
  static native void nativeSetColorSelected(long paramLong, int paramInt);
  
  static native void nativeSetOffsetPoint(long paramLong, float paramFloat1, float paramFloat2);
  
  public Object clone()
    throws CloneNotSupportedException
  {
    Log.i("MoaJavaToolStrokeResult", "clone");
    return new MoaJavaToolStrokeResult(nativeClone(n_ptr));
  }
  
  public JSONObject encode()
    throws JSONException
  {
    PointF localPointF = getOffsetPoint();
    JSONObject localJSONObject = new JSONObject();
    localJSONObject.put("colorselected", getColorSelected());
    localJSONObject.put("brushmode", getBrushMode().ordinal());
    localJSONObject.put("offsetpoint", MoaPointParameter.encode(x, y));
    return localJSONObject;
  }
  
  protected void finalize()
    throws Throwable
  {
    Log.i("MoaJavaToolStrokeResult", "finalize");
    nativeDispose(n_ptr);
    super.finalize();
  }
  
  public NativeToolFilter.BrushMode getBrushMode()
  {
    int i = nativeGetBrushMode(n_ptr);
    if ((i < 0) || (i >= NativeToolFilter.BrushMode.values().length)) {
      return null;
    }
    return NativeToolFilter.BrushMode.values()[i];
  }
  
  public int getColorSelected()
  {
    return nativeGetColorSelected(n_ptr);
  }
  
  public PointF getOffsetPoint()
  {
    return new PointF(nativeGetOffsetPointX(n_ptr), nativeGetOffsetPointY(n_ptr));
  }
  
  public long getPointer()
  {
    return n_ptr;
  }
  
  public void setBrushMode(NativeToolFilter.BrushMode paramBrushMode)
  {
    nativeSetBrushMode(n_ptr, paramBrushMode.ordinal());
  }
  
  public void setColorSelected(int paramInt)
  {
    nativeSetColorSelected(n_ptr, paramInt);
  }
  
  public void setOffsetPoint(float paramFloat1, float paramFloat2)
  {
    nativeSetOffsetPoint(n_ptr, paramFloat1, paramFloat2);
  }
  
  public String toString()
  {
    if (n_ptr != 0L)
    {
      PointF localPointF = getOffsetPoint();
      return "MoaJavaToolStrokeResult [colorSelected: 0x" + Integer.toHexString(getColorSelected()) + ", offsetPoint: " + x + "x" + y + ", brushMode: " + getBrushMode() + "]";
    }
    return "MoaJavaToolStrokeResult{NULL}";
  }
}
