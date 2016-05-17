import com.tencent.mobileqq.activity.SplashActivity;
import com.tencent.mobileqq.activity.main.MainAssistObserver;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.MainAcitivityReportHelper;
import java.util.TimerTask;

public class lvj
  extends TimerTask
{
  public lvj(MainAssistObserver paramMainAssistObserver)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if ((a.jdField_a_of_type_ComTencentMobileqqActivitySplashActivity == null) || (a.jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.app == null)) {
      return;
    }
    if (a.jdField_a_of_type_ComTencentMobileqqStatisticsMainAcitivityReportHelper == null) {
      a.jdField_a_of_type_ComTencentMobileqqStatisticsMainAcitivityReportHelper = new MainAcitivityReportHelper(a.jdField_a_of_type_ComTencentMobileqqActivitySplashActivity);
    }
    a.jdField_a_of_type_ComTencentMobileqqStatisticsMainAcitivityReportHelper.a(a.jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.b);
    a.jdField_a_of_type_ComTencentMobileqqStatisticsMainAcitivityReportHelper.b(a.jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.app);
  }
}
