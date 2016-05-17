package com.tencent.mobileqq.activity.richmedia.view;

import android.content.Context;
import android.util.AttributeSet;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class CameraCoverTexture
  extends CameraCover
{
  public CameraCoverTexture(Context paramContext)
  {
    this(paramContext, null);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public CameraCoverTexture(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
  }
  
  public CameraCoverTexture(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
  }
}
