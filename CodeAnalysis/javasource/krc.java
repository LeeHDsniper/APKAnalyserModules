import android.content.Context;
import android.content.res.Resources;
import android.os.AsyncTask;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.photo.ImageInfo;
import com.tencent.mobileqq.activity.photo.StatisticConstants;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pic.PicBusiManager;
import com.tencent.mobileqq.pic.PicReq;
import com.tencent.mobileqq.pic.PicUploadInfo.Builder;
import com.tencent.mobileqq.transfile.TranDbRecord.PicDbRecord;
import com.tencent.mobileqq.utils.FileUtils;
import com.tencent.mobileqq.utils.ImageUtil;
import com.tencent.mobileqq.widget.QQToast;
import java.util.ArrayList;
import java.util.List;

public final class krc
  extends AsyncTask
{
  public krc(SessionInfo paramSessionInfo, QQAppInterface paramQQAppInterface, Context paramContext, String paramString)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected ImageInfo a(Void... paramVarArgs)
  {
    ImageUtil.a(-1L, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, true, "image_send_prepare", "sessionInfo.handleScreenPhoto");
    String str = ImageUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication(), jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
    paramVarArgs = new ImageInfo();
    ImageUtil.a(paramVarArgs, "compress_start", "sessionInfo.handleScreenPhoto");
    ImageUtil.a(3, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_JavaLangString, str, true, paramVarArgs, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
    if (!FileUtils.b(b)) {
      return null;
    }
    try
    {
      int i = jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int;
      QQAppInterface localQQAppInterface = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
      StatisticConstants.a(new String[] { str }, i, false, false, -1, localQQAppInterface);
      return paramVarArgs;
    }
    catch (Exception localException) {}
    return paramVarArgs;
  }
  
  protected void a(ImageInfo paramImageInfo)
  {
    if (paramImageInfo != null)
    {
      Object localObject = new PicUploadInfo.Builder();
      ((PicUploadInfo.Builder)localObject).a(b);
      ((PicUploadInfo.Builder)localObject).d(1027);
      ((PicUploadInfo.Builder)localObject).d(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
      if (j == 2) {}
      for (int i = TranDbRecord.PicDbRecord.f;; i = TranDbRecord.PicDbRecord.e)
      {
        ((PicUploadInfo.Builder)localObject).c(i);
        ((PicUploadInfo.Builder)localObject).e(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.b);
        ((PicUploadInfo.Builder)localObject).c(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
        ((PicUploadInfo.Builder)localObject).e(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
        PicReq localPicReq = PicBusiManager.a(2, 1027);
        localPicReq.a(((PicUploadInfo.Builder)localObject).a());
        PicBusiManager.a(localPicReq, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
        localObject = new ArrayList();
        ((ArrayList)localObject).add(paramImageInfo);
        ImageUtil.a(jdField_a_of_type_AndroidContentContext, (List)localObject, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
        return;
      }
    }
    ImageUtil.a(-1L, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, true, "image_send_prepared_failed", "sessionInfo.handleScreenPhoto");
    QQToast.a(jdField_a_of_type_AndroidContentContext, jdField_a_of_type_AndroidContentContext.getResources().getString(2131368411), 0).b(jdField_a_of_type_AndroidContentContext.getResources().getDimensionPixelSize(2131492908));
  }
}
