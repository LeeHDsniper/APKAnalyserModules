import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.filemanager.app.FMObserver;
import com.tencent.mobileqq.filemanager.core.FileManagerNotifyCenter;
import com.tencent.mobileqq.filemanager.core.OfflineVideoThumbDownLoader;
import com.tencent.mobileqq.filemanager.core.OfflineVideoThumbDownLoader.VideoSession;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class osz
  extends FMObserver
{
  public osz(OfflineVideoThumbDownLoader paramOfflineVideoThumbDownLoader)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(boolean paramBoolean, int paramInt1, String paramString1, String paramString2, String paramString3, String paramString4, int paramInt2, String paramString5, long paramLong)
  {
    QLog.i("OfflineVideoThumbDownLoader<FileAssistant>", 1, "[downloadThumb]  ID[" + paramLong + "] OnGetOfflineVideoThumbInfo, bSuccess[" + paramBoolean + " retCode:" + paramInt1 + " downloadIp:" + paramString3 + " downloadDomain:" + paramString4 + " port:" + paramInt2 + " url:" + paramString5);
    OfflineVideoThumbDownLoader.VideoSession localVideoSession = OfflineVideoThumbDownLoader.a(a, paramLong, false);
    if (localVideoSession == null)
    {
      QLog.e("OfflineVideoThumbDownLoader<FileAssistant>", 2, "[downloadThumb]  ID[" + paramLong + "] OnGetOfflineVideoThumbInfo no this session");
      a.a(paramLong, false, null, 0, null, null);
      return;
    }
    if (!paramBoolean)
    {
      a.a.a().a(false, 50, new Object[] { jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity });
      a.a(paramLong);
      a.a(paramLong, false, null, 0, null, null);
      return;
    }
    if ((paramString5 != null) && (paramString5.length() > 0))
    {
      QLog.w("OfflineVideoThumbDownLoader<FileAssistant>", 2, "[downloadThumb]  ID[" + paramLong + "] OnGetOfflineVideoThumbInfo url=null");
      a.a.a().a(false, 50, new Object[] { jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity });
      a.a(paramLong);
      a.a(paramLong, false, null, 0, null, null);
      return;
    }
    paramString5 = null;
    if ((paramString3 != null) && (paramString3.length() > 0)) {
      paramString1 = paramString3;
    }
    while ((paramString1 == null) || (paramString1.length() < 0))
    {
      a.a.a().a(false, 50, new Object[] { jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity });
      a.a(paramLong);
      a.a(paramLong, false, null, 0, null, null);
      return;
      paramString1 = paramString5;
      if (paramString4 != null)
      {
        paramString1 = paramString5;
        if (paramString4.length() > 0) {
          paramString1 = paramString4;
        }
      }
    }
    if ((paramString2 == null) || (paramString2.length() < 0)) {
      QLog.w("OfflineVideoThumbDownLoader<FileAssistant>", 2, "[downloadThumb]  ID[" + paramLong + "] OnGetOfflineVideoThumbInfo downloadKey invaild");
    }
    paramString2 = "/ftn_video_pic/rkey=" + paramString2 + "&filetype=" + b + "&size=" + a.a(jdField_a_of_type_Int) + "&";
    a.a(paramLong, true, paramString1, paramInt2, paramString2, null);
  }
}
