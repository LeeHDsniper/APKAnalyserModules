package cooperation.qwallet.open;

import android.content.Intent;
import android.os.Bundle;
import android.os.SystemClock;
import android.text.TextUtils;
import com.tencent.mobileqq.activity.LoginActivity;
import com.tencent.mobileqq.activity.PayBridgeActivity;
import com.tencent.mobileqq.activity.qwallet.report.VACDReportUtil;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.gesturelock.GesturePWDUtils;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.DeviceInfoUtil;
import com.tencent.qphone.base.util.QLog;

public class AppPayActivity
  extends BaseActivity
{
  public static final int a = 21;
  private boolean a;
  
  public AppPayActivity()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = false;
  }
  
  private void a()
  {
    if (QLog.isColorLevel()) {
      QLog.i("Q.qwallet.pay", 2, "" + System.currentTimeMillis() + " AppPayActivity.prePay");
    }
    Object localObject = super.getIntent();
    if ((localObject != null) && (!TextUtils.isEmpty(((Intent)localObject).getAction())) && (((Intent)localObject).getAction().equals("android.intent.action.VIEW")) && (!TextUtils.isEmpty(((Intent)localObject).getScheme())) && (((Intent)localObject).getScheme().equals("mqqwallet")))
    {
      a(true);
      return;
    }
    if (localObject == null) {}
    String str;
    for (localObject = "intent is null";; localObject = str + " Action:" + ((Intent)localObject).getAction())
    {
      PayBridgeActivity.a(app, -1, 4, (String)localObject, "AppPayAct.prePay parameters error.");
      if (QLog.isColorLevel()) {
        QLog.e("Q.qwallet.pay", 2, "AppPayActivity.prePay error, params:" + (String)localObject);
      }
      super.finish();
      return;
      str = "Scheme:" + ((Intent)localObject).getScheme();
    }
  }
  
  private void a(Intent paramIntent)
  {
    if (paramIntent == null) {
      return;
    }
    long l = VACDReportUtil.a(null, "qqwallet", "pay-open-app", "payinvoke", null, 0, null);
    Object localObject = new cooperation.qwallet.open.openpay.PayApi();
    try
    {
      ((cooperation.qwallet.open.openpay.PayApi)localObject).b(paramIntent.getExtras());
      boolean bool = ((cooperation.qwallet.open.openpay.PayApi)localObject).a();
      paramIntent = ((cooperation.qwallet.open.openpay.PayApi)localObject).toString();
      paramIntent = paramIntent + "&check=" + bool;
      PayBridgeActivity.a(app, 4, paramIntent);
      if (QLog.isColorLevel()) {
        QLog.i("Q.qwallet.pay", 2, "" + System.currentTimeMillis() + " AppPayActivity.doOpenPay data:" + paramIntent);
      }
      if (bool)
      {
        VACDReportUtil.a(l, i, "parseurl", paramIntent, 0, null);
        paramIntent = new Bundle();
        paramIntent.putInt("extra.key.pay.type", 1);
        paramIntent.putInt("extra.key.pay.from", 2);
        paramIntent.putInt("extra.key.pay.platform", 1);
        paramIntent.putLong("vacreport_key_seq", l);
        paramIntent.putString("appId", jdField_a_of_type_JavaLangString);
        paramIntent.putString("callbackSn", e);
        paramIntent.putString("nonce", j);
        paramIntent.putLong("timeStamp", jdField_a_of_type_Long);
        paramIntent.putString("sig", m);
        paramIntent.putString("sigType", l);
        paramIntent.putString("tokenId", i);
        paramIntent.putString("pubAcc", g);
        paramIntent.putString("pubAccHint", h);
        paramIntent.putString("bargainorId", k);
        paramIntent.putString("qVersion", DeviceInfoUtil.a(this));
        paramIntent.putString("packageName", n);
        paramIntent.putString("callbackScheme", f);
        localObject = new Intent(this, OpenPayActivity.class);
        ((Intent)localObject).putExtras(paramIntent);
        ((Intent)localObject).addFlags(67108864);
        super.startActivity((Intent)localObject);
        super.finish();
        return;
      }
    }
    catch (Exception paramIntent)
    {
      for (;;)
      {
        paramIntent.printStackTrace();
        continue;
        VACDReportUtil.a(l, "parseurl", paramIntent, 668801, "params error");
      }
    }
  }
  
  private void a(boolean paramBoolean)
  {
    Intent localIntent = super.getIntent();
    if (localIntent == null) {
      if (QLog.isColorLevel()) {
        QLog.i("Q.qwallet.pay", 2, "" + System.currentTimeMillis() + " AppPayActivity.doPay intent == null");
      }
    }
    Object localObject;
    do
    {
      do
      {
        return;
        if (QLog.isColorLevel()) {
          QLog.i("Q.qwallet.pay", 2, "" + System.currentTimeMillis() + " AppPayActivity.doPay");
        }
        if ((!paramBoolean) || (app.isLogin())) {
          break;
        }
        localObject = new Intent(this, LoginActivity.class);
        ((Intent)localObject).putExtra("isActionSend", true);
        ((Intent)localObject).putExtras(localIntent);
        super.startActivityForResult((Intent)localObject, 21);
      } while (!QLog.isColorLevel());
      QLog.i("Q.qwallet.pay", 2, "" + System.currentTimeMillis() + " AppPayActivity.doPay login");
      return;
      localObject = null;
      try
      {
        String str = localIntent.getDataString();
        localObject = str;
      }
      catch (Exception localException)
      {
        for (;;)
        {
          localException.printStackTrace();
        }
        if ("mqqwallet://open_pay/".compareTo((String)localObject) != 0) {
          continue;
        }
        a(localIntent);
        return;
        if ("mqqwallet://pubacc_pay/".compareTo((String)localObject) != 0) {
          continue;
        }
        b(localIntent);
        return;
        PayBridgeActivity.a(app, -1, 4, (String)localObject, "AppPayAct.doPay url not THIRD_APP.");
      }
      if ((TextUtils.isEmpty((CharSequence)localObject)) || (((String)localObject).length() <= 9))
      {
        PayBridgeActivity.a(app, -1, 4, (String)localObject, "AppPayAct.doPay url error.");
        if (QLog.isColorLevel()) {
          QLog.e("Q.qwallet.pay", 2, "AppPayActivity.doPay url error:" + (String)localObject);
        }
        super.finish();
        return;
      }
    } while (!QLog.isColorLevel());
    QLog.e("Q.qwallet.pay", 2, "AppPayActivity.doPay url not THIRD_APP:" + (String)localObject);
  }
  
  private void b(Intent paramIntent)
  {
    if (paramIntent == null) {
      return;
    }
    long l = VACDReportUtil.a(null, "qqwallet", "pay-app", "payinvoke", null, 0, null);
    Object localObject = new cooperation.qwallet.open.pubaccpay.PayApi();
    try
    {
      ((cooperation.qwallet.open.pubaccpay.PayApi)localObject).b(paramIntent.getExtras());
      boolean bool = ((cooperation.qwallet.open.pubaccpay.PayApi)localObject).a();
      paramIntent = ((cooperation.qwallet.open.pubaccpay.PayApi)localObject).toString();
      paramIntent = paramIntent + "&check=" + bool;
      PayBridgeActivity.a(app, 7, paramIntent);
      if (QLog.isColorLevel()) {
        QLog.i("Q.qwallet.pay", 2, "" + System.currentTimeMillis() + " AppPayActivity.doPubAccPay data:" + paramIntent);
      }
      if (bool)
      {
        VACDReportUtil.a(l, i, "parseurl", paramIntent, 0, null);
        paramIntent = new Bundle();
        paramIntent.putInt("extra.key.pay.type", 1);
        paramIntent.putInt("extra.key.pay.from", 2);
        paramIntent.putInt("extra.key.pay.platform", 2);
        paramIntent.putLong("vacreport_key_seq", l);
        paramIntent.putString("appId", f);
        paramIntent.putString("callbackSn", d);
        paramIntent.putString("nonce", h);
        paramIntent.putString("timeStampStr", g);
        paramIntent.putString("packageValue", i);
        paramIntent.putString("sig", k);
        paramIntent.putString("sigType", j);
        paramIntent.putString("qVersion", DeviceInfoUtil.a(this));
        paramIntent.putString("packageName", l);
        paramIntent.putString("callbackScheme", e);
        localObject = new Intent(this, OpenPayActivity.class);
        ((Intent)localObject).putExtras(paramIntent);
        ((Intent)localObject).addFlags(67108864);
        super.startActivity((Intent)localObject);
        super.finish();
        return;
      }
    }
    catch (Exception paramIntent)
    {
      for (;;)
      {
        paramIntent.printStackTrace();
        continue;
        VACDReportUtil.a(l, "parseurl", paramIntent, 668801, "params error");
      }
    }
  }
  
  protected void doOnActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    super.doOnActivityResult(paramInt1, paramInt2, paramIntent);
    if (paramInt2 == -1) {}
    switch (paramInt1)
    {
    default: 
      return;
    }
    if (QLog.isColorLevel()) {
      QLog.i("Q.qwallet.pay", 2, "" + System.currentTimeMillis() + " AppPayActivity.doOnActivityResult PAY_LOGIN_REQUEST");
    }
    a(false);
  }
  
  protected boolean doOnCreate(Bundle paramBundle)
  {
    mNeedStatusTrans = true;
    mActNeedImmersive = false;
    try
    {
      super.doOnCreate(paramBundle);
      if (QLog.isColorLevel()) {
        QLog.i("Q.qwallet.pay", 2, "" + System.currentTimeMillis() + " AppPayActivity.doOnCreate");
      }
      if ((mAppForground) || (!mCanLock) || (app == null) || (app.a() == null) || (!GesturePWDUtils.getJumpLock(this, app.a()))) {
        break label184;
      }
      if (QLog.isColorLevel()) {
        QLog.i("Q.qwallet.pay", 2, "" + System.currentTimeMillis() + " AppPayActivity.doOnCreate getJumpLock");
      }
      a = true;
    }
    catch (Exception paramBundle)
    {
      while (!QLog.isColorLevel()) {}
      QLog.e("qqBaseActivity", 2, "doOnCreate|exp:" + paramBundle.getMessage());
      return false;
    }
    return false;
    label184:
    a();
    return false;
  }
  
  protected void doOnResume()
  {
    super.doOnResume();
    if ((a) && (Math.abs(mShowGesture - SystemClock.uptimeMillis()) >= 1000L))
    {
      a = false;
      a();
    }
  }
  
  protected void requestWindowFeature(Intent paramIntent)
  {
    super.requestWindowFeature(1);
  }
}
