package com.tencent.mobileqq.persistence;

import android.content.ContentValues;
import android.database.Cursor;
import com.tencent.mobileqq.data.TroopInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class TroopInfoDao
  extends OGAbstractDao
{
  private OGEntityInfo a;
  
  public TroopInfoDao()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = 67;
  }
  
  public Entity a(Entity paramEntity, Cursor paramCursor, boolean paramBoolean, NoColumnErrorHandler paramNoColumnErrorHandler)
  {
    boolean bool = true;
    paramBoolean = true;
    paramEntity = (TroopInfo)paramEntity;
    if (paramNoColumnErrorHandler == null)
    {
      uin = paramCursor.getString(paramCursor.getColumnIndex("uin"));
      timeSec = paramCursor.getLong(paramCursor.getColumnIndex("timeSec"));
      troopuin = paramCursor.getString(paramCursor.getColumnIndex("troopuin"));
      troopcode = paramCursor.getString(paramCursor.getColumnIndex("troopcode"));
      troopowneruin = paramCursor.getString(paramCursor.getColumnIndex("troopowneruin"));
      troopname = paramCursor.getString(paramCursor.getColumnIndex("troopname"));
      troopface = paramCursor.getShort(paramCursor.getColumnIndex("troopface"));
      troopmemo = paramCursor.getString(paramCursor.getColumnIndex("troopmemo"));
      fingertroopmemo = paramCursor.getString(paramCursor.getColumnIndex("fingertroopmemo"));
      mRichFingerMemo = paramCursor.getString(paramCursor.getColumnIndex("mRichFingerMemo"));
      troopmask = paramCursor.getInt(paramCursor.getColumnIndex("troopmask"));
      trooptype = paramCursor.getInt(paramCursor.getColumnIndex("trooptype"));
      troopCreateTime = paramCursor.getLong(paramCursor.getColumnIndex("troopCreateTime"));
      dwGroupFlag = paramCursor.getLong(paramCursor.getColumnIndex("dwGroupFlag"));
      cGroupOption = paramCursor.getShort(paramCursor.getColumnIndex("cGroupOption"));
      wMemberMax = paramCursor.getInt(paramCursor.getColumnIndex("wMemberMax"));
      maxAdminNum = paramCursor.getInt(paramCursor.getColumnIndex("maxAdminNum"));
      wSpecialClass = paramCursor.getInt(paramCursor.getColumnIndex("wSpecialClass"));
      cGroupLevel = paramCursor.getShort(paramCursor.getColumnIndex("cGroupLevel"));
      wMemberNum = paramCursor.getInt(paramCursor.getColumnIndex("wMemberNum"));
      Administrator = paramCursor.getString(paramCursor.getColumnIndex("Administrator"));
      dwGroupClassExt = paramCursor.getLong(paramCursor.getColumnIndex("dwGroupClassExt"));
      mGroupClassExtText = paramCursor.getString(paramCursor.getColumnIndex("mGroupClassExtText"));
      dwGroupFlagExt = paramCursor.getLong(paramCursor.getColumnIndex("dwGroupFlagExt"));
      dwAuthGroupType = paramCursor.getLong(paramCursor.getColumnIndex("dwAuthGroupType"));
      troopAuthenticateInfo = paramCursor.getString(paramCursor.getColumnIndex("troopAuthenticateInfo"));
      dwGroupInfoSeq = paramCursor.getLong(paramCursor.getColumnIndex("dwGroupInfoSeq"));
      mMemberNumSeq = paramCursor.getLong(paramCursor.getColumnIndex("mMemberNumSeq"));
      mOldMemberNumSeq = paramCursor.getLong(paramCursor.getColumnIndex("mOldMemberNumSeq"));
      mMemberCardSeq = paramCursor.getLong(paramCursor.getColumnIndex("mMemberCardSeq"));
      mOldMemberCardSeq = paramCursor.getLong(paramCursor.getColumnIndex("mOldMemberCardSeq"));
      dwGroupLevelSeq = paramCursor.getLong(paramCursor.getColumnIndex("dwGroupLevelSeq"));
      cGroupRankSysFlag = ((byte)paramCursor.getShort(paramCursor.getColumnIndex("cGroupRankSysFlag")));
      cGroupRankUserFlag = ((byte)paramCursor.getShort(paramCursor.getColumnIndex("cGroupRankUserFlag")));
      troopLevelMap = paramCursor.getString(paramCursor.getColumnIndex("troopLevelMap"));
      joinTroopQuestion = paramCursor.getString(paramCursor.getColumnIndex("joinTroopQuestion"));
      joinTroopAnswer = paramCursor.getString(paramCursor.getColumnIndex("joinTroopAnswer"));
      cAlbumResult = ((byte)paramCursor.getShort(paramCursor.getColumnIndex("cAlbumResult")));
      dwTimeStamp = paramCursor.getLong(paramCursor.getColumnIndex("dwTimeStamp"));
      strQZonePhotoUrls = paramCursor.getString(paramCursor.getColumnIndex("strQZonePhotoUrls"));
      mQZonePhotoNum = paramCursor.getInt(paramCursor.getColumnIndex("mQZonePhotoNum"));
      strLocation = paramCursor.getString(paramCursor.getColumnIndex("strLocation"));
      troopLat = paramCursor.getInt(paramCursor.getColumnIndex("troopLat"));
      troopLon = paramCursor.getInt(paramCursor.getColumnIndex("troopLon"));
      if (1 == paramCursor.getShort(paramCursor.getColumnIndex("mMemberInvitingFlag"))) {}
      for (;;)
      {
        mMemberInvitingFlag = paramBoolean;
        mComparePartInt = paramCursor.getInt(paramCursor.getColumnIndex("mComparePartInt"));
        mCompareSpell = paramCursor.getString(paramCursor.getColumnIndex("mCompareSpell"));
        mSomeMemberUins = paramCursor.getString(paramCursor.getColumnIndex("mSomeMemberUins"));
        mTags = paramCursor.getString(paramCursor.getColumnIndex("mTags"));
        mTroopAvatarId = paramCursor.getInt(paramCursor.getColumnIndex("mTroopAvatarId"));
        nTroopGrade = paramCursor.getInt(paramCursor.getColumnIndex("nTroopGrade"));
        isShowInNearbyTroops = paramCursor.getInt(paramCursor.getColumnIndex("isShowInNearbyTroops"));
        dwGagTimeStamp = paramCursor.getLong(paramCursor.getColumnIndex("dwGagTimeStamp"));
        dwGagTimeStamp_me = paramCursor.getLong(paramCursor.getColumnIndex("dwGagTimeStamp_me"));
        dwCmdUinUinFlag = paramCursor.getLong(paramCursor.getColumnIndex("dwCmdUinUinFlag"));
        dwAdditionalFlag = paramCursor.getLong(paramCursor.getColumnIndex("dwAdditionalFlag"));
        troopTypeExt = paramCursor.getInt(paramCursor.getColumnIndex("troopTypeExt"));
        ownerNameShow = paramCursor.getString(paramCursor.getColumnIndex("ownerNameShow"));
        adminNameShow = paramCursor.getString(paramCursor.getColumnIndex("adminNameShow"));
        dwOfficeMode = paramCursor.getLong(paramCursor.getColumnIndex("dwOfficeMode"));
        troopPrivilegeFlag = paramCursor.getLong(paramCursor.getColumnIndex("troopPrivilegeFlag"));
        mTroopNeedPayNumber = paramCursor.getFloat(paramCursor.getColumnIndex("mTroopNeedPayNumber"));
        troopCreditLevel = paramCursor.getLong(paramCursor.getColumnIndex("troopCreditLevel"));
        troopCreditLevelInfo = paramCursor.getLong(paramCursor.getColumnIndex("troopCreditLevelInfo"));
        dwAppPrivilegeFlag = paramCursor.getLong(paramCursor.getColumnIndex("dwAppPrivilegeFlag"));
        topicId = paramCursor.getString(paramCursor.getColumnIndex("topicId"));
        associatePubAccount = paramCursor.getLong(paramCursor.getColumnIndex("associatePubAccount"));
        return paramEntity;
        paramBoolean = false;
      }
    }
    int i = paramCursor.getColumnIndex("uin");
    if (i == -1)
    {
      paramNoColumnErrorHandler.a(new NoColumnError("uin", String.class));
      i = paramCursor.getColumnIndex("timeSec");
      if (i != -1) {
        break label3643;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("timeSec", Long.TYPE));
      label1321:
      i = paramCursor.getColumnIndex("troopuin");
      if (i != -1) {
        break label3658;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("troopuin", String.class));
      label1356:
      i = paramCursor.getColumnIndex("troopcode");
      if (i != -1) {
        break label3673;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("troopcode", String.class));
      label1391:
      i = paramCursor.getColumnIndex("troopowneruin");
      if (i != -1) {
        break label3688;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("troopowneruin", String.class));
      label1426:
      i = paramCursor.getColumnIndex("troopname");
      if (i != -1) {
        break label3703;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("troopname", String.class));
      label1461:
      i = paramCursor.getColumnIndex("troopface");
      if (i != -1) {
        break label3718;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("troopface", Short.TYPE));
      label1496:
      i = paramCursor.getColumnIndex("troopmemo");
      if (i != -1) {
        break label3733;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("troopmemo", String.class));
      label1531:
      i = paramCursor.getColumnIndex("fingertroopmemo");
      if (i != -1) {
        break label3748;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("fingertroopmemo", String.class));
      label1566:
      i = paramCursor.getColumnIndex("mRichFingerMemo");
      if (i != -1) {
        break label3763;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("mRichFingerMemo", String.class));
      label1601:
      i = paramCursor.getColumnIndex("troopmask");
      if (i != -1) {
        break label3778;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("troopmask", Integer.TYPE));
      label1636:
      i = paramCursor.getColumnIndex("trooptype");
      if (i != -1) {
        break label3793;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("trooptype", Integer.TYPE));
      label1671:
      i = paramCursor.getColumnIndex("troopCreateTime");
      if (i != -1) {
        break label3808;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("troopCreateTime", Long.TYPE));
      label1706:
      i = paramCursor.getColumnIndex("dwGroupFlag");
      if (i != -1) {
        break label3823;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("dwGroupFlag", Long.TYPE));
      label1741:
      i = paramCursor.getColumnIndex("cGroupOption");
      if (i != -1) {
        break label3838;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("cGroupOption", Short.TYPE));
      label1776:
      i = paramCursor.getColumnIndex("wMemberMax");
      if (i != -1) {
        break label3853;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("wMemberMax", Integer.TYPE));
      label1811:
      i = paramCursor.getColumnIndex("maxAdminNum");
      if (i != -1) {
        break label3868;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("maxAdminNum", Integer.TYPE));
      label1846:
      i = paramCursor.getColumnIndex("wSpecialClass");
      if (i != -1) {
        break label3883;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("wSpecialClass", Integer.TYPE));
      label1881:
      i = paramCursor.getColumnIndex("cGroupLevel");
      if (i != -1) {
        break label3898;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("cGroupLevel", Short.TYPE));
      label1916:
      i = paramCursor.getColumnIndex("wMemberNum");
      if (i != -1) {
        break label3913;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("wMemberNum", Integer.TYPE));
      label1951:
      i = paramCursor.getColumnIndex("Administrator");
      if (i != -1) {
        break label3928;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("Administrator", String.class));
      label1986:
      i = paramCursor.getColumnIndex("dwGroupClassExt");
      if (i != -1) {
        break label3943;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("dwGroupClassExt", Long.TYPE));
      label2021:
      i = paramCursor.getColumnIndex("mGroupClassExtText");
      if (i != -1) {
        break label3958;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("mGroupClassExtText", String.class));
      label2056:
      i = paramCursor.getColumnIndex("dwGroupFlagExt");
      if (i != -1) {
        break label3973;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("dwGroupFlagExt", Long.TYPE));
      label2091:
      i = paramCursor.getColumnIndex("dwAuthGroupType");
      if (i != -1) {
        break label3988;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("dwAuthGroupType", Long.TYPE));
      label2126:
      i = paramCursor.getColumnIndex("troopAuthenticateInfo");
      if (i != -1) {
        break label4003;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("troopAuthenticateInfo", String.class));
      label2161:
      i = paramCursor.getColumnIndex("dwGroupInfoSeq");
      if (i != -1) {
        break label4018;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("dwGroupInfoSeq", Long.TYPE));
      label2196:
      i = paramCursor.getColumnIndex("mMemberNumSeq");
      if (i != -1) {
        break label4033;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("mMemberNumSeq", Long.TYPE));
      label2231:
      i = paramCursor.getColumnIndex("mOldMemberNumSeq");
      if (i != -1) {
        break label4048;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("mOldMemberNumSeq", Long.TYPE));
      label2266:
      i = paramCursor.getColumnIndex("mMemberCardSeq");
      if (i != -1) {
        break label4063;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("mMemberCardSeq", Long.TYPE));
      label2301:
      i = paramCursor.getColumnIndex("mOldMemberCardSeq");
      if (i != -1) {
        break label4078;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("mOldMemberCardSeq", Long.TYPE));
      label2336:
      i = paramCursor.getColumnIndex("dwGroupLevelSeq");
      if (i != -1) {
        break label4093;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("dwGroupLevelSeq", Long.TYPE));
      label2371:
      i = paramCursor.getColumnIndex("cGroupRankSysFlag");
      if (i != -1) {
        break label4108;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("cGroupRankSysFlag", Byte.TYPE));
      label2406:
      i = paramCursor.getColumnIndex("cGroupRankUserFlag");
      if (i != -1) {
        break label4124;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("cGroupRankUserFlag", Byte.TYPE));
      label2441:
      i = paramCursor.getColumnIndex("troopLevelMap");
      if (i != -1) {
        break label4140;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("troopLevelMap", String.class));
      label2476:
      i = paramCursor.getColumnIndex("joinTroopQuestion");
      if (i != -1) {
        break label4155;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("joinTroopQuestion", String.class));
      label2511:
      i = paramCursor.getColumnIndex("joinTroopAnswer");
      if (i != -1) {
        break label4170;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("joinTroopAnswer", String.class));
      label2546:
      i = paramCursor.getColumnIndex("cAlbumResult");
      if (i != -1) {
        break label4185;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("cAlbumResult", Byte.TYPE));
      label2581:
      i = paramCursor.getColumnIndex("dwTimeStamp");
      if (i != -1) {
        break label4201;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("dwTimeStamp", Long.TYPE));
      label2616:
      i = paramCursor.getColumnIndex("strQZonePhotoUrls");
      if (i != -1) {
        break label4216;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strQZonePhotoUrls", String.class));
      label2651:
      i = paramCursor.getColumnIndex("mQZonePhotoNum");
      if (i != -1) {
        break label4231;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("mQZonePhotoNum", Integer.TYPE));
      label2686:
      i = paramCursor.getColumnIndex("strLocation");
      if (i != -1) {
        break label4246;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strLocation", String.class));
      label2721:
      i = paramCursor.getColumnIndex("troopLat");
      if (i != -1) {
        break label4261;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("troopLat", Integer.TYPE));
      label2756:
      i = paramCursor.getColumnIndex("troopLon");
      if (i != -1) {
        break label4276;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("troopLon", Integer.TYPE));
      label2791:
      i = paramCursor.getColumnIndex("mMemberInvitingFlag");
      if (i != -1) {
        break label4291;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("mMemberInvitingFlag", Boolean.TYPE));
      i = paramCursor.getColumnIndex("mComparePartInt");
      if (i != -1) {
        break label4319;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("mComparePartInt", Integer.TYPE));
      label2861:
      i = paramCursor.getColumnIndex("mCompareSpell");
      if (i != -1) {
        break label4334;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("mCompareSpell", String.class));
      label2896:
      i = paramCursor.getColumnIndex("mSomeMemberUins");
      if (i != -1) {
        break label4349;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("mSomeMemberUins", String.class));
      label2931:
      i = paramCursor.getColumnIndex("mTags");
      if (i != -1) {
        break label4364;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("mTags", String.class));
      label2966:
      i = paramCursor.getColumnIndex("mTroopAvatarId");
      if (i != -1) {
        break label4379;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("mTroopAvatarId", Integer.TYPE));
      label3001:
      i = paramCursor.getColumnIndex("nTroopGrade");
      if (i != -1) {
        break label4394;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("nTroopGrade", Integer.TYPE));
      label3036:
      i = paramCursor.getColumnIndex("isShowInNearbyTroops");
      if (i != -1) {
        break label4409;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("isShowInNearbyTroops", Integer.TYPE));
      label3071:
      i = paramCursor.getColumnIndex("dwGagTimeStamp");
      if (i != -1) {
        break label4424;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("dwGagTimeStamp", Long.TYPE));
      label3108:
      i = paramCursor.getColumnIndex("dwGagTimeStamp_me");
      if (i != -1) {
        break label4439;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("dwGagTimeStamp_me", Long.TYPE));
      label3145:
      i = paramCursor.getColumnIndex("dwCmdUinUinFlag");
      if (i != -1) {
        break label4454;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("dwCmdUinUinFlag", Long.TYPE));
      label3182:
      i = paramCursor.getColumnIndex("dwAdditionalFlag");
      if (i != -1) {
        break label4469;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("dwAdditionalFlag", Long.TYPE));
      label3219:
      i = paramCursor.getColumnIndex("troopTypeExt");
      if (i != -1) {
        break label4484;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("troopTypeExt", Integer.TYPE));
      label3256:
      i = paramCursor.getColumnIndex("ownerNameShow");
      if (i != -1) {
        break label4499;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("ownerNameShow", String.class));
      label3293:
      i = paramCursor.getColumnIndex("adminNameShow");
      if (i != -1) {
        break label4514;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("adminNameShow", String.class));
      label3330:
      i = paramCursor.getColumnIndex("dwOfficeMode");
      if (i != -1) {
        break label4529;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("dwOfficeMode", Long.TYPE));
      label3367:
      i = paramCursor.getColumnIndex("troopPrivilegeFlag");
      if (i != -1) {
        break label4544;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("troopPrivilegeFlag", Long.TYPE));
      label3404:
      i = paramCursor.getColumnIndex("mTroopNeedPayNumber");
      if (i != -1) {
        break label4559;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("mTroopNeedPayNumber", Float.TYPE));
      label3441:
      i = paramCursor.getColumnIndex("troopCreditLevel");
      if (i != -1) {
        break label4574;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("troopCreditLevel", Long.TYPE));
      label3478:
      i = paramCursor.getColumnIndex("troopCreditLevelInfo");
      if (i != -1) {
        break label4589;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("troopCreditLevelInfo", Long.TYPE));
      label3515:
      i = paramCursor.getColumnIndex("dwAppPrivilegeFlag");
      if (i != -1) {
        break label4604;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("dwAppPrivilegeFlag", Long.TYPE));
      label3552:
      i = paramCursor.getColumnIndex("topicId");
      if (i != -1) {
        break label4619;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("topicId", String.class));
    }
    for (;;)
    {
      i = paramCursor.getColumnIndex("associatePubAccount");
      if (i != -1) {
        break label4634;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("associatePubAccount", Long.TYPE));
      return paramEntity;
      uin = paramCursor.getString(i);
      break;
      label3643:
      timeSec = paramCursor.getLong(i);
      break label1321;
      label3658:
      troopuin = paramCursor.getString(i);
      break label1356;
      label3673:
      troopcode = paramCursor.getString(i);
      break label1391;
      label3688:
      troopowneruin = paramCursor.getString(i);
      break label1426;
      label3703:
      troopname = paramCursor.getString(i);
      break label1461;
      label3718:
      troopface = paramCursor.getShort(i);
      break label1496;
      label3733:
      troopmemo = paramCursor.getString(i);
      break label1531;
      label3748:
      fingertroopmemo = paramCursor.getString(i);
      break label1566;
      label3763:
      mRichFingerMemo = paramCursor.getString(i);
      break label1601;
      label3778:
      troopmask = paramCursor.getInt(i);
      break label1636;
      label3793:
      trooptype = paramCursor.getInt(i);
      break label1671;
      label3808:
      troopCreateTime = paramCursor.getLong(i);
      break label1706;
      label3823:
      dwGroupFlag = paramCursor.getLong(i);
      break label1741;
      label3838:
      cGroupOption = paramCursor.getShort(i);
      break label1776;
      label3853:
      wMemberMax = paramCursor.getInt(i);
      break label1811;
      label3868:
      maxAdminNum = paramCursor.getInt(i);
      break label1846;
      label3883:
      wSpecialClass = paramCursor.getInt(i);
      break label1881;
      label3898:
      cGroupLevel = paramCursor.getShort(i);
      break label1916;
      label3913:
      wMemberNum = paramCursor.getInt(i);
      break label1951;
      label3928:
      Administrator = paramCursor.getString(i);
      break label1986;
      label3943:
      dwGroupClassExt = paramCursor.getLong(i);
      break label2021;
      label3958:
      mGroupClassExtText = paramCursor.getString(i);
      break label2056;
      label3973:
      dwGroupFlagExt = paramCursor.getLong(i);
      break label2091;
      label3988:
      dwAuthGroupType = paramCursor.getLong(i);
      break label2126;
      label4003:
      troopAuthenticateInfo = paramCursor.getString(i);
      break label2161;
      label4018:
      dwGroupInfoSeq = paramCursor.getLong(i);
      break label2196;
      label4033:
      mMemberNumSeq = paramCursor.getLong(i);
      break label2231;
      label4048:
      mOldMemberNumSeq = paramCursor.getLong(i);
      break label2266;
      label4063:
      mMemberCardSeq = paramCursor.getLong(i);
      break label2301;
      label4078:
      mOldMemberCardSeq = paramCursor.getLong(i);
      break label2336;
      label4093:
      dwGroupLevelSeq = paramCursor.getLong(i);
      break label2371;
      label4108:
      cGroupRankSysFlag = ((byte)paramCursor.getShort(i));
      break label2406;
      label4124:
      cGroupRankUserFlag = ((byte)paramCursor.getShort(i));
      break label2441;
      label4140:
      troopLevelMap = paramCursor.getString(i);
      break label2476;
      label4155:
      joinTroopQuestion = paramCursor.getString(i);
      break label2511;
      label4170:
      joinTroopAnswer = paramCursor.getString(i);
      break label2546;
      label4185:
      cAlbumResult = ((byte)paramCursor.getShort(i));
      break label2581;
      label4201:
      dwTimeStamp = paramCursor.getLong(i);
      break label2616;
      label4216:
      strQZonePhotoUrls = paramCursor.getString(i);
      break label2651;
      label4231:
      mQZonePhotoNum = paramCursor.getInt(i);
      break label2686;
      label4246:
      strLocation = paramCursor.getString(i);
      break label2721;
      label4261:
      troopLat = paramCursor.getInt(i);
      break label2756;
      label4276:
      troopLon = paramCursor.getInt(i);
      break label2791;
      label4291:
      if (1 == paramCursor.getShort(i)) {}
      for (paramBoolean = bool;; paramBoolean = false)
      {
        mMemberInvitingFlag = paramBoolean;
        break;
      }
      label4319:
      mComparePartInt = paramCursor.getInt(i);
      break label2861;
      label4334:
      mCompareSpell = paramCursor.getString(i);
      break label2896;
      label4349:
      mSomeMemberUins = paramCursor.getString(i);
      break label2931;
      label4364:
      mTags = paramCursor.getString(i);
      break label2966;
      label4379:
      mTroopAvatarId = paramCursor.getInt(i);
      break label3001;
      label4394:
      nTroopGrade = paramCursor.getInt(i);
      break label3036;
      label4409:
      isShowInNearbyTroops = paramCursor.getInt(i);
      break label3071;
      label4424:
      dwGagTimeStamp = paramCursor.getLong(i);
      break label3108;
      label4439:
      dwGagTimeStamp_me = paramCursor.getLong(i);
      break label3145;
      label4454:
      dwCmdUinUinFlag = paramCursor.getLong(i);
      break label3182;
      label4469:
      dwAdditionalFlag = paramCursor.getLong(i);
      break label3219;
      label4484:
      troopTypeExt = paramCursor.getInt(i);
      break label3256;
      label4499:
      ownerNameShow = paramCursor.getString(i);
      break label3293;
      label4514:
      adminNameShow = paramCursor.getString(i);
      break label3330;
      label4529:
      dwOfficeMode = paramCursor.getLong(i);
      break label3367;
      label4544:
      troopPrivilegeFlag = paramCursor.getLong(i);
      break label3404;
      label4559:
      mTroopNeedPayNumber = paramCursor.getFloat(i);
      break label3441;
      label4574:
      troopCreditLevel = paramCursor.getLong(i);
      break label3478;
      label4589:
      troopCreditLevelInfo = paramCursor.getLong(i);
      break label3515;
      label4604:
      dwAppPrivilegeFlag = paramCursor.getLong(i);
      break label3552;
      label4619:
      topicId = paramCursor.getString(i);
    }
    label4634:
    associatePubAccount = paramCursor.getLong(i);
    return paramEntity;
  }
  
  public String a(String paramString)
  {
    StringBuilder localStringBuilder = new StringBuilder("CREATE TABLE IF NOT EXISTS ");
    localStringBuilder.append(paramString);
    localStringBuilder.append(" (_id INTEGER PRIMARY KEY AUTOINCREMENT ,uin TEXT ,timeSec INTEGER ,troopuin TEXT UNIQUE ,troopcode TEXT ,troopowneruin TEXT ,troopname TEXT ,troopface INTEGER ,troopmemo TEXT ,fingertroopmemo TEXT ,mRichFingerMemo TEXT ,troopmask INTEGER ,trooptype INTEGER ,troopCreateTime INTEGER ,dwGroupFlag INTEGER ,cGroupOption INTEGER ,wMemberMax INTEGER ,maxAdminNum INTEGER ,wSpecialClass INTEGER ,cGroupLevel INTEGER ,wMemberNum INTEGER ,Administrator TEXT ,dwGroupClassExt INTEGER ,mGroupClassExtText TEXT ,dwGroupFlagExt INTEGER ,dwAuthGroupType INTEGER ,troopAuthenticateInfo TEXT ,dwGroupInfoSeq INTEGER ,mMemberNumSeq INTEGER ,mOldMemberNumSeq INTEGER ,mMemberCardSeq INTEGER ,mOldMemberCardSeq INTEGER ,dwGroupLevelSeq INTEGER ,cGroupRankSysFlag INTEGER ,cGroupRankUserFlag INTEGER ,troopLevelMap TEXT ,joinTroopQuestion TEXT ,joinTroopAnswer TEXT ,cAlbumResult INTEGER ,dwTimeStamp INTEGER ,strQZonePhotoUrls TEXT ,mQZonePhotoNum INTEGER ,strLocation TEXT ,troopLat INTEGER ,troopLon INTEGER ,mMemberInvitingFlag INTEGER ,mComparePartInt INTEGER ,mCompareSpell TEXT ,mSomeMemberUins TEXT ,mTags TEXT ,mTroopAvatarId INTEGER ,nTroopGrade INTEGER ,isShowInNearbyTroops INTEGER ,dwGagTimeStamp INTEGER ,dwGagTimeStamp_me INTEGER ,dwCmdUinUinFlag INTEGER ,dwAdditionalFlag INTEGER ,troopTypeExt INTEGER ,ownerNameShow TEXT ,adminNameShow TEXT ,dwOfficeMode INTEGER ,troopPrivilegeFlag INTEGER ,mTroopNeedPayNumber REAL ,troopCreditLevel INTEGER ,troopCreditLevelInfo INTEGER ,dwAppPrivilegeFlag INTEGER ,topicId TEXT ,associatePubAccount INTEGER)");
    return localStringBuilder.toString();
  }
  
  public void a(Entity paramEntity, ContentValues paramContentValues)
  {
    paramEntity = (TroopInfo)paramEntity;
    paramContentValues.put("uin", uin);
    paramContentValues.put("timeSec", Long.valueOf(timeSec));
    paramContentValues.put("troopuin", troopuin);
    paramContentValues.put("troopcode", troopcode);
    paramContentValues.put("troopowneruin", troopowneruin);
    paramContentValues.put("troopname", troopname);
    paramContentValues.put("troopface", Short.valueOf(troopface));
    paramContentValues.put("troopmemo", troopmemo);
    paramContentValues.put("fingertroopmemo", fingertroopmemo);
    paramContentValues.put("mRichFingerMemo", mRichFingerMemo);
    paramContentValues.put("troopmask", Integer.valueOf(troopmask));
    paramContentValues.put("trooptype", Integer.valueOf(trooptype));
    paramContentValues.put("troopCreateTime", Long.valueOf(troopCreateTime));
    paramContentValues.put("dwGroupFlag", Long.valueOf(dwGroupFlag));
    paramContentValues.put("cGroupOption", Short.valueOf(cGroupOption));
    paramContentValues.put("wMemberMax", Integer.valueOf(wMemberMax));
    paramContentValues.put("maxAdminNum", Integer.valueOf(maxAdminNum));
    paramContentValues.put("wSpecialClass", Integer.valueOf(wSpecialClass));
    paramContentValues.put("cGroupLevel", Short.valueOf(cGroupLevel));
    paramContentValues.put("wMemberNum", Integer.valueOf(wMemberNum));
    paramContentValues.put("Administrator", Administrator);
    paramContentValues.put("dwGroupClassExt", Long.valueOf(dwGroupClassExt));
    paramContentValues.put("mGroupClassExtText", mGroupClassExtText);
    paramContentValues.put("dwGroupFlagExt", Long.valueOf(dwGroupFlagExt));
    paramContentValues.put("dwAuthGroupType", Long.valueOf(dwAuthGroupType));
    paramContentValues.put("troopAuthenticateInfo", troopAuthenticateInfo);
    paramContentValues.put("dwGroupInfoSeq", Long.valueOf(dwGroupInfoSeq));
    paramContentValues.put("mMemberNumSeq", Long.valueOf(mMemberNumSeq));
    paramContentValues.put("mOldMemberNumSeq", Long.valueOf(mOldMemberNumSeq));
    paramContentValues.put("mMemberCardSeq", Long.valueOf(mMemberCardSeq));
    paramContentValues.put("mOldMemberCardSeq", Long.valueOf(mOldMemberCardSeq));
    paramContentValues.put("dwGroupLevelSeq", Long.valueOf(dwGroupLevelSeq));
    paramContentValues.put("cGroupRankSysFlag", Byte.valueOf(cGroupRankSysFlag));
    paramContentValues.put("cGroupRankUserFlag", Byte.valueOf(cGroupRankUserFlag));
    paramContentValues.put("troopLevelMap", troopLevelMap);
    paramContentValues.put("joinTroopQuestion", joinTroopQuestion);
    paramContentValues.put("joinTroopAnswer", joinTroopAnswer);
    paramContentValues.put("cAlbumResult", Byte.valueOf(cAlbumResult));
    paramContentValues.put("dwTimeStamp", Long.valueOf(dwTimeStamp));
    paramContentValues.put("strQZonePhotoUrls", strQZonePhotoUrls);
    paramContentValues.put("mQZonePhotoNum", Integer.valueOf(mQZonePhotoNum));
    paramContentValues.put("strLocation", strLocation);
    paramContentValues.put("troopLat", Integer.valueOf(troopLat));
    paramContentValues.put("troopLon", Integer.valueOf(troopLon));
    paramContentValues.put("mMemberInvitingFlag", Boolean.valueOf(mMemberInvitingFlag));
    paramContentValues.put("mComparePartInt", Integer.valueOf(mComparePartInt));
    paramContentValues.put("mCompareSpell", mCompareSpell);
    paramContentValues.put("mSomeMemberUins", mSomeMemberUins);
    paramContentValues.put("mTags", mTags);
    paramContentValues.put("mTroopAvatarId", Integer.valueOf(mTroopAvatarId));
    paramContentValues.put("nTroopGrade", Integer.valueOf(nTroopGrade));
    paramContentValues.put("isShowInNearbyTroops", Integer.valueOf(isShowInNearbyTroops));
    paramContentValues.put("dwGagTimeStamp", Long.valueOf(dwGagTimeStamp));
    paramContentValues.put("dwGagTimeStamp_me", Long.valueOf(dwGagTimeStamp_me));
    paramContentValues.put("dwCmdUinUinFlag", Long.valueOf(dwCmdUinUinFlag));
    paramContentValues.put("dwAdditionalFlag", Long.valueOf(dwAdditionalFlag));
    paramContentValues.put("troopTypeExt", Integer.valueOf(troopTypeExt));
    paramContentValues.put("ownerNameShow", ownerNameShow);
    paramContentValues.put("adminNameShow", adminNameShow);
    paramContentValues.put("dwOfficeMode", Long.valueOf(dwOfficeMode));
    paramContentValues.put("troopPrivilegeFlag", Long.valueOf(troopPrivilegeFlag));
    paramContentValues.put("mTroopNeedPayNumber", Float.valueOf(mTroopNeedPayNumber));
    paramContentValues.put("troopCreditLevel", Long.valueOf(troopCreditLevel));
    paramContentValues.put("troopCreditLevelInfo", Long.valueOf(troopCreditLevelInfo));
    paramContentValues.put("dwAppPrivilegeFlag", Long.valueOf(dwAppPrivilegeFlag));
    paramContentValues.put("topicId", topicId);
    paramContentValues.put("associatePubAccount", Long.valueOf(associatePubAccount));
  }
}
