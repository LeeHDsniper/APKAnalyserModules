import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.biz.pubaccount.PublicAccountBrowser;
import com.tencent.biz.pubaccount.util.PAMessageUtil;
import com.tencent.biz.pubaccount.util.PublicAccountUtil;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.item.PATextItemBuilder;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.MessageForPubAccount;
import com.tencent.mobileqq.data.PAMessage;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.open.adapter.OpenAppClient;

public class kyx
  implements View.OnClickListener
{
  public kyx(PATextItemBuilder paramPATextItemBuilder)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    paramView = (kyy)AIOUtils.a(paramView);
    if (PAMessageUtil.a(jdField_a_of_type_JavaLangString, a.jdField_a_of_type_AndroidContentContext)) {}
    for (;;)
    {
      paramView = jdField_a_of_type_ComTencentMobileqqDataChatMessage;
      if ((paramView instanceof MessageForPubAccount))
      {
        paramView = (MessageForPubAccount)paramView;
        if ((mPAMessage != null) && (mPAMessage.mMsgId > 0L)) {
          ReportController.b(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Pb_account_lifeservice", frienduin, "mp_msg_sys_14", "msg_click", 0, 1, 0, Long.toString(mPAMessage.mMsgId), "", "", "");
        }
      }
      return;
      if ((b == null) || (!b.equals("open_local"))) {
        break;
      }
      localObject = new Bundle();
      ((Bundle)localObject).putString("schemaurl", c);
      ((Bundle)localObject).putString("uin", a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
      ((Bundle)localObject).putString("vkey", a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.d());
      OpenAppClient.b((Activity)a.jdField_a_of_type_AndroidContentContext, (Bundle)localObject);
    }
    Object localObject = new Intent(a.jdField_a_of_type_AndroidContentContext, PublicAccountBrowser.class);
    ((Intent)localObject).putExtra("uin", a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
    ((Intent)localObject).putExtra("url", c);
    ((Intent)localObject).putExtra("assignBackText", a.jdField_a_of_type_AndroidContentContext.getResources().getString(2131367694));
    ((Intent)localObject).putExtra("puin", a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
    ((Intent)localObject).putExtra("source_name", a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d);
    MessageForPubAccount localMessageForPubAccount;
    if ((jdField_a_of_type_ComTencentMobileqqDataChatMessage instanceof MessageForPubAccount))
    {
      localMessageForPubAccount = (MessageForPubAccount)jdField_a_of_type_ComTencentMobileqqDataChatMessage;
      if ((mPAMessage == null) || (mPAMessage.mMsgId <= 0L)) {
        break label428;
      }
    }
    label428:
    for (long l = mPAMessage.mMsgId;; l = -1L)
    {
      if (l >= 0L) {
        ((Intent)localObject).putExtra("msg_id", String.valueOf(l));
      }
      ((Intent)localObject).putExtra("fromAio", true);
      PublicAccountUtil.a((Intent)localObject, c);
      a.jdField_a_of_type_AndroidContentContext.startActivity((Intent)localObject);
      ReportController.b(null, "P_CliOper", "Pb_account_lifeservice", "", "aio_msg_url", "aio_url_clickqq", 0, 1, 0, c, "", "", "");
      break;
    }
  }
}
