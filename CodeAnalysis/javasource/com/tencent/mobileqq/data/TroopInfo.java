package com.tencent.mobileqq.data;

import android.content.Context;
import android.database.Cursor;
import android.text.TextUtils;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.TroopManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pb.ByteStringMicro;
import com.tencent.mobileqq.pb.PBBytesField;
import com.tencent.mobileqq.pb.PBRepeatMessageField;
import com.tencent.mobileqq.pb.PBStringField;
import com.tencent.mobileqq.pb.PBUInt32Field;
import com.tencent.mobileqq.pb.PBUInt64Field;
import com.tencent.mobileqq.persistence.Entity;
import com.tencent.mobileqq.persistence.unique;
import com.tencent.qphone.base.util.QLog;
import friendlist.stLevelRankPair;
import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import tencent.im.oidb.cmd0x787.oidb_0x787.LevelName;
import tencent.im.oidb.cmd0x88d.oidb_0x88d.GroupHeadPortrait;
import tencent.im.oidb.cmd0x88d.oidb_0x88d.GroupHeadPortraitInfo;
import tencent.im.oidb.cmd0x88d.oidb_0x88d.TagRecord;
import tencent.im.oidb.cmd0x899.oidb_0x899.memberlist;
import tencent.im.oidb.cmd0x8fd.Oidb_0x8fd.LevelName;

public class TroopInfo
  extends Entity
  implements Serializable
{
  public static final int DEL_PIC_REQ = 2;
  public static final int MODIFY_ORDER = 0;
  public static final int PAY_CHOICE_PAY_TO_JOIN_TROOP = 512;
  public static final int PAY_PRIVILEGE_ALL = 448;
  public static final int PAY_PRIVILEGE_DELIVER_GIFT = 32;
  public static final int PAY_PRIVILEGE_GIFT_SETTLEMENT_ABILITY = 256;
  public static final int PAY_PRIVILEGE_GROUP_FEE = 64;
  public static final int PAY_PRIVILEGE_PAY_TO_JOIN_TROOP = 128;
  public static final int SET_DEFAULT_PIC = 1;
  public String Administrator;
  public String adminNameShow;
  public long associatePubAccount;
  public byte cAlbumResult;
  public short cGroupLevel;
  public short cGroupOption;
  public byte cGroupRankSysFlag;
  public byte cGroupRankUserFlag;
  public long dwAdditionalFlag;
  public long dwAppPrivilegeFlag;
  public long dwAuthGroupType;
  public long dwCmdUinUinFlag;
  public long dwGagTimeStamp;
  public long dwGagTimeStamp_me;
  public long dwGroupClassExt;
  public long dwGroupFlag;
  public long dwGroupFlagExt;
  public long dwGroupInfoSeq;
  public long dwGroupLevelSeq;
  public long dwOfficeMode;
  public long dwTimeStamp;
  public String fingertroopmemo;
  public int isShowInNearbyTroops;
  public String joinTroopAnswer;
  public String joinTroopQuestion;
  public int mComparePartInt;
  public String mCompareSpell;
  public String mGroupClassExtText;
  public long mMemberCardSeq;
  public boolean mMemberInvitingFlag;
  public long mMemberNumSeq;
  public long mOldMemberCardSeq;
  public long mOldMemberNumSeq;
  public int mQZonePhotoNum;
  public String mRichFingerMemo;
  public String mSomeMemberUins;
  public String mTags;
  public int mTroopAvatarId;
  public float mTroopNeedPayNumber;
  public List mTroopPicList;
  public Set mTroopVerifyingPics;
  public int maxAdminNum;
  public int nTroopGrade;
  public String ownerNameShow;
  public String strLocation;
  public String strQZonePhotoUrls;
  public long timeSec;
  public String topicId;
  public String troopAuthenticateInfo;
  public long troopCreateTime;
  public long troopCreditLevel;
  public long troopCreditLevelInfo;
  public int troopLat;
  public String troopLevelMap;
  public int troopLon;
  public long troopPrivilegeFlag;
  public int troopTypeExt;
  public String troopcode;
  public short troopface;
  public int troopmask;
  public String troopmemo;
  public String troopname;
  public String troopowneruin;
  public int trooptype;
  @unique
  public String troopuin;
  public String uin;
  public int wMemberMax;
  public int wMemberNum;
  public int wSpecialClass;
  
  public TroopInfo()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    troopmask = -1;
    dwGroupFlagExt = 0L;
    dwAuthGroupType = 0L;
    dwGroupInfoSeq = 0L;
    mMemberNumSeq = -1L;
    mOldMemberNumSeq = -1L;
    mMemberCardSeq = -1L;
    mOldMemberCardSeq = -1L;
    cGroupRankSysFlag = 0;
    cGroupRankUserFlag = 0;
    cAlbumResult = 0;
    dwTimeStamp = 0L;
    mQZonePhotoNum = 0;
    troopLat = 0;
    troopLon = 0;
    isShowInNearbyTroops = -1;
    troopTypeExt = -1;
    dwOfficeMode = 0L;
    troopPrivilegeFlag = 0L;
    mTroopNeedPayNumber = 0.0F;
    troopCreditLevel = 5L;
    troopCreditLevelInfo = 0L;
    dwAppPrivilegeFlag = 0L;
  }
  
  public static List getTags(String paramString)
  {
    ArrayList localArrayList = new ArrayList();
    if (!TextUtils.isEmpty(paramString))
    {
      paramString = paramString.split("\n");
      int i = 0;
      while (i < paramString.length)
      {
        localArrayList.add(paramString[i]);
        i += 1;
      }
    }
    return localArrayList;
  }
  
  public static boolean hasPayPrivilege(long paramLong, int paramInt)
  {
    return ((0x20 | paramLong) & paramInt) != 0L;
  }
  
  public static final boolean isTroopMember(QQAppInterface paramQQAppInterface, String paramString)
  {
    paramQQAppInterface = (TroopManager)paramQQAppInterface.getManager(51);
    if (paramQQAppInterface != null) {
      return paramQQAppInterface.a(paramString) != null;
    }
    return false;
  }
  
  public static List setAvatarPicId(oidb_0x88d.GroupHeadPortrait paramGroupHeadPortrait)
  {
    if (uint32_pic_cnt.get() != rpt_msg_info.size()) {}
    ArrayList localArrayList = new ArrayList();
    paramGroupHeadPortrait = rpt_msg_info.get().iterator();
    while (paramGroupHeadPortrait.hasNext()) {
      localArrayList.add(String.valueOf(nextrpt_uint32_pic_id.get()));
    }
    return localArrayList;
  }
  
  public static String setTags(List paramList)
  {
    StringBuffer localStringBuffer = new StringBuffer();
    if ((paramList != null) && (paramList.size() > 0))
    {
      Iterator localIterator = paramList.iterator();
      for (;;)
      {
        if (localIterator.hasNext())
        {
          paramList = (oidb_0x88d.TagRecord)localIterator.next();
          if (!bytes_tag_value.has()) {
            continue;
          }
          paramList = bytes_tag_value.get().toStringUtf8();
          try
          {
            paramList = new String(paramList.getBytes("utf-8"));
            localStringBuffer.append(paramList + "\n");
          }
          catch (UnsupportedEncodingException paramList)
          {
            for (;;)
            {
              paramList.printStackTrace();
              paramList = "";
            }
          }
        }
      }
      localStringBuffer.deleteCharAt(localStringBuffer.length() - 1);
    }
    return localStringBuffer.toString();
  }
  
  public static Set setVerifyingAvatarPicId(oidb_0x88d.GroupHeadPortrait paramGroupHeadPortrait)
  {
    int i = uint32_verifying_pic_cnt.get();
    int j = rpt_msg_verifyingpic_info.size();
    if ((i != j) && (QLog.isColorLevel())) {
      QLog.d("TroopInfo", 2, String.format("wrong data from server! uint32_verifying_pic_cnt = %d not equals rpt_msg_verifyingpic_info's size = %d", new Object[] { Integer.valueOf(i), Integer.valueOf(j) }));
    }
    HashSet localHashSet = new HashSet();
    paramGroupHeadPortrait = rpt_msg_verifyingpic_info.get().iterator();
    while (paramGroupHeadPortrait.hasNext()) {
      localHashSet.add(String.valueOf(nextrpt_uint32_pic_id.get()));
    }
    return localHashSet;
  }
  
  public void coverAdministrators(QQAppInterface paramQQAppInterface, ArrayList paramArrayList)
  {
    if ((paramArrayList == null) || (paramQQAppInterface == null)) {
      return;
    }
    StringBuffer localStringBuffer = new StringBuffer();
    paramArrayList = paramArrayList.iterator();
    while (paramArrayList.hasNext())
    {
      String str = (String)paramArrayList.next();
      localStringBuffer.append(str + "|");
    }
    Administrator = localStringBuffer.toString();
    ((TroopManager)paramQQAppInterface.getManager(51)).b(this);
  }
  
  protected boolean entityByCursor(Cursor paramCursor)
  {
    Administrator = paramCursor.getString(paramCursor.getColumnIndex("Administrator"));
    cAlbumResult = ((byte)paramCursor.getShort(paramCursor.getColumnIndex("cAlbumResult")));
    cGroupLevel = paramCursor.getShort(paramCursor.getColumnIndex("cGroupLevel"));
    cGroupOption = paramCursor.getShort(paramCursor.getColumnIndex("cGroupOption"));
    cGroupRankSysFlag = ((byte)paramCursor.getShort(paramCursor.getColumnIndex("cGroupRankSysFlag")));
    cGroupRankUserFlag = ((byte)paramCursor.getShort(paramCursor.getColumnIndex("cGroupRankUserFlag")));
    dwAdditionalFlag = ((byte)paramCursor.getShort(paramCursor.getColumnIndex("dwAdditionalFlag")));
    dwAuthGroupType = paramCursor.getLong(paramCursor.getColumnIndex("dwAuthGroupType"));
    dwCmdUinUinFlag = paramCursor.getLong(paramCursor.getColumnIndex("dwCmdUinUinFlag"));
    dwGagTimeStamp = paramCursor.getLong(paramCursor.getColumnIndex("dwGagTimeStamp"));
    dwGagTimeStamp_me = paramCursor.getLong(paramCursor.getColumnIndex("dwGagTimeStamp_me"));
    dwGroupClassExt = paramCursor.getLong(paramCursor.getColumnIndex("dwGroupClassExt"));
    dwGroupFlag = paramCursor.getLong(paramCursor.getColumnIndex("dwGroupFlag"));
    dwGroupFlagExt = paramCursor.getLong(paramCursor.getColumnIndex("dwGroupFlagExt"));
    dwGroupInfoSeq = paramCursor.getLong(paramCursor.getColumnIndex("dwGroupInfoSeq"));
    dwGroupLevelSeq = paramCursor.getLong(paramCursor.getColumnIndex("dwGroupLevelSeq"));
    dwTimeStamp = paramCursor.getLong(paramCursor.getColumnIndex("dwTimeStamp"));
    fingertroopmemo = paramCursor.getString(paramCursor.getColumnIndex("fingertroopmemo"));
    isShowInNearbyTroops = paramCursor.getInt(paramCursor.getColumnIndex("isShowInNearbyTroops"));
    joinTroopAnswer = paramCursor.getString(paramCursor.getColumnIndex("joinTroopAnswer"));
    joinTroopQuestion = paramCursor.getString(paramCursor.getColumnIndex("joinTroopQuestion"));
    mComparePartInt = paramCursor.getInt(paramCursor.getColumnIndex("mComparePartInt"));
    mCompareSpell = paramCursor.getString(paramCursor.getColumnIndex("mCompareSpell"));
    mGroupClassExtText = paramCursor.getString(paramCursor.getColumnIndex("mGroupClassExtText"));
    boolean bool;
    if (paramCursor.getInt(paramCursor.getColumnIndex("mMemberInvitingFlag")) == 1) {
      bool = true;
    }
    for (;;)
    {
      mMemberInvitingFlag = bool;
      mQZonePhotoNum = paramCursor.getInt(paramCursor.getColumnIndex("mQZonePhotoNum"));
      mRichFingerMemo = paramCursor.getString(paramCursor.getColumnIndex("mRichFingerMemo"));
      mSomeMemberUins = paramCursor.getString(paramCursor.getColumnIndex("mSomeMemberUins"));
      mTags = paramCursor.getString(paramCursor.getColumnIndex("mTags"));
      mTroopAvatarId = paramCursor.getInt(paramCursor.getColumnIndex("mTroopAvatarId"));
      maxAdminNum = paramCursor.getInt(paramCursor.getColumnIndex("maxAdminNum"));
      nTroopGrade = paramCursor.getInt(paramCursor.getColumnIndex("nTroopGrade"));
      strLocation = paramCursor.getString(paramCursor.getColumnIndex("strLocation"));
      strQZonePhotoUrls = paramCursor.getString(paramCursor.getColumnIndex("strQZonePhotoUrls"));
      timeSec = paramCursor.getLong(paramCursor.getColumnIndex("timeSec"));
      troopAuthenticateInfo = paramCursor.getString(paramCursor.getColumnIndex("troopAuthenticateInfo"));
      troopCreateTime = paramCursor.getLong(paramCursor.getColumnIndex("troopCreateTime"));
      troopLat = paramCursor.getInt(paramCursor.getColumnIndex("troopLat"));
      troopLevelMap = paramCursor.getString(paramCursor.getColumnIndex("troopLevelMap"));
      troopLon = paramCursor.getInt(paramCursor.getColumnIndex("troopLon"));
      troopTypeExt = paramCursor.getInt(paramCursor.getColumnIndex("troopTypeExt"));
      troopcode = paramCursor.getString(paramCursor.getColumnIndex("troopcode"));
      troopface = paramCursor.getShort(paramCursor.getColumnIndex("troopface"));
      troopmask = paramCursor.getInt(paramCursor.getColumnIndex("troopmask"));
      troopmemo = paramCursor.getString(paramCursor.getColumnIndex("troopmemo"));
      troopname = paramCursor.getString(paramCursor.getColumnIndex("troopname"));
      troopowneruin = paramCursor.getString(paramCursor.getColumnIndex("troopowneruin"));
      trooptype = paramCursor.getInt(paramCursor.getColumnIndex("trooptype"));
      troopuin = paramCursor.getString(paramCursor.getColumnIndex("troopuin"));
      uin = paramCursor.getString(paramCursor.getColumnIndex("uin"));
      wMemberMax = paramCursor.getInt(paramCursor.getColumnIndex("wMemberMax"));
      wMemberNum = paramCursor.getInt(paramCursor.getColumnIndex("wMemberNum"));
      wSpecialClass = paramCursor.getInt(paramCursor.getColumnIndex("wSpecialClass"));
      troopPrivilegeFlag = paramCursor.getLong(paramCursor.getColumnIndex("troopPrivilegeFlag"));
      associatePubAccount = paramCursor.getLong(paramCursor.getColumnIndex("associatePubAccount"));
      mTroopNeedPayNumber = paramCursor.getFloat(paramCursor.getColumnIndex("mTroopNeedPayNumber"));
      dwOfficeMode = paramCursor.getLong(paramCursor.getColumnIndex("dwOfficeMode"));
      mMemberCardSeq = paramCursor.getLong(paramCursor.getColumnIndex("mMemberCardSeq"));
      mOldMemberCardSeq = paramCursor.getLong(paramCursor.getColumnIndex("mOldMemberCardSeq"));
      mMemberNumSeq = paramCursor.getLong(paramCursor.getColumnIndex("mMemberNumSeq"));
      mOldMemberNumSeq = paramCursor.getLong(paramCursor.getColumnIndex("mOldMemberNumSeq"));
      try
      {
        ownerNameShow = paramCursor.getString(paramCursor.getColumnIndex("ownerNameShow"));
        adminNameShow = paramCursor.getString(paramCursor.getColumnIndex("adminNameShow"));
        dwAppPrivilegeFlag = paramCursor.getLong(paramCursor.getColumnIndex("dwAppPrivilegeFlag"));
        topicId = paramCursor.getString(paramCursor.getColumnIndex("topicId"));
        int i = paramCursor.getColumnIndex("troopCreditLevel");
        if (i >= 0) {
          troopCreditLevel = paramCursor.getLong(i);
        }
        i = paramCursor.getColumnIndex("troopCreditLevelInfo");
        if (i >= 0) {
          troopCreditLevelInfo = paramCursor.getLong(i);
        }
        return true;
        bool = false;
      }
      catch (Exception localException)
      {
        for (;;) {}
      }
    }
  }
  
  public String getAdminShow(Context paramContext)
  {
    if (TextUtils.isEmpty(adminNameShow)) {
      return paramContext.getString(2131367134);
    }
    return adminNameShow;
  }
  
  public String getOwnerOrAdminString(String paramString, Context paramContext)
  {
    if ((paramString != null) && (paramString.equals(troopowneruin))) {
      return getOwnerShow(paramContext);
    }
    if (Administrator != null)
    {
      String[] arrayOfString = Administrator.split("\\|");
      if ((arrayOfString != null) && (arrayOfString.length > 0))
      {
        int i = 0;
        while (i < arrayOfString.length)
        {
          if ((paramString != null) && (paramString.equals(arrayOfString[i]))) {
            return getAdminShow(paramContext);
          }
          i += 1;
        }
      }
    }
    return null;
  }
  
  public String getOwnerShow(Context paramContext)
  {
    if (TextUtils.isEmpty(ownerNameShow)) {
      return paramContext.getString(2131367133);
    }
    return ownerNameShow;
  }
  
  public String getPercentage()
  {
    return "66";
  }
  
  public ArrayList getQZonePhotoUrls()
  {
    Object localObject2 = null;
    Object localObject1 = localObject2;
    if (strQZonePhotoUrls != null)
    {
      String[] arrayOfString = strQZonePhotoUrls.split(";");
      localObject1 = localObject2;
      if (arrayOfString != null)
      {
        localObject1 = localObject2;
        if (arrayOfString.length > 0)
        {
          localObject1 = new ArrayList();
          int i = 0;
          while (i < arrayOfString.length)
          {
            if ((arrayOfString[i] != null) && (arrayOfString[i].length() > 0)) {
              ((ArrayList)localObject1).add(arrayOfString[i]);
            }
            i += 1;
          }
        }
      }
    }
    return localObject1;
  }
  
  public List getSomeMemberUins()
  {
    ArrayList localArrayList = new ArrayList();
    if ((mSomeMemberUins != null) && (mSomeMemberUins.length() > 0))
    {
      int j = 0;
      int i = mSomeMemberUins.indexOf('|', 0);
      int k = mSomeMemberUins.length();
      String str2;
      String str1;
      while ((i >= j) && (i < k))
      {
        if (j < i)
        {
          str2 = mSomeMemberUins.substring(j, i);
          str1 = str2;
          if (str2 != null) {
            str1 = str2.trim();
          }
          if ((str1 != null) && (str1.length() > 0)) {
            localArrayList.add(str1);
          }
        }
        j = i + 1;
        i = mSomeMemberUins.indexOf('|', j);
      }
      if (j < k)
      {
        str2 = mSomeMemberUins.substring(j, k);
        str1 = str2;
        if (str2 != null) {
          str1 = str2.trim();
        }
        if ((str1 != null) && (str1.length() > 0)) {
          localArrayList.add(str1);
        }
      }
    }
    return localArrayList;
  }
  
  public HashMap getTroopLevelMap()
  {
    HashMap localHashMap = new HashMap();
    if (troopLevelMap != null)
    {
      String[] arrayOfString1 = troopLevelMap.split("\001");
      if ((arrayOfString1 != null) && (arrayOfString1.length > 0))
      {
        int i = 0;
        for (;;)
        {
          if (i < arrayOfString1.length)
          {
            String[] arrayOfString2 = arrayOfString1[i].split("\000");
            if (arrayOfString2.length == 2) {}
            try
            {
              localHashMap.put(Integer.valueOf(Integer.parseInt(arrayOfString2[0])), arrayOfString2[1]);
              i += 1;
            }
            catch (Exception localException)
            {
              for (;;)
              {
                if (QLog.isColorLevel()) {
                  QLog.d("TroopInfo", 2, "getTroopLevelMap, catch exception, key: " + arrayOfString2[0] + " value: " + arrayOfString2[1]);
                }
              }
            }
          }
        }
      }
    }
    return localHashMap;
  }
  
  public boolean hasOrgs()
  {
    return (troopPrivilegeFlag & 0x800) != 0L;
  }
  
  public boolean isAdmin()
  {
    return ((dwAdditionalFlag & 1L) == 1L) || ((dwCmdUinUinFlag & 1L) == 1L);
  }
  
  public boolean isTroopAdmin(String paramString)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    String[] arrayOfString;
    int i;
    if (Administrator != null)
    {
      arrayOfString = Administrator.split("\\|");
      bool1 = bool2;
      if (arrayOfString != null)
      {
        bool1 = bool2;
        if (arrayOfString.length > 0) {
          i = 0;
        }
      }
    }
    for (;;)
    {
      bool1 = bool2;
      if (i < arrayOfString.length)
      {
        if ((paramString != null) && (paramString.equals(arrayOfString[i]))) {
          bool1 = true;
        }
      }
      else {
        return bool1;
      }
      i += 1;
    }
  }
  
  public boolean isTroopOwner(String paramString)
  {
    return (paramString != null) && (paramString.equals(troopowneruin));
  }
  
  public void setTroopLevelMap(List paramList)
  {
    if ((paramList != null) && (paramList.size() > 0))
    {
      StringBuilder localStringBuilder = new StringBuilder();
      int i = 0;
      while (i < paramList.size() - 1)
      {
        stLevelRankPair localStLevelRankPair = (stLevelRankPair)paramList.get(i);
        localStringBuilder.append(dwLevel).append("\000").append(strRank).append("\001");
        i += 1;
      }
      paramList = (stLevelRankPair)paramList.get(paramList.size() - 1);
      localStringBuilder.append(dwLevel).append("\000").append(strRank);
      troopLevelMap = localStringBuilder.toString();
    }
  }
  
  public void setTroopLevelMap2(List paramList)
  {
    if ((paramList != null) && (paramList.size() > 0))
    {
      StringBuilder localStringBuilder = new StringBuilder();
      int i = 0;
      while (i < paramList.size() - 1)
      {
        Oidb_0x8fd.LevelName localLevelName = (Oidb_0x8fd.LevelName)paramList.get(i);
        localStringBuilder.append(uint32_level.get()).append("\000").append(str_name.get()).append("\001");
        i += 1;
      }
      paramList = (Oidb_0x8fd.LevelName)paramList.get(paramList.size() - 1);
      localStringBuilder.append(uint32_level.get()).append("\000").append(str_name.get());
      troopLevelMap = localStringBuilder.toString();
    }
  }
  
  public void setTroopLevelMap787(List paramList)
  {
    if ((paramList != null) && (paramList.size() > 0))
    {
      StringBuilder localStringBuilder = new StringBuilder();
      int i = 0;
      while (i < paramList.size() - 1)
      {
        oidb_0x787.LevelName localLevelName = (oidb_0x787.LevelName)paramList.get(i);
        localStringBuilder.append(uint32_level.get()).append("\000").append(str_name.get().toStringUtf8()).append("\001");
        i += 1;
      }
      paramList = (oidb_0x787.LevelName)paramList.get(paramList.size() - 1);
      localStringBuilder.append(uint32_level.get()).append("\000").append(str_name.get().toStringUtf8());
      troopLevelMap = localStringBuilder.toString();
    }
  }
  
  public void updateQZonePhotoUrls(ArrayList paramArrayList)
  {
    int j = 0;
    StringBuilder localStringBuilder = new StringBuilder();
    int i;
    if (paramArrayList != null) {
      i = paramArrayList.size();
    }
    while (j < i)
    {
      String str = (String)paramArrayList.get(j);
      if ((str != null) && (str.length() > 0)) {
        localStringBuilder.append(str).append(";");
      }
      j += 1;
      continue;
      i = 0;
    }
    strQZonePhotoUrls = localStringBuilder.toString();
  }
  
  public void updateSomeMemberUins(List paramList)
  {
    int j = 0;
    int i;
    StringBuilder localStringBuilder;
    label22:
    oidb_0x899.memberlist localMemberlist;
    if (paramList != null)
    {
      i = paramList.size();
      localStringBuilder = new StringBuilder();
      if (j >= i) {
        break label89;
      }
      localMemberlist = (oidb_0x899.memberlist)paramList.get(j);
      if ((localMemberlist != null) && (uint64_member_uin.has())) {
        break label67;
      }
    }
    for (;;)
    {
      j += 1;
      break label22;
      i = 0;
      break;
      label67:
      localStringBuilder.append(uint64_member_uin.get()).append('|');
    }
    label89:
    mSomeMemberUins = localStringBuilder.toString();
    if ((i < 6) && (i > 0)) {
      wMemberNum = i;
    }
  }
}
