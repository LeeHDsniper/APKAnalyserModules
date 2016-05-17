import android.content.res.Resources;
import android.support.v4.util.MQLruCache;
import android.util.DisplayMetrics;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.activity.SplashActivity;
import com.tencent.mobileqq.activity.aio.panel.AIOPanelUtiles;
import com.tencent.mobileqq.activity.main.MainAssistObserver;
import com.tencent.mobileqq.app.MemoryConfigs;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.multimsg.MultiMsgManager;
import com.tencent.mobileqq.statistics.MainAcitivityReportHelper;

public class lvi
  implements Runnable
{
  public lvi(MainAssistObserver paramMainAssistObserver)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    Object localObject = a.jdField_a_of_type_ComTencentMobileqqActivitySplashActivity;
    if (localObject != null) {}
    for (QQAppInterface localQQAppInterface = app; (localObject == null) || (localQQAppInterface == null); localQQAppInterface = null) {
      return;
    }
    try
    {
      if (a.jdField_a_of_type_ComTencentMobileqqStatisticsMainAcitivityReportHelper == null) {
        a.jdField_a_of_type_ComTencentMobileqqStatisticsMainAcitivityReportHelper = new MainAcitivityReportHelper((SplashActivity)localObject);
      }
      a.jdField_a_of_type_ComTencentMobileqqStatisticsMainAcitivityReportHelper.b(localQQAppInterface);
      MultiMsgManager.a().a(localQQAppInterface);
      AIOPanelUtiles.a(localQQAppInterface);
      localObject = BaseApplicationImpl.jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl.getResources().getDisplayMetrics();
      int i = widthPixels;
      int j = heightPixels;
      localObject = BaseApplicationImpl.jdField_a_of_type_AndroidSupportV4UtilMQLruCache;
      float f = aa;
      ((MQLruCache)localObject).setLargeSize((int)(j * i * 4 * f));
    }
    catch (Exception localException)
    {
      for (;;) {}
    }
    localQQAppInterface.H();
  }
}
