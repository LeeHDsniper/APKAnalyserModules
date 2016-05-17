package com.tencent.mobileqq.persistence;

import android.content.ContentValues;
import android.database.Cursor;
import com.tencent.mobileqq.data.NearbyPeopleCard;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class NearbyPeopleCardDao
  extends OGAbstractDao
{
  private OGEntityInfo a;
  
  public NearbyPeopleCardDao()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = 59;
  }
  
  public Entity a(Entity paramEntity, Cursor paramCursor, boolean paramBoolean, NoColumnErrorHandler paramNoColumnErrorHandler)
  {
    boolean bool2 = true;
    boolean bool1 = true;
    paramEntity = (NearbyPeopleCard)paramEntity;
    if (paramNoColumnErrorHandler == null)
    {
      tinyId = paramCursor.getLong(paramCursor.getColumnIndex("tinyId"));
      uin = paramCursor.getString(paramCursor.getColumnIndex("uin"));
      nickname = paramCursor.getString(paramCursor.getColumnIndex("nickname"));
      gender = ((byte)paramCursor.getShort(paramCursor.getColumnIndex("gender")));
      age = paramCursor.getInt(paramCursor.getColumnIndex("age"));
      birthday = paramCursor.getInt(paramCursor.getColumnIndex("birthday"));
      constellation = ((byte)paramCursor.getShort(paramCursor.getColumnIndex("constellation")));
      distance = paramCursor.getString(paramCursor.getColumnIndex("distance"));
      timeDiff = paramCursor.getString(paramCursor.getColumnIndex("timeDiff"));
      likeCount = paramCursor.getInt(paramCursor.getColumnIndex("likeCount"));
      likeCountInc = paramCursor.getInt(paramCursor.getColumnIndex("likeCountInc"));
      oldPhotoCount = paramCursor.getInt(paramCursor.getColumnIndex("oldPhotoCount"));
      dateInfo = paramCursor.getBlob(paramCursor.getColumnIndex("dateInfo"));
      xuanYan = paramCursor.getBlob(paramCursor.getColumnIndex("xuanYan"));
      maritalStatus = ((byte)paramCursor.getShort(paramCursor.getColumnIndex("maritalStatus")));
      job = paramCursor.getInt(paramCursor.getColumnIndex("job"));
      company = paramCursor.getString(paramCursor.getColumnIndex("company"));
      college = paramCursor.getString(paramCursor.getColumnIndex("college"));
      hometownCountry = paramCursor.getString(paramCursor.getColumnIndex("hometownCountry"));
      hometownProvice = paramCursor.getString(paramCursor.getColumnIndex("hometownProvice"));
      hometownCity = paramCursor.getString(paramCursor.getColumnIndex("hometownCity"));
      hometownDistrict = paramCursor.getString(paramCursor.getColumnIndex("hometownDistrict"));
      vCookies = paramCursor.getBlob(paramCursor.getColumnIndex("vCookies"));
      bVoted = ((byte)paramCursor.getShort(paramCursor.getColumnIndex("bVoted")));
      feedPreviewTime = paramCursor.getLong(paramCursor.getColumnIndex("feedPreviewTime"));
      qzoneFeed = paramCursor.getString(paramCursor.getColumnIndex("qzoneFeed"));
      qzoneName = paramCursor.getString(paramCursor.getColumnIndex("qzoneName"));
      qzonePicUrl_1 = paramCursor.getString(paramCursor.getColumnIndex("qzonePicUrl_1"));
      qzonePicUrl_2 = paramCursor.getString(paramCursor.getColumnIndex("qzonePicUrl_2"));
      qzonePicUrl_3 = paramCursor.getString(paramCursor.getColumnIndex("qzonePicUrl_3"));
      if (1 == paramCursor.getShort(paramCursor.getColumnIndex("isPhotoUseCache")))
      {
        paramBoolean = true;
        isPhotoUseCache = paramBoolean;
        vSeed = paramCursor.getBlob(paramCursor.getColumnIndex("vSeed"));
        vTempChatSig = paramCursor.getBlob(paramCursor.getColumnIndex("vTempChatSig"));
        if (1 != paramCursor.getShort(paramCursor.getColumnIndex("switchQzone"))) {
          break label1126;
        }
        paramBoolean = true;
        label641:
        switchQzone = paramBoolean;
        if (1 != paramCursor.getShort(paramCursor.getColumnIndex("switchHobby"))) {
          break label1131;
        }
        paramBoolean = true;
        label666:
        switchHobby = paramBoolean;
        uiShowControl = paramCursor.getLong(paramCursor.getColumnIndex("uiShowControl"));
        userFlag = paramCursor.getLong(paramCursor.getColumnIndex("userFlag"));
        busiEntry = paramCursor.getString(paramCursor.getColumnIndex("busiEntry"));
        if (1 != paramCursor.getShort(paramCursor.getColumnIndex("godFlag"))) {
          break label1136;
        }
      }
      label1126:
      label1131:
      label1136:
      for (paramBoolean = bool1;; paramBoolean = false)
      {
        godFlag = paramBoolean;
        nLastGameFlag = paramCursor.getInt(paramCursor.getColumnIndex("nLastGameFlag"));
        strProfileUrl = paramCursor.getString(paramCursor.getColumnIndex("strProfileUrl"));
        lastUpdateNickTime = paramCursor.getLong(paramCursor.getColumnIndex("lastUpdateNickTime"));
        favoriteSource = paramCursor.getInt(paramCursor.getColumnIndex("favoriteSource"));
        switchGiftVisible = paramCursor.getLong(paramCursor.getColumnIndex("switchGiftVisible"));
        vGiftInfo = paramCursor.getBlob(paramCursor.getColumnIndex("vGiftInfo"));
        sayHelloFlag = paramCursor.getInt(paramCursor.getColumnIndex("sayHelloFlag"));
        charm = paramCursor.getLong(paramCursor.getColumnIndex("charm"));
        charmLevel = paramCursor.getInt(paramCursor.getColumnIndex("charmLevel"));
        nextThreshold = paramCursor.getInt(paramCursor.getColumnIndex("nextThreshold"));
        curThreshold = paramCursor.getInt(paramCursor.getColumnIndex("curThreshold"));
        profPercent = paramCursor.getInt(paramCursor.getColumnIndex("profPercent"));
        tagFlag = paramCursor.getLong(paramCursor.getColumnIndex("tagFlag"));
        tagInfo = paramCursor.getString(paramCursor.getColumnIndex("tagInfo"));
        picInfo = paramCursor.getString(paramCursor.getColumnIndex("picInfo"));
        strFreshNewsInfo = paramCursor.getString(paramCursor.getColumnIndex("strFreshNewsInfo"));
        uRoomid = paramCursor.getLong(paramCursor.getColumnIndex("uRoomid"));
        strVoteLimitedNotice = paramCursor.getString(paramCursor.getColumnIndex("strVoteLimitedNotice"));
        bHaveVotedCnt = paramCursor.getShort(paramCursor.getColumnIndex("bHaveVotedCnt"));
        bAvailVoteCnt = paramCursor.getShort(paramCursor.getColumnIndex("bAvailVoteCnt"));
        return paramEntity;
        paramBoolean = false;
        break;
        paramBoolean = false;
        break label641;
        paramBoolean = false;
        break label666;
      }
    }
    int i = paramCursor.getColumnIndex("tinyId");
    if (i == -1)
    {
      paramNoColumnErrorHandler.a(new NoColumnError("tinyId", Long.TYPE));
      i = paramCursor.getColumnIndex("uin");
      if (i != -1) {
        break label3239;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("uin", String.class));
      label1211:
      i = paramCursor.getColumnIndex("nickname");
      if (i != -1) {
        break label3254;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("nickname", String.class));
      label1246:
      i = paramCursor.getColumnIndex("gender");
      if (i != -1) {
        break label3269;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("gender", Byte.TYPE));
      label1281:
      i = paramCursor.getColumnIndex("age");
      if (i != -1) {
        break label3285;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("age", Integer.TYPE));
      label1316:
      i = paramCursor.getColumnIndex("birthday");
      if (i != -1) {
        break label3300;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("birthday", Integer.TYPE));
      label1351:
      i = paramCursor.getColumnIndex("constellation");
      if (i != -1) {
        break label3315;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("constellation", Byte.TYPE));
      label1386:
      i = paramCursor.getColumnIndex("distance");
      if (i != -1) {
        break label3331;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("distance", String.class));
      label1421:
      i = paramCursor.getColumnIndex("timeDiff");
      if (i != -1) {
        break label3346;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("timeDiff", String.class));
      label1456:
      i = paramCursor.getColumnIndex("likeCount");
      if (i != -1) {
        break label3361;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("likeCount", Integer.TYPE));
      label1491:
      i = paramCursor.getColumnIndex("likeCountInc");
      if (i != -1) {
        break label3376;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("likeCountInc", Integer.TYPE));
      label1526:
      i = paramCursor.getColumnIndex("oldPhotoCount");
      if (i != -1) {
        break label3391;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("oldPhotoCount", Integer.TYPE));
      label1561:
      i = paramCursor.getColumnIndex("dateInfo");
      if (i != -1) {
        break label3406;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("dateInfo", [B.class));
      label1596:
      i = paramCursor.getColumnIndex("xuanYan");
      if (i != -1) {
        break label3421;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("xuanYan", [B.class));
      label1631:
      i = paramCursor.getColumnIndex("maritalStatus");
      if (i != -1) {
        break label3436;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("maritalStatus", Byte.TYPE));
      label1666:
      i = paramCursor.getColumnIndex("job");
      if (i != -1) {
        break label3452;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("job", Integer.TYPE));
      label1701:
      i = paramCursor.getColumnIndex("company");
      if (i != -1) {
        break label3467;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("company", String.class));
      label1736:
      i = paramCursor.getColumnIndex("college");
      if (i != -1) {
        break label3482;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("college", String.class));
      label1771:
      i = paramCursor.getColumnIndex("hometownCountry");
      if (i != -1) {
        break label3497;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("hometownCountry", String.class));
      label1806:
      i = paramCursor.getColumnIndex("hometownProvice");
      if (i != -1) {
        break label3512;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("hometownProvice", String.class));
      label1841:
      i = paramCursor.getColumnIndex("hometownCity");
      if (i != -1) {
        break label3527;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("hometownCity", String.class));
      label1876:
      i = paramCursor.getColumnIndex("hometownDistrict");
      if (i != -1) {
        break label3542;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("hometownDistrict", String.class));
      label1911:
      i = paramCursor.getColumnIndex("vCookies");
      if (i != -1) {
        break label3557;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("vCookies", [B.class));
      label1946:
      i = paramCursor.getColumnIndex("bVoted");
      if (i != -1) {
        break label3572;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("bVoted", Byte.TYPE));
      label1981:
      i = paramCursor.getColumnIndex("feedPreviewTime");
      if (i != -1) {
        break label3588;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("feedPreviewTime", Long.TYPE));
      label2016:
      i = paramCursor.getColumnIndex("qzoneFeed");
      if (i != -1) {
        break label3603;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("qzoneFeed", String.class));
      label2051:
      i = paramCursor.getColumnIndex("qzoneName");
      if (i != -1) {
        break label3618;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("qzoneName", String.class));
      label2086:
      i = paramCursor.getColumnIndex("qzonePicUrl_1");
      if (i != -1) {
        break label3633;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("qzonePicUrl_1", String.class));
      label2121:
      i = paramCursor.getColumnIndex("qzonePicUrl_2");
      if (i != -1) {
        break label3648;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("qzonePicUrl_2", String.class));
      label2156:
      i = paramCursor.getColumnIndex("qzonePicUrl_3");
      if (i != -1) {
        break label3663;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("qzonePicUrl_3", String.class));
      label2191:
      i = paramCursor.getColumnIndex("isPhotoUseCache");
      if (i != -1) {
        break label3678;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("isPhotoUseCache", Boolean.TYPE));
      i = paramCursor.getColumnIndex("vSeed");
      if (i != -1) {
        break label3705;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("vSeed", [B.class));
      label2261:
      i = paramCursor.getColumnIndex("vTempChatSig");
      if (i != -1) {
        break label3720;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("vTempChatSig", [B.class));
      label2296:
      i = paramCursor.getColumnIndex("switchQzone");
      if (i != -1) {
        break label3735;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("switchQzone", Boolean.TYPE));
      i = paramCursor.getColumnIndex("switchHobby");
      if (i != -1) {
        break label3762;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("switchHobby", Boolean.TYPE));
      i = paramCursor.getColumnIndex("uiShowControl");
      if (i != -1) {
        break label3789;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("uiShowControl", Long.TYPE));
      label2401:
      i = paramCursor.getColumnIndex("userFlag");
      if (i != -1) {
        break label3804;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("userFlag", Long.TYPE));
      label2436:
      i = paramCursor.getColumnIndex("busiEntry");
      if (i != -1) {
        break label3819;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("busiEntry", String.class));
      label2471:
      i = paramCursor.getColumnIndex("godFlag");
      if (i != -1) {
        break label3834;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("godFlag", Boolean.TYPE));
      i = paramCursor.getColumnIndex("nLastGameFlag");
      if (i != -1) {
        break label3862;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("nLastGameFlag", Integer.TYPE));
      label2541:
      i = paramCursor.getColumnIndex("strProfileUrl");
      if (i != -1) {
        break label3877;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strProfileUrl", String.class));
      label2576:
      i = paramCursor.getColumnIndex("lastUpdateNickTime");
      if (i != -1) {
        break label3892;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("lastUpdateNickTime", Long.TYPE));
      label2611:
      i = paramCursor.getColumnIndex("favoriteSource");
      if (i != -1) {
        break label3907;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("favoriteSource", Integer.TYPE));
      label2646:
      i = paramCursor.getColumnIndex("switchGiftVisible");
      if (i != -1) {
        break label3922;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("switchGiftVisible", Long.TYPE));
      label2681:
      i = paramCursor.getColumnIndex("vGiftInfo");
      if (i != -1) {
        break label3937;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("vGiftInfo", [B.class));
      label2716:
      i = paramCursor.getColumnIndex("sayHelloFlag");
      if (i != -1) {
        break label3952;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("sayHelloFlag", Integer.TYPE));
      label2751:
      i = paramCursor.getColumnIndex("charm");
      if (i != -1) {
        break label3967;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("charm", Long.TYPE));
      label2786:
      i = paramCursor.getColumnIndex("charmLevel");
      if (i != -1) {
        break label3982;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("charmLevel", Integer.TYPE));
      label2821:
      i = paramCursor.getColumnIndex("nextThreshold");
      if (i != -1) {
        break label3997;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("nextThreshold", Integer.TYPE));
      label2856:
      i = paramCursor.getColumnIndex("curThreshold");
      if (i != -1) {
        break label4012;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("curThreshold", Integer.TYPE));
      label2891:
      i = paramCursor.getColumnIndex("profPercent");
      if (i != -1) {
        break label4027;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("profPercent", Integer.TYPE));
      label2926:
      i = paramCursor.getColumnIndex("tagFlag");
      if (i != -1) {
        break label4042;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("tagFlag", Long.TYPE));
      label2963:
      i = paramCursor.getColumnIndex("tagInfo");
      if (i != -1) {
        break label4057;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("tagInfo", String.class));
      label3000:
      i = paramCursor.getColumnIndex("picInfo");
      if (i != -1) {
        break label4072;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("picInfo", String.class));
      label3037:
      i = paramCursor.getColumnIndex("strFreshNewsInfo");
      if (i != -1) {
        break label4087;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strFreshNewsInfo", String.class));
      label3074:
      i = paramCursor.getColumnIndex("uRoomid");
      if (i != -1) {
        break label4102;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("uRoomid", Long.TYPE));
      label3111:
      i = paramCursor.getColumnIndex("strVoteLimitedNotice");
      if (i != -1) {
        break label4117;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strVoteLimitedNotice", String.class));
      label3148:
      i = paramCursor.getColumnIndex("bHaveVotedCnt");
      if (i != -1) {
        break label4132;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("bHaveVotedCnt", Short.TYPE));
    }
    for (;;)
    {
      i = paramCursor.getColumnIndex("bAvailVoteCnt");
      if (i != -1) {
        break label4147;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("bAvailVoteCnt", Short.TYPE));
      return paramEntity;
      tinyId = paramCursor.getLong(i);
      break;
      label3239:
      uin = paramCursor.getString(i);
      break label1211;
      label3254:
      nickname = paramCursor.getString(i);
      break label1246;
      label3269:
      gender = ((byte)paramCursor.getShort(i));
      break label1281;
      label3285:
      age = paramCursor.getInt(i);
      break label1316;
      label3300:
      birthday = paramCursor.getInt(i);
      break label1351;
      label3315:
      constellation = ((byte)paramCursor.getShort(i));
      break label1386;
      label3331:
      distance = paramCursor.getString(i);
      break label1421;
      label3346:
      timeDiff = paramCursor.getString(i);
      break label1456;
      label3361:
      likeCount = paramCursor.getInt(i);
      break label1491;
      label3376:
      likeCountInc = paramCursor.getInt(i);
      break label1526;
      label3391:
      oldPhotoCount = paramCursor.getInt(i);
      break label1561;
      label3406:
      dateInfo = paramCursor.getBlob(i);
      break label1596;
      label3421:
      xuanYan = paramCursor.getBlob(i);
      break label1631;
      label3436:
      maritalStatus = ((byte)paramCursor.getShort(i));
      break label1666;
      label3452:
      job = paramCursor.getInt(i);
      break label1701;
      label3467:
      company = paramCursor.getString(i);
      break label1736;
      label3482:
      college = paramCursor.getString(i);
      break label1771;
      label3497:
      hometownCountry = paramCursor.getString(i);
      break label1806;
      label3512:
      hometownProvice = paramCursor.getString(i);
      break label1841;
      label3527:
      hometownCity = paramCursor.getString(i);
      break label1876;
      label3542:
      hometownDistrict = paramCursor.getString(i);
      break label1911;
      label3557:
      vCookies = paramCursor.getBlob(i);
      break label1946;
      label3572:
      bVoted = ((byte)paramCursor.getShort(i));
      break label1981;
      label3588:
      feedPreviewTime = paramCursor.getLong(i);
      break label2016;
      label3603:
      qzoneFeed = paramCursor.getString(i);
      break label2051;
      label3618:
      qzoneName = paramCursor.getString(i);
      break label2086;
      label3633:
      qzonePicUrl_1 = paramCursor.getString(i);
      break label2121;
      label3648:
      qzonePicUrl_2 = paramCursor.getString(i);
      break label2156;
      label3663:
      qzonePicUrl_3 = paramCursor.getString(i);
      break label2191;
      label3678:
      if (1 == paramCursor.getShort(i)) {}
      for (paramBoolean = true;; paramBoolean = false)
      {
        isPhotoUseCache = paramBoolean;
        break;
      }
      label3705:
      vSeed = paramCursor.getBlob(i);
      break label2261;
      label3720:
      vTempChatSig = paramCursor.getBlob(i);
      break label2296;
      label3735:
      if (1 == paramCursor.getShort(i)) {}
      for (paramBoolean = true;; paramBoolean = false)
      {
        switchQzone = paramBoolean;
        break;
      }
      label3762:
      if (1 == paramCursor.getShort(i)) {}
      for (paramBoolean = true;; paramBoolean = false)
      {
        switchHobby = paramBoolean;
        break;
      }
      label3789:
      uiShowControl = paramCursor.getLong(i);
      break label2401;
      label3804:
      userFlag = paramCursor.getLong(i);
      break label2436;
      label3819:
      busiEntry = paramCursor.getString(i);
      break label2471;
      label3834:
      if (1 == paramCursor.getShort(i)) {}
      for (paramBoolean = bool2;; paramBoolean = false)
      {
        godFlag = paramBoolean;
        break;
      }
      label3862:
      nLastGameFlag = paramCursor.getInt(i);
      break label2541;
      label3877:
      strProfileUrl = paramCursor.getString(i);
      break label2576;
      label3892:
      lastUpdateNickTime = paramCursor.getLong(i);
      break label2611;
      label3907:
      favoriteSource = paramCursor.getInt(i);
      break label2646;
      label3922:
      switchGiftVisible = paramCursor.getLong(i);
      break label2681;
      label3937:
      vGiftInfo = paramCursor.getBlob(i);
      break label2716;
      label3952:
      sayHelloFlag = paramCursor.getInt(i);
      break label2751;
      label3967:
      charm = paramCursor.getLong(i);
      break label2786;
      label3982:
      charmLevel = paramCursor.getInt(i);
      break label2821;
      label3997:
      nextThreshold = paramCursor.getInt(i);
      break label2856;
      label4012:
      curThreshold = paramCursor.getInt(i);
      break label2891;
      label4027:
      profPercent = paramCursor.getInt(i);
      break label2926;
      label4042:
      tagFlag = paramCursor.getLong(i);
      break label2963;
      label4057:
      tagInfo = paramCursor.getString(i);
      break label3000;
      label4072:
      picInfo = paramCursor.getString(i);
      break label3037;
      label4087:
      strFreshNewsInfo = paramCursor.getString(i);
      break label3074;
      label4102:
      uRoomid = paramCursor.getLong(i);
      break label3111;
      label4117:
      strVoteLimitedNotice = paramCursor.getString(i);
      break label3148;
      label4132:
      bHaveVotedCnt = paramCursor.getShort(i);
    }
    label4147:
    bAvailVoteCnt = paramCursor.getShort(i);
    return paramEntity;
  }
  
  public String a(String paramString)
  {
    StringBuilder localStringBuilder = new StringBuilder("CREATE TABLE IF NOT EXISTS ");
    localStringBuilder.append(paramString);
    localStringBuilder.append(" (_id INTEGER PRIMARY KEY AUTOINCREMENT ,tinyId INTEGER ,uin TEXT ,nickname TEXT ,gender INTEGER ,age INTEGER ,birthday INTEGER ,constellation INTEGER ,distance TEXT ,timeDiff TEXT ,likeCount INTEGER ,likeCountInc INTEGER ,oldPhotoCount INTEGER ,dateInfo BLOB ,xuanYan BLOB ,maritalStatus INTEGER ,job INTEGER ,company TEXT ,college TEXT ,hometownCountry TEXT ,hometownProvice TEXT ,hometownCity TEXT ,hometownDistrict TEXT ,vCookies BLOB ,bVoted INTEGER ,feedPreviewTime INTEGER ,qzoneFeed TEXT ,qzoneName TEXT ,qzonePicUrl_1 TEXT ,qzonePicUrl_2 TEXT ,qzonePicUrl_3 TEXT ,isPhotoUseCache INTEGER ,vSeed BLOB ,vTempChatSig BLOB ,switchQzone INTEGER ,switchHobby INTEGER ,uiShowControl INTEGER ,userFlag INTEGER ,busiEntry TEXT ,godFlag INTEGER ,nLastGameFlag INTEGER ,strProfileUrl TEXT ,lastUpdateNickTime INTEGER ,favoriteSource INTEGER ,switchGiftVisible INTEGER ,vGiftInfo BLOB ,sayHelloFlag INTEGER ,charm INTEGER ,charmLevel INTEGER ,nextThreshold INTEGER ,curThreshold INTEGER ,profPercent INTEGER ,tagFlag INTEGER ,tagInfo TEXT ,picInfo TEXT ,strFreshNewsInfo TEXT ,uRoomid INTEGER ,strVoteLimitedNotice TEXT ,bHaveVotedCnt INTEGER ,bAvailVoteCnt INTEGER)");
    return localStringBuilder.toString();
  }
  
  public void a(Entity paramEntity, ContentValues paramContentValues)
  {
    paramEntity = (NearbyPeopleCard)paramEntity;
    paramContentValues.put("tinyId", Long.valueOf(tinyId));
    paramContentValues.put("uin", uin);
    paramContentValues.put("nickname", nickname);
    paramContentValues.put("gender", Byte.valueOf(gender));
    paramContentValues.put("age", Integer.valueOf(age));
    paramContentValues.put("birthday", Integer.valueOf(birthday));
    paramContentValues.put("constellation", Byte.valueOf(constellation));
    paramContentValues.put("distance", distance);
    paramContentValues.put("timeDiff", timeDiff);
    paramContentValues.put("likeCount", Integer.valueOf(likeCount));
    paramContentValues.put("likeCountInc", Integer.valueOf(likeCountInc));
    paramContentValues.put("oldPhotoCount", Integer.valueOf(oldPhotoCount));
    paramContentValues.put("dateInfo", dateInfo);
    paramContentValues.put("xuanYan", xuanYan);
    paramContentValues.put("maritalStatus", Byte.valueOf(maritalStatus));
    paramContentValues.put("job", Integer.valueOf(job));
    paramContentValues.put("company", company);
    paramContentValues.put("college", college);
    paramContentValues.put("hometownCountry", hometownCountry);
    paramContentValues.put("hometownProvice", hometownProvice);
    paramContentValues.put("hometownCity", hometownCity);
    paramContentValues.put("hometownDistrict", hometownDistrict);
    paramContentValues.put("vCookies", vCookies);
    paramContentValues.put("bVoted", Byte.valueOf(bVoted));
    paramContentValues.put("feedPreviewTime", Long.valueOf(feedPreviewTime));
    paramContentValues.put("qzoneFeed", qzoneFeed);
    paramContentValues.put("qzoneName", qzoneName);
    paramContentValues.put("qzonePicUrl_1", qzonePicUrl_1);
    paramContentValues.put("qzonePicUrl_2", qzonePicUrl_2);
    paramContentValues.put("qzonePicUrl_3", qzonePicUrl_3);
    paramContentValues.put("isPhotoUseCache", Boolean.valueOf(isPhotoUseCache));
    paramContentValues.put("vSeed", vSeed);
    paramContentValues.put("vTempChatSig", vTempChatSig);
    paramContentValues.put("switchQzone", Boolean.valueOf(switchQzone));
    paramContentValues.put("switchHobby", Boolean.valueOf(switchHobby));
    paramContentValues.put("uiShowControl", Long.valueOf(uiShowControl));
    paramContentValues.put("userFlag", Long.valueOf(userFlag));
    paramContentValues.put("busiEntry", busiEntry);
    paramContentValues.put("godFlag", Boolean.valueOf(godFlag));
    paramContentValues.put("nLastGameFlag", Integer.valueOf(nLastGameFlag));
    paramContentValues.put("strProfileUrl", strProfileUrl);
    paramContentValues.put("lastUpdateNickTime", Long.valueOf(lastUpdateNickTime));
    paramContentValues.put("favoriteSource", Integer.valueOf(favoriteSource));
    paramContentValues.put("switchGiftVisible", Long.valueOf(switchGiftVisible));
    paramContentValues.put("vGiftInfo", vGiftInfo);
    paramContentValues.put("sayHelloFlag", Integer.valueOf(sayHelloFlag));
    paramContentValues.put("charm", Long.valueOf(charm));
    paramContentValues.put("charmLevel", Integer.valueOf(charmLevel));
    paramContentValues.put("nextThreshold", Integer.valueOf(nextThreshold));
    paramContentValues.put("curThreshold", Integer.valueOf(curThreshold));
    paramContentValues.put("profPercent", Integer.valueOf(profPercent));
    paramContentValues.put("tagFlag", Long.valueOf(tagFlag));
    paramContentValues.put("tagInfo", tagInfo);
    paramContentValues.put("picInfo", picInfo);
    paramContentValues.put("strFreshNewsInfo", strFreshNewsInfo);
    paramContentValues.put("uRoomid", Long.valueOf(uRoomid));
    paramContentValues.put("strVoteLimitedNotice", strVoteLimitedNotice);
    paramContentValues.put("bHaveVotedCnt", Short.valueOf(bHaveVotedCnt));
    paramContentValues.put("bAvailVoteCnt", Short.valueOf(bAvailVoteCnt));
  }
}
