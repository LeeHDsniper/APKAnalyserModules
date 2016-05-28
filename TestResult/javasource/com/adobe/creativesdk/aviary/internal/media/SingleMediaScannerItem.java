package com.adobe.creativesdk.aviary.internal.media;

import android.content.Context;
import android.media.MediaScannerConnection;
import android.media.MediaScannerConnection.MediaScannerConnectionClient;
import android.media.MediaScannerConnection.OnScanCompletedListener;
import android.net.Uri;
import android.util.Log;
import java.io.File;

public class SingleMediaScannerItem
  implements MediaScannerConnection.MediaScannerConnectionClient
{
  private MediaScannerConnection mConn;
  private File mFile;
  private MediaScannerConnection.OnScanCompletedListener mScanCompletedListener;
  private OnScanErrorListener mScaneErrorListener;
  
  public SingleMediaScannerItem(Context paramContext, File paramFile, MediaScannerConnection.OnScanCompletedListener paramOnScanCompletedListener, OnScanErrorListener paramOnScanErrorListener)
  {
    mFile = paramFile;
    mScanCompletedListener = paramOnScanCompletedListener;
    mScaneErrorListener = paramOnScanErrorListener;
    mConn = new MediaScannerConnection(paramContext, this);
  }
  
  public void onMediaScannerConnected()
  {
    Log.i("single-media-scanner", "onMediaScannerConnected");
    try
    {
      mConn.scanFile(mFile.getAbsolutePath(), null);
      return;
    }
    catch (Throwable localThrowable)
    {
      while (mScaneErrorListener == null) {}
      mScaneErrorListener.onScanError();
    }
  }
  
  public void onScanCompleted(String paramString, Uri paramUri)
  {
    Log.i("single-media-scanner", "onMediaScannerCompleted: " + paramString + "(" + paramUri + ")");
    mConn.disconnect();
    if (mScanCompletedListener != null) {
      mScanCompletedListener.onScanCompleted(paramString, paramUri);
    }
  }
  
  public void run()
  {
    mConn.connect();
  }
  
  public static abstract interface OnScanErrorListener
  {
    public abstract void onScanError();
  }
}
