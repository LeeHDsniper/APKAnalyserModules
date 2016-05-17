package com.tencent.mobileqq.activity.photo;

import android.content.Intent;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class PhotoCropMenuForQzone
  extends PhotoCropAction
{
  public PhotoCropMenuForQzone(PhotoCropActivity paramPhotoCropActivity)
  {
    super(paramPhotoCropActivity);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(int paramInt)
  {
    a.getIntent().putExtra("PhotoConst.QZONE_COVER_SYNC_FLAG", paramInt);
  }
}
