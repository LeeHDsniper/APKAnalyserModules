package com.tencent.mobileqq.persistence;

import android.content.ContentValues;
import android.database.Cursor;
import com.tencent.mobileqq.data.ResourcePluginInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class ResourcePluginInfoDao
  extends OGAbstractDao
{
  private OGEntityInfo a;
  
  public ResourcePluginInfoDao()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = 22;
  }
  
  public Entity a(Entity paramEntity, Cursor paramCursor, boolean paramBoolean, NoColumnErrorHandler paramNoColumnErrorHandler)
  {
    paramEntity = (ResourcePluginInfo)paramEntity;
    if (paramNoColumnErrorHandler == null)
    {
      strPkgName = paramCursor.getString(paramCursor.getColumnIndex("strPkgName"));
      strResName = paramCursor.getString(paramCursor.getColumnIndex("strResName"));
      strResURL = paramCursor.getString(paramCursor.getColumnIndex("strResURL"));
      uiCurVer = paramCursor.getLong(paramCursor.getColumnIndex("uiCurVer"));
      sLanType = paramCursor.getShort(paramCursor.getColumnIndex("sLanType"));
      strGotoUrl = paramCursor.getString(paramCursor.getColumnIndex("strGotoUrl"));
      sResSubType = paramCursor.getShort(paramCursor.getColumnIndex("sResSubType"));
      sPriority = paramCursor.getShort(paramCursor.getColumnIndex("sPriority"));
      strResDesc = paramCursor.getString(paramCursor.getColumnIndex("strResDesc"));
      uiResId = paramCursor.getLong(paramCursor.getColumnIndex("uiResId"));
      cDefaultState = ((byte)paramCursor.getShort(paramCursor.getColumnIndex("cDefaultState")));
      cCanChangeState = ((byte)paramCursor.getShort(paramCursor.getColumnIndex("cCanChangeState")));
      isNew = ((byte)paramCursor.getShort(paramCursor.getColumnIndex("isNew")));
      cDataType = ((byte)paramCursor.getShort(paramCursor.getColumnIndex("cDataType")));
      cLocalState = ((byte)paramCursor.getShort(paramCursor.getColumnIndex("cLocalState")));
      iPluginType = paramCursor.getInt(paramCursor.getColumnIndex("iPluginType"));
      timeStamp = paramCursor.getLong(paramCursor.getColumnIndex("timeStamp"));
      strNewPluginDesc = paramCursor.getString(paramCursor.getColumnIndex("strNewPluginDesc"));
      strNewPluginURL = paramCursor.getString(paramCursor.getColumnIndex("strNewPluginURL"));
      lebaSearchResultType = paramCursor.getInt(paramCursor.getColumnIndex("lebaSearchResultType"));
      pluginSetTips = paramCursor.getString(paramCursor.getColumnIndex("pluginSetTips"));
      pluginBg = paramCursor.getString(paramCursor.getColumnIndex("pluginBg"));
      return paramEntity;
    }
    int i = paramCursor.getColumnIndex("strPkgName");
    if (i == -1)
    {
      paramNoColumnErrorHandler.a(new NoColumnError("strPkgName", String.class));
      i = paramCursor.getColumnIndex("strResName");
      if (i != -1) {
        break label1191;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strResName", String.class));
      label481:
      i = paramCursor.getColumnIndex("strResURL");
      if (i != -1) {
        break label1206;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strResURL", String.class));
      label515:
      i = paramCursor.getColumnIndex("uiCurVer");
      if (i != -1) {
        break label1221;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("uiCurVer", Long.TYPE));
      label550:
      i = paramCursor.getColumnIndex("sLanType");
      if (i != -1) {
        break label1236;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("sLanType", Short.TYPE));
      label585:
      i = paramCursor.getColumnIndex("strGotoUrl");
      if (i != -1) {
        break label1251;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strGotoUrl", String.class));
      label619:
      i = paramCursor.getColumnIndex("sResSubType");
      if (i != -1) {
        break label1266;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("sResSubType", Short.TYPE));
      label654:
      i = paramCursor.getColumnIndex("sPriority");
      if (i != -1) {
        break label1281;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("sPriority", Short.TYPE));
      label689:
      i = paramCursor.getColumnIndex("strResDesc");
      if (i != -1) {
        break label1296;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strResDesc", String.class));
      label723:
      i = paramCursor.getColumnIndex("uiResId");
      if (i != -1) {
        break label1311;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("uiResId", Long.TYPE));
      label758:
      i = paramCursor.getColumnIndex("cDefaultState");
      if (i != -1) {
        break label1326;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("cDefaultState", Byte.TYPE));
      label793:
      i = paramCursor.getColumnIndex("cCanChangeState");
      if (i != -1) {
        break label1342;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("cCanChangeState", Byte.TYPE));
      label828:
      i = paramCursor.getColumnIndex("isNew");
      if (i != -1) {
        break label1358;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("isNew", Byte.TYPE));
      label863:
      i = paramCursor.getColumnIndex("cDataType");
      if (i != -1) {
        break label1374;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("cDataType", Byte.TYPE));
      label898:
      i = paramCursor.getColumnIndex("cLocalState");
      if (i != -1) {
        break label1390;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("cLocalState", Byte.TYPE));
      label933:
      i = paramCursor.getColumnIndex("iPluginType");
      if (i != -1) {
        break label1406;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("iPluginType", Integer.TYPE));
      label968:
      i = paramCursor.getColumnIndex("timeStamp");
      if (i != -1) {
        break label1421;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("timeStamp", Long.TYPE));
      label1003:
      i = paramCursor.getColumnIndex("strNewPluginDesc");
      if (i != -1) {
        break label1436;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strNewPluginDesc", String.class));
      label1037:
      i = paramCursor.getColumnIndex("strNewPluginURL");
      if (i != -1) {
        break label1451;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strNewPluginURL", String.class));
      label1071:
      i = paramCursor.getColumnIndex("lebaSearchResultType");
      if (i != -1) {
        break label1466;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("lebaSearchResultType", Integer.TYPE));
      label1106:
      i = paramCursor.getColumnIndex("pluginSetTips");
      if (i != -1) {
        break label1481;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("pluginSetTips", String.class));
    }
    for (;;)
    {
      i = paramCursor.getColumnIndex("pluginBg");
      if (i != -1) {
        break label1496;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("pluginBg", String.class));
      return paramEntity;
      strPkgName = paramCursor.getString(i);
      break;
      label1191:
      strResName = paramCursor.getString(i);
      break label481;
      label1206:
      strResURL = paramCursor.getString(i);
      break label515;
      label1221:
      uiCurVer = paramCursor.getLong(i);
      break label550;
      label1236:
      sLanType = paramCursor.getShort(i);
      break label585;
      label1251:
      strGotoUrl = paramCursor.getString(i);
      break label619;
      label1266:
      sResSubType = paramCursor.getShort(i);
      break label654;
      label1281:
      sPriority = paramCursor.getShort(i);
      break label689;
      label1296:
      strResDesc = paramCursor.getString(i);
      break label723;
      label1311:
      uiResId = paramCursor.getLong(i);
      break label758;
      label1326:
      cDefaultState = ((byte)paramCursor.getShort(i));
      break label793;
      label1342:
      cCanChangeState = ((byte)paramCursor.getShort(i));
      break label828;
      label1358:
      isNew = ((byte)paramCursor.getShort(i));
      break label863;
      label1374:
      cDataType = ((byte)paramCursor.getShort(i));
      break label898;
      label1390:
      cLocalState = ((byte)paramCursor.getShort(i));
      break label933;
      label1406:
      iPluginType = paramCursor.getInt(i);
      break label968;
      label1421:
      timeStamp = paramCursor.getLong(i);
      break label1003;
      label1436:
      strNewPluginDesc = paramCursor.getString(i);
      break label1037;
      label1451:
      strNewPluginURL = paramCursor.getString(i);
      break label1071;
      label1466:
      lebaSearchResultType = paramCursor.getInt(i);
      break label1106;
      label1481:
      pluginSetTips = paramCursor.getString(i);
    }
    label1496:
    pluginBg = paramCursor.getString(i);
    return paramEntity;
  }
  
  public String a(String paramString)
  {
    StringBuilder localStringBuilder = new StringBuilder("CREATE TABLE IF NOT EXISTS ");
    localStringBuilder.append(paramString);
    localStringBuilder.append(" (_id INTEGER PRIMARY KEY AUTOINCREMENT ,strPkgName TEXT UNIQUE ,strResName TEXT ,strResURL TEXT ,uiCurVer INTEGER ,sLanType INTEGER ,strGotoUrl TEXT ,sResSubType INTEGER ,sPriority INTEGER ,strResDesc TEXT ,uiResId INTEGER ,cDefaultState INTEGER ,cCanChangeState INTEGER ,isNew INTEGER ,cDataType INTEGER ,cLocalState INTEGER ,iPluginType INTEGER ,timeStamp INTEGER ,strNewPluginDesc TEXT ,strNewPluginURL TEXT ,lebaSearchResultType INTEGER ,pluginSetTips TEXT ,pluginBg TEXT)");
    return localStringBuilder.toString();
  }
  
  public void a(Entity paramEntity, ContentValues paramContentValues)
  {
    paramEntity = (ResourcePluginInfo)paramEntity;
    paramContentValues.put("strPkgName", strPkgName);
    paramContentValues.put("strResName", strResName);
    paramContentValues.put("strResURL", strResURL);
    paramContentValues.put("uiCurVer", Long.valueOf(uiCurVer));
    paramContentValues.put("sLanType", Short.valueOf(sLanType));
    paramContentValues.put("strGotoUrl", strGotoUrl);
    paramContentValues.put("sResSubType", Short.valueOf(sResSubType));
    paramContentValues.put("sPriority", Short.valueOf(sPriority));
    paramContentValues.put("strResDesc", strResDesc);
    paramContentValues.put("uiResId", Long.valueOf(uiResId));
    paramContentValues.put("cDefaultState", Byte.valueOf(cDefaultState));
    paramContentValues.put("cCanChangeState", Byte.valueOf(cCanChangeState));
    paramContentValues.put("isNew", Byte.valueOf(isNew));
    paramContentValues.put("cDataType", Byte.valueOf(cDataType));
    paramContentValues.put("cLocalState", Byte.valueOf(cLocalState));
    paramContentValues.put("iPluginType", Integer.valueOf(iPluginType));
    paramContentValues.put("timeStamp", Long.valueOf(timeStamp));
    paramContentValues.put("strNewPluginDesc", strNewPluginDesc);
    paramContentValues.put("strNewPluginURL", strNewPluginURL);
    paramContentValues.put("lebaSearchResultType", Integer.valueOf(lebaSearchResultType));
    paramContentValues.put("pluginSetTips", pluginSetTips);
    paramContentValues.put("pluginBg", pluginBg);
  }
}
