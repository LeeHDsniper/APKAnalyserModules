package com.tencent.mobileqq.activity.aio;

import android.content.Context;
import com.tencent.image.URLDrawable;
import com.tencent.mobileqq.activity.aio.photo.AIORichMediaInfo;
import com.tencent.mobileqq.data.MessageForPic;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class ForwardUtils
{
  public static final String a = "foward";
  
  public ForwardUtils()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public static URLDrawable a(Context paramContext, MessageForPic paramMessageForPic)
  {
    return AIORichMediaInfo.a(paramMessageForPic);
  }
}
