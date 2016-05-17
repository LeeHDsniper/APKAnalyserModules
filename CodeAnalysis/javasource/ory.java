import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.filemanager.app.FileTransferObserver;
import com.tencent.mobileqq.filemanager.core.DiscPicThumbDownloader;
import com.tencent.mobileqq.filemanager.core.DiscPicThumbDownloader.PicSession;
import com.tencent.mobileqq.filemanager.core.FileManagerNotifyCenter;
import com.tencent.mobileqq.filemanager.data.FileManagerEntity;
import com.tencent.mobileqq.filemanager.util.FileManagerUtil;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class ory
  extends FileTransferObserver
{
  public ory(DiscPicThumbDownloader paramDiscPicThumbDownloader)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(boolean paramBoolean, long paramLong1, String paramString1, String paramString2, String paramString3, int paramInt1, String paramString4, String paramString5, int paramInt2, long paramLong2)
  {
    QLog.i("OfflineVideoThumbDownLoader<FileAssistant>", 2, "[downloadThumb]  ID[" + paramLong2 + "] OnDiscDownloadInfo");
    paramString2 = DiscPicThumbDownloader.a(a, paramLong2, false);
    if (paramString2 == null)
    {
      QLog.e("OfflineVideoThumbDownLoader<FileAssistant>", 2, "OnDiscDownloadInfo, mapDowload is not existed taskid[" + String.valueOf(paramLong2) + "]");
      FileManagerUtil.a(a.a, 0L, "actFileDiscThumb", 0L, "", "", "", "", 9005L, "get info null", 0L, 0L, 0L, "", "", 0, "get info null", "");
      FileManagerUtil.a(a.a, 0L, "actFileDiscThumbDetail", 0L, "", "", "", "", 9005L, "get info null", 0L, 0L, 0L, "", "", 0, "get info null", "");
      a.a(paramLong2, false, null, 0, null, null);
      return;
    }
    long l;
    if (!paramBoolean)
    {
      QLog.e("OfflineVideoThumbDownLoader<FileAssistant>", 1, "[downloadThumb]  ID[" + paramLong2 + "] OnDiscDownloadInfo isSuccess[false],retCode[" + String.valueOf(paramLong1) + "],retMsg[" + String.valueOf(paramString1) + "]");
      if (paramLong1 == -100001L) {}
      for (l = 9043L;; l = 9045L)
      {
        FileManagerUtil.a(a.a, c, "actFileDiscThumb", b, "", jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.peerUin, jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.Uuid, jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.strFileMd5, l, String.valueOf(paramInt2) + "&" + String.valueOf(paramLong1), 0L, 0L, 0L, "", "", 0, "ret error", null);
        FileManagerUtil.a(a.a, c, "actFileDiscThumbDetail", b, "", jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.peerUin, jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.Uuid, jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.strFileMd5, l, String.valueOf(paramInt2) + "&" + String.valueOf(paramLong1), 0L, 0L, 0L, "", "", 0, "ret error", null);
        a.a.a().a(false, 50, new Object[] { jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity });
        a.a(paramLong2);
        a.a(paramLong2, false, null, 0, null, null);
        return;
      }
    }
    if ((paramString3 == null) || (paramString3.length() == 0))
    {
      QLog.i("OfflineVideoThumbDownLoader<FileAssistant>", 1, "[downloadThumb]  ID[" + paramLong2 + "]  get DiscdownLoad info Url is null ");
      a.a.a().a(false, 50, new Object[] { jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity });
      if (paramLong1 == 0L) {}
      for (l = 9048L;; l = paramLong1)
      {
        FileManagerUtil.a(a.a, c, "actFileDiscThumb", b, "", jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.peerUin, jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.Uuid, jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.strFileMd5, l, String.valueOf(paramInt2) + "&" + String.valueOf(paramLong1), 0L, 0L, 0L, "", "", 0, "ret error", null);
        FileManagerUtil.a(a.a, c, "actFileDiscThumbDetail", b, "", jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.peerUin, jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.Uuid, jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.strFileMd5, l, String.valueOf(paramInt2) + "&" + String.valueOf(paramLong1), 0L, 0L, 0L, "", "", 0, "ret error", null);
        a.a(paramLong2);
        a.a(paramLong2, false, null, 0, null, null);
        return;
      }
    }
    jdField_a_of_type_JavaLangString = paramString5;
    switch (jdField_a_of_type_Int)
    {
    default: 
      paramString1 = "http://" + paramString3 + ":" + String.valueOf(paramInt1) + "/ftn_handler/" + paramString4;
      QLog.e("OfflineVideoThumbDownLoader<FileAssistant>", 2, "[downloadThumb]  ID[" + paramLong2 + "] unknow thumbSize!!!info:" + paramString2.toString());
      a.a.a().a(false, 50, new Object[] { jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity });
      FileManagerUtil.a(a.a, c, "actFileDiscThumb", b, paramString1, jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.peerUin, jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.Uuid, jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.strFileMd5, 9005L, "size error", 0L, 0L, 0L, paramString1, "", 0, "size error", "");
      FileManagerUtil.a(a.a, c, "actFileDiscThumbDetail", b, paramString1, jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.peerUin, jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.Uuid, jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.strFileMd5, 9005L, "size error", 0L, 0L, 0L, paramString1, "", 0, "size error", "");
      a.a(paramLong2);
      a.a(paramLong2, false, paramString3, paramInt1, "/ftn_handler/" + paramString4, null);
      return;
    case 0: 
      paramString1 = "?pictype=scaled&size=16*16";
    }
    for (;;)
    {
      paramString1 = "/ftn_handler/" + paramString4 + paramString1;
      a.a(paramLong2, true, paramString3, paramInt1, paramString1, null);
      return;
      paramString1 = "?pictype=scaled&size=32*32";
      continue;
      paramString1 = "?pictype=scaled&size=64*64";
      continue;
      paramString1 = "?pictype=scaled&size=128*128";
      continue;
      paramString1 = "?pictype=scaled&size=320*320";
      continue;
      paramString1 = "?pictype=scaled&size=640*640";
      continue;
      paramString1 = "?pictype=scaled&size=1024*1024";
    }
  }
}
