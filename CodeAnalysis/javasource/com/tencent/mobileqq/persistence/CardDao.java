package com.tencent.mobileqq.persistence;

import android.content.ContentValues;
import android.database.Cursor;
import com.tencent.mobileqq.data.Card;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class CardDao
  extends OGAbstractDao
{
  private OGEntityInfo a;
  
  public CardDao()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = 155;
  }
  
  public Entity a(Entity paramEntity, Cursor paramCursor, boolean paramBoolean, NoColumnErrorHandler paramNoColumnErrorHandler)
  {
    boolean bool2 = true;
    boolean bool1 = true;
    paramEntity = (Card)paramEntity;
    if (paramNoColumnErrorHandler == null)
    {
      uin = paramCursor.getString(paramCursor.getColumnIndex("uin"));
      strNick = paramCursor.getString(paramCursor.getColumnIndex("strNick"));
      shGender = paramCursor.getShort(paramCursor.getColumnIndex("shGender"));
      shAge = paramCursor.getShort(paramCursor.getColumnIndex("shAge"));
      nFaceID = paramCursor.getInt(paramCursor.getColumnIndex("nFaceID"));
      strCertificationInfo = paramCursor.getString(paramCursor.getColumnIndex("strCertificationInfo"));
      shType = paramCursor.getShort(paramCursor.getColumnIndex("shType"));
      vContent = paramCursor.getBlob(paramCursor.getColumnIndex("vContent"));
      strSign = paramCursor.getString(paramCursor.getColumnIndex("strSign"));
      strCompany = paramCursor.getString(paramCursor.getColumnIndex("strCompany"));
      strSchool = paramCursor.getString(paramCursor.getColumnIndex("strSchool"));
      uFaceTimeStamp = paramCursor.getInt(paramCursor.getColumnIndex("uFaceTimeStamp"));
      vQQFaceID = paramCursor.getBlob(paramCursor.getColumnIndex("vQQFaceID"));
      strReMark = paramCursor.getString(paramCursor.getColumnIndex("strReMark"));
      bWeiboInfo = ((byte)paramCursor.getShort(paramCursor.getColumnIndex("bWeiboInfo")));
      bQzoneInfo = ((byte)paramCursor.getShort(paramCursor.getColumnIndex("bQzoneInfo")));
      nSameFriendsNum = paramCursor.getInt(paramCursor.getColumnIndex("nSameFriendsNum"));
      strCompanySame = paramCursor.getString(paramCursor.getColumnIndex("strCompanySame"));
      strSchoolSame = paramCursor.getString(paramCursor.getColumnIndex("strSchoolSame"));
      lCardShowNum = paramCursor.getLong(paramCursor.getColumnIndex("lCardShowNum"));
      bSingle = ((byte)paramCursor.getShort(paramCursor.getColumnIndex("bSingle")));
      lVisitCount = paramCursor.getLong(paramCursor.getColumnIndex("lVisitCount"));
      lVoteCount = paramCursor.getLong(paramCursor.getColumnIndex("lVoteCount"));
      tagInfosByte = paramCursor.getBlob(paramCursor.getColumnIndex("tagInfosByte"));
      eUserIdentityType = ((byte)paramCursor.getShort(paramCursor.getColumnIndex("eUserIdentityType")));
      vBackground = paramCursor.getBlob(paramCursor.getColumnIndex("vBackground"));
      labelInfoBytes = paramCursor.getBlob(paramCursor.getColumnIndex("labelInfoBytes"));
      age = ((byte)paramCursor.getShort(paramCursor.getColumnIndex("age")));
      constellation = paramCursor.getInt(paramCursor.getColumnIndex("constellation"));
      pyFaceUrl = paramCursor.getString(paramCursor.getColumnIndex("pyFaceUrl"));
      location = paramCursor.getString(paramCursor.getColumnIndex("location"));
      bVoted = ((byte)paramCursor.getShort(paramCursor.getColumnIndex("bVoted")));
      bFavorited = ((byte)paramCursor.getShort(paramCursor.getColumnIndex("bFavorited")));
      iVoteIncrement = paramCursor.getInt(paramCursor.getColumnIndex("iVoteIncrement"));
      strJoinHexAlbumFileKey = paramCursor.getString(paramCursor.getColumnIndex("strJoinHexAlbumFileKey"));
      iFaceNum = paramCursor.getInt(paramCursor.getColumnIndex("iFaceNum"));
      cSqqLevel = ((byte)paramCursor.getShort(paramCursor.getColumnIndex("cSqqLevel")));
      iQQLevel = paramCursor.getInt(paramCursor.getColumnIndex("iQQLevel"));
      strProvince = paramCursor.getString(paramCursor.getColumnIndex("strProvince"));
      strCity = paramCursor.getString(paramCursor.getColumnIndex("strCity"));
      strCountry = paramCursor.getString(paramCursor.getColumnIndex("strCountry"));
      lBirthday = paramCursor.getLong(paramCursor.getColumnIndex("lBirthday"));
      strLocationCodes = paramCursor.getString(paramCursor.getColumnIndex("strLocationCodes"));
      strLocationDesc = paramCursor.getString(paramCursor.getColumnIndex("strLocationDesc"));
      strHometownCodes = paramCursor.getString(paramCursor.getColumnIndex("strHometownCodes"));
      strHometownDesc = paramCursor.getString(paramCursor.getColumnIndex("strHometownDesc"));
      strEmail = paramCursor.getString(paramCursor.getColumnIndex("strEmail"));
      strPersonalNote = paramCursor.getString(paramCursor.getColumnIndex("strPersonalNote"));
      iProfession = paramCursor.getInt(paramCursor.getColumnIndex("iProfession"));
      bindPhoneInfo = paramCursor.getString(paramCursor.getColumnIndex("bindPhoneInfo"));
      bCardInfo = paramCursor.getBlob(paramCursor.getColumnIndex("bCardInfo"));
      strTroopName = paramCursor.getString(paramCursor.getColumnIndex("strTroopName"));
      strTroopNick = paramCursor.getString(paramCursor.getColumnIndex("strTroopNick"));
      strMobile = paramCursor.getString(paramCursor.getColumnIndex("strMobile"));
      strContactName = paramCursor.getString(paramCursor.getColumnIndex("strContactName"));
      ulShowControl = paramCursor.getInt(paramCursor.getColumnIndex("ulShowControl"));
      feedPreviewTime = paramCursor.getLong(paramCursor.getColumnIndex("feedPreviewTime"));
      strQzoneFeedsDesc = paramCursor.getString(paramCursor.getColumnIndex("strQzoneFeedsDesc"));
      strSpaceName = paramCursor.getString(paramCursor.getColumnIndex("strSpaceName"));
      strQzonePicUrl1 = paramCursor.getString(paramCursor.getColumnIndex("strQzonePicUrl1"));
      strQzonePicUrl2 = paramCursor.getString(paramCursor.getColumnIndex("strQzonePicUrl2"));
      strQzonePicUrl3 = paramCursor.getString(paramCursor.getColumnIndex("strQzonePicUrl3"));
      strStatus = paramCursor.getString(paramCursor.getColumnIndex("strStatus"));
      strAutoRemark = paramCursor.getString(paramCursor.getColumnIndex("strAutoRemark"));
      vSeed = paramCursor.getBlob(paramCursor.getColumnIndex("vSeed"));
      vCookies = paramCursor.getBlob(paramCursor.getColumnIndex("vCookies"));
      bQQVipOpen = ((byte)paramCursor.getShort(paramCursor.getColumnIndex("bQQVipOpen")));
      iQQVipType = paramCursor.getInt(paramCursor.getColumnIndex("iQQVipType"));
      iQQVipLevel = paramCursor.getInt(paramCursor.getColumnIndex("iQQVipLevel"));
      bSuperVipOpen = ((byte)paramCursor.getShort(paramCursor.getColumnIndex("bSuperVipOpen")));
      iSuperVipType = paramCursor.getInt(paramCursor.getColumnIndex("iSuperVipType"));
      iSuperVipLevel = paramCursor.getInt(paramCursor.getColumnIndex("iSuperVipLevel"));
      bSuperQQOpen = ((byte)paramCursor.getShort(paramCursor.getColumnIndex("bSuperQQOpen")));
      iSuperQQType = paramCursor.getInt(paramCursor.getColumnIndex("iSuperQQType"));
      iSuperQQLevel = paramCursor.getInt(paramCursor.getColumnIndex("iSuperQQLevel"));
      bHollywoodVipOpen = ((byte)paramCursor.getShort(paramCursor.getColumnIndex("bHollywoodVipOpen")));
      iHollywoodVipType = paramCursor.getInt(paramCursor.getColumnIndex("iHollywoodVipType"));
      iHollywoodVipLevel = paramCursor.getInt(paramCursor.getColumnIndex("iHollywoodVipLevel"));
      strShowName = paramCursor.getString(paramCursor.getColumnIndex("strShowName"));
      strVoiceFilekey = paramCursor.getString(paramCursor.getColumnIndex("strVoiceFilekey"));
      shDuration = paramCursor.getShort(paramCursor.getColumnIndex("shDuration"));
      bRead = ((byte)paramCursor.getShort(paramCursor.getColumnIndex("bRead")));
      strUrl = paramCursor.getString(paramCursor.getColumnIndex("strUrl"));
      vRichSign = paramCursor.getBlob(paramCursor.getColumnIndex("vRichSign"));
      lSignModifyTime = paramCursor.getLong(paramCursor.getColumnIndex("lSignModifyTime"));
      nLastGameFlag = paramCursor.getInt(paramCursor.getColumnIndex("nLastGameFlag"));
      strGameLogoUrl_1 = paramCursor.getString(paramCursor.getColumnIndex("strGameLogoUrl_1"));
      strGameLogoUrl_2 = paramCursor.getString(paramCursor.getColumnIndex("strGameLogoUrl_2"));
      strGameLogoUrl_3 = paramCursor.getString(paramCursor.getColumnIndex("strGameLogoUrl_3"));
      strGameLogoUrl_4 = paramCursor.getString(paramCursor.getColumnIndex("strGameLogoUrl_4"));
      strGameLogoKey_1 = paramCursor.getString(paramCursor.getColumnIndex("strGameLogoKey_1"));
      strGameLogoKey_2 = paramCursor.getString(paramCursor.getColumnIndex("strGameLogoKey_2"));
      strGameLogoKey_3 = paramCursor.getString(paramCursor.getColumnIndex("strGameLogoKey_3"));
      strGameLogoKey_4 = paramCursor.getString(paramCursor.getColumnIndex("strGameLogoKey_4"));
      strGameName_1 = paramCursor.getString(paramCursor.getColumnIndex("strGameName_1"));
      strGameName_2 = paramCursor.getString(paramCursor.getColumnIndex("strGameName_2"));
      strGameName_3 = paramCursor.getString(paramCursor.getColumnIndex("strGameName_3"));
      strGameName_4 = paramCursor.getString(paramCursor.getColumnIndex("strGameName_4"));
      strGameAppid_1 = paramCursor.getString(paramCursor.getColumnIndex("strGameAppid_1"));
      strGameAppid_2 = paramCursor.getString(paramCursor.getColumnIndex("strGameAppid_2"));
      strGameAppid_3 = paramCursor.getString(paramCursor.getColumnIndex("strGameAppid_3"));
      strGameAppid_4 = paramCursor.getString(paramCursor.getColumnIndex("strGameAppid_4"));
      strProfileUrl = paramCursor.getString(paramCursor.getColumnIndex("strProfileUrl"));
      nStarFansFlag = paramCursor.getInt(paramCursor.getColumnIndex("nStarFansFlag"));
      strStarPicUrl_0 = paramCursor.getString(paramCursor.getColumnIndex("strStarPicUrl_0"));
      strStarPicUrl_1 = paramCursor.getString(paramCursor.getColumnIndex("strStarPicUrl_1"));
      strStarPicUrl_2 = paramCursor.getString(paramCursor.getColumnIndex("strStarPicUrl_2"));
      strStarLvUrl_0 = paramCursor.getString(paramCursor.getColumnIndex("strStarLvUrl_0"));
      strStarLvUrl_1 = paramCursor.getString(paramCursor.getColumnIndex("strStarLvUrl_1"));
      strStarLvUrl_2 = paramCursor.getString(paramCursor.getColumnIndex("strStarLvUrl_2"));
      strStarLogoUrl = paramCursor.getString(paramCursor.getColumnIndex("strStarLogoUrl"));
      starFansJumpUrl = paramCursor.getString(paramCursor.getColumnIndex("starFansJumpUrl"));
      lUserFlag = paramCursor.getLong(paramCursor.getColumnIndex("lUserFlag"));
      lLoginDays = paramCursor.getLong(paramCursor.getColumnIndex("lLoginDays"));
      strLoginDaysDesc = paramCursor.getString(paramCursor.getColumnIndex("strLoginDaysDesc"));
      lQQMasterLogindays = paramCursor.getLong(paramCursor.getColumnIndex("lQQMasterLogindays"));
      if (1 == paramCursor.getShort(paramCursor.getColumnIndex("allowPeopleSee")))
      {
        paramBoolean = true;
        allowPeopleSee = paramBoolean;
        if (1 != paramCursor.getShort(paramCursor.getColumnIndex("allowClick"))) {
          break label3016;
        }
        paramBoolean = true;
        label2230:
        allowClick = paramBoolean;
        if (1 != paramCursor.getShort(paramCursor.getColumnIndex("showLightalk"))) {
          break label3021;
        }
        paramBoolean = true;
        label2256:
        showLightalk = paramBoolean;
        lightalkNick = paramCursor.getString(paramCursor.getColumnIndex("lightalkNick"));
        lightalkId = paramCursor.getString(paramCursor.getColumnIndex("lightalkId"));
        if (1 != paramCursor.getShort(paramCursor.getColumnIndex("isSuperRedDiamond"))) {
          break label3026;
        }
        paramBoolean = true;
        label2320:
        isSuperRedDiamond = paramBoolean;
        if (1 != paramCursor.getShort(paramCursor.getColumnIndex("isRedDiamond"))) {
          break label3031;
        }
        paramBoolean = true;
        label2346:
        isRedDiamond = paramBoolean;
        redLevel = paramCursor.getInt(paramCursor.getColumnIndex("redLevel"));
        if (1 != paramCursor.getShort(paramCursor.getColumnIndex("isSuperYellowDiamond"))) {
          break label3036;
        }
        paramBoolean = true;
        label2391:
        isSuperYellowDiamond = paramBoolean;
        if (1 != paramCursor.getShort(paramCursor.getColumnIndex("isYellowDiamond"))) {
          break label3041;
        }
        paramBoolean = true;
        label2417:
        isYellowDiamond = paramBoolean;
        yellowLevel = paramCursor.getInt(paramCursor.getColumnIndex("yellowLevel"));
        if (1 != paramCursor.getShort(paramCursor.getColumnIndex("isSuperGreenDiamond"))) {
          break label3046;
        }
        paramBoolean = true;
        label2462:
        isSuperGreenDiamond = paramBoolean;
        if (1 != paramCursor.getShort(paramCursor.getColumnIndex("isGreenDiamond"))) {
          break label3051;
        }
        paramBoolean = true;
        label2488:
        isGreenDiamond = paramBoolean;
        greenLevel = paramCursor.getInt(paramCursor.getColumnIndex("greenLevel"));
        uAccelerateMultiple = paramCursor.getLong(paramCursor.getColumnIndex("uAccelerateMultiple"));
        strRespMusicInfo = paramCursor.getString(paramCursor.getColumnIndex("strRespMusicInfo"));
        templateRet = paramCursor.getInt(paramCursor.getColumnIndex("templateRet"));
        lCurrentStyleId = paramCursor.getLong(paramCursor.getColumnIndex("lCurrentStyleId"));
        lCurrentBgId = paramCursor.getLong(paramCursor.getColumnIndex("lCurrentBgId"));
        backgroundUrl = paramCursor.getString(paramCursor.getColumnIndex("backgroundUrl"));
        backgroundColor = paramCursor.getLong(paramCursor.getColumnIndex("backgroundColor"));
        strCurrentBgUrl = paramCursor.getString(paramCursor.getColumnIndex("strCurrentBgUrl"));
        bgType = paramCursor.getBlob(paramCursor.getColumnIndex("bgType"));
        encId = paramCursor.getString(paramCursor.getColumnIndex("encId"));
        busiEntry = paramCursor.getString(paramCursor.getColumnIndex("busiEntry"));
        favoriteSource = paramCursor.getInt(paramCursor.getColumnIndex("favoriteSource"));
        if (1 != paramCursor.getShort(paramCursor.getColumnIndex("visibleMusicPendant"))) {
          break label3056;
        }
        paramBoolean = true;
        label2761:
        visibleMusicPendant = paramBoolean;
        if (1 != paramCursor.getShort(paramCursor.getColumnIndex("autoPlayMusicPendant"))) {
          break label3061;
        }
        paramBoolean = true;
        label2787:
        autoPlayMusicPendant = paramBoolean;
        if (1 != paramCursor.getShort(paramCursor.getColumnIndex("showRedPointMusicPendant"))) {
          break label3066;
        }
      }
      label3016:
      label3021:
      label3026:
      label3031:
      label3036:
      label3041:
      label3046:
      label3051:
      label3056:
      label3061:
      label3066:
      for (paramBoolean = bool1;; paramBoolean = false)
      {
        showRedPointMusicPendant = paramBoolean;
        privilegePromptStr = paramCursor.getString(paramCursor.getColumnIndex("privilegePromptStr"));
        privilegeJumpUrl = paramCursor.getString(paramCursor.getColumnIndex("privilegeJumpUrl"));
        vOpenPriv = paramCursor.getBlob(paramCursor.getColumnIndex("vOpenPriv"));
        vClosePriv = paramCursor.getBlob(paramCursor.getColumnIndex("vClosePriv"));
        addSrcName = paramCursor.getString(paramCursor.getColumnIndex("addSrcName"));
        addSrcId = paramCursor.getLong(paramCursor.getColumnIndex("addSrcId"));
        addSubSrcId = paramCursor.getLong(paramCursor.getColumnIndex("addSubSrcId"));
        strVoteLimitedNotice = paramCursor.getString(paramCursor.getColumnIndex("strVoteLimitedNotice"));
        bHaveVotedCnt = paramCursor.getShort(paramCursor.getColumnIndex("bHaveVotedCnt"));
        bAvailVoteCnt = paramCursor.getShort(paramCursor.getColumnIndex("bAvailVoteCnt"));
        return paramEntity;
        paramBoolean = false;
        break;
        paramBoolean = false;
        break label2230;
        paramBoolean = false;
        break label2256;
        paramBoolean = false;
        break label2320;
        paramBoolean = false;
        break label2346;
        paramBoolean = false;
        break label2391;
        paramBoolean = false;
        break label2417;
        paramBoolean = false;
        break label2462;
        paramBoolean = false;
        break label2488;
        paramBoolean = false;
        break label2761;
        paramBoolean = false;
        break label2787;
      }
    }
    int i = paramCursor.getColumnIndex("uin");
    if (i == -1)
    {
      paramNoColumnErrorHandler.a(new NoColumnError("uin", String.class));
      i = paramCursor.getColumnIndex("strNick");
      if (i != -1) {
        break label8723;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strNick", String.class));
      label3141:
      i = paramCursor.getColumnIndex("shGender");
      if (i != -1) {
        break label8738;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("shGender", Short.TYPE));
      label3176:
      i = paramCursor.getColumnIndex("shAge");
      if (i != -1) {
        break label8753;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("shAge", Short.TYPE));
      label3211:
      i = paramCursor.getColumnIndex("nFaceID");
      if (i != -1) {
        break label8768;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("nFaceID", Integer.TYPE));
      label3246:
      i = paramCursor.getColumnIndex("strCertificationInfo");
      if (i != -1) {
        break label8783;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strCertificationInfo", String.class));
      label3281:
      i = paramCursor.getColumnIndex("shType");
      if (i != -1) {
        break label8798;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("shType", Short.TYPE));
      label3316:
      i = paramCursor.getColumnIndex("vContent");
      if (i != -1) {
        break label8813;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("vContent", [B.class));
      label3351:
      i = paramCursor.getColumnIndex("strSign");
      if (i != -1) {
        break label8828;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strSign", String.class));
      label3386:
      i = paramCursor.getColumnIndex("strCompany");
      if (i != -1) {
        break label8843;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strCompany", String.class));
      label3421:
      i = paramCursor.getColumnIndex("strSchool");
      if (i != -1) {
        break label8858;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strSchool", String.class));
      label3456:
      i = paramCursor.getColumnIndex("uFaceTimeStamp");
      if (i != -1) {
        break label8873;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("uFaceTimeStamp", Integer.TYPE));
      label3491:
      i = paramCursor.getColumnIndex("vQQFaceID");
      if (i != -1) {
        break label8888;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("vQQFaceID", [B.class));
      label3526:
      i = paramCursor.getColumnIndex("strReMark");
      if (i != -1) {
        break label8903;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strReMark", String.class));
      label3561:
      i = paramCursor.getColumnIndex("bWeiboInfo");
      if (i != -1) {
        break label8918;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("bWeiboInfo", Byte.TYPE));
      label3596:
      i = paramCursor.getColumnIndex("bQzoneInfo");
      if (i != -1) {
        break label8934;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("bQzoneInfo", Byte.TYPE));
      label3631:
      i = paramCursor.getColumnIndex("nSameFriendsNum");
      if (i != -1) {
        break label8950;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("nSameFriendsNum", Integer.TYPE));
      label3666:
      i = paramCursor.getColumnIndex("strCompanySame");
      if (i != -1) {
        break label8965;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strCompanySame", String.class));
      label3701:
      i = paramCursor.getColumnIndex("strSchoolSame");
      if (i != -1) {
        break label8980;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strSchoolSame", String.class));
      label3736:
      i = paramCursor.getColumnIndex("lCardShowNum");
      if (i != -1) {
        break label8995;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("lCardShowNum", Long.TYPE));
      label3771:
      i = paramCursor.getColumnIndex("bSingle");
      if (i != -1) {
        break label9010;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("bSingle", Byte.TYPE));
      label3806:
      i = paramCursor.getColumnIndex("lVisitCount");
      if (i != -1) {
        break label9026;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("lVisitCount", Long.TYPE));
      label3841:
      i = paramCursor.getColumnIndex("lVoteCount");
      if (i != -1) {
        break label9041;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("lVoteCount", Long.TYPE));
      label3876:
      i = paramCursor.getColumnIndex("tagInfosByte");
      if (i != -1) {
        break label9056;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("tagInfosByte", [B.class));
      label3911:
      i = paramCursor.getColumnIndex("eUserIdentityType");
      if (i != -1) {
        break label9071;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("eUserIdentityType", Byte.TYPE));
      label3946:
      i = paramCursor.getColumnIndex("vBackground");
      if (i != -1) {
        break label9087;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("vBackground", [B.class));
      label3981:
      i = paramCursor.getColumnIndex("labelInfoBytes");
      if (i != -1) {
        break label9102;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("labelInfoBytes", [B.class));
      label4016:
      i = paramCursor.getColumnIndex("age");
      if (i != -1) {
        break label9117;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("age", Byte.TYPE));
      label4051:
      i = paramCursor.getColumnIndex("constellation");
      if (i != -1) {
        break label9133;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("constellation", Integer.TYPE));
      label4086:
      i = paramCursor.getColumnIndex("pyFaceUrl");
      if (i != -1) {
        break label9148;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("pyFaceUrl", String.class));
      label4121:
      i = paramCursor.getColumnIndex("location");
      if (i != -1) {
        break label9163;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("location", String.class));
      label4156:
      i = paramCursor.getColumnIndex("bVoted");
      if (i != -1) {
        break label9178;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("bVoted", Byte.TYPE));
      label4191:
      i = paramCursor.getColumnIndex("bFavorited");
      if (i != -1) {
        break label9194;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("bFavorited", Byte.TYPE));
      label4226:
      i = paramCursor.getColumnIndex("iVoteIncrement");
      if (i != -1) {
        break label9210;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("iVoteIncrement", Integer.TYPE));
      label4261:
      i = paramCursor.getColumnIndex("strJoinHexAlbumFileKey");
      if (i != -1) {
        break label9225;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strJoinHexAlbumFileKey", String.class));
      label4296:
      i = paramCursor.getColumnIndex("iFaceNum");
      if (i != -1) {
        break label9240;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("iFaceNum", Integer.TYPE));
      label4331:
      i = paramCursor.getColumnIndex("cSqqLevel");
      if (i != -1) {
        break label9255;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("cSqqLevel", Byte.TYPE));
      label4366:
      i = paramCursor.getColumnIndex("iQQLevel");
      if (i != -1) {
        break label9271;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("iQQLevel", Integer.TYPE));
      label4401:
      i = paramCursor.getColumnIndex("strProvince");
      if (i != -1) {
        break label9286;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strProvince", String.class));
      label4436:
      i = paramCursor.getColumnIndex("strCity");
      if (i != -1) {
        break label9301;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strCity", String.class));
      label4471:
      i = paramCursor.getColumnIndex("strCountry");
      if (i != -1) {
        break label9316;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strCountry", String.class));
      label4506:
      i = paramCursor.getColumnIndex("lBirthday");
      if (i != -1) {
        break label9331;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("lBirthday", Long.TYPE));
      label4541:
      i = paramCursor.getColumnIndex("strLocationCodes");
      if (i != -1) {
        break label9346;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strLocationCodes", String.class));
      label4576:
      i = paramCursor.getColumnIndex("strLocationDesc");
      if (i != -1) {
        break label9361;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strLocationDesc", String.class));
      label4611:
      i = paramCursor.getColumnIndex("strHometownCodes");
      if (i != -1) {
        break label9376;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strHometownCodes", String.class));
      label4646:
      i = paramCursor.getColumnIndex("strHometownDesc");
      if (i != -1) {
        break label9391;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strHometownDesc", String.class));
      label4681:
      i = paramCursor.getColumnIndex("strEmail");
      if (i != -1) {
        break label9406;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strEmail", String.class));
      label4716:
      i = paramCursor.getColumnIndex("strPersonalNote");
      if (i != -1) {
        break label9421;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strPersonalNote", String.class));
      label4751:
      i = paramCursor.getColumnIndex("iProfession");
      if (i != -1) {
        break label9436;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("iProfession", Integer.TYPE));
      label4786:
      i = paramCursor.getColumnIndex("bindPhoneInfo");
      if (i != -1) {
        break label9451;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("bindPhoneInfo", String.class));
      label4821:
      i = paramCursor.getColumnIndex("bCardInfo");
      if (i != -1) {
        break label9466;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("bCardInfo", [B.class));
      label4858:
      i = paramCursor.getColumnIndex("strTroopName");
      if (i != -1) {
        break label9481;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strTroopName", String.class));
      label4895:
      i = paramCursor.getColumnIndex("strTroopNick");
      if (i != -1) {
        break label9496;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strTroopNick", String.class));
      label4932:
      i = paramCursor.getColumnIndex("strMobile");
      if (i != -1) {
        break label9511;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strMobile", String.class));
      label4969:
      i = paramCursor.getColumnIndex("strContactName");
      if (i != -1) {
        break label9526;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strContactName", String.class));
      label5006:
      i = paramCursor.getColumnIndex("ulShowControl");
      if (i != -1) {
        break label9541;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("ulShowControl", Integer.TYPE));
      label5043:
      i = paramCursor.getColumnIndex("feedPreviewTime");
      if (i != -1) {
        break label9556;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("feedPreviewTime", Long.TYPE));
      label5080:
      i = paramCursor.getColumnIndex("strQzoneFeedsDesc");
      if (i != -1) {
        break label9571;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strQzoneFeedsDesc", String.class));
      label5117:
      i = paramCursor.getColumnIndex("strSpaceName");
      if (i != -1) {
        break label9586;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strSpaceName", String.class));
      label5154:
      i = paramCursor.getColumnIndex("strQzonePicUrl1");
      if (i != -1) {
        break label9601;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strQzonePicUrl1", String.class));
      label5191:
      i = paramCursor.getColumnIndex("strQzonePicUrl2");
      if (i != -1) {
        break label9616;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strQzonePicUrl2", String.class));
      label5228:
      i = paramCursor.getColumnIndex("strQzonePicUrl3");
      if (i != -1) {
        break label9631;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strQzonePicUrl3", String.class));
      label5265:
      i = paramCursor.getColumnIndex("strStatus");
      if (i != -1) {
        break label9646;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strStatus", String.class));
      label5302:
      i = paramCursor.getColumnIndex("strAutoRemark");
      if (i != -1) {
        break label9661;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strAutoRemark", String.class));
      label5339:
      i = paramCursor.getColumnIndex("vSeed");
      if (i != -1) {
        break label9676;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("vSeed", [B.class));
      label5376:
      i = paramCursor.getColumnIndex("vCookies");
      if (i != -1) {
        break label9691;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("vCookies", [B.class));
      label5413:
      i = paramCursor.getColumnIndex("bQQVipOpen");
      if (i != -1) {
        break label9706;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("bQQVipOpen", Byte.TYPE));
      label5450:
      i = paramCursor.getColumnIndex("iQQVipType");
      if (i != -1) {
        break label9722;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("iQQVipType", Integer.TYPE));
      label5487:
      i = paramCursor.getColumnIndex("iQQVipLevel");
      if (i != -1) {
        break label9737;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("iQQVipLevel", Integer.TYPE));
      label5524:
      i = paramCursor.getColumnIndex("bSuperVipOpen");
      if (i != -1) {
        break label9752;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("bSuperVipOpen", Byte.TYPE));
      label5561:
      i = paramCursor.getColumnIndex("iSuperVipType");
      if (i != -1) {
        break label9768;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("iSuperVipType", Integer.TYPE));
      label5598:
      i = paramCursor.getColumnIndex("iSuperVipLevel");
      if (i != -1) {
        break label9783;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("iSuperVipLevel", Integer.TYPE));
      label5635:
      i = paramCursor.getColumnIndex("bSuperQQOpen");
      if (i != -1) {
        break label9798;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("bSuperQQOpen", Byte.TYPE));
      label5672:
      i = paramCursor.getColumnIndex("iSuperQQType");
      if (i != -1) {
        break label9814;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("iSuperQQType", Integer.TYPE));
      label5709:
      i = paramCursor.getColumnIndex("iSuperQQLevel");
      if (i != -1) {
        break label9829;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("iSuperQQLevel", Integer.TYPE));
      label5746:
      i = paramCursor.getColumnIndex("bHollywoodVipOpen");
      if (i != -1) {
        break label9844;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("bHollywoodVipOpen", Byte.TYPE));
      label5783:
      i = paramCursor.getColumnIndex("iHollywoodVipType");
      if (i != -1) {
        break label9860;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("iHollywoodVipType", Integer.TYPE));
      label5820:
      i = paramCursor.getColumnIndex("iHollywoodVipLevel");
      if (i != -1) {
        break label9875;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("iHollywoodVipLevel", Integer.TYPE));
      label5857:
      i = paramCursor.getColumnIndex("strShowName");
      if (i != -1) {
        break label9890;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strShowName", String.class));
      label5894:
      i = paramCursor.getColumnIndex("strVoiceFilekey");
      if (i != -1) {
        break label9905;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strVoiceFilekey", String.class));
      label5931:
      i = paramCursor.getColumnIndex("shDuration");
      if (i != -1) {
        break label9920;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("shDuration", Short.TYPE));
      label5968:
      i = paramCursor.getColumnIndex("bRead");
      if (i != -1) {
        break label9935;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("bRead", Byte.TYPE));
      label6005:
      i = paramCursor.getColumnIndex("strUrl");
      if (i != -1) {
        break label9951;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strUrl", String.class));
      label6042:
      i = paramCursor.getColumnIndex("vRichSign");
      if (i != -1) {
        break label9966;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("vRichSign", [B.class));
      label6079:
      i = paramCursor.getColumnIndex("lSignModifyTime");
      if (i != -1) {
        break label9981;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("lSignModifyTime", Long.TYPE));
      label6116:
      i = paramCursor.getColumnIndex("nLastGameFlag");
      if (i != -1) {
        break label9996;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("nLastGameFlag", Integer.TYPE));
      label6153:
      i = paramCursor.getColumnIndex("strGameLogoUrl_1");
      if (i != -1) {
        break label10011;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strGameLogoUrl_1", String.class));
      label6190:
      i = paramCursor.getColumnIndex("strGameLogoUrl_2");
      if (i != -1) {
        break label10026;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strGameLogoUrl_2", String.class));
      label6227:
      i = paramCursor.getColumnIndex("strGameLogoUrl_3");
      if (i != -1) {
        break label10041;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strGameLogoUrl_3", String.class));
      label6264:
      i = paramCursor.getColumnIndex("strGameLogoUrl_4");
      if (i != -1) {
        break label10056;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strGameLogoUrl_4", String.class));
      label6301:
      i = paramCursor.getColumnIndex("strGameLogoKey_1");
      if (i != -1) {
        break label10071;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strGameLogoKey_1", String.class));
      label6338:
      i = paramCursor.getColumnIndex("strGameLogoKey_2");
      if (i != -1) {
        break label10086;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strGameLogoKey_2", String.class));
      label6375:
      i = paramCursor.getColumnIndex("strGameLogoKey_3");
      if (i != -1) {
        break label10101;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strGameLogoKey_3", String.class));
      label6412:
      i = paramCursor.getColumnIndex("strGameLogoKey_4");
      if (i != -1) {
        break label10116;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strGameLogoKey_4", String.class));
      label6449:
      i = paramCursor.getColumnIndex("strGameName_1");
      if (i != -1) {
        break label10131;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strGameName_1", String.class));
      label6486:
      i = paramCursor.getColumnIndex("strGameName_2");
      if (i != -1) {
        break label10146;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strGameName_2", String.class));
      label6523:
      i = paramCursor.getColumnIndex("strGameName_3");
      if (i != -1) {
        break label10161;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strGameName_3", String.class));
      label6560:
      i = paramCursor.getColumnIndex("strGameName_4");
      if (i != -1) {
        break label10176;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strGameName_4", String.class));
      label6597:
      i = paramCursor.getColumnIndex("strGameAppid_1");
      if (i != -1) {
        break label10191;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strGameAppid_1", String.class));
      label6634:
      i = paramCursor.getColumnIndex("strGameAppid_2");
      if (i != -1) {
        break label10206;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strGameAppid_2", String.class));
      label6671:
      i = paramCursor.getColumnIndex("strGameAppid_3");
      if (i != -1) {
        break label10221;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strGameAppid_3", String.class));
      label6708:
      i = paramCursor.getColumnIndex("strGameAppid_4");
      if (i != -1) {
        break label10236;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strGameAppid_4", String.class));
      label6745:
      i = paramCursor.getColumnIndex("strProfileUrl");
      if (i != -1) {
        break label10251;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strProfileUrl", String.class));
      label6782:
      i = paramCursor.getColumnIndex("nStarFansFlag");
      if (i != -1) {
        break label10266;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("nStarFansFlag", Integer.TYPE));
      label6819:
      i = paramCursor.getColumnIndex("strStarPicUrl_0");
      if (i != -1) {
        break label10281;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strStarPicUrl_0", String.class));
      label6856:
      i = paramCursor.getColumnIndex("strStarPicUrl_1");
      if (i != -1) {
        break label10296;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strStarPicUrl_1", String.class));
      label6893:
      i = paramCursor.getColumnIndex("strStarPicUrl_2");
      if (i != -1) {
        break label10311;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strStarPicUrl_2", String.class));
      label6930:
      i = paramCursor.getColumnIndex("strStarLvUrl_0");
      if (i != -1) {
        break label10326;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strStarLvUrl_0", String.class));
      label6967:
      i = paramCursor.getColumnIndex("strStarLvUrl_1");
      if (i != -1) {
        break label10341;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strStarLvUrl_1", String.class));
      label7004:
      i = paramCursor.getColumnIndex("strStarLvUrl_2");
      if (i != -1) {
        break label10356;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strStarLvUrl_2", String.class));
      label7041:
      i = paramCursor.getColumnIndex("strStarLogoUrl");
      if (i != -1) {
        break label10371;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strStarLogoUrl", String.class));
      label7078:
      i = paramCursor.getColumnIndex("starFansJumpUrl");
      if (i != -1) {
        break label10386;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("starFansJumpUrl", String.class));
      label7115:
      i = paramCursor.getColumnIndex("lUserFlag");
      if (i != -1) {
        break label10401;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("lUserFlag", Long.TYPE));
      label7152:
      i = paramCursor.getColumnIndex("lLoginDays");
      if (i != -1) {
        break label10416;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("lLoginDays", Long.TYPE));
      label7189:
      i = paramCursor.getColumnIndex("strLoginDaysDesc");
      if (i != -1) {
        break label10431;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strLoginDaysDesc", String.class));
      label7226:
      i = paramCursor.getColumnIndex("lQQMasterLogindays");
      if (i != -1) {
        break label10446;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("lQQMasterLogindays", Long.TYPE));
      label7263:
      i = paramCursor.getColumnIndex("allowPeopleSee");
      if (i != -1) {
        break label10461;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("allowPeopleSee", Boolean.TYPE));
      i = paramCursor.getColumnIndex("allowClick");
      if (i != -1) {
        break label10488;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("allowClick", Boolean.TYPE));
      i = paramCursor.getColumnIndex("showLightalk");
      if (i != -1) {
        break label10515;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("showLightalk", Boolean.TYPE));
      i = paramCursor.getColumnIndex("lightalkNick");
      if (i != -1) {
        break label10542;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("lightalkNick", String.class));
      label7411:
      i = paramCursor.getColumnIndex("lightalkId");
      if (i != -1) {
        break label10557;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("lightalkId", String.class));
      label7448:
      i = paramCursor.getColumnIndex("isSuperRedDiamond");
      if (i != -1) {
        break label10572;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("isSuperRedDiamond", Boolean.TYPE));
      i = paramCursor.getColumnIndex("isRedDiamond");
      if (i != -1) {
        break label10599;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("isRedDiamond", Boolean.TYPE));
      i = paramCursor.getColumnIndex("redLevel");
      if (i != -1) {
        break label10626;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("redLevel", Integer.TYPE));
      label7559:
      i = paramCursor.getColumnIndex("isSuperYellowDiamond");
      if (i != -1) {
        break label10641;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("isSuperYellowDiamond", Boolean.TYPE));
      i = paramCursor.getColumnIndex("isYellowDiamond");
      if (i != -1) {
        break label10668;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("isYellowDiamond", Boolean.TYPE));
      i = paramCursor.getColumnIndex("yellowLevel");
      if (i != -1) {
        break label10695;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("yellowLevel", Integer.TYPE));
      label7670:
      i = paramCursor.getColumnIndex("isSuperGreenDiamond");
      if (i != -1) {
        break label10710;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("isSuperGreenDiamond", Boolean.TYPE));
      i = paramCursor.getColumnIndex("isGreenDiamond");
      if (i != -1) {
        break label10737;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("isGreenDiamond", Boolean.TYPE));
      i = paramCursor.getColumnIndex("greenLevel");
      if (i != -1) {
        break label10764;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("greenLevel", Integer.TYPE));
      label7781:
      i = paramCursor.getColumnIndex("uAccelerateMultiple");
      if (i != -1) {
        break label10779;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("uAccelerateMultiple", Long.TYPE));
      label7818:
      i = paramCursor.getColumnIndex("strRespMusicInfo");
      if (i != -1) {
        break label10794;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strRespMusicInfo", String.class));
      label7855:
      i = paramCursor.getColumnIndex("templateRet");
      if (i != -1) {
        break label10809;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("templateRet", Integer.TYPE));
      label7892:
      i = paramCursor.getColumnIndex("lCurrentStyleId");
      if (i != -1) {
        break label10824;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("lCurrentStyleId", Long.TYPE));
      label7929:
      i = paramCursor.getColumnIndex("lCurrentBgId");
      if (i != -1) {
        break label10839;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("lCurrentBgId", Long.TYPE));
      label7966:
      i = paramCursor.getColumnIndex("backgroundUrl");
      if (i != -1) {
        break label10854;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("backgroundUrl", String.class));
      label8003:
      i = paramCursor.getColumnIndex("backgroundColor");
      if (i != -1) {
        break label10869;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("backgroundColor", Long.TYPE));
      label8040:
      i = paramCursor.getColumnIndex("strCurrentBgUrl");
      if (i != -1) {
        break label10884;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strCurrentBgUrl", String.class));
      label8077:
      i = paramCursor.getColumnIndex("bgType");
      if (i != -1) {
        break label10899;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("bgType", [B.class));
      label8114:
      i = paramCursor.getColumnIndex("encId");
      if (i != -1) {
        break label10914;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("encId", String.class));
      label8151:
      i = paramCursor.getColumnIndex("busiEntry");
      if (i != -1) {
        break label10929;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("busiEntry", String.class));
      label8188:
      i = paramCursor.getColumnIndex("favoriteSource");
      if (i != -1) {
        break label10944;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("favoriteSource", Integer.TYPE));
      label8225:
      i = paramCursor.getColumnIndex("visibleMusicPendant");
      if (i != -1) {
        break label10959;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("visibleMusicPendant", Boolean.TYPE));
      i = paramCursor.getColumnIndex("autoPlayMusicPendant");
      if (i != -1) {
        break label10986;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("autoPlayMusicPendant", Boolean.TYPE));
      i = paramCursor.getColumnIndex("showRedPointMusicPendant");
      if (i != -1) {
        break label11013;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("showRedPointMusicPendant", Boolean.TYPE));
      i = paramCursor.getColumnIndex("privilegePromptStr");
      if (i != -1) {
        break label11041;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("privilegePromptStr", String.class));
      label8373:
      i = paramCursor.getColumnIndex("privilegeJumpUrl");
      if (i != -1) {
        break label11056;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("privilegeJumpUrl", String.class));
      label8410:
      i = paramCursor.getColumnIndex("vOpenPriv");
      if (i != -1) {
        break label11071;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("vOpenPriv", [B.class));
      label8447:
      i = paramCursor.getColumnIndex("vClosePriv");
      if (i != -1) {
        break label11086;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("vClosePriv", [B.class));
      label8484:
      i = paramCursor.getColumnIndex("addSrcName");
      if (i != -1) {
        break label11101;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("addSrcName", String.class));
      label8521:
      i = paramCursor.getColumnIndex("addSrcId");
      if (i != -1) {
        break label11116;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("addSrcId", Long.TYPE));
      label8558:
      i = paramCursor.getColumnIndex("addSubSrcId");
      if (i != -1) {
        break label11131;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("addSubSrcId", Long.TYPE));
      label8595:
      i = paramCursor.getColumnIndex("strVoteLimitedNotice");
      if (i != -1) {
        break label11146;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strVoteLimitedNotice", String.class));
      label8632:
      i = paramCursor.getColumnIndex("bHaveVotedCnt");
      if (i != -1) {
        break label11161;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("bHaveVotedCnt", Short.TYPE));
    }
    for (;;)
    {
      i = paramCursor.getColumnIndex("bAvailVoteCnt");
      if (i != -1) {
        break label11176;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("bAvailVoteCnt", Short.TYPE));
      return paramEntity;
      uin = paramCursor.getString(i);
      break;
      label8723:
      strNick = paramCursor.getString(i);
      break label3141;
      label8738:
      shGender = paramCursor.getShort(i);
      break label3176;
      label8753:
      shAge = paramCursor.getShort(i);
      break label3211;
      label8768:
      nFaceID = paramCursor.getInt(i);
      break label3246;
      label8783:
      strCertificationInfo = paramCursor.getString(i);
      break label3281;
      label8798:
      shType = paramCursor.getShort(i);
      break label3316;
      label8813:
      vContent = paramCursor.getBlob(i);
      break label3351;
      label8828:
      strSign = paramCursor.getString(i);
      break label3386;
      label8843:
      strCompany = paramCursor.getString(i);
      break label3421;
      label8858:
      strSchool = paramCursor.getString(i);
      break label3456;
      label8873:
      uFaceTimeStamp = paramCursor.getInt(i);
      break label3491;
      label8888:
      vQQFaceID = paramCursor.getBlob(i);
      break label3526;
      label8903:
      strReMark = paramCursor.getString(i);
      break label3561;
      label8918:
      bWeiboInfo = ((byte)paramCursor.getShort(i));
      break label3596;
      label8934:
      bQzoneInfo = ((byte)paramCursor.getShort(i));
      break label3631;
      label8950:
      nSameFriendsNum = paramCursor.getInt(i);
      break label3666;
      label8965:
      strCompanySame = paramCursor.getString(i);
      break label3701;
      label8980:
      strSchoolSame = paramCursor.getString(i);
      break label3736;
      label8995:
      lCardShowNum = paramCursor.getLong(i);
      break label3771;
      label9010:
      bSingle = ((byte)paramCursor.getShort(i));
      break label3806;
      label9026:
      lVisitCount = paramCursor.getLong(i);
      break label3841;
      label9041:
      lVoteCount = paramCursor.getLong(i);
      break label3876;
      label9056:
      tagInfosByte = paramCursor.getBlob(i);
      break label3911;
      label9071:
      eUserIdentityType = ((byte)paramCursor.getShort(i));
      break label3946;
      label9087:
      vBackground = paramCursor.getBlob(i);
      break label3981;
      label9102:
      labelInfoBytes = paramCursor.getBlob(i);
      break label4016;
      label9117:
      age = ((byte)paramCursor.getShort(i));
      break label4051;
      label9133:
      constellation = paramCursor.getInt(i);
      break label4086;
      label9148:
      pyFaceUrl = paramCursor.getString(i);
      break label4121;
      label9163:
      location = paramCursor.getString(i);
      break label4156;
      label9178:
      bVoted = ((byte)paramCursor.getShort(i));
      break label4191;
      label9194:
      bFavorited = ((byte)paramCursor.getShort(i));
      break label4226;
      label9210:
      iVoteIncrement = paramCursor.getInt(i);
      break label4261;
      label9225:
      strJoinHexAlbumFileKey = paramCursor.getString(i);
      break label4296;
      label9240:
      iFaceNum = paramCursor.getInt(i);
      break label4331;
      label9255:
      cSqqLevel = ((byte)paramCursor.getShort(i));
      break label4366;
      label9271:
      iQQLevel = paramCursor.getInt(i);
      break label4401;
      label9286:
      strProvince = paramCursor.getString(i);
      break label4436;
      label9301:
      strCity = paramCursor.getString(i);
      break label4471;
      label9316:
      strCountry = paramCursor.getString(i);
      break label4506;
      label9331:
      lBirthday = paramCursor.getLong(i);
      break label4541;
      label9346:
      strLocationCodes = paramCursor.getString(i);
      break label4576;
      label9361:
      strLocationDesc = paramCursor.getString(i);
      break label4611;
      label9376:
      strHometownCodes = paramCursor.getString(i);
      break label4646;
      label9391:
      strHometownDesc = paramCursor.getString(i);
      break label4681;
      label9406:
      strEmail = paramCursor.getString(i);
      break label4716;
      label9421:
      strPersonalNote = paramCursor.getString(i);
      break label4751;
      label9436:
      iProfession = paramCursor.getInt(i);
      break label4786;
      label9451:
      bindPhoneInfo = paramCursor.getString(i);
      break label4821;
      label9466:
      bCardInfo = paramCursor.getBlob(i);
      break label4858;
      label9481:
      strTroopName = paramCursor.getString(i);
      break label4895;
      label9496:
      strTroopNick = paramCursor.getString(i);
      break label4932;
      label9511:
      strMobile = paramCursor.getString(i);
      break label4969;
      label9526:
      strContactName = paramCursor.getString(i);
      break label5006;
      label9541:
      ulShowControl = paramCursor.getInt(i);
      break label5043;
      label9556:
      feedPreviewTime = paramCursor.getLong(i);
      break label5080;
      label9571:
      strQzoneFeedsDesc = paramCursor.getString(i);
      break label5117;
      label9586:
      strSpaceName = paramCursor.getString(i);
      break label5154;
      label9601:
      strQzonePicUrl1 = paramCursor.getString(i);
      break label5191;
      label9616:
      strQzonePicUrl2 = paramCursor.getString(i);
      break label5228;
      label9631:
      strQzonePicUrl3 = paramCursor.getString(i);
      break label5265;
      label9646:
      strStatus = paramCursor.getString(i);
      break label5302;
      label9661:
      strAutoRemark = paramCursor.getString(i);
      break label5339;
      label9676:
      vSeed = paramCursor.getBlob(i);
      break label5376;
      label9691:
      vCookies = paramCursor.getBlob(i);
      break label5413;
      label9706:
      bQQVipOpen = ((byte)paramCursor.getShort(i));
      break label5450;
      label9722:
      iQQVipType = paramCursor.getInt(i);
      break label5487;
      label9737:
      iQQVipLevel = paramCursor.getInt(i);
      break label5524;
      label9752:
      bSuperVipOpen = ((byte)paramCursor.getShort(i));
      break label5561;
      label9768:
      iSuperVipType = paramCursor.getInt(i);
      break label5598;
      label9783:
      iSuperVipLevel = paramCursor.getInt(i);
      break label5635;
      label9798:
      bSuperQQOpen = ((byte)paramCursor.getShort(i));
      break label5672;
      label9814:
      iSuperQQType = paramCursor.getInt(i);
      break label5709;
      label9829:
      iSuperQQLevel = paramCursor.getInt(i);
      break label5746;
      label9844:
      bHollywoodVipOpen = ((byte)paramCursor.getShort(i));
      break label5783;
      label9860:
      iHollywoodVipType = paramCursor.getInt(i);
      break label5820;
      label9875:
      iHollywoodVipLevel = paramCursor.getInt(i);
      break label5857;
      label9890:
      strShowName = paramCursor.getString(i);
      break label5894;
      label9905:
      strVoiceFilekey = paramCursor.getString(i);
      break label5931;
      label9920:
      shDuration = paramCursor.getShort(i);
      break label5968;
      label9935:
      bRead = ((byte)paramCursor.getShort(i));
      break label6005;
      label9951:
      strUrl = paramCursor.getString(i);
      break label6042;
      label9966:
      vRichSign = paramCursor.getBlob(i);
      break label6079;
      label9981:
      lSignModifyTime = paramCursor.getLong(i);
      break label6116;
      label9996:
      nLastGameFlag = paramCursor.getInt(i);
      break label6153;
      label10011:
      strGameLogoUrl_1 = paramCursor.getString(i);
      break label6190;
      label10026:
      strGameLogoUrl_2 = paramCursor.getString(i);
      break label6227;
      label10041:
      strGameLogoUrl_3 = paramCursor.getString(i);
      break label6264;
      label10056:
      strGameLogoUrl_4 = paramCursor.getString(i);
      break label6301;
      label10071:
      strGameLogoKey_1 = paramCursor.getString(i);
      break label6338;
      label10086:
      strGameLogoKey_2 = paramCursor.getString(i);
      break label6375;
      label10101:
      strGameLogoKey_3 = paramCursor.getString(i);
      break label6412;
      label10116:
      strGameLogoKey_4 = paramCursor.getString(i);
      break label6449;
      label10131:
      strGameName_1 = paramCursor.getString(i);
      break label6486;
      label10146:
      strGameName_2 = paramCursor.getString(i);
      break label6523;
      label10161:
      strGameName_3 = paramCursor.getString(i);
      break label6560;
      label10176:
      strGameName_4 = paramCursor.getString(i);
      break label6597;
      label10191:
      strGameAppid_1 = paramCursor.getString(i);
      break label6634;
      label10206:
      strGameAppid_2 = paramCursor.getString(i);
      break label6671;
      label10221:
      strGameAppid_3 = paramCursor.getString(i);
      break label6708;
      label10236:
      strGameAppid_4 = paramCursor.getString(i);
      break label6745;
      label10251:
      strProfileUrl = paramCursor.getString(i);
      break label6782;
      label10266:
      nStarFansFlag = paramCursor.getInt(i);
      break label6819;
      label10281:
      strStarPicUrl_0 = paramCursor.getString(i);
      break label6856;
      label10296:
      strStarPicUrl_1 = paramCursor.getString(i);
      break label6893;
      label10311:
      strStarPicUrl_2 = paramCursor.getString(i);
      break label6930;
      label10326:
      strStarLvUrl_0 = paramCursor.getString(i);
      break label6967;
      label10341:
      strStarLvUrl_1 = paramCursor.getString(i);
      break label7004;
      label10356:
      strStarLvUrl_2 = paramCursor.getString(i);
      break label7041;
      label10371:
      strStarLogoUrl = paramCursor.getString(i);
      break label7078;
      label10386:
      starFansJumpUrl = paramCursor.getString(i);
      break label7115;
      label10401:
      lUserFlag = paramCursor.getLong(i);
      break label7152;
      label10416:
      lLoginDays = paramCursor.getLong(i);
      break label7189;
      label10431:
      strLoginDaysDesc = paramCursor.getString(i);
      break label7226;
      label10446:
      lQQMasterLogindays = paramCursor.getLong(i);
      break label7263;
      label10461:
      if (1 == paramCursor.getShort(i)) {}
      for (paramBoolean = true;; paramBoolean = false)
      {
        allowPeopleSee = paramBoolean;
        break;
      }
      label10488:
      if (1 == paramCursor.getShort(i)) {}
      for (paramBoolean = true;; paramBoolean = false)
      {
        allowClick = paramBoolean;
        break;
      }
      label10515:
      if (1 == paramCursor.getShort(i)) {}
      for (paramBoolean = true;; paramBoolean = false)
      {
        showLightalk = paramBoolean;
        break;
      }
      label10542:
      lightalkNick = paramCursor.getString(i);
      break label7411;
      label10557:
      lightalkId = paramCursor.getString(i);
      break label7448;
      label10572:
      if (1 == paramCursor.getShort(i)) {}
      for (paramBoolean = true;; paramBoolean = false)
      {
        isSuperRedDiamond = paramBoolean;
        break;
      }
      label10599:
      if (1 == paramCursor.getShort(i)) {}
      for (paramBoolean = true;; paramBoolean = false)
      {
        isRedDiamond = paramBoolean;
        break;
      }
      label10626:
      redLevel = paramCursor.getInt(i);
      break label7559;
      label10641:
      if (1 == paramCursor.getShort(i)) {}
      for (paramBoolean = true;; paramBoolean = false)
      {
        isSuperYellowDiamond = paramBoolean;
        break;
      }
      label10668:
      if (1 == paramCursor.getShort(i)) {}
      for (paramBoolean = true;; paramBoolean = false)
      {
        isYellowDiamond = paramBoolean;
        break;
      }
      label10695:
      yellowLevel = paramCursor.getInt(i);
      break label7670;
      label10710:
      if (1 == paramCursor.getShort(i)) {}
      for (paramBoolean = true;; paramBoolean = false)
      {
        isSuperGreenDiamond = paramBoolean;
        break;
      }
      label10737:
      if (1 == paramCursor.getShort(i)) {}
      for (paramBoolean = true;; paramBoolean = false)
      {
        isGreenDiamond = paramBoolean;
        break;
      }
      label10764:
      greenLevel = paramCursor.getInt(i);
      break label7781;
      label10779:
      uAccelerateMultiple = paramCursor.getLong(i);
      break label7818;
      label10794:
      strRespMusicInfo = paramCursor.getString(i);
      break label7855;
      label10809:
      templateRet = paramCursor.getInt(i);
      break label7892;
      label10824:
      lCurrentStyleId = paramCursor.getLong(i);
      break label7929;
      label10839:
      lCurrentBgId = paramCursor.getLong(i);
      break label7966;
      label10854:
      backgroundUrl = paramCursor.getString(i);
      break label8003;
      label10869:
      backgroundColor = paramCursor.getLong(i);
      break label8040;
      label10884:
      strCurrentBgUrl = paramCursor.getString(i);
      break label8077;
      label10899:
      bgType = paramCursor.getBlob(i);
      break label8114;
      label10914:
      encId = paramCursor.getString(i);
      break label8151;
      label10929:
      busiEntry = paramCursor.getString(i);
      break label8188;
      label10944:
      favoriteSource = paramCursor.getInt(i);
      break label8225;
      label10959:
      if (1 == paramCursor.getShort(i)) {}
      for (paramBoolean = true;; paramBoolean = false)
      {
        visibleMusicPendant = paramBoolean;
        break;
      }
      label10986:
      if (1 == paramCursor.getShort(i)) {}
      for (paramBoolean = true;; paramBoolean = false)
      {
        autoPlayMusicPendant = paramBoolean;
        break;
      }
      label11013:
      if (1 == paramCursor.getShort(i)) {}
      for (paramBoolean = bool2;; paramBoolean = false)
      {
        showRedPointMusicPendant = paramBoolean;
        break;
      }
      label11041:
      privilegePromptStr = paramCursor.getString(i);
      break label8373;
      label11056:
      privilegeJumpUrl = paramCursor.getString(i);
      break label8410;
      label11071:
      vOpenPriv = paramCursor.getBlob(i);
      break label8447;
      label11086:
      vClosePriv = paramCursor.getBlob(i);
      break label8484;
      label11101:
      addSrcName = paramCursor.getString(i);
      break label8521;
      label11116:
      addSrcId = paramCursor.getLong(i);
      break label8558;
      label11131:
      addSubSrcId = paramCursor.getLong(i);
      break label8595;
      label11146:
      strVoteLimitedNotice = paramCursor.getString(i);
      break label8632;
      label11161:
      bHaveVotedCnt = paramCursor.getShort(i);
    }
    label11176:
    bAvailVoteCnt = paramCursor.getShort(i);
    return paramEntity;
  }
  
  public String a(String paramString)
  {
    StringBuilder localStringBuilder = new StringBuilder("CREATE TABLE IF NOT EXISTS ");
    localStringBuilder.append(paramString);
    localStringBuilder.append(" (_id INTEGER PRIMARY KEY AUTOINCREMENT ,uin TEXT UNIQUE ,strNick TEXT ,shGender INTEGER ,shAge INTEGER ,nFaceID INTEGER ,strCertificationInfo TEXT ,shType INTEGER ,vContent BLOB ,strSign TEXT ,strCompany TEXT ,strSchool TEXT ,uFaceTimeStamp INTEGER ,vQQFaceID BLOB ,strReMark TEXT ,bWeiboInfo INTEGER ,bQzoneInfo INTEGER ,nSameFriendsNum INTEGER ,strCompanySame TEXT ,strSchoolSame TEXT ,lCardShowNum INTEGER ,bSingle INTEGER ,lVisitCount INTEGER ,lVoteCount INTEGER ,tagInfosByte BLOB ,eUserIdentityType INTEGER ,vBackground BLOB ,labelInfoBytes BLOB ,age INTEGER ,constellation INTEGER ,pyFaceUrl TEXT ,location TEXT ,bVoted INTEGER ,bFavorited INTEGER ,iVoteIncrement INTEGER ,strJoinHexAlbumFileKey TEXT ,iFaceNum INTEGER ,cSqqLevel INTEGER ,iQQLevel INTEGER ,strProvince TEXT ,strCity TEXT ,strCountry TEXT ,lBirthday INTEGER ,strLocationCodes TEXT ,strLocationDesc TEXT ,strHometownCodes TEXT ,strHometownDesc TEXT ,strEmail TEXT ,strPersonalNote TEXT ,iProfession INTEGER ,bindPhoneInfo TEXT ,bCardInfo BLOB ,strTroopName TEXT ,strTroopNick TEXT ,strMobile TEXT ,strContactName TEXT ,ulShowControl INTEGER ,feedPreviewTime INTEGER ,strQzoneFeedsDesc TEXT ,strSpaceName TEXT ,strQzonePicUrl1 TEXT ,strQzonePicUrl2 TEXT ,strQzonePicUrl3 TEXT ,strStatus TEXT ,strAutoRemark TEXT ,vSeed BLOB ,vCookies BLOB ,bQQVipOpen INTEGER ,iQQVipType INTEGER ,iQQVipLevel INTEGER ,bSuperVipOpen INTEGER ,iSuperVipType INTEGER ,iSuperVipLevel INTEGER ,bSuperQQOpen INTEGER ,iSuperQQType INTEGER ,iSuperQQLevel INTEGER ,bHollywoodVipOpen INTEGER ,iHollywoodVipType INTEGER ,iHollywoodVipLevel INTEGER ,strShowName TEXT ,strVoiceFilekey TEXT ,shDuration INTEGER ,bRead INTEGER ,strUrl TEXT ,vRichSign BLOB ,lSignModifyTime INTEGER ,nLastGameFlag INTEGER ,strGameLogoUrl_1 TEXT ,strGameLogoUrl_2 TEXT ,strGameLogoUrl_3 TEXT ,strGameLogoUrl_4 TEXT ,strGameLogoKey_1 TEXT ,strGameLogoKey_2 TEXT ,strGameLogoKey_3 TEXT ,strGameLogoKey_4 TEXT ,strGameName_1 TEXT ,strGameName_2 TEXT ,strGameName_3 TEXT ,strGameName_4 TEXT ,strGameAppid_1 TEXT ,strGameAppid_2 TEXT ,strGameAppid_3 TEXT ,strGameAppid_4 TEXT ,strProfileUrl TEXT ,nStarFansFlag INTEGER ,strStarPicUrl_0 TEXT ,strStarPicUrl_1 TEXT ,strStarPicUrl_2 TEXT ,strStarLvUrl_0 TEXT ,strStarLvUrl_1 TEXT ,strStarLvUrl_2 TEXT ,strStarLogoUrl TEXT ,starFansJumpUrl TEXT ,lUserFlag INTEGER ,lLoginDays INTEGER ,strLoginDaysDesc TEXT ,lQQMasterLogindays INTEGER ,allowPeopleSee INTEGER ,allowClick INTEGER ,showLightalk INTEGER ,lightalkNick TEXT ,lightalkId TEXT ,isSuperRedDiamond INTEGER ,isRedDiamond INTEGER ,redLevel INTEGER ,isSuperYellowDiamond INTEGER ,isYellowDiamond INTEGER ,yellowLevel INTEGER ,isSuperGreenDiamond INTEGER ,isGreenDiamond INTEGER ,greenLevel INTEGER ,uAccelerateMultiple INTEGER ,strRespMusicInfo TEXT ,templateRet INTEGER ,lCurrentStyleId INTEGER ,lCurrentBgId INTEGER ,backgroundUrl TEXT ,backgroundColor INTEGER ,strCurrentBgUrl TEXT ,bgType BLOB ,encId TEXT ,busiEntry TEXT ,favoriteSource INTEGER ,visibleMusicPendant INTEGER ,autoPlayMusicPendant INTEGER ,showRedPointMusicPendant INTEGER ,privilegePromptStr TEXT ,privilegeJumpUrl TEXT ,vOpenPriv BLOB ,vClosePriv BLOB ,addSrcName TEXT ,addSrcId INTEGER ,addSubSrcId INTEGER ,strVoteLimitedNotice TEXT ,bHaveVotedCnt INTEGER ,bAvailVoteCnt INTEGER)");
    return localStringBuilder.toString();
  }
  
  public void a(Entity paramEntity, ContentValues paramContentValues)
  {
    paramEntity = (Card)paramEntity;
    paramContentValues.put("uin", uin);
    paramContentValues.put("strNick", strNick);
    paramContentValues.put("shGender", Short.valueOf(shGender));
    paramContentValues.put("shAge", Short.valueOf(shAge));
    paramContentValues.put("nFaceID", Integer.valueOf(nFaceID));
    paramContentValues.put("strCertificationInfo", strCertificationInfo);
    paramContentValues.put("shType", Short.valueOf(shType));
    paramContentValues.put("vContent", vContent);
    paramContentValues.put("strSign", strSign);
    paramContentValues.put("strCompany", strCompany);
    paramContentValues.put("strSchool", strSchool);
    paramContentValues.put("uFaceTimeStamp", Integer.valueOf(uFaceTimeStamp));
    paramContentValues.put("vQQFaceID", vQQFaceID);
    paramContentValues.put("strReMark", strReMark);
    paramContentValues.put("bWeiboInfo", Byte.valueOf(bWeiboInfo));
    paramContentValues.put("bQzoneInfo", Byte.valueOf(bQzoneInfo));
    paramContentValues.put("nSameFriendsNum", Integer.valueOf(nSameFriendsNum));
    paramContentValues.put("strCompanySame", strCompanySame);
    paramContentValues.put("strSchoolSame", strSchoolSame);
    paramContentValues.put("lCardShowNum", Long.valueOf(lCardShowNum));
    paramContentValues.put("bSingle", Byte.valueOf(bSingle));
    paramContentValues.put("lVisitCount", Long.valueOf(lVisitCount));
    paramContentValues.put("lVoteCount", Long.valueOf(lVoteCount));
    paramContentValues.put("tagInfosByte", tagInfosByte);
    paramContentValues.put("eUserIdentityType", Byte.valueOf(eUserIdentityType));
    paramContentValues.put("vBackground", vBackground);
    paramContentValues.put("labelInfoBytes", labelInfoBytes);
    paramContentValues.put("age", Byte.valueOf(age));
    paramContentValues.put("constellation", Integer.valueOf(constellation));
    paramContentValues.put("pyFaceUrl", pyFaceUrl);
    paramContentValues.put("location", location);
    paramContentValues.put("bVoted", Byte.valueOf(bVoted));
    paramContentValues.put("bFavorited", Byte.valueOf(bFavorited));
    paramContentValues.put("iVoteIncrement", Integer.valueOf(iVoteIncrement));
    paramContentValues.put("strJoinHexAlbumFileKey", strJoinHexAlbumFileKey);
    paramContentValues.put("iFaceNum", Integer.valueOf(iFaceNum));
    paramContentValues.put("cSqqLevel", Byte.valueOf(cSqqLevel));
    paramContentValues.put("iQQLevel", Integer.valueOf(iQQLevel));
    paramContentValues.put("strProvince", strProvince);
    paramContentValues.put("strCity", strCity);
    paramContentValues.put("strCountry", strCountry);
    paramContentValues.put("lBirthday", Long.valueOf(lBirthday));
    paramContentValues.put("strLocationCodes", strLocationCodes);
    paramContentValues.put("strLocationDesc", strLocationDesc);
    paramContentValues.put("strHometownCodes", strHometownCodes);
    paramContentValues.put("strHometownDesc", strHometownDesc);
    paramContentValues.put("strEmail", strEmail);
    paramContentValues.put("strPersonalNote", strPersonalNote);
    paramContentValues.put("iProfession", Integer.valueOf(iProfession));
    paramContentValues.put("bindPhoneInfo", bindPhoneInfo);
    paramContentValues.put("bCardInfo", bCardInfo);
    paramContentValues.put("strTroopName", strTroopName);
    paramContentValues.put("strTroopNick", strTroopNick);
    paramContentValues.put("strMobile", strMobile);
    paramContentValues.put("strContactName", strContactName);
    paramContentValues.put("ulShowControl", Integer.valueOf(ulShowControl));
    paramContentValues.put("feedPreviewTime", Long.valueOf(feedPreviewTime));
    paramContentValues.put("strQzoneFeedsDesc", strQzoneFeedsDesc);
    paramContentValues.put("strSpaceName", strSpaceName);
    paramContentValues.put("strQzonePicUrl1", strQzonePicUrl1);
    paramContentValues.put("strQzonePicUrl2", strQzonePicUrl2);
    paramContentValues.put("strQzonePicUrl3", strQzonePicUrl3);
    paramContentValues.put("strStatus", strStatus);
    paramContentValues.put("strAutoRemark", strAutoRemark);
    paramContentValues.put("vSeed", vSeed);
    paramContentValues.put("vCookies", vCookies);
    paramContentValues.put("bQQVipOpen", Byte.valueOf(bQQVipOpen));
    paramContentValues.put("iQQVipType", Integer.valueOf(iQQVipType));
    paramContentValues.put("iQQVipLevel", Integer.valueOf(iQQVipLevel));
    paramContentValues.put("bSuperVipOpen", Byte.valueOf(bSuperVipOpen));
    paramContentValues.put("iSuperVipType", Integer.valueOf(iSuperVipType));
    paramContentValues.put("iSuperVipLevel", Integer.valueOf(iSuperVipLevel));
    paramContentValues.put("bSuperQQOpen", Byte.valueOf(bSuperQQOpen));
    paramContentValues.put("iSuperQQType", Integer.valueOf(iSuperQQType));
    paramContentValues.put("iSuperQQLevel", Integer.valueOf(iSuperQQLevel));
    paramContentValues.put("bHollywoodVipOpen", Byte.valueOf(bHollywoodVipOpen));
    paramContentValues.put("iHollywoodVipType", Integer.valueOf(iHollywoodVipType));
    paramContentValues.put("iHollywoodVipLevel", Integer.valueOf(iHollywoodVipLevel));
    paramContentValues.put("strShowName", strShowName);
    paramContentValues.put("strVoiceFilekey", strVoiceFilekey);
    paramContentValues.put("shDuration", Short.valueOf(shDuration));
    paramContentValues.put("bRead", Byte.valueOf(bRead));
    paramContentValues.put("strUrl", strUrl);
    paramContentValues.put("vRichSign", vRichSign);
    paramContentValues.put("lSignModifyTime", Long.valueOf(lSignModifyTime));
    paramContentValues.put("nLastGameFlag", Integer.valueOf(nLastGameFlag));
    paramContentValues.put("strGameLogoUrl_1", strGameLogoUrl_1);
    paramContentValues.put("strGameLogoUrl_2", strGameLogoUrl_2);
    paramContentValues.put("strGameLogoUrl_3", strGameLogoUrl_3);
    paramContentValues.put("strGameLogoUrl_4", strGameLogoUrl_4);
    paramContentValues.put("strGameLogoKey_1", strGameLogoKey_1);
    paramContentValues.put("strGameLogoKey_2", strGameLogoKey_2);
    paramContentValues.put("strGameLogoKey_3", strGameLogoKey_3);
    paramContentValues.put("strGameLogoKey_4", strGameLogoKey_4);
    paramContentValues.put("strGameName_1", strGameName_1);
    paramContentValues.put("strGameName_2", strGameName_2);
    paramContentValues.put("strGameName_3", strGameName_3);
    paramContentValues.put("strGameName_4", strGameName_4);
    paramContentValues.put("strGameAppid_1", strGameAppid_1);
    paramContentValues.put("strGameAppid_2", strGameAppid_2);
    paramContentValues.put("strGameAppid_3", strGameAppid_3);
    paramContentValues.put("strGameAppid_4", strGameAppid_4);
    paramContentValues.put("strProfileUrl", strProfileUrl);
    paramContentValues.put("nStarFansFlag", Integer.valueOf(nStarFansFlag));
    paramContentValues.put("strStarPicUrl_0", strStarPicUrl_0);
    paramContentValues.put("strStarPicUrl_1", strStarPicUrl_1);
    paramContentValues.put("strStarPicUrl_2", strStarPicUrl_2);
    paramContentValues.put("strStarLvUrl_0", strStarLvUrl_0);
    paramContentValues.put("strStarLvUrl_1", strStarLvUrl_1);
    paramContentValues.put("strStarLvUrl_2", strStarLvUrl_2);
    paramContentValues.put("strStarLogoUrl", strStarLogoUrl);
    paramContentValues.put("starFansJumpUrl", starFansJumpUrl);
    paramContentValues.put("lUserFlag", Long.valueOf(lUserFlag));
    paramContentValues.put("lLoginDays", Long.valueOf(lLoginDays));
    paramContentValues.put("strLoginDaysDesc", strLoginDaysDesc);
    paramContentValues.put("lQQMasterLogindays", Long.valueOf(lQQMasterLogindays));
    paramContentValues.put("allowPeopleSee", Boolean.valueOf(allowPeopleSee));
    paramContentValues.put("allowClick", Boolean.valueOf(allowClick));
    paramContentValues.put("showLightalk", Boolean.valueOf(showLightalk));
    paramContentValues.put("lightalkNick", lightalkNick);
    paramContentValues.put("lightalkId", lightalkId);
    paramContentValues.put("isSuperRedDiamond", Boolean.valueOf(isSuperRedDiamond));
    paramContentValues.put("isRedDiamond", Boolean.valueOf(isRedDiamond));
    paramContentValues.put("redLevel", Integer.valueOf(redLevel));
    paramContentValues.put("isSuperYellowDiamond", Boolean.valueOf(isSuperYellowDiamond));
    paramContentValues.put("isYellowDiamond", Boolean.valueOf(isYellowDiamond));
    paramContentValues.put("yellowLevel", Integer.valueOf(yellowLevel));
    paramContentValues.put("isSuperGreenDiamond", Boolean.valueOf(isSuperGreenDiamond));
    paramContentValues.put("isGreenDiamond", Boolean.valueOf(isGreenDiamond));
    paramContentValues.put("greenLevel", Integer.valueOf(greenLevel));
    paramContentValues.put("uAccelerateMultiple", Long.valueOf(uAccelerateMultiple));
    paramContentValues.put("strRespMusicInfo", strRespMusicInfo);
    paramContentValues.put("templateRet", Integer.valueOf(templateRet));
    paramContentValues.put("lCurrentStyleId", Long.valueOf(lCurrentStyleId));
    paramContentValues.put("lCurrentBgId", Long.valueOf(lCurrentBgId));
    paramContentValues.put("backgroundUrl", backgroundUrl);
    paramContentValues.put("backgroundColor", Long.valueOf(backgroundColor));
    paramContentValues.put("strCurrentBgUrl", strCurrentBgUrl);
    paramContentValues.put("bgType", bgType);
    paramContentValues.put("encId", encId);
    paramContentValues.put("busiEntry", busiEntry);
    paramContentValues.put("favoriteSource", Integer.valueOf(favoriteSource));
    paramContentValues.put("visibleMusicPendant", Boolean.valueOf(visibleMusicPendant));
    paramContentValues.put("autoPlayMusicPendant", Boolean.valueOf(autoPlayMusicPendant));
    paramContentValues.put("showRedPointMusicPendant", Boolean.valueOf(showRedPointMusicPendant));
    paramContentValues.put("privilegePromptStr", privilegePromptStr);
    paramContentValues.put("privilegeJumpUrl", privilegeJumpUrl);
    paramContentValues.put("vOpenPriv", vOpenPriv);
    paramContentValues.put("vClosePriv", vClosePriv);
    paramContentValues.put("addSrcName", addSrcName);
    paramContentValues.put("addSrcId", Long.valueOf(addSrcId));
    paramContentValues.put("addSubSrcId", Long.valueOf(addSubSrcId));
    paramContentValues.put("strVoteLimitedNotice", strVoteLimitedNotice);
    paramContentValues.put("bHaveVotedCnt", Short.valueOf(bHaveVotedCnt));
    paramContentValues.put("bAvailVoteCnt", Short.valueOf(bAvailVoteCnt));
  }
}
