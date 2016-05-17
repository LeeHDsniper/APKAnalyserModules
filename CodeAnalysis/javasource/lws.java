import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.text.TextUtils;
import android.widget.Button;
import android.widget.ImageView;
import com.tencent.mobileqq.activity.QQBrowserActivity;
import com.tencent.mobileqq.activity.pendant.AvatarPendantActivity;
import com.tencent.mobileqq.adapter.AvatarPendantAdapter;
import com.tencent.mobileqq.app.FriendsManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.ExtensionInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.utils.DialogUtil;
import com.tencent.mobileqq.utils.QQCustomDialog;
import com.tencent.mobileqq.vas.AvatarPendantManager;
import com.tencent.mobileqq.vas.VasExtensionObserver;
import com.tencent.mobileqq.widget.QQToast;

public class lws
  extends VasExtensionObserver
{
  public lws(AvatarPendantActivity paramAvatarPendantActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(boolean paramBoolean, Object paramObject)
  {
    Object localObject3 = (Bundle)paramObject;
    long l = ((Bundle)localObject3).getLong("pendantId");
    int i = ((Bundle)localObject3).getInt("seriesId");
    Object localObject2 = ((Bundle)localObject3).getString("uin");
    if ((l == -1L) || (localObject2 == null)) {}
    for (;;)
    {
      return;
      if (paramBoolean)
      {
        localObject3 = (FriendsManager)a.app.getManager(50);
        localObject1 = ((FriendsManager)localObject3).a((String)localObject2);
        paramObject = localObject1;
        if (localObject1 == null)
        {
          paramObject = new ExtensionInfo();
          uin = ((String)localObject2);
        }
        pendantId = l;
        timestamp = System.currentTimeMillis();
        ((FriendsManager)localObject3).a(paramObject);
        j = a.jdField_a_of_type_AndroidWidgetButton.getPaddingBottom();
        int k = a.jdField_a_of_type_AndroidWidgetButton.getPaddingTop();
        int m = a.jdField_a_of_type_AndroidWidgetButton.getPaddingRight();
        int n = a.jdField_a_of_type_AndroidWidgetButton.getPaddingLeft();
        if (l == 0L)
        {
          a.c.setVisibility(4);
          a.b.setVisibility(4);
          if (a.jdField_a_of_type_ComTencentMobileqqVasAvatarPendantShopSeriesInfo != null) {
            a.jdField_a_of_type_ComTencentMobileqqVasAvatarPendantShopSeriesInfo.c = -1;
          }
          a.jdField_a_of_type_AndroidWidgetButton.setTextColor(-1);
          a.jdField_a_of_type_AndroidWidgetButton.setBackgroundResource(2130841262);
          ReportController.b(a.app, "CliOper", "", "", "0X8005FD4", "0X8005FD4", 0, 0, "", "", "", "");
        }
        for (;;)
        {
          a.jdField_a_of_type_AndroidWidgetButton.setPadding(n, k, m, j);
          if (a.jdField_a_of_type_ComTencentMobileqqAdapterAvatarPendantAdapter == null) {
            break;
          }
          paramObject = ((AvatarPendantManager)a.app.getManager(45)).a();
          a.jdField_a_of_type_ComTencentMobileqqAdapterAvatarPendantAdapter.a(paramObject);
          return;
          a.jdField_a_of_type_AndroidWidgetButton.setTextColor(-1711276033);
          a.jdField_a_of_type_AndroidWidgetButton.setBackgroundResource(2130841263);
          a.c.setVisibility(0);
          a.b.setVisibility(0);
          ReportController.b(a.app, "CliOper", "", "", "0X8005FD6", "0X8005FD6", 0, 0, String.valueOf(i), String.valueOf(l), "", "");
        }
      }
      if (l != 0L) {
        ReportController.b(a.app, "CliOper", "", "", "0X8005FD7", "0X8005FD7", 0, 0, String.valueOf(i), String.valueOf(l), "", "");
      }
      int j = ((Bundle)localObject3).getInt("result");
      i = -1;
      Object localObject1 = "LTMCLUB";
      paramObject = "QQ会员";
      switch (j)
      {
      }
      while (i != -1)
      {
        localObject2 = a;
        DialogUtil.a(a, 230).setTitle(((Context)localObject2).getString(2131367267)).setMessage(((Context)localObject2).getString(i)).setPositiveButton(((Context)localObject2).getString(2131370668), new lwu(this, (String)localObject1, paramObject)).setNegativeButton(((Context)localObject2).getString(2131366996), new lwt(this)).show();
        ReportController.b(a.app, "CliOper", "", "", "0X8005FD8", "0X8005FD8", 0, 0, "", "", "", "");
        return;
        QQToast.a(a, 1, 2131370708, 0).b(a.getTitleBarHeight());
        continue;
        i = 2131370709;
        continue;
        i = 2131370710;
        localObject1 = "CJCLUBT";
        paramObject = a.getString(2131370740);
        continue;
        localObject2 = ((Bundle)localObject3).getString("tips");
        localObject3 = ((Bundle)localObject3).getString("url");
        if (TextUtils.isEmpty((CharSequence)localObject2))
        {
          QQToast.a(a, 1, 2131370711, 0).b(a.getTitleBarHeight());
        }
        else if (TextUtils.isEmpty((CharSequence)localObject3))
        {
          QQToast.a(a, 1, (CharSequence)localObject2, 0).b(a.getTitleBarHeight());
        }
        else
        {
          localObject2 = new Intent(a, QQBrowserActivity.class);
          ((Intent)localObject2).putExtra("url", (String)localObject3);
          ((Intent)localObject2).putExtra("hide_more_button", true);
          ((Intent)localObject2).putExtra("webStyle", "noBottomBar");
          a.startActivity((Intent)localObject2);
        }
      }
    }
  }
}
