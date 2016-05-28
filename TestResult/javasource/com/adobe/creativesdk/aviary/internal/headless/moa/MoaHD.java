package com.adobe.creativesdk.aviary.internal.headless.moa;

import android.graphics.Bitmap.CompressFormat;
import com.adobe.creativesdk.aviary.internal.headless.AdobeImageExecutionException;
import com.adobe.creativesdk.aviary.internal.headless.filters.NativeFilterProxy;
import java.io.FileDescriptor;
import java.io.Serializable;
import org.json.JSONException;

public class MoaHD
  implements Serializable
{
  private static final long serialVersionUID = 8520783327148903183L;
  private boolean disposed = false;
  private long m_ptr = m_nativeCtor();
  
  public MoaHD() {}
  
  static native boolean m_getOriginalEnabled(long paramLong);
  
  private native int m_height(long paramLong);
  
  private native void m_nativeApplyActions(long paramLong, String paramString);
  
  private native long m_nativeCtor();
  
  private native void m_nativeDispose(long paramLong);
  
  private native boolean m_nativeIsLoaded(long paramLong);
  
  private native boolean m_nativeIsValid(long paramLong);
  
  private native int m_nativeLoad(long paramLong, int paramInt);
  
  private native int m_nativeLoad(long paramLong, FileDescriptor paramFileDescriptor);
  
  private native int m_nativeLoad(long paramLong, String paramString);
  
  private native int m_nativeSave(long paramLong, String paramString);
  
  private native int m_nativeSaveWithQualityAndConfig(long paramLong, String paramString, int paramInt1, int paramInt2);
  
  private native int m_nativeUnload(long paramLong);
  
  static native int m_revert(long paramLong);
  
  static native void m_setMaxMegaPixels(long paramLong, int paramInt);
  
  static native void m_setOriginalEnabled(long paramLong, boolean paramBoolean);
  
  private native int m_width(long paramLong);
  
  static int nativeFormat(Bitmap.CompressFormat paramCompressFormat)
  {
    switch (1.$SwitchMap$android$graphics$Bitmap$CompressFormat[paramCompressFormat.ordinal()])
    {
    case 1: 
    default: 
      return 0;
    }
    return 1;
  }
  
  public void applyActions(MoaActionList paramMoaActionList)
    throws JSONException
  {
    applyActions(NativeFilterProxy.encodeActions(paramMoaActionList));
  }
  
  public void applyActions(String paramString)
  {
    m_nativeApplyActions(m_ptr, paramString);
  }
  
  public void dispose()
  {
    m_nativeDispose(m_ptr);
    m_ptr = 0L;
    disposed = true;
  }
  
  public boolean getOriginalEnabled()
  {
    return m_getOriginalEnabled(m_ptr);
  }
  
  public boolean isLoaded()
  {
    return m_nativeIsLoaded(m_ptr);
  }
  
  public void load(FileDescriptor paramFileDescriptor)
    throws AdobeImageExecutionException
  {
    int i = m_nativeLoad(m_ptr, paramFileDescriptor);
    if (i > 0) {
      throw AdobeImageExecutionException.fromInt(i);
    }
  }
  
  public void load(String paramString)
    throws AdobeImageExecutionException
  {
    int i = m_nativeLoad(m_ptr, paramString);
    if (i > 0) {
      throw AdobeImageExecutionException.fromInt(i);
    }
  }
  
  public void revert()
    throws AdobeImageExecutionException
  {
    int i = m_revert(m_ptr);
    if (i > 0) {
      throw AdobeImageExecutionException.fromInt(i);
    }
  }
  
  public void save(String paramString, int paramInt, Bitmap.CompressFormat paramCompressFormat)
    throws AdobeImageExecutionException
  {
    paramInt = m_nativeSaveWithQualityAndConfig(m_ptr, paramString, paramInt, nativeFormat(paramCompressFormat));
    if (paramInt > 0) {
      throw AdobeImageExecutionException.fromInt(paramInt);
    }
  }
  
  public void setOriginalEnabled(boolean paramBoolean)
  {
    m_setOriginalEnabled(m_ptr, paramBoolean);
  }
  
  public void unload()
    throws AdobeImageExecutionException
  {
    int i = m_nativeUnload(m_ptr);
    if (i > 0) {
      throw AdobeImageExecutionException.fromInt(i);
    }
  }
}
