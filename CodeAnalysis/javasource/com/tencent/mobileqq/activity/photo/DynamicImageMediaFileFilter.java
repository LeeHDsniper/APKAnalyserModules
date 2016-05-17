package com.tencent.mobileqq.activity.photo;

import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class DynamicImageMediaFileFilter
  extends MediaFileFilter
{
  private MediaFileFilter d;
  
  public DynamicImageMediaFileFilter(MediaFileFilter paramMediaFileFilter)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    d = paramMediaFileFilter;
  }
  
  public boolean a()
  {
    return d.a();
  }
  
  public boolean a(String paramString)
  {
    String[] arrayOfString = MimeHelper.a(paramString);
    if ((arrayOfString != null) && ("image".equals(arrayOfString[0])) && ("gif".equals(arrayOfString[1]))) {
      return true;
    }
    return d.a(paramString);
  }
  
  public boolean b()
  {
    return d.b();
  }
}
