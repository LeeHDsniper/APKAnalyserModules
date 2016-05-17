package com.tencent.mobileqq.activity.richmedia.view;

import android.content.Context;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.view.View;
import android.widget.FrameLayout;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.shortvideo.mediadevice.CameraControl;
import com.tencent.mobileqq.shortvideo.mediadevice.CameraControl.CustomSize;
import com.tencent.mobileqq.shortvideo.mediadevice.CameraPreview;
import com.tencent.mobileqq.shortvideo.mediadevice.CameraProxy;
import com.tencent.mobileqq.shortvideo.mediadevice.PreviewContext;
import java.io.File;

public class CameraCover
  extends FrameLayout
{
  private View a;
  
  public CameraCover(Context paramContext)
  {
    this(paramContext, null);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public CameraCover(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
  }
  
  public CameraCover(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
  }
  
  private Rect a(int paramInt, Rect paramRect1, Rect paramRect2)
  {
    if (!paramRect1.contains(paramRect2)) {
      throw new IllegalArgumentException("CoverRect " + paramRect2 + " is outside ViewRect " + paramRect1);
    }
    Rect localRect = new Rect();
    switch (paramInt % 360)
    {
    default: 
      return localRect;
    case 0: 
      left = top;
      top = (paramRect1.width() - right);
      right = bottom;
      bottom = (paramRect1.width() - left);
      return localRect;
    case 90: 
      localRect.set(paramRect2);
      return localRect;
    case 180: 
      left = (paramRect1.height() - bottom);
      top = left;
      right = (paramRect1.height() - top);
      bottom = right;
      return localRect;
    }
    left = (paramRect1.width() - right);
    top = (paramRect1.height() - bottom);
    right = (paramRect1.width() - left);
    bottom = (paramRect1.height() - top);
    return localRect;
  }
  
  public Rect a(Rect paramRect, int paramInt)
  {
    Rect localRect2 = new Rect(0, 0, getRight() - getLeft(), getBottom() - getTop());
    Rect localRect1 = new Rect(0, 0, a.getWidth(), a.getHeight());
    int i = a.getLeft();
    int j = a.getTop();
    localRect2.offset(-i, -j);
    CameraControl localCameraControl;
    if (localRect1.equals(localRect2))
    {
      localCameraControl = CameraControl.a();
      localRect2 = a(paramInt, localRect1, localRect2);
      if (localCameraControl.b() % 180 != 90) {
        break label266;
      }
      paramInt = localRect1.height();
      label129:
      if (paramRect == null) {
        break label275;
      }
    }
    label266:
    label275:
    for (i = paramRect.width();; i = ba)
    {
      float f = i / paramInt;
      left = ((int)(left * f));
      top = ((int)(top * f));
      right = ((int)(right * f));
      bottom = ((int)(f * bottom));
      return localRect2;
      if (localRect1.contains(localRect2)) {
        break;
      }
      if (localRect2.contains(localRect1))
      {
        localRect2.set(localRect1);
        break;
      }
      if (Rect.intersects(localRect1, localRect2))
      {
        localRect2.intersect(localRect1);
        break;
      }
      throw new IllegalArgumentException("Cover and Camera rect must have intersect rect!");
      paramInt = localRect1.width();
      break label129;
    }
  }
  
  public void a(File paramFile, CameraCover.PictureCallback paramPictureCallback, int paramInt)
  {
    Object localObject = null;
    if (a == null) {}
    for (;;)
    {
      return;
      Rect localRect = a(null, paramInt);
      if (CameraTextureView.class.isInstance(a)) {
        localObject = a).a;
      }
      while (localObject != null)
      {
        a.a(paramFile, localRect, paramPictureCallback, paramInt);
        return;
        if (CameraPreview.class.isInstance(a)) {
          localObject = a).a;
        }
      }
    }
  }
  
  public void setCameraView(View paramView)
  {
    a = paramView;
  }
}
