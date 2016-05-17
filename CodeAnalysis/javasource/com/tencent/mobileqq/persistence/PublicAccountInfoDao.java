package com.tencent.mobileqq.persistence;

import android.content.ContentValues;
import android.database.Cursor;
import com.tencent.mobileqq.data.PublicAccountInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class PublicAccountInfoDao
  extends OGAbstractDao
{
  private OGEntityInfo a;
  
  public PublicAccountInfoDao()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = 23;
  }
  
  public Entity a(Entity paramEntity, Cursor paramCursor, boolean paramBoolean, NoColumnErrorHandler paramNoColumnErrorHandler)
  {
    boolean bool2 = true;
    boolean bool1 = true;
    paramEntity = (PublicAccountInfo)paramEntity;
    if (paramNoColumnErrorHandler == null)
    {
      uin = paramCursor.getLong(paramCursor.getColumnIndex("uin"));
      name = paramCursor.getString(paramCursor.getColumnIndex("name"));
      displayNumber = paramCursor.getString(paramCursor.getColumnIndex("displayNumber"));
      summary = paramCursor.getString(paramCursor.getColumnIndex("summary"));
      if (1 == paramCursor.getShort(paramCursor.getColumnIndex("isRecvMsg")))
      {
        paramBoolean = true;
        isRecvMsg = paramBoolean;
        if (1 != paramCursor.getShort(paramCursor.getColumnIndex("isRecvPush"))) {
          break label480;
        }
        paramBoolean = true;
        label133:
        isRecvPush = paramBoolean;
        clickCount = paramCursor.getInt(paramCursor.getColumnIndex("clickCount"));
        certifiedGrade = paramCursor.getLong(paramCursor.getColumnIndex("certifiedGrade"));
        if (1 != paramCursor.getShort(paramCursor.getColumnIndex("isSyncLbs"))) {
          break label485;
        }
        paramBoolean = true;
        label194:
        isSyncLbs = paramBoolean;
        showFlag = paramCursor.getInt(paramCursor.getColumnIndex("showFlag"));
        mShowMsgFlag = paramCursor.getInt(paramCursor.getColumnIndex("mShowMsgFlag"));
        if (1 != paramCursor.getShort(paramCursor.getColumnIndex("mIsAgreeSyncLbs"))) {
          break label490;
        }
        paramBoolean = true;
        label255:
        mIsAgreeSyncLbs = paramBoolean;
        if (1 != paramCursor.getShort(paramCursor.getColumnIndex("mIsSyncLbsSelected"))) {
          break label495;
        }
        paramBoolean = true;
        label280:
        mIsSyncLbsSelected = paramBoolean;
        dateTime = paramCursor.getLong(paramCursor.getColumnIndex("dateTime"));
        accountFlag = paramCursor.getInt(paramCursor.getColumnIndex("accountFlag"));
        accountFlag2 = paramCursor.getLong(paramCursor.getColumnIndex("accountFlag2"));
        eqqAccountFlag = paramCursor.getLong(paramCursor.getColumnIndex("eqqAccountFlag"));
        if (1 != paramCursor.getShort(paramCursor.getColumnIndex("isShieldMsg"))) {
          break label500;
        }
      }
      label480:
      label485:
      label490:
      label495:
      label500:
      for (paramBoolean = bool1;; paramBoolean = false)
      {
        isShieldMsg = paramBoolean;
        messageSettingFlag = paramCursor.getInt(paramCursor.getColumnIndex("messageSettingFlag"));
        extendType = paramCursor.getInt(paramCursor.getColumnIndex("extendType"));
        mComparePartInt = paramCursor.getInt(paramCursor.getColumnIndex("mComparePartInt"));
        mCompareSpell = paramCursor.getString(paramCursor.getColumnIndex("mCompareSpell"));
        logo = paramCursor.getString(paramCursor.getColumnIndex("logo"));
        return paramEntity;
        paramBoolean = false;
        break;
        paramBoolean = false;
        break label133;
        paramBoolean = false;
        break label194;
        paramBoolean = false;
        break label255;
        paramBoolean = false;
        break label280;
      }
    }
    int i = paramCursor.getColumnIndex("uin");
    if (i == -1)
    {
      paramNoColumnErrorHandler.a(new NoColumnError("uin", Long.TYPE));
      i = paramCursor.getColumnIndex("name");
      if (i != -1) {
        break label1322;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("name", String.class));
      label574:
      i = paramCursor.getColumnIndex("displayNumber");
      if (i != -1) {
        break label1337;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("displayNumber", String.class));
      label608:
      i = paramCursor.getColumnIndex("summary");
      if (i != -1) {
        break label1352;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("summary", String.class));
      label642:
      i = paramCursor.getColumnIndex("isRecvMsg");
      if (i != -1) {
        break label1367;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("isRecvMsg", Boolean.TYPE));
      i = paramCursor.getColumnIndex("isRecvPush");
      if (i != -1) {
        break label1394;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("isRecvPush", Boolean.TYPE));
      i = paramCursor.getColumnIndex("clickCount");
      if (i != -1) {
        break label1421;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("clickCount", Integer.TYPE));
      label747:
      i = paramCursor.getColumnIndex("certifiedGrade");
      if (i != -1) {
        break label1436;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("certifiedGrade", Long.TYPE));
      label782:
      i = paramCursor.getColumnIndex("isSyncLbs");
      if (i != -1) {
        break label1451;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("isSyncLbs", Boolean.TYPE));
      i = paramCursor.getColumnIndex("showFlag");
      if (i != -1) {
        break label1478;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("showFlag", Integer.TYPE));
      label852:
      i = paramCursor.getColumnIndex("mShowMsgFlag");
      if (i != -1) {
        break label1493;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("mShowMsgFlag", Integer.TYPE));
      label887:
      i = paramCursor.getColumnIndex("mIsAgreeSyncLbs");
      if (i != -1) {
        break label1508;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("mIsAgreeSyncLbs", Boolean.TYPE));
      i = paramCursor.getColumnIndex("mIsSyncLbsSelected");
      if (i != -1) {
        break label1535;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("mIsSyncLbsSelected", Boolean.TYPE));
      i = paramCursor.getColumnIndex("dateTime");
      if (i != -1) {
        break label1562;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("dateTime", Long.TYPE));
      label992:
      i = paramCursor.getColumnIndex("accountFlag");
      if (i != -1) {
        break label1577;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("accountFlag", Integer.TYPE));
      label1027:
      i = paramCursor.getColumnIndex("accountFlag2");
      if (i != -1) {
        break label1592;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("accountFlag2", Long.TYPE));
      label1062:
      i = paramCursor.getColumnIndex("eqqAccountFlag");
      if (i != -1) {
        break label1607;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("eqqAccountFlag", Long.TYPE));
      label1097:
      i = paramCursor.getColumnIndex("isShieldMsg");
      if (i != -1) {
        break label1622;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("isShieldMsg", Boolean.TYPE));
      i = paramCursor.getColumnIndex("messageSettingFlag");
      if (i != -1) {
        break label1650;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("messageSettingFlag", Integer.TYPE));
      label1167:
      i = paramCursor.getColumnIndex("extendType");
      if (i != -1) {
        break label1665;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("extendType", Integer.TYPE));
      label1202:
      i = paramCursor.getColumnIndex("mComparePartInt");
      if (i != -1) {
        break label1680;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("mComparePartInt", Integer.TYPE));
      label1237:
      i = paramCursor.getColumnIndex("mCompareSpell");
      if (i != -1) {
        break label1695;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("mCompareSpell", String.class));
    }
    for (;;)
    {
      i = paramCursor.getColumnIndex("logo");
      if (i != -1) {
        break label1710;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("logo", String.class));
      return paramEntity;
      uin = paramCursor.getLong(i);
      break;
      label1322:
      name = paramCursor.getString(i);
      break label574;
      label1337:
      displayNumber = paramCursor.getString(i);
      break label608;
      label1352:
      summary = paramCursor.getString(i);
      break label642;
      label1367:
      if (1 == paramCursor.getShort(i)) {}
      for (paramBoolean = true;; paramBoolean = false)
      {
        isRecvMsg = paramBoolean;
        break;
      }
      label1394:
      if (1 == paramCursor.getShort(i)) {}
      for (paramBoolean = true;; paramBoolean = false)
      {
        isRecvPush = paramBoolean;
        break;
      }
      label1421:
      clickCount = paramCursor.getInt(i);
      break label747;
      label1436:
      certifiedGrade = paramCursor.getLong(i);
      break label782;
      label1451:
      if (1 == paramCursor.getShort(i)) {}
      for (paramBoolean = true;; paramBoolean = false)
      {
        isSyncLbs = paramBoolean;
        break;
      }
      label1478:
      showFlag = paramCursor.getInt(i);
      break label852;
      label1493:
      mShowMsgFlag = paramCursor.getInt(i);
      break label887;
      label1508:
      if (1 == paramCursor.getShort(i)) {}
      for (paramBoolean = true;; paramBoolean = false)
      {
        mIsAgreeSyncLbs = paramBoolean;
        break;
      }
      label1535:
      if (1 == paramCursor.getShort(i)) {}
      for (paramBoolean = true;; paramBoolean = false)
      {
        mIsSyncLbsSelected = paramBoolean;
        break;
      }
      label1562:
      dateTime = paramCursor.getLong(i);
      break label992;
      label1577:
      accountFlag = paramCursor.getInt(i);
      break label1027;
      label1592:
      accountFlag2 = paramCursor.getLong(i);
      break label1062;
      label1607:
      eqqAccountFlag = paramCursor.getLong(i);
      break label1097;
      label1622:
      if (1 == paramCursor.getShort(i)) {}
      for (paramBoolean = bool2;; paramBoolean = false)
      {
        isShieldMsg = paramBoolean;
        break;
      }
      label1650:
      messageSettingFlag = paramCursor.getInt(i);
      break label1167;
      label1665:
      extendType = paramCursor.getInt(i);
      break label1202;
      label1680:
      mComparePartInt = paramCursor.getInt(i);
      break label1237;
      label1695:
      mCompareSpell = paramCursor.getString(i);
    }
    label1710:
    logo = paramCursor.getString(i);
    return paramEntity;
  }
  
  public String a(String paramString)
  {
    StringBuilder localStringBuilder = new StringBuilder("CREATE TABLE IF NOT EXISTS ");
    localStringBuilder.append(paramString);
    localStringBuilder.append(" (_id INTEGER PRIMARY KEY AUTOINCREMENT ,uin INTEGER UNIQUE ,name TEXT ,displayNumber TEXT ,summary TEXT ,isRecvMsg INTEGER ,isRecvPush INTEGER ,clickCount INTEGER ,certifiedGrade INTEGER ,isSyncLbs INTEGER ,showFlag INTEGER ,mShowMsgFlag INTEGER ,mIsAgreeSyncLbs INTEGER ,mIsSyncLbsSelected INTEGER ,dateTime INTEGER ,accountFlag INTEGER ,accountFlag2 INTEGER ,eqqAccountFlag INTEGER ,isShieldMsg INTEGER ,messageSettingFlag INTEGER ,extendType INTEGER ,mComparePartInt INTEGER ,mCompareSpell TEXT ,logo TEXT)");
    return localStringBuilder.toString();
  }
  
  public void a(Entity paramEntity, ContentValues paramContentValues)
  {
    paramEntity = (PublicAccountInfo)paramEntity;
    paramContentValues.put("uin", Long.valueOf(uin));
    paramContentValues.put("name", name);
    paramContentValues.put("displayNumber", displayNumber);
    paramContentValues.put("summary", summary);
    paramContentValues.put("isRecvMsg", Boolean.valueOf(isRecvMsg));
    paramContentValues.put("isRecvPush", Boolean.valueOf(isRecvPush));
    paramContentValues.put("clickCount", Integer.valueOf(clickCount));
    paramContentValues.put("certifiedGrade", Long.valueOf(certifiedGrade));
    paramContentValues.put("isSyncLbs", Boolean.valueOf(isSyncLbs));
    paramContentValues.put("showFlag", Integer.valueOf(showFlag));
    paramContentValues.put("mShowMsgFlag", Integer.valueOf(mShowMsgFlag));
    paramContentValues.put("mIsAgreeSyncLbs", Boolean.valueOf(mIsAgreeSyncLbs));
    paramContentValues.put("mIsSyncLbsSelected", Boolean.valueOf(mIsSyncLbsSelected));
    paramContentValues.put("dateTime", Long.valueOf(dateTime));
    paramContentValues.put("accountFlag", Integer.valueOf(accountFlag));
    paramContentValues.put("accountFlag2", Long.valueOf(accountFlag2));
    paramContentValues.put("eqqAccountFlag", Long.valueOf(eqqAccountFlag));
    paramContentValues.put("isShieldMsg", Boolean.valueOf(isShieldMsg));
    paramContentValues.put("messageSettingFlag", Integer.valueOf(messageSettingFlag));
    paramContentValues.put("extendType", Integer.valueOf(extendType));
    paramContentValues.put("mComparePartInt", Integer.valueOf(mComparePartInt));
    paramContentValues.put("mCompareSpell", mCompareSpell);
    paramContentValues.put("logo", logo);
  }
}
