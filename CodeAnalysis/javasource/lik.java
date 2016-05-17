import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.support.v4.app.FragmentActivity;
import android.view.View;
import com.tencent.biz.pubaccount.PublicAccountManager;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.activity.aio.rebuild.PublicAccountChatPie;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.ConversationFacade;
import com.tencent.mobileqq.bubble.ChatXListView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.troop.data.TroopEntranceBar;
import com.tencent.mobileqq.utils.DialogUtil;
import com.tencent.mobileqq.utils.QQCustomDialog;
import com.tencent.mobileqq.widget.QQProgressDialog;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import java.util.List;
import java.util.Map;

public class lik
  extends Handler
{
  public lik(PublicAccountChatPie paramPublicAccountChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void handleMessage(Message paramMessage)
  {
    switch (what)
    {
    }
    do
    {
      do
      {
        do
        {
          SharedPreferences localSharedPreferences;
          do
          {
            long l;
            do
            {
              do
              {
                do
                {
                  do
                  {
                    do
                    {
                      do
                      {
                        return;
                      } while (a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.isFinishing());
                      try
                      {
                        a.az();
                        return;
                      }
                      catch (Exception paramMessage)
                      {
                        paramMessage.printStackTrace();
                        return;
                      }
                      paramMessage = a.jdField_a_of_type_ComTencentBizPubaccountPublicAccountManager.a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a.a());
                      a.c(paramMessage);
                    } while ((paramMessage == null) || (paramMessage.isEmpty()));
                    a.h(true);
                    return;
                    a.ax();
                    a.aw();
                  } while (a.dt == 1);
                  a.dw = 5;
                  return;
                } while ((a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.isFinishing()) || (a.b == null) || (!a.b.isShowing()));
                a.b.dismiss();
                QQToast.a(a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity, 2131367396, 0).b(a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getTitleBarHeight());
                return;
              } while (a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.isFinishing());
              localSharedPreferences = BaseApplicationImpl.getContext().getSharedPreferences("public_account_weather", 0);
              l = localSharedPreferences.getLong("switch_city" + a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), 0L);
              if (System.currentTimeMillis() - l >= 86400000L) {
                break;
              }
            } while (!QLog.isColorLevel());
            QLog.d("Q.aio.BaseChatPie", 2, "switch_city no time =" + (System.currentTimeMillis() - l));
            return;
          } while (arg2 != 1);
          int i = arg1;
          PublicAccountChatPie.a(a, DialogUtil.a(a.jdField_a_of_type_AndroidContentContext, 230, null, String.format("定位到你当前所在城市在%s，是否切换？", new Object[] { (String)obj }), "否", "是", new lil(this, i), new lim(this, localSharedPreferences)));
          PublicAccountChatPie.a(a).show();
          return;
          paramMessage = paramMessage.getData();
        } while (paramMessage == null);
        a.jdField_a_of_type_ComTencentMobileqqTroopDataTroopEntranceBar.a.put(paramMessage.getString("troopUin"), Integer.valueOf(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramMessage.getString("troopUin"), 1)));
        a.jdField_a_of_type_ComTencentMobileqqTroopDataTroopEntranceBar.d();
        a.jdField_a_of_type_ComTencentMobileqqTroopDataTroopEntranceBar.e();
        a.jdField_a_of_type_ComTencentMobileqqTroopDataTroopEntranceBar.c();
        return;
      } while (a.jdField_a_of_type_ComTencentMobileqqBubbleChatXListView == null);
      a.jdField_a_of_type_ComTencentMobileqqBubbleChatXListView.H();
      a.O = false;
      return;
    } while (a.jdField_a_of_type_ComTencentMobileqqBubbleChatXListView == null);
    try
    {
      a.jdField_a_of_type_ComTencentMobileqqBubbleChatXListView.getChildAt(0).getLayoutParams().height = -2;
      a.jdField_a_of_type_ComTencentMobileqqBubbleChatXListView.setSelection(1);
      postDelayed(new lin(this), 100L);
      postDelayed(new lio(this), 300L);
      return;
    }
    catch (Exception paramMessage)
    {
      paramMessage.printStackTrace();
    }
  }
}
