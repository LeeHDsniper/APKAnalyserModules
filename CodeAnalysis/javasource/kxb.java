import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.graphics.Color;
import android.net.Uri;
import android.os.Bundle;
import android.text.TextPaint;
import android.text.TextUtils;
import android.text.style.ClickableSpan;
import android.view.View;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.activity.ChatActivityUtils;
import com.tencent.mobileqq.activity.QQBrowserActivity;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.item.GrayTipsItemBuilder;
import com.tencent.mobileqq.activity.qwallet.SendHbActivity;
import com.tencent.mobileqq.activity.qwallet.TransactionActivity;
import com.tencent.mobileqq.activity.qwallet.report.VACDReportUtil;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.util.ProfileCardUtil;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.mqp.app.sec.MQPSensitiveMsgUtil;
import com.tencent.qphone.base.util.QLog;
import org.json.JSONException;
import org.json.JSONObject;

public class kxb
  extends ClickableSpan
{
  public kxb(GrayTipsItemBuilder paramGrayTipsItemBuilder, String paramString1, String paramString2, int paramInt1, int paramInt2, String paramString3, Bundle paramBundle, String paramString4, int paramInt3, long paramLong, String paramString5, int paramInt4, String paramString6)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    if (jdField_a_of_type_JavaLangString.compareToIgnoreCase("makePhoneCall") == 0)
    {
      ReportController.b(jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Safe_SensMsg", jdField_b_of_type_JavaLangString, "Tips_Click", "makePhoneCall", jdField_a_of_type_Int, jdField_b_of_type_Int, "", "", "", "");
      paramView = new Intent("android.intent.action.DIAL", Uri.parse("tel:" + jdField_c_of_type_JavaLangString));
      jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder.jdField_a_of_type_AndroidContentContext.startActivity(paramView);
    }
    Object localObject1;
    Object localObject2;
    Object localObject3;
    do
    {
      return;
      if (jdField_a_of_type_JavaLangString.compareToIgnoreCase("showAlert") == 0)
      {
        paramView = jdField_a_of_type_AndroidOsBundle.getString("AlertTitle");
        localObject1 = jdField_a_of_type_AndroidOsBundle.getString("AlertText");
        localObject2 = jdField_a_of_type_AndroidOsBundle.getString("AlertOtherBtnText");
        localObject3 = jdField_a_of_type_AndroidOsBundle.getString("AlertCancelBtnText");
        MQPSensitiveMsgUtil.a(jdField_d_of_type_JavaLangString, jdField_c_of_type_Int, jdField_a_of_type_Long, paramView, (String)localObject1, (String)localObject2, (String)localObject3);
        return;
      }
      if (jdField_a_of_type_JavaLangString.compareToIgnoreCase("openURL") != 0) {
        break;
      }
      ReportController.b(jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Safe_SensMsg", jdField_b_of_type_JavaLangString, "Tips_Click", "openURL", jdField_a_of_type_Int, jdField_b_of_type_Int, "", "", "", "");
      localObject1 = jdField_a_of_type_AndroidOsBundle.getString("Action");
    } while (TextUtils.isEmpty((CharSequence)localObject1));
    paramView = (View)localObject1;
    if (!TextUtils.isEmpty((CharSequence)localObject1))
    {
      if (((String)localObject1).startsWith("http://")) {
        break label395;
      }
      paramView = "http://" + (String)localObject1;
      if (!paramView.contains("?")) {
        break label432;
      }
    }
    label395:
    label432:
    for (paramView = paramView + "&sid=" + jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getSid();; paramView = paramView + "?sid=" + jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getSid())
    {
      localObject1 = new Intent(jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder.jdField_a_of_type_AndroidContentContext, QQBrowserActivity.class);
      ((Intent)localObject1).putExtra("url", paramView);
      ((Intent)localObject1).putExtra("hide_left_button", true);
      ((Intent)localObject1).putExtra("show_right_close_button", true);
      ((Intent)localObject1).putExtra("finish_animation_up_down", true);
      jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder.jdField_a_of_type_AndroidContentContext.startActivity((Intent)localObject1);
      return;
      paramView = (View)localObject1;
      if (((String)localObject1).startsWith("https://")) {
        break;
      }
      paramView = "https://" + (String)localObject1;
      break;
    }
    if (jdField_a_of_type_JavaLangString.compareToIgnoreCase("transfer") == 0)
    {
      ReportController.b(jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Safe_SensMsg", jdField_b_of_type_JavaLangString, "Tips_Click", "transfer", jdField_a_of_type_Int, jdField_b_of_type_Int, "", "", "", "");
      paramView = e;
      if ((jdField_d_of_type_Int == 1) || (jdField_d_of_type_Int == 3000)) {
        paramView = ContactUtils.a(jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, false, jdField_b_of_type_JavaLangString);
      }
      localObject1 = new Intent(jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder.jdField_a_of_type_AndroidContentContext, TransactionActivity.class);
      ((Intent)localObject1).putExtra("come_from", 2);
      localObject2 = new JSONObject();
      try
      {
        ((JSONObject)localObject2).put("targetUin", jdField_d_of_type_JavaLangString);
        ((JSONObject)localObject2).put("targetNickname", paramView);
        ((JSONObject)localObject2).put("sign", "");
        ((Intent)localObject1).putExtra("extra_data", ((JSONObject)localObject2).toString());
        ((Intent)localObject1).putExtra("app_info", "appid#20000001|bargainor_id#1000026901|channel#graytips");
        jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder.jdField_a_of_type_AndroidContentContext.startActivity((Intent)localObject1);
        return;
      }
      catch (JSONException paramView)
      {
        for (;;)
        {
          paramView.printStackTrace();
        }
      }
    }
    if (jdField_a_of_type_JavaLangString.compareToIgnoreCase("openDeviceLock") == 0)
    {
      ReportController.b(jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Safe_SensMsg", jdField_b_of_type_JavaLangString, "Tips_Click", "openDeviceLock", jdField_a_of_type_Int, jdField_b_of_type_Int, "", "", "", "");
      paramView = new Intent();
      paramView.setFlags(268435456);
      paramView.setAction("android.intent.action.VIEW");
      paramView.putExtra("devlock_open_source", "Graytips");
      paramView.putExtra("enable_open_allowset_dev", true);
      paramView.setData(Uri.parse("mqqdevlock://devlock/open?"));
      jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder.jdField_a_of_type_AndroidContentContext.startActivity(paramView);
      return;
    }
    if (jdField_a_of_type_JavaLangString.compareToIgnoreCase("tipOff") == 0)
    {
      ReportController.b(jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Safe_SensMsg", jdField_b_of_type_JavaLangString, "Tips_Click", "tipOff", jdField_a_of_type_Int, jdField_b_of_type_Int, "", "", "", "");
      if ((jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int != 3000) && (jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int != 1)) {
        break label1420;
      }
    }
    label1133:
    label1420:
    for (paramView = jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString;; paramView = null)
    {
      ProfileCardUtil.a((BaseActivity)jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder.jdField_a_of_type_AndroidContentContext, jdField_b_of_type_JavaLangString, paramView, jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount(), 1101);
      return;
      if ((jdField_a_of_type_JavaLangString.compareToIgnoreCase("QQCall") == 0) || (jdField_a_of_type_JavaLangString.compareToIgnoreCase("videoCall") == 0))
      {
        ReportController.b(jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Safe_SensMsg", jdField_b_of_type_JavaLangString, "Tips_Click", jdField_a_of_type_JavaLangString, jdField_a_of_type_Int, jdField_b_of_type_Int, "", "", "", "");
        if (!(jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder.jdField_a_of_type_AndroidContentContext instanceof Activity)) {
          break;
        }
        paramView = e;
        i = jdField_d_of_type_Int;
        if ((jdField_d_of_type_Int == 1) || (jdField_d_of_type_Int == 3000))
        {
          paramView = ContactUtils.a(jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, false, jdField_b_of_type_JavaLangString);
          i = 0;
        }
        localObject2 = jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
        localObject3 = (Activity)jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder.jdField_a_of_type_AndroidContentContext;
        String str = jdField_d_of_type_JavaLangString;
        if (jdField_d_of_type_Int == 1006)
        {
          localObject1 = jdField_d_of_type_JavaLangString;
          if (jdField_a_of_type_JavaLangString.compareToIgnoreCase("QQCall") != 0) {
            break label1133;
          }
        }
        for (boolean bool = true;; bool = false)
        {
          ChatActivityUtils.a((QQAppInterface)localObject2, (Context)localObject3, i, str, paramView, (String)localObject1, bool, f, true, true, null, "from_internal");
          return;
          localObject1 = null;
          break;
        }
      }
      if (jdField_a_of_type_JavaLangString.compareToIgnoreCase("luckyMoney") != 0) {
        break;
      }
      ReportController.b(jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Safe_SensMsg", jdField_b_of_type_JavaLangString, "Tips_Click", "luckyMoney", jdField_a_of_type_Int, jdField_b_of_type_Int, "", "", "", "");
      int i = 1;
      if (jdField_d_of_type_Int == 3000) {
        i = 2;
      }
      for (;;)
      {
        paramView = new JSONObject();
        try
        {
          paramView.put("recv_uin", jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
          paramView.put("recv_nick", jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_d_of_type_JavaLangString);
          paramView.put("recv_type", i);
          if (QLog.isColorLevel()) {
            QLog.d("PlusPanel", 2, "click HongBao:params=" + paramView.toString());
          }
          localObject1 = new Intent(BaseApplicationImpl.getContext(), SendHbActivity.class);
          ((Intent)localObject1).putExtra("come_from", 2);
          ((Intent)localObject1).putExtra("app_info", "appid#1344242394|bargainor_id#1000030201|channel#graytips");
          ((Intent)localObject1).putExtra("extra_data", paramView.toString());
          ((Intent)localObject1).putExtra("vacreport_key_seq", VACDReportUtil.a(null, "qqwallet", "makeHongbao", "click", "groupType=" + i, 0, null));
          jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder.jdField_a_of_type_AndroidContentContext.startActivity((Intent)localObject1);
          return;
          if (jdField_d_of_type_Int == 1) {
            i = 3;
          }
        }
        catch (JSONException localJSONException)
        {
          for (;;)
          {
            localJSONException.printStackTrace();
          }
        }
      }
    }
  }
  
  public void updateDrawState(TextPaint paramTextPaint)
  {
    paramTextPaint.setColor(Color.rgb(26, 144, 240));
  }
}
