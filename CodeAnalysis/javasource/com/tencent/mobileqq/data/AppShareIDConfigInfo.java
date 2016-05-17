package com.tencent.mobileqq.data;

import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class AppShareIDConfigInfo
{
  public String appstorelink;
  public String bundleid;
  public String messagetail;
  public String officalwebsite;
  public String sourceUrl;
  
  public AppShareIDConfigInfo()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
}
