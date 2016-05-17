import com.tencent.image.URLDrawable.DownloadListener;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.item.TroopGiftMsgItemBuilder;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;

public class lcc
  implements URLDrawable.DownloadListener
{
  public lcc(TroopGiftMsgItemBuilder paramTroopGiftMsgItemBuilder)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onFileDownloadFailed(int paramInt)
  {
    ReportController.b(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_flower", "", "grp_aio", "objicon_fail", 0, 0, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, "", "", "");
  }
  
  public void onFileDownloadStarted() {}
  
  public void onFileDownloadSucceed(long paramLong) {}
}
