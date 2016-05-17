package com.tencent.mobileqq.filemanager.core;

import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.filemanager.app.FileTransferHandler;
import com.tencent.mobileqq.filemanager.app.FileTransferObserver;
import com.tencent.mobileqq.filemanager.data.FileManagerEntity;
import com.tencent.mobileqq.filemanager.settings.FMSettings;
import com.tencent.mobileqq.filemanager.util.FileManagerUtil;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.FileUtils;
import com.tencent.mobileqq.utils.httputils.HttpMsg;
import com.tencent.qphone.base.util.QLog;
import ory;

public class DiscPicThumbDownloader
  extends BaseThumbDownloader
{
  private static final String jdField_a_of_type_JavaLangString = "OfflineVideoThumbDownLoader<FileAssistant>";
  private FileTransferObserver jdField_a_of_type_ComTencentMobileqqFilemanagerAppFileTransferObserver;
  
  public DiscPicThumbDownloader(QQAppInterface paramQQAppInterface)
  {
    super(paramQQAppInterface);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_ComTencentMobileqqFilemanagerAppFileTransferObserver = new ory(this);
  }
  
  private DiscPicThumbDownloader.PicSession a(long paramLong, boolean paramBoolean)
  {
    BaseThumbDownloader.Session localSession = a(paramLong);
    if (localSession == null) {
      return null;
    }
    if ((localSession instanceof DiscPicThumbDownloader.PicSession)) {
      return (DiscPicThumbDownloader.PicSession)localSession;
    }
    QLog.e("OfflineVideoThumbDownLoader<FileAssistant>", 1, "[downloadThumb] getSession  ID[" + paramLong + "] no instance");
    return null;
  }
  
  private String b(int paramInt, String paramString)
  {
    String str;
    switch (paramInt)
    {
    default: 
      str = "x-dsc-";
    }
    for (;;)
    {
      return str + paramString;
      str = "micro-dsc-";
      continue;
      str = "minni-dsc-";
      continue;
      str = "small-dsc-";
      continue;
      str = "middle-dsc-";
      continue;
      str = "large-dsc-";
      continue;
      str = "xlarge-dsc-";
      continue;
      str = "screen-dsc-";
    }
  }
  
  public String a(FileManagerEntity paramFileManagerEntity, int paramInt)
  {
    QLog.i("OfflineVideoThumbDownLoader<FileAssistant>", 1, "[downloadThumb] download  nSession[" + nSessionId + "]");
    if (Uuid == null)
    {
      QLog.e("OfflineVideoThumbDownLoader<FileAssistant>", 1, "[downloadThumb]  download. uuid = null nSession[" + nSessionId + "]");
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(false, 50, new Object[] { paramFileManagerEntity });
      return null;
    }
    String str = Uuid.replace("/", "");
    a();
    str = FMSettings.a().d() + b(paramInt, str);
    if (FileUtils.b(str) == true)
    {
      strThumbPath = str;
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().c(paramFileManagerEntity);
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(true, 50, new Object[] { paramFileManagerEntity });
      QLog.i("OfflineVideoThumbDownLoader<FileAssistant>", 2, "download discFile Thumb existed,nSession[" + String.valueOf(nSessionId) + "],discUin[" + String.valueOf(peerUin) + "],path[" + str + "]");
      FileManagerUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, nSessionId, "actFileDiscThumb", 0L, "", peerUin, Uuid, strFileMd5, 0L, 0L, 0L, 0, null);
      return str;
    }
    paramFileManagerEntity = new DiscPicThumbDownloader.PicSession(paramFileManagerEntity);
    jdField_a_of_type_Int = paramInt;
    a(paramFileManagerEntity, str);
    return null;
  }
  
  public void a(long paramLong, ThumbHttpDownloader.DownloadTask paramDownloadTask)
  {
    Object localObject = a(paramLong, false);
    if (localObject == null)
    {
      QLog.e("OfflineVideoThumbDownLoader<FileAssistant>", 2, "[downloadThumb]  ID[" + paramLong + "] onDownloadCompleted no this session");
      return;
    }
    int i;
    String str1;
    label76:
    QQAppInterface localQQAppInterface;
    long l1;
    String str2;
    String str3;
    String str4;
    String str5;
    long l2;
    long l3;
    long l4;
    long l5;
    String str6;
    if (jdField_b_of_type_ComTencentMobileqqUtilsHttputilsHttpMsg != null)
    {
      i = jdField_b_of_type_ComTencentMobileqqUtilsHttputilsHttpMsg.h;
      if (jdField_b_of_type_ComTencentMobileqqUtilsHttputilsHttpMsg == null) {
        break label224;
      }
      str1 = jdField_b_of_type_ComTencentMobileqqUtilsHttputilsHttpMsg.d();
      localQQAppInterface = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
      paramLong = jdField_c_of_type_Long;
      l1 = b;
      str2 = jdField_a_of_type_JavaLangString;
      str3 = jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.peerUin;
      str4 = jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.Uuid;
      str5 = jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.strFileMd5;
      l2 = i;
      l3 = e;
      l4 = jdField_c_of_type_Long;
      l5 = jdField_a_of_type_Int;
      str6 = jdField_a_of_type_JavaLangString;
      if (jdField_b_of_type_ComTencentMobileqqUtilsHttputilsHttpMsg == null) {
        break label231;
      }
    }
    label224:
    label231:
    for (localObject = jdField_b_of_type_ComTencentMobileqqUtilsHttputilsHttpMsg.am;; localObject = "respose null")
    {
      FileManagerUtil.a(localQQAppInterface, paramLong, "actFileDiscThumbDetail", l1, str2, str3, str4, str5, l2, str1, l3, l4, l5, str6, (String)localObject, jdField_c_of_type_Int, str1, "");
      return;
      i = 0;
      break;
      str1 = "start retry";
      break label76;
    }
  }
  
  public void a(long paramLong, HttpMsg paramHttpMsg)
  {
    DiscPicThumbDownloader.PicSession localPicSession = a(paramLong, false);
    if (localPicSession == null)
    {
      QLog.e("OfflineVideoThumbDownLoader<FileAssistant>", 2, "[downloadThumb]  ID[" + paramLong + "] onSetHttpMsg no this session");
      return;
    }
    e = 3000;
    paramHttpMsg.a("Cookie", "FTN5K=" + jdField_a_of_type_JavaLangString);
  }
  
  public void a(long paramLong, boolean paramBoolean, int paramInt, String paramString, ThumbHttpDownloader.DownloadTask paramDownloadTask)
  {
    DiscPicThumbDownloader.PicSession localPicSession = a(paramLong, false);
    if (localPicSession == null)
    {
      QLog.e("OfflineVideoThumbDownLoader<FileAssistant>", 2, "[downloadThumb]  ID[" + paramLong + "] onDownloadCompleted no this session");
      return;
    }
    if (paramBoolean)
    {
      FileManagerUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_c_of_type_Long, "actFileDiscThumb", System.currentTimeMillis() - b, jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.peerUin, jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.Uuid, jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.strFileMd5, e, jdField_c_of_type_Long, jdField_a_of_type_Int, jdField_b_of_type_Int, null);
      jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.strThumbPath = paramString;
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().c(jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity);
    }
    for (;;)
    {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramBoolean, 50, new Object[] { jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity });
      super.a(paramLong, paramBoolean, paramInt, paramString, paramDownloadTask);
      return;
      switch (paramInt)
      {
      }
    }
    Object localObject1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
    long l1 = jdField_c_of_type_Long;
    long l2 = b;
    Object localObject2 = jdField_a_of_type_JavaLangString;
    String str2 = jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.peerUin;
    String str3 = jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.Uuid;
    String str4 = jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.strFileMd5;
    long l3 = e;
    long l4 = jdField_c_of_type_Long;
    long l5 = jdField_a_of_type_Int;
    String str5 = jdField_a_of_type_JavaLangString;
    if (jdField_b_of_type_ComTencentMobileqqUtilsHttputilsHttpMsg != null)
    {
      str1 = jdField_b_of_type_ComTencentMobileqqUtilsHttputilsHttpMsg.am;
      label339:
      FileManagerUtil.a((QQAppInterface)localObject1, l1, "actFileDiscThumb", l2, (String)localObject2, str2, str3, str4, 9003L, "rename error", l3, l4, l5, str5, str1, jdField_b_of_type_Int, "rename error", "");
      localObject1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
      l1 = jdField_c_of_type_Long;
      l2 = b;
      localObject2 = jdField_a_of_type_JavaLangString;
      str2 = jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.peerUin;
      str3 = jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.Uuid;
      str4 = jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.strFileMd5;
      l3 = e;
      l4 = jdField_c_of_type_Long;
      l5 = jdField_a_of_type_Int;
      str5 = jdField_a_of_type_JavaLangString;
      if (jdField_b_of_type_ComTencentMobileqqUtilsHttputilsHttpMsg == null) {
        break label1825;
      }
    }
    label640:
    label844:
    label1012:
    label1030:
    label1139:
    label1341:
    label1349:
    label1356:
    label1616:
    label1811:
    label1825:
    for (String str1 = jdField_b_of_type_ComTencentMobileqqUtilsHttputilsHttpMsg.am;; str1 = "respose null")
    {
      FileManagerUtil.a((QQAppInterface)localObject1, l1, "actFileDiscThumbDetail", l2, (String)localObject2, str2, str3, str4, 9003L, "rename error", l3, l4, l5, str5, str1, jdField_c_of_type_Int, "rename error", "");
      break;
      localObject1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
      l1 = jdField_c_of_type_Long;
      l2 = b;
      localObject2 = jdField_a_of_type_JavaLangString;
      str2 = jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.peerUin;
      str3 = jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.Uuid;
      str4 = jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.strFileMd5;
      l3 = e;
      l4 = jdField_c_of_type_Long;
      l5 = jdField_a_of_type_Int;
      str5 = jdField_a_of_type_JavaLangString;
      if (jdField_b_of_type_ComTencentMobileqqUtilsHttputilsHttpMsg != null)
      {
        str1 = jdField_b_of_type_ComTencentMobileqqUtilsHttputilsHttpMsg.am;
        FileManagerUtil.a((QQAppInterface)localObject1, l1, "actFileDiscThumb", l2, (String)localObject2, str2, str3, str4, 9004L, "no network", l3, l4, l5, str5, str1, jdField_b_of_type_Int, "no network", "");
        localObject1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
        l1 = jdField_c_of_type_Long;
        l2 = b;
        localObject2 = jdField_a_of_type_JavaLangString;
        str2 = jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.peerUin;
        str3 = jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.Uuid;
        str4 = jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.strFileMd5;
        l3 = e;
        l4 = jdField_c_of_type_Long;
        l5 = jdField_a_of_type_Int;
        str5 = jdField_a_of_type_JavaLangString;
        if (jdField_b_of_type_ComTencentMobileqqUtilsHttputilsHttpMsg == null) {
          break label844;
        }
      }
      for (str1 = jdField_b_of_type_ComTencentMobileqqUtilsHttputilsHttpMsg.am;; str1 = "respose null")
      {
        FileManagerUtil.a((QQAppInterface)localObject1, l1, "actFileDiscThumbDetail", l2, (String)localObject2, str2, str3, str4, 9004L, "no network", l3, l4, l5, str5, str1, jdField_c_of_type_Int, "no network", "");
        break;
        str1 = "respose null";
        break label640;
      }
      FileManagerUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_c_of_type_Long, "actFileDiscThumb", b, jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.peerUin, jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.Uuid, jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.strFileMd5, 9003L, "FileNotFoundException", 0L, 0L, 0L, jdField_a_of_type_JavaLangString, "", 0, "FileNotFoundException", "");
      FileManagerUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_c_of_type_Long, "actFileDiscThumbDetail", b, jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.peerUin, jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.Uuid, jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.strFileMd5, 9003L, "FileNotFoundException", 0L, 0L, 0L, jdField_a_of_type_JavaLangString, "", 0, "size error", "");
      break;
      int i;
      long l6;
      String str6;
      if (jdField_b_of_type_ComTencentMobileqqUtilsHttputilsHttpMsg != null)
      {
        i = jdField_b_of_type_ComTencentMobileqqUtilsHttputilsHttpMsg.h;
        if (jdField_b_of_type_ComTencentMobileqqUtilsHttputilsHttpMsg == null) {
          break label1341;
        }
        str1 = jdField_b_of_type_ComTencentMobileqqUtilsHttputilsHttpMsg.d();
        localObject2 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
        l1 = jdField_c_of_type_Long;
        l2 = b;
        str2 = jdField_a_of_type_JavaLangString;
        str3 = jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.peerUin;
        str4 = jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.Uuid;
        str5 = jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.strFileMd5;
        l3 = i;
        l4 = e;
        l5 = jdField_c_of_type_Long;
        l6 = jdField_a_of_type_Int;
        str6 = jdField_a_of_type_JavaLangString;
        if (jdField_b_of_type_ComTencentMobileqqUtilsHttputilsHttpMsg == null) {
          break label1349;
        }
        localObject1 = jdField_b_of_type_ComTencentMobileqqUtilsHttputilsHttpMsg.am;
        FileManagerUtil.a((QQAppInterface)localObject2, l1, "actFileDiscThumb", l2, str2, str3, str4, str5, l3, str1, l4, l5, l6, str6, (String)localObject1, jdField_b_of_type_Int, str1, "");
        localObject2 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
        l1 = jdField_c_of_type_Long;
        l2 = b;
        str2 = jdField_a_of_type_JavaLangString;
        str3 = jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.peerUin;
        str4 = jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.Uuid;
        str5 = jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.strFileMd5;
        l3 = i;
        l4 = e;
        l5 = jdField_c_of_type_Long;
        l6 = jdField_a_of_type_Int;
        str6 = jdField_a_of_type_JavaLangString;
        if (jdField_b_of_type_ComTencentMobileqqUtilsHttputilsHttpMsg == null) {
          break label1356;
        }
      }
      for (localObject1 = jdField_b_of_type_ComTencentMobileqqUtilsHttputilsHttpMsg.am;; localObject1 = "respose null")
      {
        FileManagerUtil.a((QQAppInterface)localObject2, l1, "actFileDiscThumbDetail", l2, str2, str3, str4, str5, l3, str1, l4, l5, l6, str6, (String)localObject1, jdField_c_of_type_Int, str1, "");
        break;
        i = 0;
        break label1012;
        str1 = "http resp err";
        break label1030;
        localObject1 = "respose null";
        break label1139;
      }
      FileManagerUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_c_of_type_Long, "actFileDiscThumb", b, jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.peerUin, jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.Uuid, jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.strFileMd5, 9005L, "noRs", 0L, 0L, 0L, jdField_a_of_type_JavaLangString, "", 0, "noRs", "");
      FileManagerUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_c_of_type_Long, "actFileDiscThumbDetail", b, jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.peerUin, jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.Uuid, jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.strFileMd5, 9005L, "noRs", e, jdField_c_of_type_Long, jdField_a_of_type_Int, jdField_a_of_type_JavaLangString, "", 0, "noRs", "");
      break;
      localObject1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
      l1 = jdField_c_of_type_Long;
      l2 = b;
      localObject2 = jdField_a_of_type_JavaLangString;
      str2 = jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.peerUin;
      str3 = jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.Uuid;
      str4 = jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.strFileMd5;
      l3 = jdField_c_of_type_Long;
      l4 = jdField_a_of_type_Int;
      str5 = jdField_a_of_type_JavaLangString;
      if (jdField_b_of_type_ComTencentMobileqqUtilsHttputilsHttpMsg != null)
      {
        str1 = jdField_b_of_type_ComTencentMobileqqUtilsHttputilsHttpMsg.am;
        FileManagerUtil.a((QQAppInterface)localObject1, l1, "actFileDiscThumb", l2, (String)localObject2, str2, str3, str4, 9003L, "revStream write Exception", 0L, l3, l4, str5, str1, jdField_b_of_type_Int, "revStream write Exception", "");
        localObject1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
        l1 = jdField_c_of_type_Long;
        l2 = b;
        localObject2 = jdField_a_of_type_JavaLangString;
        str2 = jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.peerUin;
        str3 = jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.Uuid;
        str4 = jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.strFileMd5;
        l3 = jdField_c_of_type_Long;
        l4 = jdField_a_of_type_Int;
        str5 = jdField_a_of_type_JavaLangString;
        if (jdField_b_of_type_ComTencentMobileqqUtilsHttputilsHttpMsg == null) {
          break label1811;
        }
      }
      for (str1 = jdField_b_of_type_ComTencentMobileqqUtilsHttputilsHttpMsg.am;; str1 = "respose null")
      {
        FileManagerUtil.a((QQAppInterface)localObject1, l1, "actFileDiscThumbDetail", l2, (String)localObject2, str2, str3, str4, 9003L, "revStream write Exception", 0L, l3, l4, str5, str1, jdField_c_of_type_Int, "revStream write Exception", "");
        break;
        str1 = "respose null";
        break label1616;
      }
      str1 = "respose null";
      break label339;
    }
  }
  
  public boolean a(long paramLong, ThumbHttpDownloader.DownloadTask paramDownloadTask)
  {
    paramDownloadTask = a(paramLong, false);
    if (paramDownloadTask == null)
    {
      QLog.e("OfflineVideoThumbDownLoader<FileAssistant>", 2, "[downloadThumb]  ID[" + paramLong + "] onGetDownloadUrl no this session");
      return false;
    }
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramLong, jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.fileName, Long.parseLong(jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.peerUin), jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.Uuid, jdField_a_of_type_ComTencentMobileqqFilemanagerAppFileTransferObserver);
    return true;
  }
  
  public void b(long paramLong, ThumbHttpDownloader.DownloadTask paramDownloadTask) {}
}
