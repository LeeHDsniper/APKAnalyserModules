import com.tencent.mobileqq.data.MessageForPic;
import com.tencent.mobileqq.forward.ForwardBaseOption;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pic.PicResult;
import com.tencent.mobileqq.pic.UiCallBack.DownAdapter;
import com.tencent.mobileqq.transfile.AbsDownloader;
import com.tencent.mobileqq.transfile.URLDrawableHelper;
import com.tencent.mobileqq.utils.QQCustomDialog;
import com.tencent.qphone.base.util.QLog;
import java.net.URL;

class pfo
  extends UiCallBack.DownAdapter
{
  pfo(pfn paramPfn, MessageForPic paramMessageForPic)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(int paramInt, PicResult paramPicResult)
  {
    jdField_a_of_type_Pfn.jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.a.setProgressBarVisibility(8);
    paramPicResult = AbsDownloader.d(URLDrawableHelper.a(jdField_a_of_type_ComTencentMobileqqDataMessageForPic, 1, null).toString().toString());
    if (QLog.isColorLevel()) {
      QLog.d("ForwardOption.ForwardBaseOption", 2, "DownloadBigPic finish");
    }
    ForwardBaseOption.a(jdField_a_of_type_Pfn.jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption, paramPicResult, jdField_a_of_type_Pfn.jdField_a_of_type_JavaLangString);
  }
  
  public void a(int paramInt, boolean paramBoolean) {}
}
