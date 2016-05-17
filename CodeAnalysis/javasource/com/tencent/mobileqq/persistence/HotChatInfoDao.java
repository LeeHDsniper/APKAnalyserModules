package com.tencent.mobileqq.persistence;

import android.content.ContentValues;
import android.database.Cursor;
import com.tencent.mobileqq.data.HotChatInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class HotChatInfoDao
  extends OGAbstractDao
{
  private OGEntityInfo a;
  
  public HotChatInfoDao()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = 32;
  }
  
  public Entity a(Entity paramEntity, Cursor paramCursor, boolean paramBoolean, NoColumnErrorHandler paramNoColumnErrorHandler)
  {
    boolean bool2 = true;
    boolean bool1 = true;
    paramEntity = (HotChatInfo)paramEntity;
    if (paramNoColumnErrorHandler == null)
    {
      name = paramCursor.getString(paramCursor.getColumnIndex("name"));
      troopCode = paramCursor.getString(paramCursor.getColumnIndex("troopCode"));
      signature = paramCursor.getString(paramCursor.getColumnIndex("signature"));
      troopUin = paramCursor.getString(paramCursor.getColumnIndex("troopUin"));
      faceId = paramCursor.getInt(paramCursor.getColumnIndex("faceId"));
      memberCount = paramCursor.getInt(paramCursor.getColumnIndex("memberCount"));
      if (1 == paramCursor.getShort(paramCursor.getColumnIndex("hasJoined")))
      {
        paramBoolean = true;
        hasJoined = paramBoolean;
        if (1 != paramCursor.getShort(paramCursor.getColumnIndex("isWifiHotChat"))) {
          break label642;
        }
        paramBoolean = true;
        label169:
        isWifiHotChat = paramBoolean;
        uuid = paramCursor.getString(paramCursor.getColumnIndex("uuid"));
        iconUrl = paramCursor.getString(paramCursor.getColumnIndex("iconUrl"));
        hotThemeGroupFlag = paramCursor.getInt(paramCursor.getColumnIndex("hotThemeGroupFlag"));
        detail = paramCursor.getString(paramCursor.getColumnIndex("detail"));
        state = paramCursor.getInt(paramCursor.getColumnIndex("state"));
        leftTime = paramCursor.getLong(paramCursor.getColumnIndex("leftTime"));
        ruState = paramCursor.getInt(paramCursor.getColumnIndex("ruState"));
        if (1 != paramCursor.getShort(paramCursor.getColumnIndex("supportFlashPic"))) {
          break label647;
        }
        paramBoolean = true;
        label320:
        supportFlashPic = paramBoolean;
        if (1 != paramCursor.getShort(paramCursor.getColumnIndex("supportDemo"))) {
          break label652;
        }
        paramBoolean = true;
        label345:
        supportDemo = paramBoolean;
        adminLevel = paramCursor.getInt(paramCursor.getColumnIndex("adminLevel"));
        joinUrl = paramCursor.getString(paramCursor.getColumnIndex("joinUrl"));
        hotChatType = paramCursor.getInt(paramCursor.getColumnIndex("hotChatType"));
        memo = paramCursor.getString(paramCursor.getColumnIndex("memo"));
        memoUrl = paramCursor.getString(paramCursor.getColumnIndex("memoUrl"));
        if (1 != paramCursor.getShort(paramCursor.getColumnIndex("memoShowed"))) {
          break label657;
        }
        paramBoolean = true;
        label460:
        memoShowed = paramBoolean;
        userCreate = paramCursor.getInt(paramCursor.getColumnIndex("userCreate"));
        strAdminUins = paramCursor.getString(paramCursor.getColumnIndex("strAdminUins"));
        ownerUin = paramCursor.getString(paramCursor.getColumnIndex("ownerUin"));
        pkFlag = paramCursor.getInt(paramCursor.getColumnIndex("pkFlag"));
        subType = paramCursor.getInt(paramCursor.getColumnIndex("subType"));
        lLastMsgSeq = paramCursor.getLong(paramCursor.getColumnIndex("lLastMsgSeq"));
        extra1 = paramCursor.getString(paramCursor.getColumnIndex("extra1"));
        if (1 != paramCursor.getShort(paramCursor.getColumnIndex("isFavorite"))) {
          break label662;
        }
      }
      label642:
      label647:
      label652:
      label657:
      label662:
      for (paramBoolean = bool1;; paramBoolean = false)
      {
        isFavorite = paramBoolean;
        mFissionRoomNum = paramCursor.getInt(paramCursor.getColumnIndex("mFissionRoomNum"));
        return paramEntity;
        paramBoolean = false;
        break;
        paramBoolean = false;
        break label169;
        paramBoolean = false;
        break label320;
        paramBoolean = false;
        break label345;
        paramBoolean = false;
        break label460;
      }
    }
    int i = paramCursor.getColumnIndex("name");
    if (i == -1)
    {
      paramNoColumnErrorHandler.a(new NoColumnError("name", String.class));
      i = paramCursor.getColumnIndex("troopCode");
      if (i != -1) {
        break label1791;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("troopCode", String.class));
      label735:
      i = paramCursor.getColumnIndex("signature");
      if (i != -1) {
        break label1806;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("signature", String.class));
      label769:
      i = paramCursor.getColumnIndex("troopUin");
      if (i != -1) {
        break label1821;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("troopUin", String.class));
      label803:
      i = paramCursor.getColumnIndex("faceId");
      if (i != -1) {
        break label1836;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("faceId", Integer.TYPE));
      label838:
      i = paramCursor.getColumnIndex("memberCount");
      if (i != -1) {
        break label1851;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("memberCount", Integer.TYPE));
      label873:
      i = paramCursor.getColumnIndex("hasJoined");
      if (i != -1) {
        break label1866;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("hasJoined", Boolean.TYPE));
      i = paramCursor.getColumnIndex("isWifiHotChat");
      if (i != -1) {
        break label1893;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("isWifiHotChat", Boolean.TYPE));
      i = paramCursor.getColumnIndex("uuid");
      if (i != -1) {
        break label1920;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("uuid", String.class));
      label977:
      i = paramCursor.getColumnIndex("iconUrl");
      if (i != -1) {
        break label1935;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("iconUrl", String.class));
      label1011:
      i = paramCursor.getColumnIndex("hotThemeGroupFlag");
      if (i != -1) {
        break label1950;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("hotThemeGroupFlag", Integer.TYPE));
      label1046:
      i = paramCursor.getColumnIndex("detail");
      if (i != -1) {
        break label1965;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("detail", String.class));
      label1080:
      i = paramCursor.getColumnIndex("state");
      if (i != -1) {
        break label1980;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("state", Integer.TYPE));
      label1115:
      i = paramCursor.getColumnIndex("leftTime");
      if (i != -1) {
        break label1995;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("leftTime", Long.TYPE));
      label1150:
      i = paramCursor.getColumnIndex("ruState");
      if (i != -1) {
        break label2010;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("ruState", Integer.TYPE));
      label1185:
      i = paramCursor.getColumnIndex("supportFlashPic");
      if (i != -1) {
        break label2025;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("supportFlashPic", Boolean.TYPE));
      i = paramCursor.getColumnIndex("supportDemo");
      if (i != -1) {
        break label2052;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("supportDemo", Boolean.TYPE));
      i = paramCursor.getColumnIndex("adminLevel");
      if (i != -1) {
        break label2079;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("adminLevel", Integer.TYPE));
      label1290:
      i = paramCursor.getColumnIndex("joinUrl");
      if (i != -1) {
        break label2094;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("joinUrl", String.class));
      label1324:
      i = paramCursor.getColumnIndex("hotChatType");
      if (i != -1) {
        break label2109;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("hotChatType", Integer.TYPE));
      label1359:
      i = paramCursor.getColumnIndex("memo");
      if (i != -1) {
        break label2124;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("memo", String.class));
      label1393:
      i = paramCursor.getColumnIndex("memoUrl");
      if (i != -1) {
        break label2139;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("memoUrl", String.class));
      label1427:
      i = paramCursor.getColumnIndex("memoShowed");
      if (i != -1) {
        break label2154;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("memoShowed", Boolean.TYPE));
      i = paramCursor.getColumnIndex("userCreate");
      if (i != -1) {
        break label2181;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("userCreate", Integer.TYPE));
      label1497:
      i = paramCursor.getColumnIndex("strAdminUins");
      if (i != -1) {
        break label2196;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strAdminUins", String.class));
      label1531:
      i = paramCursor.getColumnIndex("ownerUin");
      if (i != -1) {
        break label2211;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("ownerUin", String.class));
      label1565:
      i = paramCursor.getColumnIndex("pkFlag");
      if (i != -1) {
        break label2226;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("pkFlag", Integer.TYPE));
      label1600:
      i = paramCursor.getColumnIndex("subType");
      if (i != -1) {
        break label2241;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("subType", Integer.TYPE));
      label1635:
      i = paramCursor.getColumnIndex("lLastMsgSeq");
      if (i != -1) {
        break label2256;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("lLastMsgSeq", Long.TYPE));
      label1670:
      i = paramCursor.getColumnIndex("extra1");
      if (i != -1) {
        break label2271;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("extra1", String.class));
    }
    for (;;)
    {
      i = paramCursor.getColumnIndex("isFavorite");
      if (i != -1) {
        break label2286;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("isFavorite", Boolean.TYPE));
      i = paramCursor.getColumnIndex("mFissionRoomNum");
      if (i != -1) {
        break label2314;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("mFissionRoomNum", Integer.TYPE));
      return paramEntity;
      name = paramCursor.getString(i);
      break;
      label1791:
      troopCode = paramCursor.getString(i);
      break label735;
      label1806:
      signature = paramCursor.getString(i);
      break label769;
      label1821:
      troopUin = paramCursor.getString(i);
      break label803;
      label1836:
      faceId = paramCursor.getInt(i);
      break label838;
      label1851:
      memberCount = paramCursor.getInt(i);
      break label873;
      label1866:
      if (1 == paramCursor.getShort(i)) {}
      for (paramBoolean = true;; paramBoolean = false)
      {
        hasJoined = paramBoolean;
        break;
      }
      label1893:
      if (1 == paramCursor.getShort(i)) {}
      for (paramBoolean = true;; paramBoolean = false)
      {
        isWifiHotChat = paramBoolean;
        break;
      }
      label1920:
      uuid = paramCursor.getString(i);
      break label977;
      label1935:
      iconUrl = paramCursor.getString(i);
      break label1011;
      label1950:
      hotThemeGroupFlag = paramCursor.getInt(i);
      break label1046;
      label1965:
      detail = paramCursor.getString(i);
      break label1080;
      label1980:
      state = paramCursor.getInt(i);
      break label1115;
      label1995:
      leftTime = paramCursor.getLong(i);
      break label1150;
      label2010:
      ruState = paramCursor.getInt(i);
      break label1185;
      label2025:
      if (1 == paramCursor.getShort(i)) {}
      for (paramBoolean = true;; paramBoolean = false)
      {
        supportFlashPic = paramBoolean;
        break;
      }
      label2052:
      if (1 == paramCursor.getShort(i)) {}
      for (paramBoolean = true;; paramBoolean = false)
      {
        supportDemo = paramBoolean;
        break;
      }
      label2079:
      adminLevel = paramCursor.getInt(i);
      break label1290;
      label2094:
      joinUrl = paramCursor.getString(i);
      break label1324;
      label2109:
      hotChatType = paramCursor.getInt(i);
      break label1359;
      label2124:
      memo = paramCursor.getString(i);
      break label1393;
      label2139:
      memoUrl = paramCursor.getString(i);
      break label1427;
      label2154:
      if (1 == paramCursor.getShort(i)) {}
      for (paramBoolean = true;; paramBoolean = false)
      {
        memoShowed = paramBoolean;
        break;
      }
      label2181:
      userCreate = paramCursor.getInt(i);
      break label1497;
      label2196:
      strAdminUins = paramCursor.getString(i);
      break label1531;
      label2211:
      ownerUin = paramCursor.getString(i);
      break label1565;
      label2226:
      pkFlag = paramCursor.getInt(i);
      break label1600;
      label2241:
      subType = paramCursor.getInt(i);
      break label1635;
      label2256:
      lLastMsgSeq = paramCursor.getLong(i);
      break label1670;
      label2271:
      extra1 = paramCursor.getString(i);
    }
    label2286:
    if (1 == paramCursor.getShort(i)) {}
    for (paramBoolean = bool2;; paramBoolean = false)
    {
      isFavorite = paramBoolean;
      break;
    }
    label2314:
    mFissionRoomNum = paramCursor.getInt(i);
    return paramEntity;
  }
  
  public String a(String paramString)
  {
    StringBuilder localStringBuilder = new StringBuilder("CREATE TABLE IF NOT EXISTS ");
    localStringBuilder.append(paramString);
    localStringBuilder.append(" (_id INTEGER PRIMARY KEY AUTOINCREMENT ,name TEXT ,troopCode TEXT ,signature TEXT ,troopUin TEXT UNIQUE ,faceId INTEGER ,memberCount INTEGER ,hasJoined INTEGER ,isWifiHotChat INTEGER ,uuid TEXT ,iconUrl TEXT ,hotThemeGroupFlag INTEGER ,detail TEXT ,state INTEGER ,leftTime INTEGER ,ruState INTEGER ,supportFlashPic INTEGER ,supportDemo INTEGER ,adminLevel INTEGER ,joinUrl TEXT ,hotChatType INTEGER ,memo TEXT ,memoUrl TEXT ,memoShowed INTEGER ,userCreate INTEGER ,strAdminUins TEXT ,ownerUin TEXT ,pkFlag INTEGER ,subType INTEGER ,lLastMsgSeq INTEGER ,extra1 TEXT ,isFavorite INTEGER ,mFissionRoomNum INTEGER)");
    return localStringBuilder.toString();
  }
  
  public void a(Entity paramEntity, ContentValues paramContentValues)
  {
    paramEntity = (HotChatInfo)paramEntity;
    paramContentValues.put("name", name);
    paramContentValues.put("troopCode", troopCode);
    paramContentValues.put("signature", signature);
    paramContentValues.put("troopUin", troopUin);
    paramContentValues.put("faceId", Integer.valueOf(faceId));
    paramContentValues.put("memberCount", Integer.valueOf(memberCount));
    paramContentValues.put("hasJoined", Boolean.valueOf(hasJoined));
    paramContentValues.put("isWifiHotChat", Boolean.valueOf(isWifiHotChat));
    paramContentValues.put("uuid", uuid);
    paramContentValues.put("iconUrl", iconUrl);
    paramContentValues.put("hotThemeGroupFlag", Integer.valueOf(hotThemeGroupFlag));
    paramContentValues.put("detail", detail);
    paramContentValues.put("state", Integer.valueOf(state));
    paramContentValues.put("leftTime", Long.valueOf(leftTime));
    paramContentValues.put("ruState", Integer.valueOf(ruState));
    paramContentValues.put("supportFlashPic", Boolean.valueOf(supportFlashPic));
    paramContentValues.put("supportDemo", Boolean.valueOf(supportDemo));
    paramContentValues.put("adminLevel", Integer.valueOf(adminLevel));
    paramContentValues.put("joinUrl", joinUrl);
    paramContentValues.put("hotChatType", Integer.valueOf(hotChatType));
    paramContentValues.put("memo", memo);
    paramContentValues.put("memoUrl", memoUrl);
    paramContentValues.put("memoShowed", Boolean.valueOf(memoShowed));
    paramContentValues.put("userCreate", Integer.valueOf(userCreate));
    paramContentValues.put("strAdminUins", strAdminUins);
    paramContentValues.put("ownerUin", ownerUin);
    paramContentValues.put("pkFlag", Integer.valueOf(pkFlag));
    paramContentValues.put("subType", Integer.valueOf(subType));
    paramContentValues.put("lLastMsgSeq", Long.valueOf(lLastMsgSeq));
    paramContentValues.put("extra1", extra1);
    paramContentValues.put("isFavorite", Boolean.valueOf(isFavorite));
    paramContentValues.put("mFissionRoomNum", Integer.valueOf(mFissionRoomNum));
  }
}
