package com.tencent.mobileqq.persistence;

import android.content.ContentValues;
import android.database.Cursor;
import com.tencent.mobileqq.data.EmoticonPackage;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class EmoticonPackageDao
  extends OGAbstractDao
{
  private OGEntityInfo a;
  
  public EmoticonPackageDao()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = 27;
  }
  
  public Entity a(Entity paramEntity, Cursor paramCursor, boolean paramBoolean, NoColumnErrorHandler paramNoColumnErrorHandler)
  {
    boolean bool2 = true;
    boolean bool1 = true;
    paramEntity = (EmoticonPackage)paramEntity;
    if (paramNoColumnErrorHandler == null)
    {
      epId = paramCursor.getString(paramCursor.getColumnIndex("epId"));
      wordingId = paramCursor.getLong(paramCursor.getColumnIndex("wordingId"));
      childEpId = paramCursor.getString(paramCursor.getColumnIndex("childEpId"));
      minQQVersion = paramCursor.getString(paramCursor.getColumnIndex("minQQVersion"));
      name = paramCursor.getString(paramCursor.getColumnIndex("name"));
      mark = paramCursor.getString(paramCursor.getColumnIndex("mark"));
      type = paramCursor.getInt(paramCursor.getColumnIndex("type"));
      author = paramCursor.getString(paramCursor.getColumnIndex("author"));
      expiretime = paramCursor.getLong(paramCursor.getColumnIndex("expiretime"));
      status = paramCursor.getInt(paramCursor.getColumnIndex("status"));
      if (1 == paramCursor.getShort(paramCursor.getColumnIndex("hasSound")))
      {
        paramBoolean = true;
        hasSound = paramBoolean;
        jobType = paramCursor.getInt(paramCursor.getColumnIndex("jobType"));
        kinId = paramCursor.getString(paramCursor.getColumnIndex("kinId"));
        if (1 != paramCursor.getShort(paramCursor.getColumnIndex("valid"))) {
          break label545;
        }
        paramBoolean = true;
        label277:
        valid = paramBoolean;
        downloadCount = paramCursor.getInt(paramCursor.getColumnIndex("downloadCount"));
        mobileFeetype = paramCursor.getInt(paramCursor.getColumnIndex("mobileFeetype"));
        if (1 != paramCursor.getShort(paramCursor.getColumnIndex("isRecommendation"))) {
          break label550;
        }
        paramBoolean = true;
        label338:
        isRecommendation = paramBoolean;
        if (1 != paramCursor.getShort(paramCursor.getColumnIndex("isMagicFaceDownloading"))) {
          break label555;
        }
        paramBoolean = true;
        label363:
        isMagicFaceDownloading = paramBoolean;
        firstEmotionId = paramCursor.getString(paramCursor.getColumnIndex("firstEmotionId"));
        upperLeftLable = paramCursor.getInt(paramCursor.getColumnIndex("upperLeftLable"));
        localVersion = paramCursor.getInt(paramCursor.getColumnIndex("localVersion"));
        latestVersion = paramCursor.getInt(paramCursor.getColumnIndex("latestVersion"));
        jsonVersion = paramCursor.getInt(paramCursor.getColumnIndex("jsonVersion"));
        updateFlag = paramCursor.getInt(paramCursor.getColumnIndex("updateFlag"));
        updateTip = paramCursor.getString(paramCursor.getColumnIndex("updateTip"));
        if (1 != paramCursor.getShort(paramCursor.getColumnIndex("hasReadUpdatePage"))) {
          break label560;
        }
      }
      label545:
      label550:
      label555:
      label560:
      for (paramBoolean = bool1;; paramBoolean = false)
      {
        hasReadUpdatePage = paramBoolean;
        rscType = paramCursor.getInt(paramCursor.getColumnIndex("rscType"));
        return paramEntity;
        paramBoolean = false;
        break;
        paramBoolean = false;
        break label277;
        paramBoolean = false;
        break label338;
        paramBoolean = false;
        break label363;
      }
    }
    int i = paramCursor.getColumnIndex("epId");
    if (i == -1)
    {
      paramNoColumnErrorHandler.a(new NoColumnError("epId", String.class));
      i = paramCursor.getColumnIndex("wordingId");
      if (i != -1) {
        break label1518;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("wordingId", Long.TYPE));
      label634:
      i = paramCursor.getColumnIndex("childEpId");
      if (i != -1) {
        break label1533;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("childEpId", String.class));
      label668:
      i = paramCursor.getColumnIndex("minQQVersion");
      if (i != -1) {
        break label1548;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("minQQVersion", String.class));
      label702:
      i = paramCursor.getColumnIndex("name");
      if (i != -1) {
        break label1563;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("name", String.class));
      label736:
      i = paramCursor.getColumnIndex("mark");
      if (i != -1) {
        break label1578;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("mark", String.class));
      label770:
      i = paramCursor.getColumnIndex("type");
      if (i != -1) {
        break label1593;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("type", Integer.TYPE));
      label805:
      i = paramCursor.getColumnIndex("author");
      if (i != -1) {
        break label1608;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("author", String.class));
      label839:
      i = paramCursor.getColumnIndex("expiretime");
      if (i != -1) {
        break label1623;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("expiretime", Long.TYPE));
      label874:
      i = paramCursor.getColumnIndex("status");
      if (i != -1) {
        break label1638;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("status", Integer.TYPE));
      label909:
      i = paramCursor.getColumnIndex("hasSound");
      if (i != -1) {
        break label1653;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("hasSound", Boolean.TYPE));
      i = paramCursor.getColumnIndex("jobType");
      if (i != -1) {
        break label1680;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("jobType", Integer.TYPE));
      label979:
      i = paramCursor.getColumnIndex("kinId");
      if (i != -1) {
        break label1695;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("kinId", String.class));
      label1013:
      i = paramCursor.getColumnIndex("valid");
      if (i != -1) {
        break label1710;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("valid", Boolean.TYPE));
      i = paramCursor.getColumnIndex("downloadCount");
      if (i != -1) {
        break label1737;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("downloadCount", Integer.TYPE));
      label1083:
      i = paramCursor.getColumnIndex("mobileFeetype");
      if (i != -1) {
        break label1752;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("mobileFeetype", Integer.TYPE));
      label1118:
      i = paramCursor.getColumnIndex("isRecommendation");
      if (i != -1) {
        break label1767;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("isRecommendation", Boolean.TYPE));
      i = paramCursor.getColumnIndex("isMagicFaceDownloading");
      if (i != -1) {
        break label1794;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("isMagicFaceDownloading", Boolean.TYPE));
      i = paramCursor.getColumnIndex("firstEmotionId");
      if (i != -1) {
        break label1821;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("firstEmotionId", String.class));
      label1222:
      i = paramCursor.getColumnIndex("upperLeftLable");
      if (i != -1) {
        break label1836;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("upperLeftLable", Integer.TYPE));
      label1257:
      i = paramCursor.getColumnIndex("localVersion");
      if (i != -1) {
        break label1851;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("localVersion", Integer.TYPE));
      label1292:
      i = paramCursor.getColumnIndex("latestVersion");
      if (i != -1) {
        break label1866;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("latestVersion", Integer.TYPE));
      label1327:
      i = paramCursor.getColumnIndex("jsonVersion");
      if (i != -1) {
        break label1881;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("jsonVersion", Integer.TYPE));
      label1362:
      i = paramCursor.getColumnIndex("updateFlag");
      if (i != -1) {
        break label1896;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("updateFlag", Integer.TYPE));
      label1397:
      i = paramCursor.getColumnIndex("updateTip");
      if (i != -1) {
        break label1911;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("updateTip", String.class));
    }
    for (;;)
    {
      i = paramCursor.getColumnIndex("hasReadUpdatePage");
      if (i != -1) {
        break label1926;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("hasReadUpdatePage", Boolean.TYPE));
      i = paramCursor.getColumnIndex("rscType");
      if (i != -1) {
        break label1954;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("rscType", Integer.TYPE));
      return paramEntity;
      epId = paramCursor.getString(i);
      break;
      label1518:
      wordingId = paramCursor.getLong(i);
      break label634;
      label1533:
      childEpId = paramCursor.getString(i);
      break label668;
      label1548:
      minQQVersion = paramCursor.getString(i);
      break label702;
      label1563:
      name = paramCursor.getString(i);
      break label736;
      label1578:
      mark = paramCursor.getString(i);
      break label770;
      label1593:
      type = paramCursor.getInt(i);
      break label805;
      label1608:
      author = paramCursor.getString(i);
      break label839;
      label1623:
      expiretime = paramCursor.getLong(i);
      break label874;
      label1638:
      status = paramCursor.getInt(i);
      break label909;
      label1653:
      if (1 == paramCursor.getShort(i)) {}
      for (paramBoolean = true;; paramBoolean = false)
      {
        hasSound = paramBoolean;
        break;
      }
      label1680:
      jobType = paramCursor.getInt(i);
      break label979;
      label1695:
      kinId = paramCursor.getString(i);
      break label1013;
      label1710:
      if (1 == paramCursor.getShort(i)) {}
      for (paramBoolean = true;; paramBoolean = false)
      {
        valid = paramBoolean;
        break;
      }
      label1737:
      downloadCount = paramCursor.getInt(i);
      break label1083;
      label1752:
      mobileFeetype = paramCursor.getInt(i);
      break label1118;
      label1767:
      if (1 == paramCursor.getShort(i)) {}
      for (paramBoolean = true;; paramBoolean = false)
      {
        isRecommendation = paramBoolean;
        break;
      }
      label1794:
      if (1 == paramCursor.getShort(i)) {}
      for (paramBoolean = true;; paramBoolean = false)
      {
        isMagicFaceDownloading = paramBoolean;
        break;
      }
      label1821:
      firstEmotionId = paramCursor.getString(i);
      break label1222;
      label1836:
      upperLeftLable = paramCursor.getInt(i);
      break label1257;
      label1851:
      localVersion = paramCursor.getInt(i);
      break label1292;
      label1866:
      latestVersion = paramCursor.getInt(i);
      break label1327;
      label1881:
      jsonVersion = paramCursor.getInt(i);
      break label1362;
      label1896:
      updateFlag = paramCursor.getInt(i);
      break label1397;
      label1911:
      updateTip = paramCursor.getString(i);
    }
    label1926:
    if (1 == paramCursor.getShort(i)) {}
    for (paramBoolean = bool2;; paramBoolean = false)
    {
      hasReadUpdatePage = paramBoolean;
      break;
    }
    label1954:
    rscType = paramCursor.getInt(i);
    return paramEntity;
  }
  
  public String a(String paramString)
  {
    StringBuilder localStringBuilder = new StringBuilder("CREATE TABLE IF NOT EXISTS ");
    localStringBuilder.append(paramString);
    localStringBuilder.append(" (_id INTEGER PRIMARY KEY AUTOINCREMENT ,epId TEXT UNIQUE ,wordingId INTEGER ,childEpId TEXT ,minQQVersion TEXT ,name TEXT ,mark TEXT ,type INTEGER ,author TEXT ,expiretime INTEGER ,status INTEGER ,hasSound INTEGER ,jobType INTEGER ,kinId TEXT ,valid INTEGER ,downloadCount INTEGER ,mobileFeetype INTEGER ,isRecommendation INTEGER ,isMagicFaceDownloading INTEGER ,firstEmotionId TEXT ,upperLeftLable INTEGER ,localVersion INTEGER ,latestVersion INTEGER ,jsonVersion INTEGER default 0 ,updateFlag INTEGER ,updateTip TEXT ,hasReadUpdatePage INTEGER ,rscType INTEGER)");
    return localStringBuilder.toString();
  }
  
  public void a(Entity paramEntity, ContentValues paramContentValues)
  {
    paramEntity = (EmoticonPackage)paramEntity;
    paramContentValues.put("epId", epId);
    paramContentValues.put("wordingId", Long.valueOf(wordingId));
    paramContentValues.put("childEpId", childEpId);
    paramContentValues.put("minQQVersion", minQQVersion);
    paramContentValues.put("name", name);
    paramContentValues.put("mark", mark);
    paramContentValues.put("type", Integer.valueOf(type));
    paramContentValues.put("author", author);
    paramContentValues.put("expiretime", Long.valueOf(expiretime));
    paramContentValues.put("status", Integer.valueOf(status));
    paramContentValues.put("hasSound", Boolean.valueOf(hasSound));
    paramContentValues.put("jobType", Integer.valueOf(jobType));
    paramContentValues.put("kinId", kinId);
    paramContentValues.put("valid", Boolean.valueOf(valid));
    paramContentValues.put("downloadCount", Integer.valueOf(downloadCount));
    paramContentValues.put("mobileFeetype", Integer.valueOf(mobileFeetype));
    paramContentValues.put("isRecommendation", Boolean.valueOf(isRecommendation));
    paramContentValues.put("isMagicFaceDownloading", Boolean.valueOf(isMagicFaceDownloading));
    paramContentValues.put("firstEmotionId", firstEmotionId);
    paramContentValues.put("upperLeftLable", Integer.valueOf(upperLeftLable));
    paramContentValues.put("localVersion", Integer.valueOf(localVersion));
    paramContentValues.put("latestVersion", Integer.valueOf(latestVersion));
    paramContentValues.put("jsonVersion", Integer.valueOf(jsonVersion));
    paramContentValues.put("updateFlag", Integer.valueOf(updateFlag));
    paramContentValues.put("updateTip", updateTip);
    paramContentValues.put("hasReadUpdatePage", Boolean.valueOf(hasReadUpdatePage));
    paramContentValues.put("rscType", Integer.valueOf(rscType));
  }
}
