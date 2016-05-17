import android.content.Intent;
import android.os.Parcelable;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.av.app.PstnSessionInfo;
import com.tencent.av.gaudio.AVNotifyCenter;
import com.tencent.av.guild.GuildMultiActivity;
import com.tencent.av.random.ui.RandomDoubleActivity;
import com.tencent.av.random.ui.RandomMultiActivity;
import com.tencent.av.ui.AVActivity;
import com.tencent.av.ui.PSTNC2CActivity;
import com.tencent.av.utils.PstnUtils;
import com.tencent.av.utils.UITools;
import com.tencent.mobileqq.activity.recent.BannerManager;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.TroopManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.qphone.base.util.QLog;
import cooperation.groupvideo.GroupVideoHelper;

public class mfi
  implements View.OnClickListener
{
  public mfi(BannerManager paramBannerManager)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    QQAppInterface localQQAppInterface;
    int j;
    if (BannerManager.a(a) != null)
    {
      localQQAppInterface = aa).app;
      if (localQQAppInterface == null) {
        break label1119;
      }
      j = localQQAppInterface.a().g();
      if (QLog.isColorLevel()) {
        QLog.d("Q.recent.banner", 2, "initMultiVideoBar-->SessionType");
      }
      if ((j != 1) && (j != 2)) {
        break label307;
      }
      paramView = new Intent(BannerManager.a(a).getApplicationContext(), AVActivity.class);
      if (localQQAppInterface.a().h() == 1011) {
        paramView = new Intent(BannerManager.a(a).getApplicationContext(), RandomDoubleActivity.class);
      }
      paramView.addFlags(262144);
      paramView.addFlags(268435456);
      if (!localQQAppInterface.a().b(localQQAppInterface.a().e())) {
        break label234;
      }
      paramView.putExtra("sessionType", 3);
      paramView.putExtra("GroupId", localQQAppInterface.a().e());
      paramView.putExtra("isDoubleVideoMeeting", true);
      BannerManager.a(a).startActivity(paramView);
      BannerManager.a(a).overridePendingTransition(2130968667, 0);
      ReportController.b(localQQAppInterface, "CliOper", "", "", "0X800520A", "0X800520A", 0, 0, "", "", "", "");
    }
    label234:
    label307:
    Object localObject;
    do
    {
      return;
      localQQAppInterface = null;
      break;
      paramView.putExtra("sessionType", j);
      paramView.putExtra("uin", localQQAppInterface.a().e());
      BannerManager.a(a).startActivity(paramView);
      BannerManager.a(a).overridePendingTransition(2130968667, 0);
      ReportController.b(localQQAppInterface, "CliOper", "", "", "Two_call", "Two_call_full", 0, 0, "1", "", "", "");
      return;
      if (j != 5) {
        break label498;
      }
      paramView = new Intent(BannerManager.a(a).getApplicationContext(), PSTNC2CActivity.class);
      paramView.addFlags(262144);
      paramView.addFlags(268435456);
      localObject = new PstnSessionInfo();
      jdField_a_of_type_JavaLangString = aajdField_a_of_type_JavaLangString;
      d = aad;
      jdField_b_of_type_JavaLangString = aajdField_b_of_type_JavaLangString;
      c = aac;
      jdField_a_of_type_Int = aajdField_a_of_type_Int;
      jdField_b_of_type_Int = aajdField_b_of_type_Int;
      paramView.putExtra("pstn_session_info", (Parcelable)localObject);
      BannerManager.a(a).startActivity(paramView);
      BannerManager.a(a).overridePendingTransition(2130968667, 0);
    } while (localQQAppInterface == null);
    PstnUtils.a(localQQAppInterface.a());
    return;
    label498:
    long l = aa).app.a().a();
    int k = aa).app.a().a();
    int m;
    label649:
    int i;
    if ((l != 0L) || (aa).app.a().b() > 0))
    {
      m = localQQAppInterface.a().b(l);
      if (aa).app.a().b() > 0) {
        if (localQQAppInterface.a().b() > 0L)
        {
          paramView = new Intent(BannerManager.a(a).getApplicationContext(), GuildMultiActivity.class);
          ReportController.b(localQQAppInterface, "CliOper", "", "", "0X80057ED", "0X80057ED", 0, 0, "", "", "", "");
          if (localQQAppInterface.a().a(k, l) <= 0L) {
            break label1008;
          }
          if (!localQQAppInterface.a().a(k, l)) {
            break label1003;
          }
          i = 2;
          label683:
          paramView.addFlags(262144);
          paramView.addFlags(268435456);
          paramView.putExtra("GroupId", String.valueOf(l));
          paramView.putExtra("Type", i);
          paramView.putExtra("sessionType", j);
          paramView.putExtra("uinType", UITools.b(k));
          paramView.putExtra("MultiAVType", m);
          if (m != 2) {
            break label1013;
          }
          localObject = (TroopManager)localQQAppInterface.getManager(51);
          if ((localObject == null) || (((TroopManager)localObject).a(l + "") != null)) {
            break label1135;
          }
        }
      }
    }
    label1003:
    label1008:
    label1013:
    label1027:
    label1119:
    label1135:
    for (boolean bool = false;; bool = true)
    {
      paramView.putExtra("troopmember", bool);
      paramView.putExtra("Fromwhere", "SmallScreen");
      GroupVideoHelper.a(localQQAppInterface, BannerManager.a(a), paramView, 1);
      for (;;)
      {
        BannerManager.a(a).overridePendingTransition(2130968667, 0);
        if (k != 2) {
          break label1027;
        }
        ReportController.b(localQQAppInterface, "CliOper", "", "", "Multi_call", "Msgtab_back", 0, 0, "", "", "", "");
        return;
        if (localQQAppInterface.a().c() == 1)
        {
          paramView = new Intent(BannerManager.a(a).getApplicationContext(), RandomDoubleActivity.class);
          break label649;
        }
        if (localQQAppInterface.a().c() == 3)
        {
          paramView = new Intent(BannerManager.a(a).getApplicationContext(), RandomMultiActivity.class);
          break label649;
        }
        if (!QLog.isColorLevel()) {
          break;
        }
        QLog.e("MultiVideoBar", 2, "status error");
        return;
        if (m == 2)
        {
          paramView = new Intent();
          break label649;
        }
        paramView = new Intent(BannerManager.a(a).getApplicationContext(), AVActivity.class);
        break label649;
        i = 1;
        break label683;
        i = 0;
        break label683;
        BannerManager.a(a).startActivity(paramView);
      }
      if (k != 1) {
        break;
      }
      if (localQQAppInterface.a().b(l) == 10)
      {
        ReportController.b(localQQAppInterface, "CliOper", "", "", "0X8005931", "0X8005931", 0, 0, "", "", "", "");
        return;
      }
      ReportController.b(localQQAppInterface, "CliOper", "", "", "0X80046D8", "0X80046D8", 0, 0, "", "", "", "");
      return;
      if (!QLog.isColorLevel()) {
        break;
      }
      QLog.e("MultiVideoBar", 2, "status error");
      return;
      if (!QLog.isColorLevel()) {
        break;
      }
      QLog.e("MultiVideoBar", 2, "app is null");
      return;
    }
  }
}
