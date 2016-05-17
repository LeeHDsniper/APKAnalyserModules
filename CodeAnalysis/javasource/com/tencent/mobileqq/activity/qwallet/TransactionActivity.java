package com.tencent.mobileqq.activity.qwallet;

import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.Handler;
import android.os.ResultReceiver;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.util.DisplayMetrics;
import android.view.KeyEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.Window;
import android.view.inputmethod.InputMethodManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;
import com.tencent.mobileqq.activity.PayBridgeActivity;
import com.tencent.mobileqq.activity.qwallet.report.VACDReportUtil;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.FriendListObserver;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.mqsafeedit.BaseApplication;
import com.tencent.mobileqq.statistics.StatisticCollector;
import com.tencent.mobileqq.util.CommonUtil;
import com.tencent.mobileqq.util.FaceDrawable;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.widget.immersive.ImmersiveUtils;
import cooperation.qwallet.plugin.QWalletPayProgressDialog;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import mdv;
import mdw;
import mdx;
import mdy;
import mdz;
import org.json.JSONException;
import org.json.JSONObject;

public class TransactionActivity
  extends BaseActivity
  implements View.OnClickListener
{
  private int jdField_a_of_type_Int;
  private long jdField_a_of_type_Long;
  private Context jdField_a_of_type_AndroidContentContext;
  private ResultReceiver jdField_a_of_type_AndroidOsResultReceiver;
  protected TextWatcher a;
  private View jdField_a_of_type_AndroidViewView;
  private Button jdField_a_of_type_AndroidWidgetButton;
  private EditText jdField_a_of_type_AndroidWidgetEditText;
  private ImageView jdField_a_of_type_AndroidWidgetImageView;
  private TextView jdField_a_of_type_AndroidWidgetTextView;
  private Toast jdField_a_of_type_AndroidWidgetToast;
  FriendListObserver jdField_a_of_type_ComTencentMobileqqAppFriendListObserver;
  private QWalletPayProgressDialog jdField_a_of_type_CooperationQwalletPluginQWalletPayProgressDialog;
  private String jdField_a_of_type_JavaLangString;
  private boolean jdField_a_of_type_Boolean;
  private View jdField_b_of_type_AndroidViewView;
  private Button jdField_b_of_type_AndroidWidgetButton;
  private EditText jdField_b_of_type_AndroidWidgetEditText;
  private TextView jdField_b_of_type_AndroidWidgetTextView;
  private String jdField_b_of_type_JavaLangString;
  private boolean jdField_b_of_type_Boolean;
  private View jdField_c_of_type_AndroidViewView;
  private EditText jdField_c_of_type_AndroidWidgetEditText;
  private TextView jdField_c_of_type_AndroidWidgetTextView;
  private String jdField_c_of_type_JavaLangString;
  private boolean jdField_c_of_type_Boolean;
  private View jdField_d_of_type_AndroidViewView;
  private EditText jdField_d_of_type_AndroidWidgetEditText;
  private TextView jdField_d_of_type_AndroidWidgetTextView;
  private String jdField_d_of_type_JavaLangString;
  private EditText jdField_e_of_type_AndroidWidgetEditText;
  private String jdField_e_of_type_JavaLangString;
  private String f;
  private String g;
  private String h;
  private String i;
  private String j;
  private String k;
  private String l;
  private String m;
  private String n;
  
  public TransactionActivity()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_AndroidTextTextWatcher = new mdv(this);
    jdField_c_of_type_Boolean = false;
    jdField_a_of_type_ComTencentMobileqqAppFriendListObserver = new mdz(this);
  }
  
  private String a(String paramString)
  {
    if (TextUtils.isEmpty(paramString)) {
      return null;
    }
    try
    {
      paramString = new BigDecimal(paramString);
      BigDecimal localBigDecimal = new BigDecimal("100");
      paramString = new DecimalFormat("#").format(paramString.multiply(localBigDecimal).doubleValue());
      return paramString;
    }
    catch (Exception paramString) {}
    return "";
  }
  
  public static String a(String paramString1, String paramString2, int paramInt)
  {
    if (paramInt < 0) {
      return "0";
    }
    try
    {
      paramString1 = new BigDecimal(paramString1);
      paramString2 = new BigDecimal(paramString2);
      paramString1 = new DecimalFormat("#0.00").format(paramString1.divide(paramString2, paramInt, 4).doubleValue());
      return paramString1;
    }
    catch (Exception paramString1)
    {
      paramString1.printStackTrace();
    }
    return "0";
  }
  
  private void a(String paramString)
  {
    if (!jdField_b_of_type_Boolean) {
      return;
    }
    try
    {
      JSONObject localJSONObject = new JSONObject();
      localJSONObject.put("TargetUin", f);
      localJSONObject.put("PayeeNick", jdField_b_of_type_JavaLangString);
      localJSONObject.put("pay_status", paramString);
      localJSONObject.put("ComeFrom", jdField_a_of_type_Int);
      paramString = new JSONObject();
      paramString.put("userId", jdField_a_of_type_JavaLangString);
      paramString.put("viewTag", "transferPush");
      paramString.put("comeForm", jdField_a_of_type_Int);
      paramString.put("appInfo", j);
      paramString.put("extra_data", localJSONObject.toString());
      PayBridgeActivity.tenpay(this, paramString.toString(), 5, "0");
      return;
    }
    catch (JSONException paramString)
    {
      paramString.printStackTrace();
      return;
    }
    catch (Exception paramString)
    {
      paramString.printStackTrace();
    }
  }
  
  private boolean a(String paramString)
  {
    if (TextUtils.isEmpty(paramString)) {}
    for (;;)
    {
      return false;
      if ((paramString.indexOf('.') != 0) && ((paramString.indexOf('.') <= 0) || (paramString.indexOf('.') >= paramString.length() - 3))) {
        try
        {
          double d1 = Double.valueOf(paramString).doubleValue();
          if (d1 > 0.0D) {
            return true;
          }
        }
        catch (Exception paramString) {}
      }
    }
    return false;
  }
  
  private void b(String paramString)
  {
    try
    {
      JSONObject localJSONObject = new JSONObject();
      localJSONObject.put("tokenId", paramString);
      localJSONObject.put("comeForm", jdField_a_of_type_Int);
      localJSONObject.put("h5_success", true);
      localJSONObject.put("appInfo", j);
      paramString = new Bundle();
      paramString.putString("json", localJSONObject.toString());
      paramString.putString("callbackSn", "0");
      paramString.putLong("vacreport_key_seq", jdField_a_of_type_Long);
      PayBridgeActivity.a(this, 9, paramString);
      return;
    }
    catch (JSONException paramString)
    {
      paramString.printStackTrace();
      return;
    }
    catch (Exception paramString)
    {
      paramString.printStackTrace();
    }
  }
  
  private void c()
  {
    try
    {
      JSONObject localJSONObject1 = new JSONObject();
      localJSONObject1.put("PayeeUin", f);
      localJSONObject1.put("PayeeNick", jdField_d_of_type_JavaLangString);
      if (!TextUtils.isEmpty(jdField_e_of_type_JavaLangString))
      {
        localJSONObject1.put("Amout", a(jdField_e_of_type_JavaLangString));
        localJSONObject1.put("Memo", n);
      }
      for (;;)
      {
        localJSONObject1.put("ComeFrom", jdField_a_of_type_Int);
        localJSONObject1.put("HistransSign", jdField_c_of_type_JavaLangString);
        localJSONObject1.put("source", m);
        JSONObject localJSONObject2 = new JSONObject();
        localJSONObject2.put("userId", jdField_a_of_type_JavaLangString);
        localJSONObject2.put("viewTag", "transferInfor");
        localJSONObject2.put("comeForm", jdField_a_of_type_Int);
        localJSONObject2.put("appInfo", j);
        localJSONObject2.put("extra_data", localJSONObject1.toString());
        PayBridgeActivity.tenpay(this, localJSONObject2.toString(), 5, "0");
        return;
        localJSONObject1.put("Amout", a(jdField_a_of_type_AndroidWidgetEditText.getText().toString()));
        localJSONObject1.put("Memo", jdField_c_of_type_AndroidWidgetEditText.getText().toString());
      }
      return;
    }
    catch (JSONException localJSONException)
    {
      localJSONException.printStackTrace();
      return;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
  }
  
  public int a(Context paramContext)
  {
    try
    {
      int i1 = paramContext.getResources().getDimensionPixelSize(2131492908);
      float f1 = getResourcesgetDisplayMetricsdensity;
      return i1 - (int)(f1 * 5.0F);
    }
    catch (Exception paramContext) {}
    return 0;
  }
  
  protected void a()
  {
    setContentView(2130903806);
    Object localObject = (LinearLayout)findViewById(2131296923);
    if (ImmersiveUtils.isSupporImmersive() == 1)
    {
      ((LinearLayout)localObject).setFitsSystemWindows(true);
      ((LinearLayout)localObject).setPadding(0, ImmersiveUtils.a(this), 0, 0);
    }
    jdField_c_of_type_AndroidViewView = findViewById(2131300181);
    jdField_d_of_type_AndroidViewView = findViewById(2131300184);
    jdField_a_of_type_AndroidViewView = findViewById(2131299226);
    jdField_b_of_type_AndroidViewView = findViewById(2131299874);
    jdField_a_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131297035));
    jdField_a_of_type_AndroidWidgetTextView.setVisibility(0);
    jdField_a_of_type_AndroidWidgetTextView.setOnClickListener(this);
    jdField_d_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131297034));
    jdField_a_of_type_AndroidWidgetEditText = ((EditText)findViewById(2131300045));
    jdField_b_of_type_AndroidWidgetEditText = ((EditText)findViewById(2131300182));
    jdField_e_of_type_AndroidWidgetEditText = ((EditText)findViewById(2131299913));
    jdField_e_of_type_AndroidWidgetEditText.addTextChangedListener(jdField_a_of_type_AndroidTextTextWatcher);
    jdField_a_of_type_AndroidWidgetEditText.addTextChangedListener(jdField_a_of_type_AndroidTextTextWatcher);
    jdField_b_of_type_AndroidWidgetEditText.addTextChangedListener(jdField_a_of_type_AndroidTextTextWatcher);
    jdField_c_of_type_AndroidWidgetEditText = ((EditText)findViewById(2131300055));
    jdField_d_of_type_AndroidWidgetEditText = ((EditText)findViewById(2131300183));
    jdField_c_of_type_AndroidWidgetEditText.setOnEditorActionListener(new mdw(this));
    jdField_a_of_type_AndroidWidgetButton = ((Button)findViewById(2131300185));
    jdField_a_of_type_AndroidWidgetButton.setOnClickListener(this);
    jdField_a_of_type_AndroidWidgetButton.setEnabled(false);
    jdField_a_of_type_AndroidWidgetButton.setClickable(false);
    jdField_b_of_type_AndroidWidgetButton = ((Button)findViewById(2131299915));
    jdField_b_of_type_AndroidWidgetButton.setOnClickListener(this);
    jdField_b_of_type_AndroidWidgetButton.setEnabled(false);
    jdField_b_of_type_AndroidWidgetButton.setClickable(false);
    jdField_a_of_type_AndroidWidgetImageView = ((ImageView)findViewById(2131300178));
    jdField_b_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131300179));
    jdField_b_of_type_AndroidWidgetTextView.setText(jdField_d_of_type_JavaLangString);
    jdField_c_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131300180));
    jdField_c_of_type_AndroidWidgetTextView.setText(f);
    if ("transferInput".equals(k))
    {
      jdField_d_of_type_AndroidWidgetTextView.setText("输入QQ号");
      getWindow().setWindowAnimations(2131559116);
      jdField_a_of_type_AndroidViewView.setVisibility(8);
      jdField_b_of_type_AndroidViewView.setVisibility(0);
      jdField_e_of_type_AndroidWidgetEditText.requestFocus();
      new Handler().postDelayed(new mdx(this), 100L);
      m = "3";
      jdField_a_of_type_Int = 2;
      return;
    }
    if (!TextUtils.isEmpty(jdField_e_of_type_JavaLangString))
    {
      jdField_d_of_type_AndroidWidgetTextView.setText(2131365563);
      jdField_a_of_type_AndroidWidgetButton.setText(2131365562);
      if (!TextUtils.isEmpty(n)) {
        jdField_d_of_type_AndroidWidgetEditText.setText(n);
      }
      if (!TextUtils.isEmpty(jdField_e_of_type_JavaLangString))
      {
        jdField_e_of_type_JavaLangString = a(jdField_e_of_type_JavaLangString, "100", 2);
        localObject = jdField_e_of_type_JavaLangString + getString(2131365204);
        jdField_b_of_type_AndroidWidgetEditText.setText((CharSequence)localObject);
      }
      jdField_c_of_type_AndroidViewView.setVisibility(0);
      jdField_d_of_type_AndroidViewView.setVisibility(8);
      jdField_a_of_type_AndroidWidgetButton.setEnabled(true);
      jdField_a_of_type_AndroidWidgetButton.setClickable(true);
    }
    for (;;)
    {
      localObject = FaceDrawable.a(app, 1, f);
      jdField_a_of_type_AndroidWidgetImageView.setImageDrawable((Drawable)localObject);
      return;
      jdField_d_of_type_AndroidWidgetTextView.setText(2131365560);
      jdField_a_of_type_AndroidWidgetEditText.requestFocus();
      jdField_d_of_type_AndroidViewView.setVisibility(0);
      jdField_c_of_type_AndroidViewView.setVisibility(8);
      new Handler().postDelayed(new mdy(this), 100L);
    }
  }
  
  public void a(int paramInt, Bundle paramBundle)
  {
    if (paramBundle == null) {
      new Bundle();
    }
    paramBundle = new JSONObject();
    try
    {
      paramBundle.put("resultCode", paramInt);
      Intent localIntent = new Intent();
      localIntent.putExtra("callbackSn", i);
      localIntent.putExtra("PayInvokerId", 5);
      localIntent.putExtra("result", paramBundle.toString());
      setResult(-1, localIntent);
      return;
    }
    catch (Exception localException)
    {
      for (;;) {}
    }
  }
  
  public void a(CharSequence paramCharSequence)
  {
    if ((!jdField_c_of_type_Boolean) && (!isFinishing())) {
      QQToast.a(this, paramCharSequence, 0).b(a(jdField_a_of_type_AndroidContentContext));
    }
  }
  
  public void a(String paramString1, int paramInt1, String paramString2, String paramString3, String paramString4, int paramInt2, String paramString5)
  {
    paramString5 = new StringBuilder();
    paramString5.append("Tenpay_mqq");
    paramString5.append("|");
    paramString5.append(paramString1);
    paramString5.append("||");
    paramString5.append(paramInt1);
    paramString5.append("|");
    paramString5.append(paramString2);
    paramString5.append("|0|1|0|android.");
    try
    {
      paramString5.append(jdField_a_of_type_AndroidContentContext.getPackageManager().getPackageInfo(jdField_a_of_type_AndroidContentContext.getPackageName(), 0).versionName);
      paramString5.append("|");
      paramString5.append(CommonUtil.a());
      paramString5.append("|");
      if ((!TextUtils.isEmpty(paramString3)) || (!TextUtils.isEmpty(paramString4)))
      {
        paramString5.append(paramString3);
        paramString5.append(".");
        paramString5.append(paramString4);
      }
      paramString5.append("|");
      paramString5.append(jdField_a_of_type_Int);
      paramString5.append(".");
      if (!TextUtils.isEmpty(j)) {
        paramString5.append(j.replace("|", ","));
      }
      paramString5.append("|");
      VACDReportUtil.a(jdField_a_of_type_Long, null, paramString2, "op_type=" + paramInt1, 0, "");
      StatisticCollector.a(BaseApplication.getContext()).d(app, paramString5.toString());
      return;
    }
    catch (PackageManager.NameNotFoundException paramString1)
    {
      for (;;)
      {
        paramString1.printStackTrace();
      }
    }
  }
  
  protected void b()
  {
    jdField_a_of_type_CooperationQwalletPluginQWalletPayProgressDialog = new QWalletPayProgressDialog(this);
    jdField_a_of_type_CooperationQwalletPluginQWalletPayProgressDialog.show();
    c();
  }
  
  protected boolean doOnCreate(Bundle paramBundle)
  {
    super.doOnCreate(paramBundle);
    setProgressBarIndeterminateVisibility(false);
    setRequestedOrientation(1);
    jdField_a_of_type_Long = getIntent().getLongExtra("vacreport_key_seq", 0L);
    if (jdField_a_of_type_Long == 0L) {
      jdField_a_of_type_Long = VACDReportUtil.a(null, "qqwallet", "transfer", "transinvoke", null, 0, null);
    }
    for (;;)
    {
      jdField_a_of_type_AndroidContentContext = this;
      addObserver(jdField_a_of_type_ComTencentMobileqqAppFriendListObserver);
      try
      {
        jdField_a_of_type_JavaLangString = app.a();
        jdField_b_of_type_JavaLangString = app.b();
        g = app.d();
        h = "2";
        jdField_a_of_type_Int = getIntent().getIntExtra("come_from", 1);
        i = getIntent().getStringExtra("callbackSn");
        j = getIntent().getStringExtra("app_info");
        jdField_b_of_type_Boolean = getIntent().getBooleanExtra("fromJump", false);
        k = getIntent().getStringExtra("tag");
        paramBundle = new JSONObject(getIntent().getStringExtra("extra_data"));
        f = paramBundle.optString("targetUin");
        jdField_d_of_type_JavaLangString = paramBundle.optString("targetNickname");
        jdField_e_of_type_JavaLangString = paramBundle.optString("trans_fee");
        n = paramBundle.optString("desc");
        jdField_c_of_type_JavaLangString = paramBundle.optString("sign");
        m = paramBundle.optString("source");
        jdField_a_of_type_AndroidOsResultReceiver = ((ResultReceiver)getIntent().getParcelableExtra("receiver"));
        a();
        a("1");
        return true;
        VACDReportUtil.a(jdField_a_of_type_Long, null, "transinvoke", null, 0, null);
      }
      catch (Exception paramBundle)
      {
        for (;;)
        {
          paramBundle.printStackTrace();
        }
      }
    }
  }
  
  protected void doOnDestroy()
  {
    removeObserver(jdField_a_of_type_ComTencentMobileqqAppFriendListObserver);
    super.doOnDestroy();
    if (jdField_a_of_type_Long != 0L) {
      VACDReportUtil.a(jdField_a_of_type_Long, "transfer.qqid.destroy", null, 0, null);
    }
  }
  
  protected void doOnPause()
  {
    super.doOnPause();
    jdField_c_of_type_Boolean = true;
  }
  
  protected void doOnResume()
  {
    super.doOnResume();
    jdField_c_of_type_Boolean = false;
    if (jdField_b_of_type_AndroidViewView.getVisibility() == 0)
    {
      a(jdField_a_of_type_JavaLangString, 128, "transfer.qqid.show", "", "", jdField_a_of_type_Int, "");
      return;
    }
    a(jdField_a_of_type_JavaLangString, 128, "transfer.amount.show", "", "", jdField_a_of_type_Int, "");
  }
  
  /* Error */
  protected void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore 5
    //   3: aload_0
    //   4: iconst_0
    //   5: putfield 53	com/tencent/mobileqq/activity/qwallet/TransactionActivity:jdField_c_of_type_Boolean	Z
    //   8: aload_3
    //   9: ifnull +143 -> 152
    //   12: iload_2
    //   13: iconst_m1
    //   14: if_icmpne +138 -> 152
    //   17: aload_3
    //   18: ldc_w 486
    //   21: invokevirtual 633	android/content/Intent:getStringExtra	(Ljava/lang/String;)Ljava/lang/String;
    //   24: astore_3
    //   25: aload_3
    //   26: ifnull +132 -> 158
    //   29: aload_3
    //   30: invokevirtual 195	java/lang/String:length	()I
    //   33: ifle +125 -> 158
    //   36: new 136	org/json/JSONObject
    //   39: dup
    //   40: aload_3
    //   41: invokespecial 644	org/json/JSONObject:<init>	(Ljava/lang/String;)V
    //   44: astore 4
    //   46: aload 4
    //   48: ifnull +537 -> 585
    //   51: aload 4
    //   53: ldc_w 703
    //   56: invokevirtual 649	org/json/JSONObject:optString	(Ljava/lang/String;)Ljava/lang/String;
    //   59: astore_3
    //   60: aload 4
    //   62: ldc_w 470
    //   65: iconst_m1
    //   66: invokevirtual 706	org/json/JSONObject:optInt	(Ljava/lang/String;I)I
    //   69: istore_2
    //   70: aload 4
    //   72: ldc_w 708
    //   75: invokevirtual 649	org/json/JSONObject:optString	(Ljava/lang/String;)Ljava/lang/String;
    //   78: astore 4
    //   80: aload 4
    //   82: ifnull +89 -> 171
    //   85: aload 4
    //   87: invokevirtual 195	java/lang/String:length	()I
    //   90: ifle +81 -> 171
    //   93: new 136	org/json/JSONObject
    //   96: dup
    //   97: aload 4
    //   99: invokespecial 644	org/json/JSONObject:<init>	(Ljava/lang/String;)V
    //   102: astore 5
    //   104: aload_3
    //   105: astore 4
    //   107: aload 5
    //   109: astore_3
    //   110: aload_0
    //   111: getfield 575	com/tencent/mobileqq/activity/qwallet/TransactionActivity:jdField_a_of_type_CooperationQwalletPluginQWalletPayProgressDialog	Lcooperation/qwallet/plugin/QWalletPayProgressDialog;
    //   114: invokevirtual 711	cooperation/qwallet/plugin/QWalletPayProgressDialog:dismiss	()V
    //   117: iload_2
    //   118: ifne +432 -> 550
    //   121: aload_3
    //   122: ifnull +428 -> 550
    //   125: iload_1
    //   126: lookupswitch	default:+26->152, 5:+57->183, 9:+80->206
    //   152: return
    //   153: astore_3
    //   154: aload_3
    //   155: invokevirtual 130	java/lang/Exception:printStackTrace	()V
    //   158: aconst_null
    //   159: astore 4
    //   161: goto -115 -> 46
    //   164: astore 4
    //   166: aload 4
    //   168: invokevirtual 130	java/lang/Exception:printStackTrace	()V
    //   171: aconst_null
    //   172: astore 5
    //   174: aload_3
    //   175: astore 4
    //   177: aload 5
    //   179: astore_3
    //   180: goto -70 -> 110
    //   183: aload_0
    //   184: aload_3
    //   185: ldc_w 713
    //   188: invokevirtual 649	org/json/JSONObject:optString	(Ljava/lang/String;)Ljava/lang/String;
    //   191: invokespecial 715	com/tencent/mobileqq/activity/qwallet/TransactionActivity:b	(Ljava/lang/String;)V
    //   194: aload_0
    //   195: aload_3
    //   196: ldc_w 717
    //   199: invokevirtual 649	org/json/JSONObject:optString	(Ljava/lang/String;)Ljava/lang/String;
    //   202: putfield 719	com/tencent/mobileqq/activity/qwallet/TransactionActivity:l	Ljava/lang/String;
    //   205: return
    //   206: aload_3
    //   207: ldc_w 721
    //   210: invokevirtual 649	org/json/JSONObject:optString	(Ljava/lang/String;)Ljava/lang/String;
    //   213: astore 4
    //   215: aload 4
    //   217: ifnull -65 -> 152
    //   220: new 723	java/lang/StringBuffer
    //   223: dup
    //   224: aload 4
    //   226: invokestatic 728	android/net/Uri:decode	(Ljava/lang/String;)Ljava/lang/String;
    //   229: invokespecial 729	java/lang/StringBuffer:<init>	(Ljava/lang/String;)V
    //   232: astore 4
    //   234: aload_3
    //   235: ldc_w 731
    //   238: invokevirtual 649	org/json/JSONObject:optString	(Ljava/lang/String;)Ljava/lang/String;
    //   241: astore 5
    //   243: aload 5
    //   245: invokestatic 92	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   248: ifne +20 -> 268
    //   251: aload 4
    //   253: ldc_w 733
    //   256: invokevirtual 736	java/lang/StringBuffer:append	(Ljava/lang/String;)Ljava/lang/StringBuffer;
    //   259: pop
    //   260: aload 4
    //   262: aload 5
    //   264: invokevirtual 736	java/lang/StringBuffer:append	(Ljava/lang/String;)Ljava/lang/StringBuffer;
    //   267: pop
    //   268: aload_3
    //   269: ldc_w 738
    //   272: invokevirtual 649	org/json/JSONObject:optString	(Ljava/lang/String;)Ljava/lang/String;
    //   275: astore 5
    //   277: aload 5
    //   279: invokestatic 92	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   282: ifne +20 -> 302
    //   285: aload 4
    //   287: ldc_w 740
    //   290: invokevirtual 736	java/lang/StringBuffer:append	(Ljava/lang/String;)Ljava/lang/StringBuffer;
    //   293: pop
    //   294: aload 4
    //   296: aload 5
    //   298: invokevirtual 736	java/lang/StringBuffer:append	(Ljava/lang/String;)Ljava/lang/StringBuffer;
    //   301: pop
    //   302: aload_3
    //   303: ldc_w 742
    //   306: invokevirtual 649	org/json/JSONObject:optString	(Ljava/lang/String;)Ljava/lang/String;
    //   309: astore 5
    //   311: aload 5
    //   313: invokestatic 92	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   316: ifne +20 -> 336
    //   319: aload 4
    //   321: ldc_w 744
    //   324: invokevirtual 736	java/lang/StringBuffer:append	(Ljava/lang/String;)Ljava/lang/StringBuffer;
    //   327: pop
    //   328: aload 4
    //   330: aload 5
    //   332: invokevirtual 736	java/lang/StringBuffer:append	(Ljava/lang/String;)Ljava/lang/StringBuffer;
    //   335: pop
    //   336: aload_3
    //   337: ldc_w 746
    //   340: invokevirtual 649	org/json/JSONObject:optString	(Ljava/lang/String;)Ljava/lang/String;
    //   343: astore_3
    //   344: aload_3
    //   345: invokestatic 92	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   348: ifne +19 -> 367
    //   351: aload 4
    //   353: ldc_w 748
    //   356: invokevirtual 736	java/lang/StringBuffer:append	(Ljava/lang/String;)Ljava/lang/StringBuffer;
    //   359: pop
    //   360: aload 4
    //   362: aload_3
    //   363: invokevirtual 736	java/lang/StringBuffer:append	(Ljava/lang/String;)Ljava/lang/StringBuffer;
    //   366: pop
    //   367: new 136	org/json/JSONObject
    //   370: dup
    //   371: invokespecial 137	org/json/JSONObject:<init>	()V
    //   374: astore_3
    //   375: new 136	org/json/JSONObject
    //   378: dup
    //   379: invokespecial 137	org/json/JSONObject:<init>	()V
    //   382: astore 5
    //   384: aload 5
    //   386: ldc_w 721
    //   389: aload 4
    //   391: invokevirtual 749	java/lang/StringBuffer:toString	()Ljava/lang/String;
    //   394: invokevirtual 145	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   397: pop
    //   398: aload 5
    //   400: ldc_w 717
    //   403: aload_0
    //   404: getfield 719	com/tencent/mobileqq/activity/qwallet/TransactionActivity:l	Ljava/lang/String;
    //   407: invokevirtual 145	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   410: pop
    //   411: aload 5
    //   413: ldc_w 751
    //   416: aload_0
    //   417: getfield 141	com/tencent/mobileqq/activity/qwallet/TransactionActivity:f	Ljava/lang/String;
    //   420: invokevirtual 145	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   423: pop
    //   424: aload 5
    //   426: ldc_w 753
    //   429: aload 4
    //   431: invokevirtual 749	java/lang/StringBuffer:toString	()Ljava/lang/String;
    //   434: invokevirtual 145	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   437: pop
    //   438: aload_3
    //   439: ldc_w 470
    //   442: iconst_0
    //   443: invokevirtual 156	org/json/JSONObject:put	(Ljava/lang/String;I)Lorg/json/JSONObject;
    //   446: pop
    //   447: aload_3
    //   448: ldc_w 703
    //   451: ldc_w 755
    //   454: invokevirtual 145	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   457: pop
    //   458: aload_0
    //   459: getfield 62	com/tencent/mobileqq/activity/qwallet/TransactionActivity:jdField_a_of_type_Int	I
    //   462: iconst_5
    //   463: if_icmpne +69 -> 532
    //   466: aload_3
    //   467: ldc_w 757
    //   470: aload 5
    //   472: invokevirtual 145	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   475: pop
    //   476: new 472	android/content/Intent
    //   479: dup
    //   480: invokespecial 473	android/content/Intent:<init>	()V
    //   483: astore 4
    //   485: aload 4
    //   487: ldc -32
    //   489: aload_0
    //   490: getfield 475	com/tencent/mobileqq/activity/qwallet/TransactionActivity:i	Ljava/lang/String;
    //   493: invokevirtual 479	android/content/Intent:putExtra	(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    //   496: pop
    //   497: aload 4
    //   499: ldc_w 481
    //   502: iconst_5
    //   503: invokevirtual 484	android/content/Intent:putExtra	(Ljava/lang/String;I)Landroid/content/Intent;
    //   506: pop
    //   507: aload 4
    //   509: ldc_w 486
    //   512: aload_3
    //   513: invokevirtual 174	org/json/JSONObject:toString	()Ljava/lang/String;
    //   516: invokevirtual 479	android/content/Intent:putExtra	(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    //   519: pop
    //   520: aload_0
    //   521: iconst_m1
    //   522: aload 4
    //   524: invokevirtual 490	com/tencent/mobileqq/activity/qwallet/TransactionActivity:setResult	(ILandroid/content/Intent;)V
    //   527: aload_0
    //   528: invokevirtual 760	com/tencent/mobileqq/activity/qwallet/TransactionActivity:finish	()V
    //   531: return
    //   532: aload_3
    //   533: ldc_w 708
    //   536: aload 5
    //   538: invokevirtual 145	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   541: pop
    //   542: goto -66 -> 476
    //   545: astore 4
    //   547: goto -71 -> 476
    //   550: iload_2
    //   551: ifle -399 -> 152
    //   554: aload_0
    //   555: ldc_w 761
    //   558: invokevirtual 449	com/tencent/mobileqq/activity/qwallet/TransactionActivity:getString	(I)Ljava/lang/String;
    //   561: astore_3
    //   562: aload 4
    //   564: ifnull +10 -> 574
    //   567: aload_0
    //   568: aload 4
    //   570: invokevirtual 763	com/tencent/mobileqq/activity/qwallet/TransactionActivity:a	(Ljava/lang/CharSequence;)V
    //   573: return
    //   574: aload_0
    //   575: aload_3
    //   576: invokevirtual 763	com/tencent/mobileqq/activity/qwallet/TransactionActivity:a	(Ljava/lang/CharSequence;)V
    //   579: return
    //   580: astore 5
    //   582: goto -465 -> 117
    //   585: aconst_null
    //   586: astore_3
    //   587: aload 5
    //   589: astore 4
    //   591: goto -481 -> 110
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	594	0	this	TransactionActivity
    //   0	594	1	paramInt1	int
    //   0	594	2	paramInt2	int
    //   0	594	3	paramIntent	Intent
    //   44	116	4	localObject1	Object
    //   164	3	4	localException1	Exception
    //   175	348	4	localObject2	Object
    //   545	24	4	localException2	Exception
    //   589	1	4	localException3	Exception
    //   1	536	5	localObject3	Object
    //   580	8	5	localException4	Exception
    // Exception table:
    //   from	to	target	type
    //   36	46	153	java/lang/Exception
    //   93	104	164	java/lang/Exception
    //   375	476	545	java/lang/Exception
    //   532	542	545	java/lang/Exception
    //   110	117	580	java/lang/Exception
  }
  
  public void onClick(View paramView)
  {
    int i1 = paramView.getId();
    if (i1 == 2131297035) {
      if (("transferInput".equals(k)) && (jdField_a_of_type_AndroidViewView.getVisibility() == 0)) {
        if (jdField_a_of_type_Boolean)
        {
          a(jdField_a_of_type_JavaLangString, 128, "transfer.qqid.keyback", "", "", jdField_a_of_type_Int, "");
          jdField_e_of_type_AndroidWidgetEditText.requestFocus();
          jdField_a_of_type_AndroidViewView.setVisibility(8);
          jdField_b_of_type_AndroidViewView.setVisibility(0);
          jdField_d_of_type_JavaLangString = null;
          jdField_a_of_type_AndroidWidgetImageView.setImageDrawable(null);
          jdField_c_of_type_AndroidWidgetTextView.setText("");
          jdField_b_of_type_AndroidWidgetTextView.setText("");
          jdField_d_of_type_AndroidWidgetTextView.setText("输入QQ号");
        }
      }
    }
    do
    {
      return;
      a(jdField_a_of_type_JavaLangString, 128, "transfer.qqid.back", "", "", jdField_a_of_type_Int, "");
      break;
      if (jdField_a_of_type_Boolean) {
        a(jdField_a_of_type_JavaLangString, 128, "transfer.amout.keyback", "", "", jdField_a_of_type_Int, "");
      }
      for (;;)
      {
        a("2");
        a(-1, null);
        ((InputMethodManager)jdField_a_of_type_AndroidContentContext.getSystemService("input_method")).hideSoftInputFromWindow(jdField_c_of_type_AndroidWidgetEditText.getWindowToken(), 0);
        finish();
        return;
        a(jdField_a_of_type_JavaLangString, 128, "transfer.amount.back", "", "", jdField_a_of_type_Int, "");
      }
      if (i1 == 2131300185)
      {
        a(jdField_a_of_type_JavaLangString, 128, "transfer.amount.go", "", "", jdField_a_of_type_Int, "");
        b();
        return;
      }
    } while (i1 != 2131299915);
    f = jdField_e_of_type_AndroidWidgetEditText.getText().toString();
    jdField_a_of_type_AndroidViewView.setVisibility(0);
    jdField_b_of_type_AndroidViewView.setVisibility(8);
    jdField_a_of_type_AndroidWidgetEditText.requestFocus();
    jdField_c_of_type_AndroidWidgetTextView.setText(f);
    jdField_d_of_type_JavaLangString = ContactUtils.b(app, f, true);
    jdField_b_of_type_AndroidWidgetTextView.setText(jdField_d_of_type_JavaLangString);
    paramView = FaceDrawable.a(app, 1, f);
    jdField_a_of_type_AndroidWidgetImageView.setImageDrawable(paramView);
    a(jdField_a_of_type_JavaLangString, 128, "transfer.qqid.next", "", "", jdField_a_of_type_Int, "");
    jdField_d_of_type_AndroidWidgetTextView.setText(2131365560);
  }
  
  public boolean onKeyDown(int paramInt, KeyEvent paramKeyEvent)
  {
    if (paramInt == 4)
    {
      jdField_a_of_type_Boolean = true;
      jdField_a_of_type_AndroidWidgetTextView.performClick();
      return true;
    }
    return super.onKeyDown(paramInt, paramKeyEvent);
  }
  
  protected void requestWindowFeature(Intent paramIntent)
  {
    requestWindowFeature(1);
  }
}
