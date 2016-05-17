package com.tencent.mobileqq.activity.qqcard;

import QCARD.CouponMobileFolder;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.persistence.Entity;
import com.tencent.mobileqq.persistence.unique;

public class QQCardFolder
  extends Entity
{
  public int aboutExpireNum;
  public int couponsNum;
  public int folderId;
  public String iconUrl;
  @unique
  public int localFolderId;
  public String unavailableUrl;
  
  public QQCardFolder()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public QQCardFolder(int paramInt, CouponMobileFolder paramCouponMobileFolder)
  {
    localFolderId = paramInt;
    folderId = folder_id;
    iconUrl = icon_url;
    unavailableUrl = unavailable_url;
    couponsNum = coupons_num;
    aboutExpireNum = aboutexpire_num;
  }
}
