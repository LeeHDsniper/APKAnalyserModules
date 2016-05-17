package com.tencent.mobileqq.data;

import QQService.EVIPSPEC;
import android.database.Cursor;
import android.text.TextUtils;
import com.tencent.mobileqq.activity.contact.OnlineStatusIconHelper;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.persistence.Entity;
import com.tencent.mobileqq.persistence.PrimaryKeyJoinColumn;
import com.tencent.mobileqq.persistence.notColumn;
import com.tencent.mobileqq.persistence.unique;
import com.tencent.mobileqq.richstatus.RichStatus;
import com.tencent.qphone.base.util.QLog;

@PrimaryKeyJoinColumn(a="uin")
public class Friends
  extends Entity
  implements Cloneable
{
  public static final int CLIENT_DEFAULT = 0;
  public static final int CLIENT_IPHONE = 3;
  public static final int CLIENT_MOBILE = 2;
  public static final int CLIENT_PC = 1;
  public static final int GATHER_TYPE_GATHERED = 1;
  public static final int GATHER_TYPE_NORMAL = 0;
  public static final int GATHER_TYPE_RECOMMENDED = 2;
  private static final long LOGIN_TYPE_OFFLINE = 10L;
  public static int MULTI_FLAGS_MASK_SHIELD = 1;
  public static final int NET_2G = 2;
  public static final int NET_3G = 3;
  public static final int NET_4G = 4;
  public static final int NET_UNKNOW = 0;
  public static final int NET_WIFI = 1;
  public static final int TERM_TYPE_ANDROID_PAD = 68104;
  public static final int TERM_TYPE_AOL_CHAOJIHUIYUAN = 73730;
  public static final int TERM_TYPE_AOL_HUIYUAN = 73474;
  public static final int TERM_TYPE_AOL_SQQ = 69378;
  public static final int TERM_TYPE_CAR = 65806;
  public static final int TERM_TYPE_HRTX_IPHONE = 66566;
  public static final int TERM_TYPE_HRTX_PC = 66561;
  public static final int TERM_TYPE_MC_3G = 65795;
  public static final int TERM_TYPE_MISRO_MSG = 69634;
  public static final int TERM_TYPE_MOBILE_ANDROID = 65799;
  public static final int TERM_TYPE_MOBILE_ANDROID_NEW = 72450;
  public static final int TERM_TYPE_MOBILE_HD = 65805;
  public static final int TERM_TYPE_MOBILE_HD_NEW = 71426;
  public static final int TERM_TYPE_MOBILE_IPAD = 68361;
  public static final int TERM_TYPE_MOBILE_IPAD_NEW = 72194;
  public static final int TERM_TYPE_MOBILE_IPHONE = 67586;
  public static final int TERM_TYPE_MOBILE_OTHER = 65794;
  public static final int TERM_TYPE_MOBILE_PC = 65793;
  public static final int TERM_TYPE_MOBILE_WINPHONE_NEW = 72706;
  public static final int TERM_TYPE_QQ_FORELDER = 70922;
  public static final int TERM_TYPE_QQ_SERVICE = 71170;
  public static final int TERM_TYPE_TV_QQ = 69130;
  public static final int TERM_TYPE_WIN8 = 69899;
  public static final int TERM_TYPE_WINPHONE = 65804;
  public long abilityBits = 0L;
  public int age;
  public String alias;
  @Deprecated
  public byte cNetwork = 0;
  public byte cSpecialFlag;
  public long datetime;
  public byte detalStatusFlag;
  public int eNetwork = 0;
  public short faceid;
  public byte gathtertype = 0;
  public byte gender;
  public int groupid = -1;
  public int hollywoodVipInfo = 0;
  public int iTermType;
  public byte isIphoneOnline;
  public boolean isMqqOnLine;
  @Deprecated
  public byte isRemark = 1;
  public long lastLoginType;
  public int mComparePartInt;
  public String mCompareSpell;
  public byte memberLevel;
  public int multiFlags = 0;
  public String name;
  @notColumn
  public int netTypeIconId;
  public int qqVipInfo = 0;
  public String recommReason;
  public String remark;
  @Deprecated
  public byte[] richBuffer;
  @notColumn
  @Deprecated
  public RichStatus richStatus;
  @Deprecated
  public long richTime;
  public long showLoginClient;
  @Deprecated
  public String signature;
  public String smartRemark;
  public byte sqqOnLineState;
  public byte sqqtype;
  public byte status = 10;
  @notColumn
  public String strTermDesc;
  public int superQqInfo = 0;
  public int superVipInfo = 0;
  @unique
  public String uin;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public Friends() {}
  
  public static boolean isValidUin(long paramLong)
  {
    return paramLong > 10000L;
  }
  
  public static boolean isValidUin(String paramString)
  {
    boolean bool = false;
    try
    {
      long l = Long.valueOf(Long.parseLong(paramString)).longValue();
      if (l > 10000L) {
        bool = true;
      }
      return bool;
    }
    catch (Exception paramString) {}
    return false;
  }
  
  public Object clone()
  {
    try
    {
      localObject = super.clone();
      return localObject;
    }
    catch (CloneNotSupportedException localCloneNotSupportedException)
    {
      do
      {
        Object localObject = this;
      } while (!QLog.isColorLevel());
      QLog.d("Q.contacttab.", 2, "Friends clone failed." + localCloneNotSupportedException.toString());
    }
    return this;
  }
  
  protected boolean entityByCursor(Cursor paramCursor)
  {
    uin = paramCursor.getString(paramCursor.getColumnIndex("uin"));
    remark = paramCursor.getString(paramCursor.getColumnIndex("remark"));
    name = paramCursor.getString(paramCursor.getColumnIndex("name"));
    faceid = paramCursor.getShort(paramCursor.getColumnIndex("faceid"));
    status = ((byte)paramCursor.getShort(paramCursor.getColumnIndex("status")));
    sqqtype = ((byte)paramCursor.getShort(paramCursor.getColumnIndex("sqqtype")));
    cSpecialFlag = ((byte)paramCursor.getShort(paramCursor.getColumnIndex("cSpecialFlag")));
    groupid = paramCursor.getInt(paramCursor.getColumnIndex("groupid"));
    memberLevel = ((byte)paramCursor.getShort(paramCursor.getColumnIndex("memberLevel")));
    if (paramCursor.getInt(paramCursor.getColumnIndex("isMqqOnLine")) != 0) {}
    for (boolean bool = true;; bool = false)
    {
      isMqqOnLine = bool;
      sqqOnLineState = ((byte)paramCursor.getShort(paramCursor.getColumnIndex("sqqOnLineState")));
      detalStatusFlag = ((byte)paramCursor.getShort(paramCursor.getColumnIndex("detalStatusFlag")));
      datetime = paramCursor.getLong(paramCursor.getColumnIndex("datetime"));
      alias = paramCursor.getString(paramCursor.getColumnIndex("alias"));
      isIphoneOnline = ((byte)paramCursor.getShort(paramCursor.getColumnIndex("isIphoneOnline")));
      iTermType = paramCursor.getInt(paramCursor.getColumnIndex("iTermType"));
      qqVipInfo = paramCursor.getInt(paramCursor.getColumnIndex("qqVipInfo"));
      superQqInfo = paramCursor.getInt(paramCursor.getColumnIndex("superQqInfo"));
      superVipInfo = paramCursor.getInt(paramCursor.getColumnIndex("superVipInfo"));
      lastLoginType = paramCursor.getLong(paramCursor.getColumnIndex("lastLoginType"));
      showLoginClient = paramCursor.getLong(paramCursor.getColumnIndex("showLoginClient"));
      mComparePartInt = paramCursor.getInt(paramCursor.getColumnIndex("mComparePartInt"));
      mCompareSpell = paramCursor.getString(paramCursor.getColumnIndex("mCompareSpell"));
      eNetwork = paramCursor.getInt(paramCursor.getColumnIndex("eNetwork"));
      multiFlags = paramCursor.getInt(paramCursor.getColumnIndex("multiFlags"));
      abilityBits = paramCursor.getLong(paramCursor.getColumnIndex("abilityBits"));
      gathtertype = ((byte)paramCursor.getShort(paramCursor.getColumnIndex("gathtertype")));
      smartRemark = paramCursor.getString(paramCursor.getColumnIndex("smartRemark"));
      age = paramCursor.getInt(paramCursor.getColumnIndex("age"));
      gender = ((byte)paramCursor.getShort(paramCursor.getColumnIndex("gender")));
      recommReason = paramCursor.getString(paramCursor.getColumnIndex("recommReason"));
      return true;
    }
  }
  
  public String getFriendName()
  {
    if (!TextUtils.isEmpty(name)) {
      return name;
    }
    return uin;
  }
  
  public String getFriendNick()
  {
    if (!TextUtils.isEmpty(remark)) {
      return remark;
    }
    if (!TextUtils.isEmpty(name)) {
      return name;
    }
    return uin;
  }
  
  public String getFriendNickWithAlias()
  {
    if (!TextUtils.isEmpty(remark)) {
      return remark;
    }
    if (!TextUtils.isEmpty(name)) {
      return name;
    }
    if (!TextUtils.isEmpty(alias)) {
      return alias;
    }
    return uin;
  }
  
  public long getLastLoginType()
  {
    if (lastLoginType == 0L) {
      return 10L;
    }
    return lastLoginType;
  }
  
  public int getNetWorkType()
  {
    int j = 2;
    OnlineStatusIconHelper localOnlineStatusIconHelper = OnlineStatusIconHelper.a();
    int i;
    if (eNetwork == 0)
    {
      if ((iTermType == 69378) || (iTermType == 73474) || (iTermType == 73730)) {
        i = 0;
      }
      do
      {
        return i;
        i = j;
      } while (1 != localOnlineStatusIconHelper.a(iTermType, 1));
    }
    if (1 != localOnlineStatusIconHelper.a(iTermType, 1)) {
      i = j;
    }
    switch (netTypeIconId)
    {
    case 2: 
    case 5: 
    case 6: 
    default: 
      if ((netTypeIconId == 7) || (netTypeIconId == 8) || (netTypeIconId == 9)) {}
      switch (netTypeIconId)
      {
      default: 
        return eNetwork;
      }
    case 1: 
      return 1;
    case 3: 
      return 3;
    case 4: 
      return 4;
    case 7: 
      return 7;
    case 8: 
      return 8;
    }
    return 9;
    return 7;
    return 8;
    return 9;
  }
  
  public int getServiceLevel(EVIPSPEC paramEVIPSPEC)
  {
    switch (paramEVIPSPEC.value())
    {
    default: 
      return 0;
    case 1: 
      return qqVipInfo & 0xFFFF;
    case 2: 
      return superQqInfo & 0xFFFF;
    }
    return superVipInfo & 0xFFFF;
  }
  
  public int getServiceType(EVIPSPEC paramEVIPSPEC)
  {
    switch (paramEVIPSPEC.value())
    {
    default: 
      return 0;
    case 1: 
      return (qqVipInfo & 0xFF0000) >>> 16;
    case 2: 
      return (superQqInfo & 0xFF0000) >>> 16;
    }
    return (superVipInfo & 0xFF0000) >>> 16;
  }
  
  public boolean isFriend()
  {
    return groupid >= 0;
  }
  
  public boolean isOffline()
  {
    if (status == 10) {
      if (isMqqOnLine) {
        if (detalStatusFlag != 31) {}
      }
    }
    while ((status == 11) || ((status == 20) && (sqqOnLineState == 1)))
    {
      do
      {
        do
        {
          return false;
        } while (detalStatusFlag != 51);
        return false;
      } while ((detalStatusFlag == 30) || (detalStatusFlag == 50) || (detalStatusFlag == 60) || (detalStatusFlag != 70));
      return false;
    }
    return true;
  }
  
  public boolean isOnline()
  {
    return (status == 10) || (status == 11) || ((status == 20) && (sqqOnLineState == 1)) || (status == 30) || (status == 31);
  }
  
  public boolean isServiceEnabled(EVIPSPEC paramEVIPSPEC)
  {
    boolean bool = true;
    switch (paramEVIPSPEC.value())
    {
    default: 
      bool = false;
    }
    do
    {
      do
      {
        do
        {
          return bool;
        } while ((qqVipInfo & 0xFF000000) != 0);
        return false;
      } while ((superQqInfo & 0xFF000000) != 0);
      return false;
    } while ((superVipInfo & 0xFF000000) != 0);
    return false;
  }
  
  public boolean isShield()
  {
    return (multiFlags & MULTI_FLAGS_MASK_SHIELD) > 0;
  }
  
  public void setShieldFlag(boolean paramBoolean)
  {
    if (paramBoolean)
    {
      multiFlags |= MULTI_FLAGS_MASK_SHIELD;
      return;
    }
    multiFlags &= (MULTI_FLAGS_MASK_SHIELD ^ 0xFFFFFFFF);
  }
}
