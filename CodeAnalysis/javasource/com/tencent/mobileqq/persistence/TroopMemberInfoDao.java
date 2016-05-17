package com.tencent.mobileqq.persistence;

import android.content.ContentValues;
import android.database.Cursor;
import com.tencent.mobileqq.data.TroopMemberInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class TroopMemberInfoDao
  extends OGAbstractDao
{
  private OGEntityInfo a;
  
  public TroopMemberInfoDao()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = 35;
  }
  
  public Entity a(Entity paramEntity, Cursor paramCursor, boolean paramBoolean, NoColumnErrorHandler paramNoColumnErrorHandler)
  {
    boolean bool2 = true;
    boolean bool1 = true;
    paramEntity = (TroopMemberInfo)paramEntity;
    if (paramNoColumnErrorHandler == null)
    {
      troopuin = paramCursor.getString(paramCursor.getColumnIndex("troopuin"));
      memberuin = paramCursor.getString(paramCursor.getColumnIndex("memberuin"));
      friendnick = paramCursor.getString(paramCursor.getColumnIndex("friendnick"));
      pyAll_friendnick = paramCursor.getString(paramCursor.getColumnIndex("pyAll_friendnick"));
      pyFirst_friendnick = paramCursor.getString(paramCursor.getColumnIndex("pyFirst_friendnick"));
      troopnick = paramCursor.getString(paramCursor.getColumnIndex("troopnick"));
      pyAll_troopnick = paramCursor.getString(paramCursor.getColumnIndex("pyAll_troopnick"));
      pyFirst_troopnick = paramCursor.getString(paramCursor.getColumnIndex("pyFirst_troopnick"));
      autoremark = paramCursor.getString(paramCursor.getColumnIndex("autoremark"));
      pyAll_autoremark = paramCursor.getString(paramCursor.getColumnIndex("pyAll_autoremark"));
      pyFirst_autoremark = paramCursor.getString(paramCursor.getColumnIndex("pyFirst_autoremark"));
      troopremark = paramCursor.getString(paramCursor.getColumnIndex("troopremark"));
      alias = paramCursor.getString(paramCursor.getColumnIndex("alias"));
      datetime = paramCursor.getLong(paramCursor.getColumnIndex("datetime"));
      faceid = paramCursor.getShort(paramCursor.getColumnIndex("faceid"));
      age = ((byte)paramCursor.getShort(paramCursor.getColumnIndex("age")));
      sex = ((byte)paramCursor.getShort(paramCursor.getColumnIndex("sex")));
      status = ((byte)paramCursor.getShort(paramCursor.getColumnIndex("status")));
      qqVipInfo = paramCursor.getInt(paramCursor.getColumnIndex("qqVipInfo"));
      superQqInfo = paramCursor.getInt(paramCursor.getColumnIndex("superQqInfo"));
      superVipInfo = paramCursor.getInt(paramCursor.getColumnIndex("superVipInfo"));
      level = paramCursor.getInt(paramCursor.getColumnIndex("level"));
      join_time = paramCursor.getLong(paramCursor.getColumnIndex("join_time"));
      last_active_time = paramCursor.getLong(paramCursor.getColumnIndex("last_active_time"));
      active_point = paramCursor.getLong(paramCursor.getColumnIndex("active_point"));
      credit_level = paramCursor.getLong(paramCursor.getColumnIndex("credit_level"));
      if (1 == paramCursor.getShort(paramCursor.getColumnIndex("isTroopFollowed")))
      {
        paramBoolean = true;
        isTroopFollowed = paramBoolean;
        distance = paramCursor.getInt(paramCursor.getColumnIndex("distance"));
        msgseq = paramCursor.getLong(paramCursor.getColumnIndex("msgseq"));
        gagTimeStamp = paramCursor.getLong(paramCursor.getColumnIndex("gagTimeStamp"));
        distanceToSelf = paramCursor.getDouble(paramCursor.getColumnIndex("distanceToSelf"));
        distanceToSelfUpdateTimeStamp = paramCursor.getLong(paramCursor.getColumnIndex("distanceToSelfUpdateTimeStamp"));
        if (1 != paramCursor.getShort(paramCursor.getColumnIndex("mIsShielded"))) {
          break label671;
        }
      }
      label671:
      for (paramBoolean = bool1;; paramBoolean = false)
      {
        mIsShielded = paramBoolean;
        mUniqueTitle = paramCursor.getString(paramCursor.getColumnIndex("mUniqueTitle"));
        mUniqueTitleExpire = paramCursor.getInt(paramCursor.getColumnIndex("mUniqueTitleExpire"));
        return paramEntity;
        paramBoolean = false;
        break;
      }
    }
    int i = paramCursor.getColumnIndex("troopuin");
    if (i == -1)
    {
      paramNoColumnErrorHandler.a(new NoColumnError("troopuin", String.class));
      i = paramCursor.getColumnIndex("memberuin");
      if (i != -1) {
        break label1904;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("memberuin", String.class));
      label744:
      i = paramCursor.getColumnIndex("friendnick");
      if (i != -1) {
        break label1919;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("friendnick", String.class));
      label778:
      i = paramCursor.getColumnIndex("pyAll_friendnick");
      if (i != -1) {
        break label1934;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("pyAll_friendnick", String.class));
      label812:
      i = paramCursor.getColumnIndex("pyFirst_friendnick");
      if (i != -1) {
        break label1949;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("pyFirst_friendnick", String.class));
      label846:
      i = paramCursor.getColumnIndex("troopnick");
      if (i != -1) {
        break label1964;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("troopnick", String.class));
      label880:
      i = paramCursor.getColumnIndex("pyAll_troopnick");
      if (i != -1) {
        break label1979;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("pyAll_troopnick", String.class));
      label914:
      i = paramCursor.getColumnIndex("pyFirst_troopnick");
      if (i != -1) {
        break label1994;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("pyFirst_troopnick", String.class));
      label948:
      i = paramCursor.getColumnIndex("autoremark");
      if (i != -1) {
        break label2009;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("autoremark", String.class));
      label982:
      i = paramCursor.getColumnIndex("pyAll_autoremark");
      if (i != -1) {
        break label2024;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("pyAll_autoremark", String.class));
      label1016:
      i = paramCursor.getColumnIndex("pyFirst_autoremark");
      if (i != -1) {
        break label2039;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("pyFirst_autoremark", String.class));
      label1050:
      i = paramCursor.getColumnIndex("troopremark");
      if (i != -1) {
        break label2054;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("troopremark", String.class));
      label1084:
      i = paramCursor.getColumnIndex("alias");
      if (i != -1) {
        break label2069;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("alias", String.class));
      label1118:
      i = paramCursor.getColumnIndex("datetime");
      if (i != -1) {
        break label2084;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("datetime", Long.TYPE));
      label1153:
      i = paramCursor.getColumnIndex("faceid");
      if (i != -1) {
        break label2099;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("faceid", Short.TYPE));
      label1188:
      i = paramCursor.getColumnIndex("age");
      if (i != -1) {
        break label2114;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("age", Byte.TYPE));
      label1223:
      i = paramCursor.getColumnIndex("sex");
      if (i != -1) {
        break label2130;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("sex", Byte.TYPE));
      label1258:
      i = paramCursor.getColumnIndex("status");
      if (i != -1) {
        break label2146;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("status", Byte.TYPE));
      label1293:
      i = paramCursor.getColumnIndex("qqVipInfo");
      if (i != -1) {
        break label2162;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("qqVipInfo", Integer.TYPE));
      label1328:
      i = paramCursor.getColumnIndex("superQqInfo");
      if (i != -1) {
        break label2177;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("superQqInfo", Integer.TYPE));
      label1363:
      i = paramCursor.getColumnIndex("superVipInfo");
      if (i != -1) {
        break label2192;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("superVipInfo", Integer.TYPE));
      label1398:
      i = paramCursor.getColumnIndex("level");
      if (i != -1) {
        break label2207;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("level", Integer.TYPE));
      label1433:
      i = paramCursor.getColumnIndex("join_time");
      if (i != -1) {
        break label2222;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("join_time", Long.TYPE));
      label1468:
      i = paramCursor.getColumnIndex("last_active_time");
      if (i != -1) {
        break label2237;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("last_active_time", Long.TYPE));
      label1503:
      i = paramCursor.getColumnIndex("active_point");
      if (i != -1) {
        break label2252;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("active_point", Long.TYPE));
      label1538:
      i = paramCursor.getColumnIndex("credit_level");
      if (i != -1) {
        break label2267;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("credit_level", Long.TYPE));
      label1573:
      i = paramCursor.getColumnIndex("isTroopFollowed");
      if (i != -1) {
        break label2282;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("isTroopFollowed", Boolean.TYPE));
      i = paramCursor.getColumnIndex("distance");
      if (i != -1) {
        break label2309;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("distance", Integer.TYPE));
      label1643:
      i = paramCursor.getColumnIndex("msgseq");
      if (i != -1) {
        break label2324;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("msgseq", Long.TYPE));
      label1678:
      i = paramCursor.getColumnIndex("gagTimeStamp");
      if (i != -1) {
        break label2339;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("gagTimeStamp", Long.TYPE));
      label1713:
      i = paramCursor.getColumnIndex("distanceToSelf");
      if (i != -1) {
        break label2354;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("distanceToSelf", Double.TYPE));
      label1748:
      i = paramCursor.getColumnIndex("distanceToSelfUpdateTimeStamp");
      if (i != -1) {
        break label2369;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("distanceToSelfUpdateTimeStamp", Long.TYPE));
      label1783:
      i = paramCursor.getColumnIndex("mIsShielded");
      if (i != -1) {
        break label2384;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("mIsShielded", Boolean.TYPE));
      i = paramCursor.getColumnIndex("mUniqueTitle");
      if (i != -1) {
        break label2412;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("mUniqueTitle", String.class));
    }
    for (;;)
    {
      i = paramCursor.getColumnIndex("mUniqueTitleExpire");
      if (i != -1) {
        break label2427;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("mUniqueTitleExpire", Integer.TYPE));
      return paramEntity;
      troopuin = paramCursor.getString(i);
      break;
      label1904:
      memberuin = paramCursor.getString(i);
      break label744;
      label1919:
      friendnick = paramCursor.getString(i);
      break label778;
      label1934:
      pyAll_friendnick = paramCursor.getString(i);
      break label812;
      label1949:
      pyFirst_friendnick = paramCursor.getString(i);
      break label846;
      label1964:
      troopnick = paramCursor.getString(i);
      break label880;
      label1979:
      pyAll_troopnick = paramCursor.getString(i);
      break label914;
      label1994:
      pyFirst_troopnick = paramCursor.getString(i);
      break label948;
      label2009:
      autoremark = paramCursor.getString(i);
      break label982;
      label2024:
      pyAll_autoremark = paramCursor.getString(i);
      break label1016;
      label2039:
      pyFirst_autoremark = paramCursor.getString(i);
      break label1050;
      label2054:
      troopremark = paramCursor.getString(i);
      break label1084;
      label2069:
      alias = paramCursor.getString(i);
      break label1118;
      label2084:
      datetime = paramCursor.getLong(i);
      break label1153;
      label2099:
      faceid = paramCursor.getShort(i);
      break label1188;
      label2114:
      age = ((byte)paramCursor.getShort(i));
      break label1223;
      label2130:
      sex = ((byte)paramCursor.getShort(i));
      break label1258;
      label2146:
      status = ((byte)paramCursor.getShort(i));
      break label1293;
      label2162:
      qqVipInfo = paramCursor.getInt(i);
      break label1328;
      label2177:
      superQqInfo = paramCursor.getInt(i);
      break label1363;
      label2192:
      superVipInfo = paramCursor.getInt(i);
      break label1398;
      label2207:
      level = paramCursor.getInt(i);
      break label1433;
      label2222:
      join_time = paramCursor.getLong(i);
      break label1468;
      label2237:
      last_active_time = paramCursor.getLong(i);
      break label1503;
      label2252:
      active_point = paramCursor.getLong(i);
      break label1538;
      label2267:
      credit_level = paramCursor.getLong(i);
      break label1573;
      label2282:
      if (1 == paramCursor.getShort(i)) {}
      for (paramBoolean = true;; paramBoolean = false)
      {
        isTroopFollowed = paramBoolean;
        break;
      }
      label2309:
      distance = paramCursor.getInt(i);
      break label1643;
      label2324:
      msgseq = paramCursor.getLong(i);
      break label1678;
      label2339:
      gagTimeStamp = paramCursor.getLong(i);
      break label1713;
      label2354:
      distanceToSelf = paramCursor.getDouble(i);
      break label1748;
      label2369:
      distanceToSelfUpdateTimeStamp = paramCursor.getLong(i);
      break label1783;
      label2384:
      if (1 == paramCursor.getShort(i)) {}
      for (paramBoolean = bool2;; paramBoolean = false)
      {
        mIsShielded = paramBoolean;
        break;
      }
      label2412:
      mUniqueTitle = paramCursor.getString(i);
    }
    label2427:
    mUniqueTitleExpire = paramCursor.getInt(i);
    return paramEntity;
  }
  
  public String a(String paramString)
  {
    StringBuilder localStringBuilder = new StringBuilder("CREATE TABLE IF NOT EXISTS ");
    localStringBuilder.append(paramString);
    localStringBuilder.append(" (_id INTEGER PRIMARY KEY AUTOINCREMENT ,troopuin TEXT ,memberuin TEXT ,friendnick TEXT ,pyAll_friendnick TEXT ,pyFirst_friendnick TEXT ,troopnick TEXT ,pyAll_troopnick TEXT ,pyFirst_troopnick TEXT ,autoremark TEXT ,pyAll_autoremark TEXT ,pyFirst_autoremark TEXT ,troopremark TEXT ,alias TEXT ,datetime INTEGER ,faceid INTEGER ,age INTEGER ,sex INTEGER ,status INTEGER ,qqVipInfo INTEGER ,superQqInfo INTEGER ,superVipInfo INTEGER ,level INTEGER ,join_time INTEGER ,last_active_time INTEGER ,active_point INTEGER ,credit_level INTEGER ,isTroopFollowed INTEGER ,distance INTEGER ,msgseq INTEGER ,gagTimeStamp INTEGER ,distanceToSelf REAL ,distanceToSelfUpdateTimeStamp INTEGER ,mIsShielded INTEGER ,mUniqueTitle TEXT ,mUniqueTitleExpire INTEGER,UNIQUE(troopuin,memberuin) ON CONFLICT IGNORE)");
    return localStringBuilder.toString();
  }
  
  public void a(Entity paramEntity, ContentValues paramContentValues)
  {
    paramEntity = (TroopMemberInfo)paramEntity;
    paramContentValues.put("troopuin", troopuin);
    paramContentValues.put("memberuin", memberuin);
    paramContentValues.put("friendnick", friendnick);
    paramContentValues.put("pyAll_friendnick", pyAll_friendnick);
    paramContentValues.put("pyFirst_friendnick", pyFirst_friendnick);
    paramContentValues.put("troopnick", troopnick);
    paramContentValues.put("pyAll_troopnick", pyAll_troopnick);
    paramContentValues.put("pyFirst_troopnick", pyFirst_troopnick);
    paramContentValues.put("autoremark", autoremark);
    paramContentValues.put("pyAll_autoremark", pyAll_autoremark);
    paramContentValues.put("pyFirst_autoremark", pyFirst_autoremark);
    paramContentValues.put("troopremark", troopremark);
    paramContentValues.put("alias", alias);
    paramContentValues.put("datetime", Long.valueOf(datetime));
    paramContentValues.put("faceid", Short.valueOf(faceid));
    paramContentValues.put("age", Byte.valueOf(age));
    paramContentValues.put("sex", Byte.valueOf(sex));
    paramContentValues.put("status", Byte.valueOf(status));
    paramContentValues.put("qqVipInfo", Integer.valueOf(qqVipInfo));
    paramContentValues.put("superQqInfo", Integer.valueOf(superQqInfo));
    paramContentValues.put("superVipInfo", Integer.valueOf(superVipInfo));
    paramContentValues.put("level", Integer.valueOf(level));
    paramContentValues.put("join_time", Long.valueOf(join_time));
    paramContentValues.put("last_active_time", Long.valueOf(last_active_time));
    paramContentValues.put("active_point", Long.valueOf(active_point));
    paramContentValues.put("credit_level", Long.valueOf(credit_level));
    paramContentValues.put("isTroopFollowed", Boolean.valueOf(isTroopFollowed));
    paramContentValues.put("distance", Integer.valueOf(distance));
    paramContentValues.put("msgseq", Long.valueOf(msgseq));
    paramContentValues.put("gagTimeStamp", Long.valueOf(gagTimeStamp));
    paramContentValues.put("distanceToSelf", Double.valueOf(distanceToSelf));
    paramContentValues.put("distanceToSelfUpdateTimeStamp", Long.valueOf(distanceToSelfUpdateTimeStamp));
    paramContentValues.put("mIsShielded", Boolean.valueOf(mIsShielded));
    paramContentValues.put("mUniqueTitle", mUniqueTitle);
    paramContentValues.put("mUniqueTitleExpire", Integer.valueOf(mUniqueTitleExpire));
  }
}
