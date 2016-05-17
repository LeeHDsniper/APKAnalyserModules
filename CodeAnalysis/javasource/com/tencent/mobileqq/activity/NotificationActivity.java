package com.tencent.mobileqq.activity;

import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.content.BroadcastReceiver;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.content.res.Resources;
import android.os.Bundle;
import android.text.Html;
import android.text.SpannableString;
import android.text.TextUtils;
import android.text.method.LinkMovementMethod;
import android.text.style.ForegroundColorSpan;
import android.view.View;
import android.view.Window;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.TextView;
import com.tencent.ims.signature.SignatureKickData;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.ConfigHandler;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.music.QQPlayerService;
import com.tencent.mobileqq.pb.InvalidProtocolBufferMicroException;
import com.tencent.mobileqq.pb.PBStringField;
import com.tencent.mobileqq.pb.PBUInt32Field;
import com.tencent.mobileqq.utils.DialogUtil;
import com.tencent.mobileqq.utils.QQCustomDialog;
import com.tencent.mobileqq.utils.SecUtil;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import jke;
import jkg;
import jkh;
import jki;
import jkj;
import jkk;
import jkl;
import jkm;
import jkn;
import jko;
import jkp;
import jkq;
import jkr;
import jks;
import jkt;
import jku;
import jkv;
import jkw;
import jkx;
import jkz;
import jla;
import jlb;
import jlc;
import jld;
import jle;
import jlf;
import jlg;
import mqq.app.Constants.LogoutReason;
import org.json.JSONObject;

public class NotificationActivity
  extends BaseActivity
{
  public static final int a = 0;
  public static NotificationActivity a;
  public static final int b = 1;
  public static final int c = 2;
  public static final int d = 3;
  public static final int e = 4;
  private static final String e = "sec_sig_tag";
  public static final int f = 5;
  public static final int g = 6;
  public static final int h = 7;
  public static final int i = 8;
  public static final int j = 9;
  public static final int k = 10;
  private Dialog jdField_a_of_type_AndroidAppDialog = null;
  private BroadcastReceiver jdField_a_of_type_AndroidContentBroadcastReceiver = new jlc(this);
  public String a;
  private Constants.LogoutReason jdField_a_of_type_MqqAppConstants$LogoutReason = Constants.LogoutReason.tips;
  private boolean jdField_a_of_type_Boolean = false;
  private byte[] jdField_a_of_type_ArrayOfByte;
  private String b = null;
  private String c = null;
  private String d = "";
  private int l;
  private int m;
  private final int n = 1;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_ComTencentMobileqqActivityNotificationActivity = null;
  }
  
  public NotificationActivity()
  {
    jdField_a_of_type_JavaLangString = "http://fwd.z.qq.com:8080/forward.jsp?bid=906";
  }
  
  private Dialog a()
  {
    AlertDialog localAlertDialog = new AlertDialog.Builder(this).create();
    localAlertDialog.show();
    Object localObject = localAlertDialog.getWindow();
    ((Window)localObject).setContentView(2130903415);
    Button localButton1 = (Button)((Window)localObject).findViewById(2131298459);
    Button localButton2 = (Button)((Window)localObject).findViewById(2131298458);
    localObject = (TextView)((Window)localObject).findViewById(2131298453);
    if ((localButton1 == null) || (localObject == null)) {
      return null;
    }
    ((TextView)localObject).setText(getString(2131368953) + "6.3.3" + getString(2131368954));
    localButton1.setOnClickListener(new jkx(this));
    localButton2.setOnClickListener(new jkz(this));
    return localAlertDialog;
  }
  
  private void a(int paramInt)
  {
    int i2 = 1;
    int i1 = -1;
    if ((jdField_a_of_type_AndroidAppDialog != null) && (jdField_a_of_type_AndroidAppDialog.isShowing())) {
      jdField_a_of_type_AndroidAppDialog.dismiss();
    }
    jdField_a_of_type_AndroidAppDialog = null;
    label471:
    int i3;
    switch (paramInt)
    {
    default: 
    case 0: 
    case 1: 
    case 2: 
    case 3: 
      for (;;)
      {
        sendBroadcast(new Intent("before_account_change"));
        if ((jdField_a_of_type_AndroidAppDialog != null) && (!jdField_a_of_type_AndroidAppDialog.isShowing()) && (!isFinishing()))
        {
          jdField_a_of_type_AndroidAppDialog.setCancelable(false);
          jdField_a_of_type_AndroidAppDialog.show();
        }
        return;
        jdField_a_of_type_AndroidAppDialog = DialogUtil.a(this, 230).setTitle(getString(2131367778)).setMessage(getString(2131367780)).setPositiveButton(2131367498, new jle(this)).setNegativeButton(2131368511, new jld(this));
        continue;
        b = getString(2131367779);
        c = getString(2131367781);
        jdField_a_of_type_AndroidAppDialog = DialogUtil.a(this, 230).setTitle(b).setMessage(c).setPositiveButton(17039370, new jlf(this));
        continue;
        TextView localTextView = new TextView(this);
        localTextView.setLinksClickable(true);
        localTextView.setMovementMethod(LinkMovementMethod.getInstance());
        localTextView.setTextSize(getResources().getInteger(2131623938));
        localTextView.setTextColor(getResources().getColor(2131427355));
        if ((b != null) && (b.equals("true"))) {}
        for (;;)
        {
          try
          {
            String str1 = getPackageName();
            localTextView.setText(c);
            jdField_a_of_type_AndroidAppDialog = DialogUtil.a(this, 230).setMessage(c).addView(localTextView).setPositiveButton(2131371270, new jlg(this, str1), false);
            paramInt = i2;
            if (paramInt != 0) {
              break;
            }
            if (TextUtils.isEmpty(c)) {
              break label471;
            }
            localTextView.setText(Html.fromHtml(c));
            jdField_a_of_type_AndroidAppDialog = DialogUtil.a(this, 230).setMessage(c).addView(localTextView).setPositiveButton(2131367498, new jkg(this));
          }
          catch (Exception localException2)
          {
            localException2.printStackTrace();
          }
          paramInt = 0;
          continue;
          localTextView.setText(Html.fromHtml(getString(2131367217)));
        }
        try
        {
          jdField_a_of_type_AndroidAppDialog = a();
        }
        catch (Exception localException1)
        {
          a();
        }
      }
    case 5: 
      if (QQPlayerService.a()) {
        sendBroadcast(new Intent("qqplayer_exit_action"));
      }
      paramInt = 2131366997;
      if (jdField_a_of_type_MqqAppConstants$LogoutReason != Constants.LogoutReason.kicked) {
        paramInt = 2131370327;
      }
      if (c != null)
      {
        i3 = c.indexOf("http://110.qq.com/");
        i2 = i3;
        if (i3 > 0) {
          i1 = "http://110.qq.com/".length() + i3;
        }
      }
      break;
    }
    for (i2 = i3;; i2 = -1)
    {
      if (c != null) {}
      for (Object localObject1 = c;; localObject1 = "")
      {
        localObject1 = new SpannableString((CharSequence)localObject1);
        if ((i2 > 0) && (i1 > i2)) {
          ((SpannableString)localObject1).setSpan(new ForegroundColorSpan(getResources().getColor(2131427450)), i2, i1, 33);
        }
        jdField_a_of_type_AndroidAppDialog = DialogUtil.a(this, 230).setTitle(b).setMessage((CharSequence)localObject1).setNegativeButton(paramInt, new jkh(this));
        if (jdField_a_of_type_MqqAppConstants$LogoutReason == Constants.LogoutReason.kicked) {
          break;
        }
        ((QQCustomDialog)jdField_a_of_type_AndroidAppDialog).setPositiveButton(2131367234, new jki(this));
        break;
      }
      jdField_a_of_type_AndroidAppDialog = DialogUtil.a(this, 230).setTitle(b).setMessage(c).setPositiveButton(17039370, new jkj(this));
      break;
      jdField_a_of_type_AndroidAppDialog = DialogUtil.a(this, 230).setTitle(b).setMessage(c).setPositiveButton(17039370, new jkk(this));
      break;
      jdField_a_of_type_AndroidAppDialog = DialogUtil.a(this, 230).setTitle(getString(2131369047)).setMessage(getString(2131369050)).setPositiveButton(getString(2131369048), new jkm(this)).setNegativeButton(getString(2131369049), new jkl(this));
      break;
      if (m == 40)
      {
        jdField_a_of_type_AndroidAppDialog = DialogUtil.a(getActivity(), 231, getString(2131370314), c, 2131370313, 2131370312, new jkn(this), new jko(this));
        break;
      }
      switch (m)
      {
      default: 
        jdField_a_of_type_AndroidAppDialog = DialogUtil.b(this, 230).setMessageWithUrl(c).setTitle(getString(2131367861)).setPositiveButton(17039370, new jks(this));
        break;
      case 41: 
      case 116: 
        if (m == 41) {}
        for (localObject1 = getString(2131369051);; localObject1 = getString(2131369052))
        {
          str2 = getString(2131369061);
          jdField_a_of_type_AndroidAppDialog = DialogUtil.a(this, 230).setMessage((CharSequence)localObject1).setTitle(str2).setNegativeButton(2131369053, new jkr(this)).setPositiveButton(2131369054, new jkp(this));
          break;
        }
        Object localObject2 = getIntent().getExtras();
        localObject1 = ((Bundle)localObject2).getString("dlg_title");
        String str2 = ((Bundle)localObject2).getString("dlg_content");
        String str3 = ((Bundle)localObject2).getString("dlg_lbutton");
        String str4 = ((Bundle)localObject2).getString("dlg_rbutton");
        localObject2 = ((Bundle)localObject2).getString("dlg_url");
        jdField_a_of_type_AndroidAppDialog = DialogUtil.a(this, 230).setTitle((String)localObject1).setMessage(str2).setPositiveButton(str4, new jku(this, (String)localObject2)).setNegativeButton(str3, new jkt(this));
        break;
        localObject1 = getResources().getString(2131370804);
        str2 = getResources().getString(2131370805);
        str3 = getResources().getString(2131370808);
        str4 = getResources().getString(2131370807);
        Object localObject3 = getResources().getString(2131370806);
        localObject2 = new CheckBox(this);
        ((CheckBox)localObject2).setText((CharSequence)localObject3);
        ((CheckBox)localObject2).setTextSize(getResources().getInteger(2131623938));
        ((CheckBox)localObject2).setTextColor(getResources().getColor(2131427355));
        localObject3 = app.a().getSharedPreferences(app.getAccount(), 0);
        boolean bool = ((SharedPreferences)localObject3).getBoolean("MemoryAlertAutoClear", false);
        ((CheckBox)localObject2).setChecked(bool);
        jdField_a_of_type_AndroidAppDialog = DialogUtil.a(this, 230).setTitle((String)localObject1).setMessage(str2).setView((View)localObject2).setPositiveButton(str4, new jkw(this, (CheckBox)localObject2, bool, (SharedPreferences)localObject3)).setNegativeButton(str3, new jkv(this, (CheckBox)localObject2, bool, (SharedPreferences)localObject3));
        break;
      }
    }
  }
  
  private void b()
  {
    if (QLog.isColorLevel()) {
      QLog.d("VideoController", 2, "send broadcast:NewIntent.ACTION_ACCOUNT_KICKED");
    }
    Intent localIntent = new Intent();
    if (localIntent != null)
    {
      localIntent.setAction("mqq.intent.action.ACCOUNT_KICKED");
      app.a().sendBroadcast(localIntent);
    }
  }
  
  private void b(int paramInt)
  {
    if ((paramInt != 41) && (paramInt != 116)) {
      return;
    }
    Object localObject;
    Intent localIntent;
    if (jdField_a_of_type_ArrayOfByte == null)
    {
      localObject = "http://haoma.qq.com/m/expire.html?num=" + d;
      localIntent = new Intent(this, QQBrowserActivity.class);
      localIntent.putExtra("url", (String)localObject);
      startActivity(localIntent);
      finish();
      return;
    }
    for (;;)
    {
      try
      {
        localObject = new JSONObject();
        ((JSONObject)localObject).put("unit", "月");
        ((JSONObject)localObject).put("userId", d);
        ((JSONObject)localObject).put("openMonth", "3");
        ((JSONObject)localObject).put("offerId", "1450000833");
        ((JSONObject)localObject).put("aid", "mvip.gongneng.android.haoma_03");
        ((JSONObject)localObject).put("ticketValue", SecUtil.toHexString(jdField_a_of_type_ArrayOfByte));
        ((JSONObject)localObject).put("ticketName", "vask_27");
        switch (paramInt)
        {
        case 41: 
          localIntent = new Intent(this, PayBridgeActivity.class);
          Bundle localBundle = new Bundle();
          localBundle.putString("json", ((JSONObject)localObject).toString());
          localBundle.putString("callbackSn", "0");
          localIntent.putExtras(localBundle);
          localIntent.putExtra("payparmas_from_is_login_state", false);
          localIntent.putExtra("pay_requestcode", 4);
          startActivityForResult(localIntent, 1);
          return;
        }
      }
      catch (Exception localException)
      {
        localException.printStackTrace();
        finish();
        return;
      }
      localException.put("serviceCode", "LTMCLUB");
      localException.put("serviceName", "QQ会员");
      continue;
      localException.put("serviceCode", "CJCLUBT");
      localException.put("serviceName", "QQ超级会员");
    }
  }
  
  private void c()
  {
    ConfigHandler localConfigHandler = (ConfigHandler)app.a(4);
    if (localConfigHandler != null) {
      localConfigHandler.a();
    }
  }
  
  public void a()
  {
    sendBroadcast(new Intent("qqplayer_exit_action"));
    finish();
    app.b(false);
  }
  
  protected void doOnActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    if (paramInt1 == 1) {
      finish();
    }
  }
  
  protected boolean doOnCreate(Bundle paramBundle)
  {
    mActNeedImmersive = false;
    super.doOnCreate(paramBundle);
    setContentView(2130903414);
    Object localObject = "";
    paramBundle = (Bundle)localObject;
    try
    {
      l = getIntent().getIntExtra("type", 0);
      paramBundle = (Bundle)localObject;
      localObject = getIntent().getAction();
      paramBundle = (Bundle)localObject;
      if (QLog.isColorLevel())
      {
        paramBundle = (Bundle)localObject;
        QLog.d("NotificationActivity", 2, "NotificationActivity action = " + (String)localObject);
      }
      paramBundle = (Bundle)localObject;
      if (!"mqq.intent.action.ACCOUNT_EXPIRED".equals(localObject)) {
        break label318;
      }
      paramBundle = (Bundle)localObject;
      l = 1;
      paramBundle = (Bundle)localObject;
      c();
    }
    catch (Exception localException)
    {
      try
      {
        do
        {
          for (;;)
          {
            String str;
            paramBundle.mergeFrom((byte[])localObject);
            if (paramBundle.has()) {
              break label454;
            }
            return false;
            paramBundle = (Bundle)localObject;
            if ("mqq.intent.action.ACCOUNT_TIPS".equals(localObject))
            {
              paramBundle = (Bundle)localObject;
              l = 6;
              continue;
              localException = localException;
              localObject = paramBundle;
              paramBundle = (Bundle)localObject;
              if (QLog.isColorLevel())
              {
                QLog.e("NotificationActivity", 2, "doOnCreate exception", localException);
                paramBundle = (Bundle)localObject;
              }
            }
            else
            {
              paramBundle = (Bundle)localObject;
              if ("mqq.intent.action.ACCOUNT_KICKED".equals(localObject))
              {
                paramBundle = (Bundle)localObject;
                b();
                paramBundle = (Bundle)localObject;
                c();
                paramBundle = (Bundle)localObject;
                l = 5;
              }
              else
              {
                paramBundle = (Bundle)localObject;
                if (!"mqq.intent.action.GRAY".equals(localObject)) {
                  break;
                }
                paramBundle = (Bundle)localObject;
                l = 2;
              }
            }
          }
          paramBundle = (Bundle)localObject;
        } while (!"mqq.intent.action.SUSPEND".equals(localObject));
        paramBundle = (Bundle)localObject;
        l = 4;
      }
      catch (InvalidProtocolBufferMicroException localInvalidProtocolBufferMicroException)
      {
        for (;;)
        {
          localInvalidProtocolBufferMicroException.printStackTrace();
        }
        if ((str_left_button.has()) && (str_packname.has()) && (u32_check_result.has()) && (str_right_button.has()) && (str_url.has())) {
          break label521;
        }
        if (!QLog.isColorLevel()) {
          break label519;
        }
        QLog.d("sec_sig_tag", 2, "NotificationActivity:package fail");
        return false;
        ThreadManager.a(new jkq(this, u32_check_result.get()), 5, null, false);
        jdField_a_of_type_AndroidAppDialog = DialogUtil.a(this, 230).setTitle(b).setMessage(c).setPositiveButton(str_right_button.get(), new jlb(this, paramBundle)).setNegativeButton(str_left_button.get(), new jla(this));
        if ((jdField_a_of_type_AndroidAppDialog == null) || (jdField_a_of_type_AndroidAppDialog.isShowing()) || (isFinishing())) {
          break label643;
        }
        jdField_a_of_type_AndroidAppDialog.setCancelable(false);
        jdField_a_of_type_AndroidAppDialog.show();
        return true;
      }
    }
    paramBundle = (Bundle)localObject;
    b = getIntent().getStringExtra("title");
    paramBundle = (Bundle)localObject;
    c = getIntent().getStringExtra("msg");
    paramBundle = (Bundle)localObject;
    d = getIntent().getStringExtra("loginalias");
    paramBundle = (Bundle)localObject;
    jdField_a_of_type_ArrayOfByte = getIntent().getByteArrayExtra("expiredSig");
    paramBundle = (Bundle)localObject;
    m = getIntent().getIntExtra("loginret", 0);
    paramBundle = (Bundle)localObject;
    jdField_a_of_type_MqqAppConstants$LogoutReason = ((Constants.LogoutReason)getIntent().getSerializableExtra("reason"));
    paramBundle = (Bundle)localObject;
    str = getIntent().getStringExtra("securityScan");
    if (str != null)
    {
      paramBundle = (Bundle)localObject;
      if ("security_scan".equals(str))
      {
        paramBundle = (Bundle)localObject;
        l = 7;
      }
    }
    paramBundle = (Bundle)localObject;
    if (("mqq.intent.action.ACCOUNT_KICKED".equals(paramBundle)) && (jdField_a_of_type_MqqAppConstants$LogoutReason == Constants.LogoutReason.secKicked))
    {
      if (QLog.isColorLevel()) {
        QLog.d("sec_sig_tag", 2, "NotificationActivity:sec kick");
      }
      localObject = getIntent().getByteArrayExtra("data");
      paramBundle = new signature.SignatureKickData();
    }
    label318:
    label454:
    label519:
    label521:
    label643:
    a(l);
    registerReceiver(jdField_a_of_type_AndroidContentBroadcastReceiver, new IntentFilter("com.tencent.mobileqq.closeNotification"));
    return false;
  }
  
  protected void doOnDestroy()
  {
    unregisterReceiver(jdField_a_of_type_AndroidContentBroadcastReceiver);
    if ((jdField_a_of_type_AndroidAppDialog != null) && (jdField_a_of_type_AndroidAppDialog.isShowing())) {
      jdField_a_of_type_AndroidAppDialog.dismiss();
    }
    jdField_a_of_type_AndroidAppDialog = null;
    super.doOnDestroy();
    if (jdField_a_of_type_ComTencentMobileqqActivityNotificationActivity == this) {
      jdField_a_of_type_ComTencentMobileqqActivityNotificationActivity = null;
    }
  }
  
  protected void doOnResume()
  {
    super.doOnResume();
    if ((jdField_a_of_type_Boolean) && (jdField_a_of_type_AndroidAppDialog != null) && (jdField_a_of_type_AndroidAppDialog.isShowing())) {
      ((QQCustomDialog)jdField_a_of_type_AndroidAppDialog).setPositiveButton(2131371271, new jke(this));
    }
  }
  
  protected void doOnUserLeaveHint()
  {
    super.doOnUserLeaveHint();
    if (l == 3) {
      a();
    }
  }
  
  public void finish()
  {
    if ((jdField_a_of_type_AndroidAppDialog != null) && (jdField_a_of_type_AndroidAppDialog.isShowing())) {
      jdField_a_of_type_AndroidAppDialog.dismiss();
    }
    jdField_a_of_type_AndroidAppDialog = null;
    super.finish();
    if (jdField_a_of_type_ComTencentMobileqqActivityNotificationActivity == this) {
      jdField_a_of_type_ComTencentMobileqqActivityNotificationActivity = null;
    }
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    jdField_a_of_type_ComTencentMobileqqActivityNotificationActivity = this;
  }
  
  protected void onLogout(Constants.LogoutReason paramLogoutReason) {}
}
