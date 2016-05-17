import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.QQBrowserDelegationActivity;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.tips.FraudTipsBar;
import com.tencent.mobileqq.activity.aio.tips.TipsManager;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.utils.AntiFraudConfigFileUtil;

public class lmv
  implements View.OnClickListener
{
  public lmv(FraudTipsBar paramFraudTipsBar, int paramInt)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    FraudTipsBar.a(jdField_a_of_type_ComTencentMobileqqActivityAioTipsFraudTipsBar, 2);
    FraudTipsBar.a(jdField_a_of_type_ComTencentMobileqqActivityAioTipsFraudTipsBar).a();
    ReportController.b(FraudTipsBar.a(jdField_a_of_type_ComTencentMobileqqActivityAioTipsFraudTipsBar), "P_CliOper", "Safe_AntiFraud", ajdField_a_of_type_ComTencentMobileqqActivityAioTipsFraudTipsBar).a, "banner", "userclick", jdField_a_of_type_Int, 0, "", "", "", "");
    paramView = (Bundle)AntiFraudConfigFileUtil.a().a("SecWarningCfg", "BannerURL", 146, jdField_a_of_type_Int);
    if (paramView != null) {}
    for (paramView = paramView.getString("BannerURL");; paramView = null)
    {
      Object localObject = paramView;
      if (TextUtils.isEmpty(paramView)) {
        localObject = "http://jubao.qq.com/cn/jubao?appname=KQQ&subapp=$SUBAPP$&jubaotype=uin&system=$SYSTEM$&eviluin=$EVILUIN$&impeachuin=$USERUIN$";
      }
      if (jdField_a_of_type_Int == 1) {}
      for (paramView = ((String)localObject).replace("$SUBAPP$", "notice");; paramView = ((String)localObject).replace("$SUBAPP$", "tips"))
      {
        paramView = paramView.replace("$SYSTEM$", "android").replace("$EVILUIN$", ajdField_a_of_type_ComTencentMobileqqActivityAioTipsFraudTipsBar).a).replace("$USERUIN$", FraudTipsBar.a(jdField_a_of_type_ComTencentMobileqqActivityAioTipsFraudTipsBar).getAccount());
        localObject = BaseActivity.sTopActivity;
        Intent localIntent = new Intent((Context)localObject, QQBrowserDelegationActivity.class);
        localIntent.putExtra("injectrecommend", true);
        localIntent.putExtra("url", paramView);
        ((Context)localObject).startActivity(localIntent);
        return;
      }
    }
  }
}
