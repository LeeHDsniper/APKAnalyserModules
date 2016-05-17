package com.tencent.mobileqq.persistence;

import android.content.ContentValues;
import android.database.Cursor;
import com.tencent.mobileqq.data.ContactCard;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class ContactCardDao
  extends OGAbstractDao
{
  private OGEntityInfo a;
  
  public ContactCardDao()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = 11;
  }
  
  public Entity a(Entity paramEntity, Cursor paramCursor, boolean paramBoolean, NoColumnErrorHandler paramNoColumnErrorHandler)
  {
    paramEntity = (ContactCard)paramEntity;
    if (paramNoColumnErrorHandler == null)
    {
      mobileNo = paramCursor.getString(paramCursor.getColumnIndex("mobileNo"));
      nationCode = paramCursor.getString(paramCursor.getColumnIndex("nationCode"));
      mobileCode = paramCursor.getString(paramCursor.getColumnIndex("mobileCode"));
      strContactName = paramCursor.getString(paramCursor.getColumnIndex("strContactName"));
      nickName = paramCursor.getString(paramCursor.getColumnIndex("nickName"));
      uin = paramCursor.getString(paramCursor.getColumnIndex("uin"));
      bSex = ((byte)paramCursor.getShort(paramCursor.getColumnIndex("bSex")));
      bAge = ((byte)paramCursor.getShort(paramCursor.getColumnIndex("bAge")));
      strProvince = paramCursor.getString(paramCursor.getColumnIndex("strProvince"));
      strCity = paramCursor.getString(paramCursor.getColumnIndex("strCity"));
      strCountry = paramCursor.getString(paramCursor.getColumnIndex("strCountry"));
      return paramEntity;
    }
    int i = paramCursor.getColumnIndex("mobileNo");
    if (i == -1)
    {
      paramNoColumnErrorHandler.a(new NoColumnError("mobileNo", String.class));
      i = paramCursor.getColumnIndex("nationCode");
      if (i != -1) {
        break label605;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("nationCode", String.class));
      label280:
      i = paramCursor.getColumnIndex("mobileCode");
      if (i != -1) {
        break label620;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("mobileCode", String.class));
      label314:
      i = paramCursor.getColumnIndex("strContactName");
      if (i != -1) {
        break label635;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strContactName", String.class));
      label348:
      i = paramCursor.getColumnIndex("nickName");
      if (i != -1) {
        break label650;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("nickName", String.class));
      label382:
      i = paramCursor.getColumnIndex("uin");
      if (i != -1) {
        break label665;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("uin", String.class));
      label416:
      i = paramCursor.getColumnIndex("bSex");
      if (i != -1) {
        break label680;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("bSex", Byte.TYPE));
      label451:
      i = paramCursor.getColumnIndex("bAge");
      if (i != -1) {
        break label696;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("bAge", Byte.TYPE));
      label486:
      i = paramCursor.getColumnIndex("strProvince");
      if (i != -1) {
        break label712;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strProvince", String.class));
      label520:
      i = paramCursor.getColumnIndex("strCity");
      if (i != -1) {
        break label727;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strCity", String.class));
    }
    for (;;)
    {
      i = paramCursor.getColumnIndex("strCountry");
      if (i != -1) {
        break label742;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("strCountry", String.class));
      return paramEntity;
      mobileNo = paramCursor.getString(i);
      break;
      label605:
      nationCode = paramCursor.getString(i);
      break label280;
      label620:
      mobileCode = paramCursor.getString(i);
      break label314;
      label635:
      strContactName = paramCursor.getString(i);
      break label348;
      label650:
      nickName = paramCursor.getString(i);
      break label382;
      label665:
      uin = paramCursor.getString(i);
      break label416;
      label680:
      bSex = ((byte)paramCursor.getShort(i));
      break label451;
      label696:
      bAge = ((byte)paramCursor.getShort(i));
      break label486;
      label712:
      strProvince = paramCursor.getString(i);
      break label520;
      label727:
      strCity = paramCursor.getString(i);
    }
    label742:
    strCountry = paramCursor.getString(i);
    return paramEntity;
  }
  
  public String a(String paramString)
  {
    StringBuilder localStringBuilder = new StringBuilder("CREATE TABLE IF NOT EXISTS ");
    localStringBuilder.append(paramString);
    localStringBuilder.append(" (_id INTEGER PRIMARY KEY AUTOINCREMENT ,mobileNo TEXT UNIQUE ,nationCode TEXT ,mobileCode TEXT ,strContactName TEXT ,nickName TEXT ,uin TEXT ,bSex INTEGER ,bAge INTEGER ,strProvince TEXT ,strCity TEXT ,strCountry TEXT)");
    return localStringBuilder.toString();
  }
  
  public void a(Entity paramEntity, ContentValues paramContentValues)
  {
    paramEntity = (ContactCard)paramEntity;
    paramContentValues.put("mobileNo", mobileNo);
    paramContentValues.put("nationCode", nationCode);
    paramContentValues.put("mobileCode", mobileCode);
    paramContentValues.put("strContactName", strContactName);
    paramContentValues.put("nickName", nickName);
    paramContentValues.put("uin", uin);
    paramContentValues.put("bSex", Byte.valueOf(bSex));
    paramContentValues.put("bAge", Byte.valueOf(bAge));
    paramContentValues.put("strProvince", strProvince);
    paramContentValues.put("strCity", strCity);
    paramContentValues.put("strCountry", strCountry);
  }
}
