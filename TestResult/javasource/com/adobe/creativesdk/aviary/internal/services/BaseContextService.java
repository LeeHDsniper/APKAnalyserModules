package com.adobe.creativesdk.aviary.internal.services;

import android.os.Handler;
import com.adobe.creativesdk.aviary.internal.AdobeImageEditorController;
import com.adobe.creativesdk.aviary.log.LoggerFactory;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import com.adobe.creativesdk.aviary.log.LoggerFactory.LoggerType;

public abstract class BaseContextService
{
  protected static final Handler HANDLER = new Handler();
  protected LoggerFactory.Logger logger = LoggerFactory.getLogger(getClass().getSimpleName(), LoggerFactory.LoggerType.ConsoleLoggerType);
  private AdobeImageEditorController mContext;
  protected boolean mDisposed;
  
  protected BaseContextService(AdobeImageEditorController paramAdobeImageEditorController)
  {
    mContext = paramAdobeImageEditorController;
  }
  
  public abstract void dispose();
  
  public AdobeImageEditorController getContext()
  {
    return mContext;
  }
  
  public <T> T getService(Class<T> paramClass)
  {
    if (mContext != null) {
      return mContext.getService(paramClass);
    }
    return null;
  }
  
  public void internalDispose()
  {
    logger.info("internalDispose");
    dispose();
    mDisposed = true;
    mContext = null;
  }
  
  public boolean isActive()
  {
    return !mDisposed;
  }
}
