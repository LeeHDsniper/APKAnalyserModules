package com.tencent.mobileqq.data;

import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.persistence.Entity;
import com.tencent.mobileqq.persistence.unique;

public class AppShareID
  extends Entity
{
  public String appstorelink;
  public String bundleid;
  public String messagetail;
  public String officalwebsite;
  public short sLanType;
  public short sPriority;
  public short sResType;
  public String sourceUrl;
  @unique
  public String strPkgName;
  public String strResDesc;
  public String strResName;
  public String strResURL_big;
  public String strResURL_small;
  public long uiNewVer;
  @unique
  public long uiResID;
  public long updateTime;
  
  public AppShareID()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder(200);
    localStringBuilder.append("[strPkgName = ").append(strPkgName).append("; uiResID = ").append(uiResID).append("; uiNewVer = ").append(uiNewVer).append("; messagetail = ").append(messagetail).append("; bundleid = ").append(bundleid).append("; sourceUrl = ").append(sourceUrl).append("]");
    return localStringBuilder.toString();
  }
}
