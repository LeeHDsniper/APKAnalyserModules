import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.text.SpannableString;
import android.text.TextUtils;
import com.tencent.mobileqq.activity.ForwardRecentActivity;
import com.tencent.mobileqq.activity.JumpActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.forward.ForwardBaseOption;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.StatisticAssist;
import mqq.app.MobileQQ;

public class jdh
  implements Runnable
{
  public jdh(JumpActivity paramJumpActivity, Bundle paramBundle)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    jdField_a_of_type_AndroidOsBundle.getString("android.intent.extra.TITLE");
    jdField_a_of_type_AndroidOsBundle.getString("android.intent.extra.SUBJECT");
    Object localObject2 = jdField_a_of_type_AndroidOsBundle.getString("android.intent.extra.TEXT");
    jdField_a_of_type_AndroidOsBundle.getString("image_url");
    jdField_a_of_type_AndroidOsBundle.getString("detail_url");
    Object localObject1 = jdField_a_of_type_ComTencentMobileqqActivityJumpActivity.getIntent().getType();
    if (TextUtils.isEmpty((CharSequence)localObject1)) {
      return;
    }
    StatisticAssist.a(jdField_a_of_type_ComTencentMobileqqActivityJumpActivity.app.getApplication().getApplicationContext(), jdField_a_of_type_ComTencentMobileqqActivityJumpActivity.app.a(), "dl_share_frd");
    if ((((String)localObject1).startsWith("text")) && (!jdField_a_of_type_AndroidOsBundle.containsKey("android.intent.extra.STREAM")))
    {
      localObject1 = new Intent(jdField_a_of_type_ComTencentMobileqqActivityJumpActivity, ForwardRecentActivity.class);
      ((Intent)localObject1).putExtras(new Bundle());
      ((Intent)localObject1).putExtra("isFromShare", true);
      ((Intent)localObject1).putExtra("k_favorites", true);
      ((Intent)localObject1).putExtra("forward_type", -1);
      ((Intent)localObject1).putExtra("forward_text", (String)localObject2);
      jdField_a_of_type_ComTencentMobileqqActivityJumpActivity.startActivity((Intent)localObject1);
    }
    for (;;)
    {
      localObject1 = jdField_a_of_type_ComTencentMobileqqActivityJumpActivity.getIntent().getScheme();
      if ((TextUtils.isEmpty((CharSequence)localObject1)) || (!((String)localObject1).equals("geo"))) {
        break label823;
      }
      localObject1 = new Intent();
      ((Intent)localObject1).putExtras(new Bundle());
      ((Intent)localObject1).putExtra("isFromShare", true);
      ((Intent)localObject1).putExtra("forward_type", -2);
      ((Intent)localObject1).setData(jdField_a_of_type_ComTencentMobileqqActivityJumpActivity.getIntent().getData());
      ForwardBaseOption.a(jdField_a_of_type_ComTencentMobileqqActivityJumpActivity, (Intent)localObject1);
      jdField_a_of_type_ComTencentMobileqqActivityJumpActivity.finish();
      return;
      if (!((String)localObject1).startsWith("message")) {
        break;
      }
      localObject1 = new Intent(jdField_a_of_type_ComTencentMobileqqActivityJumpActivity, ForwardRecentActivity.class);
      ((Intent)localObject1).putExtras(new Bundle());
      ((Intent)localObject1).putExtra("isFromShare", true);
      ((Intent)localObject1).putExtra("k_favorites", true);
      ((Intent)localObject1).putExtra("forward_type", -1);
      ((Intent)localObject1).putExtra("forward_text", (SpannableString)jdField_a_of_type_AndroidOsBundle.get("android.intent.extra.TEXT"));
      jdField_a_of_type_ComTencentMobileqqActivityJumpActivity.startActivity((Intent)localObject1);
      jdField_a_of_type_ComTencentMobileqqActivityJumpActivity.finish();
    }
    if (((String)localObject1).startsWith("image"))
    {
      localObject1 = new Intent(jdField_a_of_type_ComTencentMobileqqActivityJumpActivity, ForwardRecentActivity.class);
      ((Intent)localObject1).putExtra("isFromShare", true);
      ((Intent)localObject1).putExtra("k_favorites", true);
      ((Intent)localObject1).putExtras(new Bundle());
      ((Intent)localObject1).putExtra("forward_type", 1);
      if (jdField_a_of_type_ComTencentMobileqqActivityJumpActivity.getIntent().getAction().equals("android.intent.action.SEND"))
      {
        localObject2 = jdField_a_of_type_AndroidOsBundle.get("android.intent.extra.STREAM");
        if (localObject2 != null) {
          if ((localObject2 instanceof Uri))
          {
            ((Intent)localObject1).setData((Uri)localObject2);
            label482:
            ((Intent)localObject1).putExtra("sendMultiple", false);
          }
        }
      }
      for (;;)
      {
        ((Intent)localObject1).putExtras(jdField_a_of_type_AndroidOsBundle);
        jdField_a_of_type_ComTencentMobileqqActivityJumpActivity.startActivity((Intent)localObject1);
        break;
        if ((localObject2 instanceof String))
        {
          ((Intent)localObject1).setData(Uri.parse((String)localObject2));
          break label482;
        }
        jdField_a_of_type_ComTencentMobileqqActivityJumpActivity.finish();
        return;
        jdField_a_of_type_ComTencentMobileqqActivityJumpActivity.finish();
        return;
        ((Intent)localObject1).putExtra("sendMultiple", true);
        ((Intent)localObject1).putExtra("forward_text", jdField_a_of_type_ComTencentMobileqqActivityJumpActivity.getString(2131369997));
      }
    }
    Object localObject3 = jdField_a_of_type_ComTencentMobileqqActivityJumpActivity.getIntent().getAction();
    localObject2 = new Intent();
    ((Intent)localObject2).putExtra("isFromShare", true);
    ((Intent)localObject2).putExtra("forward_type", 0);
    if (((String)localObject3).equals("android.intent.action.SEND"))
    {
      localObject3 = jdField_a_of_type_AndroidOsBundle.get("android.intent.extra.STREAM");
      if (localObject3 != null) {
        if ((localObject3 instanceof Uri))
        {
          Uri localUri = (Uri)localObject3;
          if (("text/x-vcard".equals(localObject1)) && ("content".equals(localUri.getScheme())))
          {
            ((Intent)localObject2).putExtra("sendMultiple", false);
            ((Intent)localObject2).putExtras(jdField_a_of_type_AndroidOsBundle);
            new jdk(jdField_a_of_type_ComTencentMobileqqActivityJumpActivity, (Intent)localObject2).execute(new Object[] { jdField_a_of_type_ComTencentMobileqqActivityJumpActivity.getApplicationContext(), localUri });
            return;
          }
          ((Intent)localObject2).setData((Uri)localObject3);
          label730:
          ((Intent)localObject2).putExtra("sendMultiple", false);
        }
      }
    }
    for (;;)
    {
      ((Intent)localObject2).putExtras(jdField_a_of_type_AndroidOsBundle);
      ForwardBaseOption.a(jdField_a_of_type_ComTencentMobileqqActivityJumpActivity, (Intent)localObject2);
      break;
      if ((localObject3 instanceof String))
      {
        ((Intent)localObject2).setData(Uri.parse((String)localObject3));
        break label730;
      }
      jdField_a_of_type_ComTencentMobileqqActivityJumpActivity.finish();
      return;
      jdField_a_of_type_ComTencentMobileqqActivityJumpActivity.finish();
      return;
      ((Intent)localObject2).putExtra("sendMultiple", true);
      ((Intent)localObject2).putExtra("forward_text", jdField_a_of_type_ComTencentMobileqqActivityJumpActivity.getString(2131369997));
    }
    label823:
    jdField_a_of_type_ComTencentMobileqqActivityJumpActivity.finish();
  }
}
