package com.tencent.mobileqq.activity.qwallet;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Matrix;
import android.graphics.drawable.BitmapDrawable;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.os.ResultReceiver;
import android.support.v4.view.PagerAdapter;
import android.support.v4.view.ViewPager;
import android.support.v4.view.ViewPager.OnPageChangeListener;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextUtils.TruncateAt;
import android.text.TextWatcher;
import android.util.Base64;
import android.util.DisplayMetrics;
import android.view.Display;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.view.animation.AccelerateDecelerateInterpolator;
import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;
import android.view.animation.AnimationUtils;
import android.view.animation.TranslateAnimation;
import android.view.inputmethod.InputMethodManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.LinearLayout.LayoutParams;
import android.widget.RelativeLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;
import com.tencent.mobileqq.activity.PayBridgeActivity;
import com.tencent.mobileqq.activity.QQBrowserActivity;
import com.tencent.mobileqq.activity.qwallet.report.VACDReportUtil;
import com.tencent.mobileqq.activity.qwallet.widget.RollNumberView;
import com.tencent.mobileqq.activity.qwallet.widget.RollNumberView.OnRollListener;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.IndividualRedPacketManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.forward.ForwardBaseOption;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.mqsafeedit.BaseApplication;
import com.tencent.mobileqq.statistics.StatisticCollector;
import com.tencent.mobileqq.util.CommonUtil;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.mobileqq.utils.DialogUtil;
import com.tencent.mobileqq.utils.QQCustomDialog;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.widget.immersive.ImmersiveUtils;
import com.tencent.widget.immersive.SystemBarCompact;
import cooperation.qwallet.plugin.QWalletPayProgressDialog;
import java.io.File;
import java.io.FileInputStream;
import java.lang.reflect.Field;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import mdf;
import mdg;
import mdh;
import mdi;
import mdj;
import mdk;
import mdl;
import mdm;
import mdn;
import mdo;
import mdp;
import mdq;
import mds;
import mdt;
import mdu;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class SendHbActivity
  extends BaseActivity
  implements ViewPager.OnPageChangeListener, View.OnClickListener, Animation.AnimationListener, RollNumberView.OnRollListener
{
  private static final int jdField_a_of_type_Int = 100;
  private static final String jdField_a_of_type_JavaLangString = "@xhdpi.png";
  private static final int jdField_b_of_type_Int = -11001;
  private static final String jdField_b_of_type_JavaLangString = "64";
  private long jdField_a_of_type_Long;
  private BroadcastReceiver jdField_a_of_type_AndroidContentBroadcastReceiver;
  private Context jdField_a_of_type_AndroidContentContext;
  private Bitmap jdField_a_of_type_AndroidGraphicsBitmap;
  private BitmapDrawable jdField_a_of_type_AndroidGraphicsDrawableBitmapDrawable;
  private ResultReceiver jdField_a_of_type_AndroidOsResultReceiver;
  private PagerAdapter jdField_a_of_type_AndroidSupportV4ViewPagerAdapter;
  private ViewPager jdField_a_of_type_AndroidSupportV4ViewViewPager;
  protected TextWatcher a;
  private View jdField_a_of_type_AndroidViewView;
  private Animation jdField_a_of_type_AndroidViewAnimationAnimation;
  private Button jdField_a_of_type_AndroidWidgetButton;
  private EditText jdField_a_of_type_AndroidWidgetEditText;
  private ImageView jdField_a_of_type_AndroidWidgetImageView;
  private LinearLayout jdField_a_of_type_AndroidWidgetLinearLayout;
  private RelativeLayout jdField_a_of_type_AndroidWidgetRelativeLayout;
  public ScrollView a;
  private TextView jdField_a_of_type_AndroidWidgetTextView;
  private Toast jdField_a_of_type_AndroidWidgetToast;
  private RollNumberView jdField_a_of_type_ComTencentMobileqqActivityQwalletWidgetRollNumberView;
  private SystemBarCompact jdField_a_of_type_ComTencentWidgetImmersiveSystemBarCompact;
  private QWalletPayProgressDialog jdField_a_of_type_CooperationQwalletPluginQWalletPayProgressDialog;
  private Boolean jdField_a_of_type_JavaLangBoolean;
  private List jdField_a_of_type_JavaUtilList;
  private mdu jdField_a_of_type_Mdu;
  private JSONArray jdField_a_of_type_OrgJsonJSONArray;
  private boolean jdField_a_of_type_Boolean;
  private View jdField_b_of_type_AndroidViewView;
  private Button jdField_b_of_type_AndroidWidgetButton;
  private EditText jdField_b_of_type_AndroidWidgetEditText;
  private ImageView jdField_b_of_type_AndroidWidgetImageView;
  private LinearLayout jdField_b_of_type_AndroidWidgetLinearLayout;
  private RelativeLayout jdField_b_of_type_AndroidWidgetRelativeLayout;
  private TextView jdField_b_of_type_AndroidWidgetTextView;
  private JSONArray jdField_b_of_type_OrgJsonJSONArray;
  private boolean jdField_b_of_type_Boolean;
  private int jdField_c_of_type_Int;
  private View jdField_c_of_type_AndroidViewView;
  private Button jdField_c_of_type_AndroidWidgetButton;
  private EditText jdField_c_of_type_AndroidWidgetEditText;
  private ImageView jdField_c_of_type_AndroidWidgetImageView;
  private LinearLayout jdField_c_of_type_AndroidWidgetLinearLayout;
  private TextView jdField_c_of_type_AndroidWidgetTextView;
  private String jdField_c_of_type_JavaLangString;
  private boolean jdField_c_of_type_Boolean;
  private int jdField_d_of_type_Int;
  private View jdField_d_of_type_AndroidViewView;
  private Button jdField_d_of_type_AndroidWidgetButton;
  private LinearLayout jdField_d_of_type_AndroidWidgetLinearLayout;
  private TextView jdField_d_of_type_AndroidWidgetTextView;
  private String jdField_d_of_type_JavaLangString;
  private boolean jdField_d_of_type_Boolean;
  private int jdField_e_of_type_Int;
  private Button jdField_e_of_type_AndroidWidgetButton;
  private LinearLayout jdField_e_of_type_AndroidWidgetLinearLayout;
  private String jdField_e_of_type_JavaLangString;
  private boolean jdField_e_of_type_Boolean;
  private int jdField_f_of_type_Int;
  private Button jdField_f_of_type_AndroidWidgetButton;
  private LinearLayout jdField_f_of_type_AndroidWidgetLinearLayout;
  private String jdField_f_of_type_JavaLangString;
  private int jdField_g_of_type_Int;
  private String jdField_g_of_type_JavaLangString;
  private int jdField_h_of_type_Int;
  private String jdField_h_of_type_JavaLangString;
  private int jdField_i_of_type_Int;
  private String jdField_i_of_type_JavaLangString;
  private String j;
  private String k;
  private String l;
  private String m;
  private String n;
  private String o;
  private String p;
  private String q;
  private String r;
  private String s;
  private String t;
  private String u;
  private String v;
  private String w;
  private String x;
  private String y;
  
  public SendHbActivity()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_AndroidTextTextWatcher = new mdf(this);
    jdField_b_of_type_Boolean = false;
    l = "1";
    jdField_d_of_type_Int = 0;
    jdField_e_of_type_Int = 2;
    jdField_a_of_type_Mdu = new mdu(this);
    jdField_a_of_type_AndroidSupportV4ViewPagerAdapter = new mdg(this);
    jdField_a_of_type_AndroidContentBroadcastReceiver = new mdk(this);
  }
  
  private double a(double paramDouble1, double paramDouble2, int paramInt)
  {
    if (paramInt < 0) {
      return 0.0D;
    }
    return new BigDecimal(Double.toString(paramDouble1)).divide(new BigDecimal(Double.toString(paramDouble2)), paramInt, 4).doubleValue();
  }
  
  private int a(double paramDouble, String paramString)
  {
    int i2 = -1;
    int i1 = i2;
    if (jdField_a_of_type_ComTencentMobileqqActivityQwalletWidgetRollNumberView != null)
    {
      i1 = i2;
      if (paramDouble >= 0.0D)
      {
        try
        {
          if (("64".equals(l)) && (!TextUtils.isEmpty(p)))
          {
            jdField_a_of_type_ComTencentMobileqqActivityQwalletWidgetRollNumberView.reset(paramDouble);
            String str = a(w, p);
            jdField_b_of_type_AndroidWidgetTextView.setText(paramString);
            paramString = new StringBuffer("发送给");
            paramString.append(p);
            paramString.append("人(共");
            paramString.append(str);
            paramString.append("元)");
            jdField_f_of_type_AndroidWidgetButton.setText(paramString.toString());
            w = str;
          }
          else
          {
            jdField_a_of_type_ComTencentMobileqqActivityQwalletWidgetRollNumberView.reset(paramDouble);
          }
        }
        catch (Exception paramString)
        {
          paramString.printStackTrace();
          return -1;
        }
        i1 = 0;
      }
    }
    return i1;
  }
  
  private String a()
  {
    boolean bool = ((IndividualRedPacketManager)app.getManager(130)).a();
    if ("64".equals(l)) {
      return l;
    }
    if ((jdField_a_of_type_AndroidSupportV4ViewViewPager.getCurrentItem() == 2) || ((("1".equals(jdField_e_of_type_JavaLangString)) || ("7".equals(jdField_e_of_type_JavaLangString))) && (jdField_a_of_type_AndroidSupportV4ViewViewPager.getCurrentItem() == 1)))
    {
      if ("5".equals(l)) {
        return "48";
      }
      return "6";
    }
    if (bool)
    {
      if ("5".equals(l)) {
        return "5";
      }
      return "8";
    }
    return l;
  }
  
  private String a(String paramString)
  {
    if (TextUtils.isEmpty(paramString)) {
      return null;
    }
    try
    {
      paramString = Long.toString(Double.valueOf(a(paramString, "100")).doubleValue());
      return paramString;
    }
    catch (NumberFormatException paramString) {}
    return null;
  }
  
  private String a(String paramString1, String paramString2)
  {
    try
    {
      paramString1 = new BigDecimal(paramString1);
      paramString2 = new BigDecimal(paramString2);
      paramString1 = new DecimalFormat("#0.00").format(paramString1.multiply(paramString2).doubleValue());
      return paramString1;
    }
    catch (Exception paramString1) {}
    return "0";
  }
  
  private JSONObject a()
  {
    JSONObject localJSONObject1 = new JSONObject();
    Object localObject = new File(getFilesDir().getPath() + "/QWallet/" + jdField_c_of_type_JavaLangString + "/hbThemeConfig.cfg");
    StringBuilder localStringBuilder;
    if (((File)localObject).exists()) {
      try
      {
        localObject = new FileInputStream((File)localObject);
        byte[] arrayOfByte = new byte['Ѐ'];
        localStringBuilder = new StringBuilder();
        for (;;)
        {
          int i1 = ((FileInputStream)localObject).read(arrayOfByte);
          if (i1 <= 0) {
            break;
          }
          localStringBuilder.append(new String(arrayOfByte, 0, i1));
        }
        return localJSONObject1;
      }
      catch (Exception localException)
      {
        localException.printStackTrace();
      }
    }
    localException.close();
    JSONObject localJSONObject2 = new JSONObject(new String(Base64.decode(localStringBuilder.toString(), 0)));
    return localJSONObject2;
  }
  
  private void a(View paramView, int paramInt)
  {
    Object localObject;
    if (("1".equals(jdField_e_of_type_JavaLangString)) || ("7".equals(jdField_e_of_type_JavaLangString)))
    {
      localObject = (LinearLayout)paramView.findViewById(2131300056);
      if (localObject != null) {
        ((LinearLayout)localObject).setVisibility(8);
      }
      localObject = (TextView)paramView.findViewById(2131300074);
      if (localObject != null) {
        ((TextView)localObject).setText("金额");
      }
      localObject = (TextView)paramView.findViewById(2131298600);
      if (localObject != null) {
        ((TextView)localObject).setVisibility(8);
      }
      localObject = (EditText)paramView.findViewById(2131300045);
      ((EditText)localObject).addTextChangedListener(jdField_a_of_type_AndroidTextTextWatcher);
      ((EditText)localObject).setOnFocusChangeListener(new mdq(this));
      if (paramInt == 2) {
        ((EditText)localObject).setOnEditorActionListener(new mds(this));
      }
      localObject = (EditText)paramView.findViewById(2131300055);
      if (paramInt != 2) {
        break label283;
      }
      ((EditText)localObject).addTextChangedListener(jdField_a_of_type_AndroidTextTextWatcher);
      if (!TextUtils.isEmpty(k)) {
        ((EditText)localObject).setHint("如  “" + k + "”");
      }
    }
    for (;;)
    {
      ((Button)paramView.findViewById(2131297763)).setOnClickListener(this);
      return;
      localObject = (EditText)paramView.findViewById(2131297852);
      if (!TextUtils.isEmpty(jdField_d_of_type_JavaLangString)) {
        ((EditText)localObject).setHint("本群共" + jdField_d_of_type_JavaLangString + "人");
      }
      ((EditText)localObject).addTextChangedListener(jdField_a_of_type_AndroidTextTextWatcher);
      break;
      label283:
      ((EditText)localObject).setOnEditorActionListener(new mdt(this));
    }
  }
  
  private boolean a()
  {
    int i1 = jdField_a_of_type_AndroidWidgetEditText.getText().length();
    String str = jdField_a_of_type_AndroidWidgetEditText.getText().toString();
    if ((i1 == 0) || (str.startsWith(".")) || (str.endsWith("."))) {
      w = "";
    }
    for (;;)
    {
      return false;
      if (TextUtils.isEmpty(str))
      {
        w = "";
        return false;
      }
      if (str.indexOf('.') == 0)
      {
        w = "";
        return false;
      }
      if ((str.indexOf('.') > 0) && (str.indexOf('.') < str.length() - 3))
      {
        str = getString(2131365661);
        if (str != null) {
          a(str);
        }
        w = "";
        return false;
      }
      try
      {
        if (Double.valueOf(str).doubleValue() <= 0.0D)
        {
          w = "";
          return false;
        }
        if ("2".equals(u)) {
          str = jdField_a_of_type_AndroidWidgetEditText.getText().toString();
        }
        while (Double.valueOf(str).doubleValue() >= 0.01D)
        {
          return true;
          if (jdField_b_of_type_AndroidWidgetEditText == null)
          {
            str = jdField_a_of_type_AndroidWidgetEditText.getText().toString();
          }
          else
          {
            w = a(jdField_a_of_type_AndroidWidgetEditText.getText().toString(), jdField_b_of_type_AndroidWidgetEditText.getText().toString());
            str = w;
          }
        }
        return false;
      }
      catch (Exception localException) {}
    }
  }
  
  private boolean a(JSONObject paramJSONObject)
  {
    if (paramJSONObject == null) {}
    for (;;)
    {
      return false;
      try
      {
        Object localObject = paramJSONObject.optJSONObject("mk_hb_ad");
        if (localObject != null)
        {
          t = ((JSONObject)localObject).optString("ad_text");
          s = ((JSONObject)localObject).optString("ad_url");
          paramJSONObject = ((JSONObject)localObject).optString("ad_begin_time");
          localObject = ((JSONObject)localObject).optString("ad_end_time");
          if ((!TextUtils.isEmpty(t)) && (!TextUtils.isEmpty(paramJSONObject)) && (!TextUtils.isEmpty(paramJSONObject)))
          {
            SimpleDateFormat localSimpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            long l1 = localSimpleDateFormat.parse(paramJSONObject).getTime();
            long l2 = localSimpleDateFormat.parse((String)localObject).getTime();
            long l3 = System.currentTimeMillis();
            if ((l3 >= l1) && (l3 <= l2)) {
              return true;
            }
          }
        }
      }
      catch (Exception paramJSONObject)
      {
        paramJSONObject.printStackTrace();
      }
    }
    return false;
  }
  
  private void b()
  {
    IntentFilter localIntentFilter = new IntentFilter();
    localIntentFilter.addAction("tencent.av.v2q.StartVideoChat");
    try
    {
      registerReceiver(jdField_a_of_type_AndroidContentBroadcastReceiver, localIntentFilter);
      return;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
  }
  
  private void b(int paramInt)
  {
    jdField_a_of_type_CooperationQwalletPluginQWalletPayProgressDialog = new QWalletPayProgressDialog(this);
    jdField_a_of_type_CooperationQwalletPluginQWalletPayProgressDialog.show();
    c(paramInt);
  }
  
  private boolean b()
  {
    if (jdField_b_of_type_AndroidWidgetEditText == null) {}
    for (;;)
    {
      return true;
      String str = jdField_b_of_type_AndroidWidgetEditText.getText().toString();
      if (TextUtils.isEmpty(str)) {
        return false;
      }
      try
      {
        if (Integer.parseInt(str) < 1)
        {
          str = getString(2131365653);
          if (str != null) {
            a(str);
          }
          return false;
        }
      }
      catch (NumberFormatException localNumberFormatException)
      {
        localNumberFormatException.printStackTrace();
      }
    }
    return false;
  }
  
  private void c()
  {
    if ((jdField_a_of_type_JavaUtilList == null) || (jdField_a_of_type_AndroidTextTextWatcher == null)) {
      return;
    }
    Iterator localIterator = jdField_a_of_type_JavaUtilList.iterator();
    while (localIterator.hasNext())
    {
      Object localObject = (View)localIterator.next();
      if (localObject != null)
      {
        EditText localEditText = (EditText)((View)localObject).findViewById(2131300045);
        if (localEditText != null) {
          localEditText.removeTextChangedListener(jdField_a_of_type_AndroidTextTextWatcher);
        }
        localEditText = (EditText)((View)localObject).findViewById(2131300055);
        if (localEditText != null) {
          localEditText.removeTextChangedListener(jdField_a_of_type_AndroidTextTextWatcher);
        }
        localObject = (EditText)((View)localObject).findViewById(2131297852);
        if (localObject != null) {
          ((EditText)localObject).removeTextChangedListener(jdField_a_of_type_AndroidTextTextWatcher);
        }
      }
    }
    jdField_a_of_type_JavaUtilList.clear();
    jdField_a_of_type_JavaUtilList = null;
  }
  
  private void c(int paramInt)
  {
    for (;;)
    {
      JSONObject localJSONObject;
      Object localObject3;
      try
      {
        localJSONObject = new JSONObject();
        if (jdField_b_of_type_AndroidWidgetEditText != null)
        {
          Object localObject1 = jdField_b_of_type_AndroidWidgetEditText.getText().toString();
          if (TextUtils.isEmpty((CharSequence)localObject1))
          {
            localJSONObject.put("total_num", "1");
            if (!jdField_c_of_type_Boolean) {
              break label428;
            }
            localJSONObject.put("total_amount", a(w));
            if ("64".equals(l))
            {
              localJSONObject.put("groupid", q);
              localJSONObject.put("theme_type", y);
              localJSONObject.put("total_num", p);
            }
            localJSONObject.put("name", jdField_g_of_type_JavaLangString);
            localJSONObject.put("bus_type", u);
            if ((paramInt <= 1) || (jdField_b_of_type_OrgJsonJSONArray == null) || (jdField_d_of_type_Int >= jdField_b_of_type_OrgJsonJSONArray.length()) || (jdField_d_of_type_Int < 0)) {
              break label494;
            }
            localObject1 = jdField_b_of_type_OrgJsonJSONArray.getString(jdField_d_of_type_Int);
            localJSONObject.put("wishing", localObject1);
            localJSONObject.put("recv_uin", jdField_f_of_type_JavaLangString);
            localJSONObject.put("recv_type", r);
            localJSONObject.put("channel", a());
            localJSONObject.put("type", paramInt);
            localJSONObject.put("na_from_h5_data", m);
            localJSONObject.put("session_token", j);
            localObject1 = new JSONObject();
            ((JSONObject)localObject1).put("userId", jdField_c_of_type_JavaLangString);
            ((JSONObject)localObject1).put("viewTag", "sendHb");
            ((JSONObject)localObject1).put("comeForm", 2);
            ((JSONObject)localObject1).put("appInfo", jdField_i_of_type_JavaLangString);
            ((JSONObject)localObject1).put("extra_data", localJSONObject.toString());
            localObject3 = new Bundle();
            ((Bundle)localObject3).putString("json", ((JSONObject)localObject1).toString());
            ((Bundle)localObject3).putString("callbackSn", "0");
            ((Bundle)localObject3).putLong("vacreport_key_seq", jdField_a_of_type_Long);
            PayBridgeActivity.a(this, 5, (Bundle)localObject3);
            return;
          }
          localJSONObject.put("total_num", localObject1);
          continue;
        }
      }
      catch (JSONException localJSONException)
      {
        localJSONException.printStackTrace();
        return;
        localJSONObject.put("total_num", "1");
        continue;
      }
      catch (Exception localException)
      {
        localException.printStackTrace();
        return;
      }
      label428:
      if ((jdField_b_of_type_AndroidWidgetEditText == null) || ("2".equals(u)))
      {
        localJSONObject.put("total_amount", a(jdField_a_of_type_AndroidWidgetEditText.getText().toString()));
      }
      else
      {
        localJSONObject.put("total_amount", a(w));
        continue;
        label494:
        localObject3 = jdField_c_of_type_AndroidWidgetEditText.getText().toString();
        Object localObject2 = localObject3;
        if (TextUtils.isEmpty((CharSequence)localObject3)) {
          localObject2 = getResources().getString(2131365577);
        }
      }
    }
  }
  
  private void c(String paramString)
  {
    try
    {
      JSONObject localJSONObject = new JSONObject();
      localJSONObject.put("tokenId", paramString);
      localJSONObject.put("comeForm", jdField_c_of_type_Int);
      localJSONObject.put("h5_success", true);
      localJSONObject.put("appInfo", jdField_i_of_type_JavaLangString);
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
  
  private void d()
  {
    int i1;
    if ((jdField_b_of_type_OrgJsonJSONArray != null) && (jdField_a_of_type_OrgJsonJSONArray != null))
    {
      int i2 = jdField_b_of_type_OrgJsonJSONArray.length();
      if (i2 > 0)
      {
        i1 = jdField_a_of_type_OrgJsonJSONArray.length();
        if ((i1 > 0) && (i1 == i2))
        {
          i1 = new Random().nextInt(i1);
          if (i1 != jdField_d_of_type_Int) {
            break label131;
          }
          i1 = (i1 + 1) % i2;
        }
      }
    }
    label131:
    for (;;)
    {
      try
      {
        w = jdField_a_of_type_OrgJsonJSONArray.getString(i1);
        if (a(new BigDecimal(w).doubleValue(), jdField_b_of_type_OrgJsonJSONArray.getString(i1)) == 0) {
          jdField_a_of_type_ComTencentMobileqqActivityQwalletWidgetRollNumberView.roll();
        }
        jdField_d_of_type_Int = i1;
        return;
      }
      catch (Exception localException)
      {
        localException.printStackTrace();
      }
    }
  }
  
  public int a()
  {
    if ("5".equals(l))
    {
      if (("1".equals(jdField_e_of_type_JavaLangString)) || ("7".equals(jdField_e_of_type_JavaLangString))) {
        return 146;
      }
      return 145;
    }
    if (jdField_a_of_type_JavaLangBoolean.booleanValue()) {
      return 131;
    }
    if ((jdField_c_of_type_Boolean) && (!jdField_e_of_type_Boolean) && ((jdField_i_of_type_Int & 0x40) == 0)) {
      return 149;
    }
    if ((jdField_c_of_type_Boolean) && (jdField_e_of_type_Boolean) && ((jdField_i_of_type_Int & 0x40) == 0)) {
      return 157;
    }
    if ((jdField_c_of_type_Boolean) && ((jdField_i_of_type_Int & 0x40) > 0)) {
      return 156;
    }
    if (jdField_a_of_type_AndroidSupportV4ViewViewPager.getCurrentItem() == 2) {
      return 150;
    }
    if (("1".equals(jdField_e_of_type_JavaLangString)) && (jdField_a_of_type_AndroidSupportV4ViewViewPager.getCurrentItem() == 1)) {
      return 153;
    }
    if (("1".equals(jdField_e_of_type_JavaLangString)) || ("7".equals(jdField_e_of_type_JavaLangString))) {
      return 133;
    }
    return 132;
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
  
  public Intent a(int paramInt, String paramString1, String paramString2)
  {
    Intent localIntent = new Intent();
    if (paramInt == 0) {
      localIntent.putExtra("data", paramString2);
    }
    for (;;)
    {
      localIntent.putExtra("result", paramInt);
      return localIntent;
      localIntent.putExtra("retmsg", paramString1);
    }
  }
  
  protected void a()
  {
    setContentView(2130903804);
    Object localObject1 = (ViewGroup)findViewById(2131296923);
    if (ImmersiveUtils.isSupporImmersive() == 1)
    {
      ((ViewGroup)localObject1).setFitsSystemWindows(true);
      ((ViewGroup)localObject1).setPadding(0, ImmersiveUtils.a(this), 0, 0);
    }
    jdField_a_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131297035));
    jdField_a_of_type_AndroidWidgetTextView.setVisibility(0);
    jdField_a_of_type_AndroidWidgetTextView.setOnClickListener(this);
    Object localObject2 = (ImageView)findViewById(2131297081);
    ((ImageView)localObject2).setOnClickListener(this);
    Object localObject3;
    if (!"5".equals(l))
    {
      localObject1 = a();
      if (localObject1 == null) {
        break label1736;
      }
      localObject3 = ((JSONObject)localObject1).optJSONObject("hb_vip");
      if (localObject3 == null) {
        break label1736;
      }
    }
    label1675:
    label1677:
    label1736:
    for (int i1 = ((JSONObject)localObject3).optInt("enable_shop_enter");; i1 = 1)
    {
      if (i1 == 1)
      {
        localObject3 = (IndividualRedPacketManager)app.getManager(130);
        o = IndividualRedPacketManager.a(3, app);
        if (TextUtils.isEmpty(o)) {
          ((ImageView)localObject2).setVisibility(8);
        }
      }
      for (;;)
      {
        ((TextView)findViewById(2131297034)).setText(2131365566);
        jdField_c_of_type_AndroidWidgetButton = ((Button)findViewById(2131300150));
        jdField_c_of_type_AndroidWidgetButton.setOnClickListener(this);
        jdField_b_of_type_AndroidWidgetButton = ((Button)findViewById(2131300151));
        jdField_b_of_type_AndroidWidgetButton.setOnClickListener(this);
        jdField_d_of_type_AndroidWidgetButton = ((Button)findViewById(2131300153));
        jdField_d_of_type_AndroidWidgetButton.setOnClickListener(this);
        jdField_b_of_type_AndroidWidgetRelativeLayout = ((RelativeLayout)findViewById(2131300152));
        jdField_b_of_type_AndroidWidgetRelativeLayout.setClickable(true);
        jdField_b_of_type_AndroidWidgetRelativeLayout.setOnClickListener(this);
        jdField_a_of_type_AndroidWidgetImageView = ((ImageView)findViewById(2131300154));
        if (getSharedPreferences("qb_tenpay_hb_ling", 0).getBoolean("is_clicked", false)) {
          jdField_a_of_type_AndroidWidgetImageView.setVisibility(8);
        }
        if (("1".equals(jdField_e_of_type_JavaLangString)) || ("7".equals(jdField_e_of_type_JavaLangString))) {
          jdField_c_of_type_AndroidWidgetButton.setVisibility(8);
        }
        if ("6".equals(jdField_e_of_type_JavaLangString)) {
          jdField_b_of_type_AndroidWidgetRelativeLayout.setVisibility(8);
        }
        jdField_a_of_type_AndroidWidgetLinearLayout = ((LinearLayout)findViewById(2131297033));
        Object localObject4 = LayoutInflater.from(this);
        localObject2 = ((LayoutInflater)localObject4).inflate(2130903798, null);
        localObject3 = ((LayoutInflater)localObject4).inflate(2130903793, null);
        localObject4 = ((LayoutInflater)localObject4).inflate(2130903790, null);
        jdField_a_of_type_JavaUtilList = new ArrayList();
        if ((!"1".equals(jdField_e_of_type_JavaLangString)) && (!"7".equals(jdField_e_of_type_JavaLangString)))
        {
          jdField_a_of_type_JavaUtilList.add(localObject2);
          a((View)localObject2, 0);
        }
        jdField_a_of_type_JavaUtilList.add(localObject3);
        a((View)localObject3, 1);
        if (!"6".equals(jdField_e_of_type_JavaLangString))
        {
          jdField_a_of_type_JavaUtilList.add(localObject4);
          a((View)localObject4, 2);
        }
        localObject2 = (ImageView)findViewById(2131300156);
        jdField_a_of_type_AndroidSupportV4ViewViewPager = ((ViewPager)findViewById(2131300040));
        jdField_a_of_type_AndroidSupportV4ViewViewPager.setAdapter(jdField_a_of_type_AndroidSupportV4ViewPagerAdapter);
        jdField_a_of_type_AndroidSupportV4ViewPagerAdapter.notifyDataSetChanged();
        jdField_a_of_type_AndroidSupportV4ViewViewPager.setOnPageChangeListener(this);
        try
        {
          localObject3 = ViewPager.class.getDeclaredField("mScroller");
          ((Field)localObject3).setAccessible(true);
          localObject4 = new SendHbActivity.FixedSpeedScroller(this, jdField_a_of_type_AndroidSupportV4ViewViewPager.getContext(), new AccelerateDecelerateInterpolator());
          ((Field)localObject3).set(jdField_a_of_type_AndroidSupportV4ViewViewPager, localObject4);
          ((SendHbActivity.FixedSpeedScroller)localObject4).a(200);
          jdField_f_of_type_AndroidWidgetLinearLayout = ((LinearLayout)findViewById(2131300155));
          localObject3 = new DisplayMetrics();
          getWindowManager().getDefaultDisplay().getMetrics((DisplayMetrics)localObject3);
          float f1 = getResourcesgetDisplayMetricsdensity;
          jdField_g_of_type_Int = (((widthPixels - (int)(30.0F * f1)) / jdField_a_of_type_JavaUtilList.size() - jdField_f_of_type_Int) / 2);
          ((ImageView)localObject2).setLayoutParams(new LinearLayout.LayoutParams(jdField_g_of_type_Int * 2, (int)(f1 * 2.0F)));
          new Matrix().postTranslate(jdField_g_of_type_Int, 0.0F);
          jdField_a_of_type_AndroidWidgetScrollView = ((ScrollView)findViewById(2131299226));
          jdField_a_of_type_AndroidWidgetEditText = ((EditText)findViewById(2131300045));
          jdField_a_of_type_AndroidWidgetEditText.addTextChangedListener(jdField_a_of_type_AndroidTextTextWatcher);
          jdField_c_of_type_AndroidWidgetEditText = ((EditText)findViewById(2131300055));
          jdField_c_of_type_AndroidWidgetEditText.setOnEditorActionListener(new mdl(this));
          jdField_a_of_type_AndroidWidgetButton = ((Button)findViewById(2131297763));
          jdField_a_of_type_AndroidWidgetButton.setOnClickListener(this);
          jdField_a_of_type_AndroidWidgetButton.setEnabled(false);
          jdField_a_of_type_AndroidWidgetButton.setClickable(false);
          jdField_a_of_type_AndroidViewView = findViewById(2131300157);
          jdField_e_of_type_AndroidWidgetButton = ((Button)findViewById(2131300159));
          jdField_e_of_type_AndroidWidgetButton.setOnClickListener(this);
          ((Button)findViewById(2131300160)).setOnClickListener(this);
          jdField_d_of_type_AndroidViewView = findViewById(2131298451);
          jdField_d_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131297718));
          jdField_d_of_type_AndroidWidgetTextView.setEllipsize(TextUtils.TruncateAt.END);
          jdField_d_of_type_AndroidWidgetTextView.setSingleLine(true);
          jdField_c_of_type_AndroidWidgetImageView = ((ImageView)findViewById(2131298452));
          if (a((JSONObject)localObject1))
          {
            jdField_d_of_type_AndroidViewView.setVisibility(0);
            if (!TextUtils.isEmpty(t)) {
              jdField_d_of_type_AndroidWidgetTextView.setText(t);
            }
            if (TextUtils.isEmpty(s)) {
              jdField_c_of_type_AndroidWidgetImageView.setVisibility(4);
            }
          }
          jdField_d_of_type_AndroidViewView.setOnClickListener(this);
          if (("4".equals(jdField_e_of_type_JavaLangString)) || ("5".equals(jdField_e_of_type_JavaLangString)) || ("7".equals(jdField_e_of_type_JavaLangString)))
          {
            u = "1";
            jdField_a_of_type_AndroidWidgetLinearLayout.setVisibility(8);
            jdField_a_of_type_AndroidSupportV4ViewViewPager.setVisibility(8);
            jdField_a_of_type_AndroidWidgetScrollView.setVisibility(0);
            if (!jdField_c_of_type_Boolean) {
              jdField_a_of_type_Mdu.postDelayed(new mdm(this), 150L);
            }
          }
          for (;;)
          {
            jdField_a_of_type_AndroidViewAnimationAnimation = AnimationUtils.loadAnimation(jdField_a_of_type_AndroidContentContext, 2130968709);
            jdField_a_of_type_AndroidViewAnimationAnimation.setAnimationListener(this);
            jdField_a_of_type_ComTencentMobileqqActivityQwalletWidgetRollNumberView = ((RollNumberView)findViewById(2131300170));
            jdField_b_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131300172));
            jdField_a_of_type_AndroidWidgetRelativeLayout = ((RelativeLayout)findViewById(2131300168));
            jdField_c_of_type_AndroidWidgetLinearLayout = ((LinearLayout)findViewById(2131300164));
            jdField_f_of_type_AndroidWidgetButton = ((Button)findViewById(2131300176));
            jdField_e_of_type_AndroidWidgetLinearLayout = ((LinearLayout)findViewById(2131300163));
            jdField_b_of_type_AndroidViewView = findViewById(2131300173);
            jdField_b_of_type_AndroidWidgetLinearLayout = ((LinearLayout)findViewById(2131300169));
            jdField_c_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131300171));
            jdField_d_of_type_AndroidWidgetLinearLayout = ((LinearLayout)findViewById(2131300149));
            jdField_c_of_type_AndroidViewView = findViewById(2131300162);
            jdField_c_of_type_AndroidWidgetLinearLayout.setOnClickListener(this);
            jdField_f_of_type_AndroidWidgetButton.setOnClickListener(this);
            jdField_b_of_type_AndroidViewView.setOnClickListener(this);
            jdField_a_of_type_ComTencentMobileqqActivityQwalletWidgetRollNumberView.setLisener(this);
            jdField_c_of_type_AndroidViewView.setOnClickListener(this);
            if (jdField_c_of_type_Boolean)
            {
              getWindow().setFlags(1024, 1024);
              jdField_d_of_type_AndroidWidgetLinearLayout.setVisibility(8);
              jdField_c_of_type_AndroidViewView.setVisibility(0);
              if ("64".equals(l)) {
                u = "1";
              }
              ((InputMethodManager)getSystemService("input_method")).hideSoftInputFromWindow(jdField_d_of_type_AndroidWidgetLinearLayout.getWindowToken(), 0);
              if (!TextUtils.isEmpty(n)) {
                b(n);
              }
            }
            return;
            ((ImageView)localObject2).setVisibility(0);
            break;
            ((ImageView)localObject2).setVisibility(8);
            break;
            ((ImageView)localObject2).setVisibility(8);
            localObject1 = null;
            break;
            if (("1".equals(jdField_e_of_type_JavaLangString)) || ("7".equals(jdField_e_of_type_JavaLangString)))
            {
              a(1);
              jdField_a_of_type_AndroidSupportV4ViewViewPager.setCurrentItem(0);
            }
            for (;;)
            {
              if (jdField_c_of_type_Boolean) {
                break label1675;
              }
              if (!"6".equals(l)) {
                break label1677;
              }
              jdField_a_of_type_Mdu.postDelayed(new mdn(this), 150L);
              break;
              if ("6".equals(l))
              {
                u = "2";
                a(2);
                jdField_a_of_type_AndroidSupportV4ViewViewPager.setCurrentItem(2);
              }
              else if ("1".equals(u))
              {
                a(1);
                jdField_a_of_type_AndroidSupportV4ViewViewPager.setCurrentItem(1);
              }
              else if ("2".equals(u))
              {
                a(0);
                jdField_a_of_type_AndroidSupportV4ViewViewPager.setCurrentItem(0);
              }
              else
              {
                u = "2";
                a(0);
                jdField_a_of_type_AndroidSupportV4ViewViewPager.setCurrentItem(0);
              }
            }
            continue;
            if (jdField_b_of_type_AndroidWidgetEditText != null) {
              jdField_a_of_type_Mdu.postDelayed(new mdo(this), 150L);
            } else {
              new Handler().postDelayed(new mdp(this), 150L);
            }
          }
        }
        catch (Exception localException)
        {
          for (;;) {}
        }
      }
    }
  }
  
  public void a(int paramInt)
  {
    View localView;
    if ((!"1".equals(jdField_e_of_type_JavaLangString)) && (!"7".equals(jdField_e_of_type_JavaLangString)))
    {
      localView = (View)jdField_a_of_type_JavaUtilList.get(paramInt);
      jdField_b_of_type_AndroidWidgetEditText = ((EditText)localView.findViewById(2131297852));
      jdField_a_of_type_AndroidWidgetScrollView = ((ScrollView)localView.findViewById(2131299226));
      jdField_a_of_type_AndroidWidgetEditText = ((EditText)localView.findViewById(2131300045));
      jdField_c_of_type_AndroidWidgetEditText = ((EditText)localView.findViewById(2131300055));
      jdField_a_of_type_AndroidWidgetButton = ((Button)localView.findViewById(2131297763));
      jdField_a_of_type_AndroidWidgetButton.setEnabled(false);
      jdField_a_of_type_AndroidWidgetButton.setClickable(false);
      w = "";
      jdField_a_of_type_AndroidWidgetEditText.setText("");
      jdField_c_of_type_AndroidWidgetEditText.setText("");
      if (jdField_b_of_type_AndroidWidgetEditText != null) {
        jdField_b_of_type_AndroidWidgetEditText.setText("");
      }
      if (paramInt != 0) {
        break label271;
      }
      jdField_c_of_type_AndroidWidgetButton.setTextColor(-3064501);
      jdField_b_of_type_AndroidWidgetButton.setTextColor(-5855578);
      jdField_d_of_type_AndroidWidgetButton.setTextColor(-5855578);
      if ("6".equals(l)) {
        l = "1";
      }
      u = "2";
      if (jdField_b_of_type_AndroidWidgetEditText == null) {
        break label262;
      }
      jdField_b_of_type_AndroidWidgetEditText.requestFocus();
    }
    label262:
    label271:
    do
    {
      return;
      localView = (View)jdField_a_of_type_JavaUtilList.get(paramInt - 1);
      break;
      jdField_a_of_type_AndroidWidgetEditText.requestFocus();
      return;
      if (paramInt == 1)
      {
        jdField_c_of_type_AndroidWidgetButton.setTextColor(-5855578);
        jdField_b_of_type_AndroidWidgetButton.setTextColor(-3064501);
        jdField_d_of_type_AndroidWidgetButton.setTextColor(-5855578);
        if ("6".equals(l)) {
          l = "1";
        }
        u = "1";
        if (jdField_b_of_type_AndroidWidgetEditText != null)
        {
          jdField_b_of_type_AndroidWidgetEditText.requestFocus();
          return;
        }
        jdField_a_of_type_AndroidWidgetEditText.requestFocus();
        return;
      }
    } while (paramInt != 2);
    jdField_c_of_type_AndroidWidgetButton.setTextColor(-5855578);
    jdField_b_of_type_AndroidWidgetButton.setTextColor(-5855578);
    jdField_d_of_type_AndroidWidgetButton.setTextColor(-3064501);
    jdField_c_of_type_AndroidWidgetEditText.requestFocus();
    u = "2";
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
      localIntent.putExtra("callbackSn", jdField_h_of_type_JavaLangString);
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
    if ((!jdField_b_of_type_Boolean) && (!isFinishing())) {
      QQToast.a(this, paramCharSequence, 0).b(a(jdField_a_of_type_AndroidContentContext));
    }
  }
  
  protected void a(String paramString)
  {
    jdField_d_of_type_Boolean = true;
    jdField_a_of_type_CooperationQwalletPluginQWalletPayProgressDialog = new QWalletPayProgressDialog(this);
    jdField_a_of_type_CooperationQwalletPluginQWalletPayProgressDialog.show();
    try
    {
      JSONObject localJSONObject = new JSONObject();
      localJSONObject.put("sp_data", paramString);
      paramString = new JSONObject();
      paramString.put("userId", jdField_c_of_type_JavaLangString);
      paramString.put("viewTag", "sendHbCallback");
      paramString.put("comeForm", 2);
      paramString.put("appInfo", jdField_i_of_type_JavaLangString);
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
      paramString5.append(jdField_c_of_type_Int);
      paramString5.append(".");
      if (!TextUtils.isEmpty(jdField_i_of_type_JavaLangString)) {
        paramString5.append(jdField_i_of_type_JavaLangString.replace("|", ","));
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
  
  public void a(String paramString1, String paramString2, String paramString3)
  {
    DialogUtil.a(this, 230, null, paramString1, paramString2, paramString3, new mdh(this), new mdi(this)).show();
  }
  
  public void b(String paramString)
  {
    if (TextUtils.isEmpty(paramString)) {
      return;
    }
    try
    {
      paramString = new JSONObject(paramString);
      jdField_e_of_type_Int = paramString.optInt("hb_theme_id");
      jdField_b_of_type_OrgJsonJSONArray = paramString.optJSONArray("hb_theme_wish_array");
      if (jdField_b_of_type_OrgJsonJSONArray == null) {
        jdField_b_of_type_OrgJsonJSONArray = new JSONArray();
      }
      jdField_a_of_type_OrgJsonJSONArray = paramString.optJSONArray("hb_theme_money_array");
      x = (paramString.optString("hb_theme_img") + "@xhdpi.png");
      paramString = (QQAppInterface)getAppRuntime();
      if ((!TextUtils.isEmpty(x)) && (paramString != null))
      {
        jdField_a_of_type_AndroidGraphicsBitmap = PreloadImgManager.a().a(paramString, x);
        if (jdField_a_of_type_AndroidGraphicsBitmap != null)
        {
          jdField_a_of_type_AndroidGraphicsDrawableBitmapDrawable = new BitmapDrawable(getResources(), jdField_a_of_type_AndroidGraphicsBitmap);
          jdField_a_of_type_AndroidWidgetRelativeLayout.setBackgroundDrawable(jdField_a_of_type_AndroidGraphicsDrawableBitmapDrawable);
        }
      }
      int i2 = jdField_a_of_type_OrgJsonJSONArray.length();
      int i1 = jdField_b_of_type_OrgJsonJSONArray.length();
      paramString = getString(2131365731);
      if (i2 > i1) {
        while (i1 < i2)
        {
          jdField_b_of_type_OrgJsonJSONArray.put(paramString);
          i1 += 1;
        }
      }
      if (i2 < i1)
      {
        paramString = new JSONArray();
        i1 = 0;
        while (i1 < i2)
        {
          paramString.put(jdField_b_of_type_OrgJsonJSONArray.get(i1));
          i1 += 1;
        }
        jdField_b_of_type_OrgJsonJSONArray = paramString;
      }
      jdField_a_of_type_Mdu.postDelayed(new mdj(this), 10L);
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
  
  public void complete()
  {
    if ((jdField_d_of_type_Int >= 0) && (jdField_b_of_type_OrgJsonJSONArray != null) && (jdField_d_of_type_Int < jdField_b_of_type_OrgJsonJSONArray.length())) {}
    try
    {
      String str = jdField_b_of_type_OrgJsonJSONArray.getString(jdField_d_of_type_Int);
      if ((!TextUtils.isEmpty(str)) && (jdField_a_of_type_Mdu != null))
      {
        Message localMessage = jdField_a_of_type_Mdu.obtainMessage();
        what = 100;
        Bundle localBundle = new Bundle();
        localBundle.putString("wish", str);
        localMessage.setData(localBundle);
        jdField_a_of_type_Mdu.sendMessage(localMessage);
      }
      return;
    }
    catch (JSONException localJSONException)
    {
      localJSONException.printStackTrace();
    }
  }
  
  protected boolean doOnCreate(Bundle paramBundle)
  {
    getIntent().putExtra("fling_action_key", 0);
    super.doOnCreate(paramBundle);
    jdField_c_of_type_Boolean = getIntent().getBooleanExtra("theme", false);
    jdField_a_of_type_ComTencentWidgetImmersiveSystemBarCompact = mSystemBarComp;
    mSystemBarComp = null;
    int i1;
    if (jdField_c_of_type_Boolean)
    {
      i1 = 184549376;
      new SystemBarCompact(this, true, i1).init();
      setProgressBarIndeterminateVisibility(false);
      setRequestedOrientation(1);
      jdField_a_of_type_Long = getIntent().getLongExtra("vacreport_key_seq", 0L);
      if (jdField_a_of_type_Long != 0L) {
        break label516;
      }
      jdField_a_of_type_Long = VACDReportUtil.a(null, "qqwallet", "makeHongbao", "hbinvoke", null, 0, null);
    }
    for (;;)
    {
      jdField_a_of_type_AndroidContentContext = this;
      try
      {
        jdField_c_of_type_JavaLangString = app.a();
        jdField_g_of_type_JavaLangString = app.b();
        jdField_a_of_type_JavaLangBoolean = Boolean.valueOf(getIntent().getBooleanExtra("is_H5", false));
        jdField_c_of_type_Int = getIntent().getIntExtra("come_from", 1);
        jdField_h_of_type_JavaLangString = getIntent().getStringExtra("callbackSn");
        jdField_i_of_type_JavaLangString = getIntent().getStringExtra("app_info");
        paramBundle = new JSONObject(getIntent().getStringExtra("extra_data"));
        jdField_f_of_type_JavaLangString = paramBundle.optString("recv_uin");
        jdField_d_of_type_JavaLangString = paramBundle.optString("people_num");
        jdField_e_of_type_JavaLangString = paramBundle.optString("recv_type");
        r = jdField_e_of_type_JavaLangString;
        u = paramBundle.optString("bus_type");
        j = paramBundle.optString("session_token");
        l = paramBundle.optString("channel", "1");
        jdField_e_of_type_Boolean = paramBundle.optBoolean("feedback", false);
        n = getIntent().getStringExtra("theme_config");
        jdField_i_of_type_Int = Integer.parseInt(l);
        if (("64".equals(l)) || ((jdField_i_of_type_Int & 0x40) > 0))
        {
          jdField_c_of_type_Boolean = true;
          y = getIntent().getStringExtra("theme_type");
          q = getIntent().getStringExtra("group_id");
          p = getIntent().getStringExtra("group_member_number");
        }
        if ("5".equals(l))
        {
          jdField_g_of_type_JavaLangString = ContactUtils.o(app, jdField_c_of_type_JavaLangString);
          if (TextUtils.isEmpty(jdField_g_of_type_JavaLangString)) {
            jdField_g_of_type_JavaLangString = app.b();
          }
        }
        k = paramBundle.optString("placeholder");
        m = paramBundle.optString("na_from_h5_data");
        jdField_a_of_type_AndroidOsResultReceiver = ((ResultReceiver)getIntent().getParcelableExtra("receiver"));
      }
      catch (Exception paramBundle)
      {
        for (;;)
        {
          paramBundle.printStackTrace();
        }
      }
      a();
      b();
      return true;
      i1 = -3064501;
      break;
      label516:
      VACDReportUtil.a(jdField_a_of_type_Long, null, "hbinvoke", null, 0, null);
    }
  }
  
  protected void doOnDestroy()
  {
    if (jdField_a_of_type_AndroidGraphicsBitmap != null)
    {
      jdField_a_of_type_AndroidGraphicsBitmap.recycle();
      jdField_a_of_type_AndroidGraphicsBitmap = null;
    }
    if (jdField_a_of_type_AndroidGraphicsDrawableBitmapDrawable != null) {
      jdField_a_of_type_AndroidGraphicsDrawableBitmapDrawable.setCallback(null);
    }
    jdField_a_of_type_AndroidWidgetRelativeLayout = null;
    c();
    if (jdField_a_of_type_AndroidWidgetEditText != null) {
      jdField_a_of_type_AndroidWidgetEditText.removeTextChangedListener(jdField_a_of_type_AndroidTextTextWatcher);
    }
    if (jdField_b_of_type_AndroidWidgetEditText != null) {
      jdField_b_of_type_AndroidWidgetEditText.removeTextChangedListener(jdField_a_of_type_AndroidTextTextWatcher);
    }
    if (jdField_c_of_type_AndroidWidgetEditText != null) {
      jdField_c_of_type_AndroidWidgetEditText.removeTextChangedListener(jdField_a_of_type_AndroidTextTextWatcher);
    }
    jdField_a_of_type_Mdu.removeCallbacksAndMessages(null);
    jdField_a_of_type_AndroidTextTextWatcher = null;
    mSystemBarComp = jdField_a_of_type_ComTencentWidgetImmersiveSystemBarCompact;
    if (jdField_a_of_type_Long != 0L) {
      VACDReportUtil.a(jdField_a_of_type_Long, "hongbao.wrap.destroy", null, 0, null);
    }
    if (jdField_a_of_type_AndroidContentBroadcastReceiver != null) {
      unregisterReceiver(jdField_a_of_type_AndroidContentBroadcastReceiver);
    }
    jdField_a_of_type_AndroidContentBroadcastReceiver = null;
    super.doOnDestroy();
  }
  
  protected void doOnPause()
  {
    super.doOnPause();
    jdField_b_of_type_Boolean = true;
  }
  
  protected void doOnResume()
  {
    super.doOnResume();
    jdField_b_of_type_Boolean = false;
    a(jdField_c_of_type_JavaLangString, a(), "hongbao.wrap.show", "", "", 2, "");
    if ((jdField_a_of_type_JavaUtilList != null) && (jdField_a_of_type_JavaUtilList.size() > 0))
    {
      boolean bool = ((IndividualRedPacketManager)app.getManager(130)).a();
      int i1 = 0;
      if (i1 < jdField_a_of_type_JavaUtilList.size())
      {
        View localView = ((View)jdField_a_of_type_JavaUtilList.get(i1)).findViewById(2131300075);
        if (localView != null)
        {
          if (!bool) {
            break label125;
          }
          localView.setVisibility(0);
        }
        for (;;)
        {
          i1 += 1;
          break;
          label125:
          localView.setVisibility(8);
        }
      }
    }
  }
  
  /* Error */
  protected void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    // Byte code:
    //   0: aload_0
    //   1: iconst_0
    //   2: putfield 90	com/tencent/mobileqq/activity/qwallet/SendHbActivity:jdField_b_of_type_Boolean	Z
    //   5: aload_3
    //   6: ifnull +146 -> 152
    //   9: iload_2
    //   10: iconst_m1
    //   11: if_icmpne +141 -> 152
    //   14: aload_3
    //   15: ldc_w 720
    //   18: invokevirtual 1334	android/content/Intent:getStringExtra	(Ljava/lang/String;)Ljava/lang/String;
    //   21: astore_3
    //   22: aload_3
    //   23: ifnull +135 -> 158
    //   26: aload_3
    //   27: invokevirtual 433	java/lang/String:length	()I
    //   30: ifle +128 -> 158
    //   33: new 286	org/json/JSONObject
    //   36: dup
    //   37: aload_3
    //   38: invokespecial 338	org/json/JSONObject:<init>	(Ljava/lang/String;)V
    //   41: astore 4
    //   43: aload 4
    //   45: ifnull +1006 -> 1051
    //   48: aload 4
    //   50: ldc_w 725
    //   53: invokevirtual 463	org/json/JSONObject:optString	(Ljava/lang/String;)Ljava/lang/String;
    //   56: astore_3
    //   57: aload 4
    //   59: ldc_w 1094
    //   62: iconst_m1
    //   63: invokevirtual 1416	org/json/JSONObject:optInt	(Ljava/lang/String;I)I
    //   66: istore_2
    //   67: aload 4
    //   69: ldc_w 714
    //   72: invokevirtual 463	org/json/JSONObject:optString	(Ljava/lang/String;)Ljava/lang/String;
    //   75: astore 4
    //   77: aload 4
    //   79: ifnull +92 -> 171
    //   82: aload 4
    //   84: invokevirtual 433	java/lang/String:length	()I
    //   87: ifle +84 -> 171
    //   90: new 286	org/json/JSONObject
    //   93: dup
    //   94: aload 4
    //   96: invokespecial 338	org/json/JSONObject:<init>	(Ljava/lang/String;)V
    //   99: astore 4
    //   101: aload_3
    //   102: astore 5
    //   104: aload 4
    //   106: astore_3
    //   107: aload 5
    //   109: astore 4
    //   111: aload_0
    //   112: getfield 512	com/tencent/mobileqq/activity/qwallet/SendHbActivity:jdField_a_of_type_CooperationQwalletPluginQWalletPayProgressDialog	Lcooperation/qwallet/plugin/QWalletPayProgressDialog;
    //   115: invokevirtual 1419	cooperation/qwallet/plugin/QWalletPayProgressDialog:dismiss	()V
    //   118: iload_2
    //   119: ifne +861 -> 980
    //   122: aload_3
    //   123: ifnull +857 -> 980
    //   126: iload_1
    //   127: lookupswitch	default:+25->152, 5:+56->183, 9:+239->366
    //   152: return
    //   153: astore_3
    //   154: aload_3
    //   155: invokevirtual 196	java/lang/Exception:printStackTrace	()V
    //   158: aconst_null
    //   159: astore 4
    //   161: goto -118 -> 43
    //   164: astore 4
    //   166: aload 4
    //   168: invokevirtual 196	java/lang/Exception:printStackTrace	()V
    //   171: aconst_null
    //   172: astore 5
    //   174: aload_3
    //   175: astore 4
    //   177: aload 5
    //   179: astore_3
    //   180: goto -69 -> 111
    //   183: aload_0
    //   184: getfield 1116	com/tencent/mobileqq/activity/qwallet/SendHbActivity:jdField_d_of_type_Boolean	Z
    //   187: ifeq +72 -> 259
    //   190: aload_0
    //   191: iconst_0
    //   192: putfield 1116	com/tencent/mobileqq/activity/qwallet/SendHbActivity:jdField_d_of_type_Boolean	Z
    //   195: aload_3
    //   196: ldc_w 1421
    //   199: invokevirtual 765	org/json/JSONObject:optInt	(Ljava/lang/String;)I
    //   202: iconst_1
    //   203: if_icmpne +48 -> 251
    //   206: aload_0
    //   207: getfield 944	com/tencent/mobileqq/activity/qwallet/SendHbActivity:jdField_a_of_type_AndroidViewView	Landroid/view/View;
    //   210: iconst_0
    //   211: invokevirtual 973	android/view/View:setVisibility	(I)V
    //   214: aload_0
    //   215: aload_3
    //   216: ldc_w 1423
    //   219: invokevirtual 463	org/json/JSONObject:optString	(Ljava/lang/String;)Ljava/lang/String;
    //   222: putfield 680	com/tencent/mobileqq/activity/qwallet/SendHbActivity:v	Ljava/lang/String;
    //   225: aload_0
    //   226: aload_0
    //   227: getfield 306	com/tencent/mobileqq/activity/qwallet/SendHbActivity:jdField_c_of_type_JavaLangString	Ljava/lang/String;
    //   230: aload_0
    //   231: invokevirtual 1407	com/tencent/mobileqq/activity/qwallet/SendHbActivity:a	()I
    //   234: ldc_w 1425
    //   237: ldc_w 428
    //   240: ldc_w 428
    //   243: iconst_2
    //   244: ldc_w 428
    //   247: invokevirtual 1411	com/tencent/mobileqq/activity/qwallet/SendHbActivity:a	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V
    //   250: return
    //   251: aload_0
    //   252: ldc_w 1427
    //   255: invokevirtual 440	com/tencent/mobileqq/activity/qwallet/SendHbActivity:a	(Ljava/lang/CharSequence;)V
    //   258: return
    //   259: ldc 22
    //   261: aload_0
    //   262: getfield 94	com/tencent/mobileqq/activity/qwallet/SendHbActivity:l	Ljava/lang/String;
    //   265: invokevirtual 145	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   268: ifne +13 -> 281
    //   271: aload_0
    //   272: getfield 199	com/tencent/mobileqq/activity/qwallet/SendHbActivity:jdField_i_of_type_Int	I
    //   275: bipush 64
    //   277: iand
    //   278: ifle +76 -> 354
    //   281: new 286	org/json/JSONObject
    //   284: dup
    //   285: invokespecial 287	org/json/JSONObject:<init>	()V
    //   288: astore 4
    //   290: aload 4
    //   292: ldc_w 1429
    //   295: aload_3
    //   296: ldc_w 1429
    //   299: invokevirtual 463	org/json/JSONObject:optString	(Ljava/lang/String;)Ljava/lang/String;
    //   302: invokevirtual 1432	org/json/JSONObject:putOpt	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   305: pop
    //   306: aload 4
    //   308: ldc_w 559
    //   311: aload_0
    //   312: aload_0
    //   313: getfield 161	com/tencent/mobileqq/activity/qwallet/SendHbActivity:w	Ljava/lang/String;
    //   316: invokespecial 561	com/tencent/mobileqq/activity/qwallet/SendHbActivity:a	(Ljava/lang/String;)Ljava/lang/String;
    //   319: invokevirtual 1432	org/json/JSONObject:putOpt	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   322: pop
    //   323: aload_0
    //   324: iconst_m1
    //   325: aload_0
    //   326: iload_2
    //   327: ldc_w 428
    //   330: aload 4
    //   332: invokevirtual 623	org/json/JSONObject:toString	()Ljava/lang/String;
    //   335: invokevirtual 1434	com/tencent/mobileqq/activity/qwallet/SendHbActivity:a	(ILjava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    //   338: invokevirtual 1102	com/tencent/mobileqq/activity/qwallet/SendHbActivity:setResult	(ILandroid/content/Intent;)V
    //   341: aload_0
    //   342: invokevirtual 1437	com/tencent/mobileqq/activity/qwallet/SendHbActivity:finish	()V
    //   345: return
    //   346: astore_3
    //   347: aload_3
    //   348: invokevirtual 648	org/json/JSONException:printStackTrace	()V
    //   351: goto -28 -> 323
    //   354: aload_0
    //   355: aload_3
    //   356: ldc_w 1429
    //   359: invokevirtual 463	org/json/JSONObject:optString	(Ljava/lang/String;)Ljava/lang/String;
    //   362: invokespecial 1439	com/tencent/mobileqq/activity/qwallet/SendHbActivity:c	(Ljava/lang/String;)V
    //   365: return
    //   366: aload_3
    //   367: ldc_w 1441
    //   370: invokevirtual 463	org/json/JSONObject:optString	(Ljava/lang/String;)Ljava/lang/String;
    //   373: astore 4
    //   375: new 174	java/lang/StringBuffer
    //   378: dup
    //   379: invokespecial 1442	java/lang/StringBuffer:<init>	()V
    //   382: astore 5
    //   384: aload 5
    //   386: ldc_w 1444
    //   389: invokevirtual 181	java/lang/StringBuffer:append	(Ljava/lang/String;)Ljava/lang/StringBuffer;
    //   392: pop
    //   393: aload_0
    //   394: getfield 448	com/tencent/mobileqq/activity/qwallet/SendHbActivity:jdField_b_of_type_AndroidWidgetEditText	Landroid/widget/EditText;
    //   397: ifnull +463 -> 860
    //   400: aload_0
    //   401: getfield 448	com/tencent/mobileqq/activity/qwallet/SendHbActivity:jdField_b_of_type_AndroidWidgetEditText	Landroid/widget/EditText;
    //   404: invokevirtual 409	android/widget/EditText:getText	()Landroid/text/Editable;
    //   407: invokevirtual 417	java/lang/Object:toString	()Ljava/lang/String;
    //   410: astore 6
    //   412: aload 6
    //   414: invokestatic 153	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   417: ifeq +432 -> 849
    //   420: aload 5
    //   422: ldc 92
    //   424: invokevirtual 181	java/lang/StringBuffer:append	(Ljava/lang/String;)Ljava/lang/StringBuffer;
    //   427: pop
    //   428: aload 5
    //   430: ldc_w 1446
    //   433: invokevirtual 181	java/lang/StringBuffer:append	(Ljava/lang/String;)Ljava/lang/StringBuffer;
    //   436: pop
    //   437: ldc 92
    //   439: aload_0
    //   440: getfield 238	com/tencent/mobileqq/activity/qwallet/SendHbActivity:jdField_e_of_type_JavaLangString	Ljava/lang/String;
    //   443: invokevirtual 145	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   446: ifne +40 -> 486
    //   449: ldc -16
    //   451: aload_0
    //   452: getfield 238	com/tencent/mobileqq/activity/qwallet/SendHbActivity:jdField_e_of_type_JavaLangString	Ljava/lang/String;
    //   455: invokevirtual 145	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   458: ifne +28 -> 486
    //   461: ldc_w 976
    //   464: aload_0
    //   465: getfield 238	com/tencent/mobileqq/activity/qwallet/SendHbActivity:jdField_e_of_type_JavaLangString	Ljava/lang/String;
    //   468: invokevirtual 145	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   471: ifne +15 -> 486
    //   474: ldc -14
    //   476: aload_0
    //   477: getfield 238	com/tencent/mobileqq/activity/qwallet/SendHbActivity:jdField_e_of_type_JavaLangString	Ljava/lang/String;
    //   480: invokevirtual 145	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   483: ifeq +388 -> 871
    //   486: aload 5
    //   488: ldc_w 1448
    //   491: invokevirtual 181	java/lang/StringBuffer:append	(Ljava/lang/String;)Ljava/lang/StringBuffer;
    //   494: pop
    //   495: aload 5
    //   497: ldc_w 1450
    //   500: invokevirtual 181	java/lang/StringBuffer:append	(Ljava/lang/String;)Ljava/lang/StringBuffer;
    //   503: pop
    //   504: aload 5
    //   506: aload_0
    //   507: invokespecial 595	com/tencent/mobileqq/activity/qwallet/SendHbActivity:a	()Ljava/lang/String;
    //   510: invokevirtual 181	java/lang/StringBuffer:append	(Ljava/lang/String;)Ljava/lang/StringBuffer;
    //   513: pop
    //   514: aload 5
    //   516: ldc_w 1452
    //   519: invokevirtual 181	java/lang/StringBuffer:append	(Ljava/lang/String;)Ljava/lang/StringBuffer;
    //   522: pop
    //   523: aload_0
    //   524: getfield 557	com/tencent/mobileqq/activity/qwallet/SendHbActivity:jdField_c_of_type_Boolean	Z
    //   527: ifeq +381 -> 908
    //   530: aload 5
    //   532: aload_0
    //   533: aload_0
    //   534: getfield 161	com/tencent/mobileqq/activity/qwallet/SendHbActivity:w	Ljava/lang/String;
    //   537: invokespecial 561	com/tencent/mobileqq/activity/qwallet/SendHbActivity:a	(Ljava/lang/String;)Ljava/lang/String;
    //   540: invokevirtual 181	java/lang/StringBuffer:append	(Ljava/lang/String;)Ljava/lang/StringBuffer;
    //   543: pop
    //   544: aload_0
    //   545: aload_0
    //   546: getfield 306	com/tencent/mobileqq/activity/qwallet/SendHbActivity:jdField_c_of_type_JavaLangString	Ljava/lang/String;
    //   549: aload_0
    //   550: invokevirtual 1407	com/tencent/mobileqq/activity/qwallet/SendHbActivity:a	()I
    //   553: ldc_w 1454
    //   556: aload 5
    //   558: invokevirtual 190	java/lang/StringBuffer:toString	()Ljava/lang/String;
    //   561: aconst_null
    //   562: iconst_2
    //   563: ldc_w 428
    //   566: invokevirtual 1411	com/tencent/mobileqq/activity/qwallet/SendHbActivity:a	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V
    //   569: aload 4
    //   571: ifnull -419 -> 152
    //   574: aload_0
    //   575: getfield 587	com/tencent/mobileqq/activity/qwallet/SendHbActivity:jdField_f_of_type_JavaLangString	Ljava/lang/String;
    //   578: invokestatic 153	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   581: ifne +387 -> 968
    //   584: new 174	java/lang/StringBuffer
    //   587: dup
    //   588: aload 4
    //   590: invokestatic 1458	android/net/Uri:decode	(Ljava/lang/String;)Ljava/lang/String;
    //   593: invokespecial 177	java/lang/StringBuffer:<init>	(Ljava/lang/String;)V
    //   596: astore 4
    //   598: aload_3
    //   599: ldc_w 1118
    //   602: invokevirtual 463	org/json/JSONObject:optString	(Ljava/lang/String;)Ljava/lang/String;
    //   605: astore 5
    //   607: aload 5
    //   609: invokestatic 153	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   612: ifne +20 -> 632
    //   615: aload 4
    //   617: ldc_w 1460
    //   620: invokevirtual 181	java/lang/StringBuffer:append	(Ljava/lang/String;)Ljava/lang/StringBuffer;
    //   623: pop
    //   624: aload 4
    //   626: aload 5
    //   628: invokevirtual 181	java/lang/StringBuffer:append	(Ljava/lang/String;)Ljava/lang/StringBuffer;
    //   631: pop
    //   632: aload_3
    //   633: ldc_w 1462
    //   636: invokevirtual 463	org/json/JSONObject:optString	(Ljava/lang/String;)Ljava/lang/String;
    //   639: astore 5
    //   641: aload 5
    //   643: invokestatic 153	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   646: ifne +20 -> 666
    //   649: aload 4
    //   651: ldc_w 1464
    //   654: invokevirtual 181	java/lang/StringBuffer:append	(Ljava/lang/String;)Ljava/lang/StringBuffer;
    //   657: pop
    //   658: aload 4
    //   660: aload 5
    //   662: invokevirtual 181	java/lang/StringBuffer:append	(Ljava/lang/String;)Ljava/lang/StringBuffer;
    //   665: pop
    //   666: aload_3
    //   667: ldc_w 1466
    //   670: invokevirtual 463	org/json/JSONObject:optString	(Ljava/lang/String;)Ljava/lang/String;
    //   673: astore 5
    //   675: aload 5
    //   677: invokestatic 153	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   680: ifne +20 -> 700
    //   683: aload 4
    //   685: ldc_w 1468
    //   688: invokevirtual 181	java/lang/StringBuffer:append	(Ljava/lang/String;)Ljava/lang/StringBuffer;
    //   691: pop
    //   692: aload 4
    //   694: aload 5
    //   696: invokevirtual 181	java/lang/StringBuffer:append	(Ljava/lang/String;)Ljava/lang/StringBuffer;
    //   699: pop
    //   700: aload_3
    //   701: ldc_w 1470
    //   704: invokevirtual 463	org/json/JSONObject:optString	(Ljava/lang/String;)Ljava/lang/String;
    //   707: astore_3
    //   708: aload_3
    //   709: invokestatic 153	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   712: ifne +19 -> 731
    //   715: aload 4
    //   717: ldc_w 1472
    //   720: invokevirtual 181	java/lang/StringBuffer:append	(Ljava/lang/String;)Ljava/lang/StringBuffer;
    //   723: pop
    //   724: aload 4
    //   726: aload_3
    //   727: invokevirtual 181	java/lang/StringBuffer:append	(Ljava/lang/String;)Ljava/lang/StringBuffer;
    //   730: pop
    //   731: new 286	org/json/JSONObject
    //   734: dup
    //   735: invokespecial 287	org/json/JSONObject:<init>	()V
    //   738: astore_3
    //   739: new 286	org/json/JSONObject
    //   742: dup
    //   743: invokespecial 287	org/json/JSONObject:<init>	()V
    //   746: astore 5
    //   748: aload 5
    //   750: ldc_w 1441
    //   753: aload 4
    //   755: invokevirtual 190	java/lang/StringBuffer:toString	()Ljava/lang/String;
    //   758: invokevirtual 555	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   761: pop
    //   762: aload_3
    //   763: ldc_w 1094
    //   766: iconst_0
    //   767: invokevirtual 600	org/json/JSONObject:put	(Ljava/lang/String;I)Lorg/json/JSONObject;
    //   770: pop
    //   771: aload_3
    //   772: ldc_w 725
    //   775: ldc_w 1474
    //   778: invokevirtual 555	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   781: pop
    //   782: aload_3
    //   783: ldc_w 714
    //   786: aload 5
    //   788: invokevirtual 555	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   791: pop
    //   792: new 711	android/content/Intent
    //   795: dup
    //   796: invokespecial 712	android/content/Intent:<init>	()V
    //   799: astore 4
    //   801: aload 4
    //   803: ldc_w 634
    //   806: aload_0
    //   807: getfield 1096	com/tencent/mobileqq/activity/qwallet/SendHbActivity:jdField_h_of_type_JavaLangString	Ljava/lang/String;
    //   810: invokevirtual 718	android/content/Intent:putExtra	(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    //   813: pop
    //   814: aload 4
    //   816: ldc_w 1098
    //   819: iconst_5
    //   820: invokevirtual 723	android/content/Intent:putExtra	(Ljava/lang/String;I)Landroid/content/Intent;
    //   823: pop
    //   824: aload 4
    //   826: ldc_w 720
    //   829: aload_3
    //   830: invokevirtual 623	org/json/JSONObject:toString	()Ljava/lang/String;
    //   833: invokevirtual 718	android/content/Intent:putExtra	(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    //   836: pop
    //   837: aload_0
    //   838: iconst_m1
    //   839: aload 4
    //   841: invokevirtual 1102	com/tencent/mobileqq/activity/qwallet/SendHbActivity:setResult	(ILandroid/content/Intent;)V
    //   844: aload_0
    //   845: invokevirtual 1437	com/tencent/mobileqq/activity/qwallet/SendHbActivity:finish	()V
    //   848: return
    //   849: aload 5
    //   851: aload 6
    //   853: invokevirtual 181	java/lang/StringBuffer:append	(Ljava/lang/String;)Ljava/lang/StringBuffer;
    //   856: pop
    //   857: goto -429 -> 428
    //   860: aload 5
    //   862: ldc 92
    //   864: invokevirtual 181	java/lang/StringBuffer:append	(Ljava/lang/String;)Ljava/lang/StringBuffer;
    //   867: pop
    //   868: goto -440 -> 428
    //   871: ldc_w 442
    //   874: aload_0
    //   875: getfield 238	com/tencent/mobileqq/activity/qwallet/SendHbActivity:jdField_e_of_type_JavaLangString	Ljava/lang/String;
    //   878: invokevirtual 145	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   881: ifeq +15 -> 896
    //   884: aload 5
    //   886: ldc_w 1476
    //   889: invokevirtual 181	java/lang/StringBuffer:append	(Ljava/lang/String;)Ljava/lang/StringBuffer;
    //   892: pop
    //   893: goto -398 -> 495
    //   896: aload 5
    //   898: ldc_w 1478
    //   901: invokevirtual 181	java/lang/StringBuffer:append	(Ljava/lang/String;)Ljava/lang/StringBuffer;
    //   904: pop
    //   905: goto -410 -> 495
    //   908: aload_0
    //   909: getfield 448	com/tencent/mobileqq/activity/qwallet/SendHbActivity:jdField_b_of_type_AndroidWidgetEditText	Landroid/widget/EditText;
    //   912: ifnull +16 -> 928
    //   915: ldc_w 442
    //   918: aload_0
    //   919: getfield 444	com/tencent/mobileqq/activity/qwallet/SendHbActivity:u	Ljava/lang/String;
    //   922: invokevirtual 145	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   925: ifeq +26 -> 951
    //   928: aload 5
    //   930: aload_0
    //   931: aload_0
    //   932: getfield 405	com/tencent/mobileqq/activity/qwallet/SendHbActivity:jdField_a_of_type_AndroidWidgetEditText	Landroid/widget/EditText;
    //   935: invokevirtual 409	android/widget/EditText:getText	()Landroid/text/Editable;
    //   938: invokevirtual 417	java/lang/Object:toString	()Ljava/lang/String;
    //   941: invokespecial 561	com/tencent/mobileqq/activity/qwallet/SendHbActivity:a	(Ljava/lang/String;)Ljava/lang/String;
    //   944: invokevirtual 181	java/lang/StringBuffer:append	(Ljava/lang/String;)Ljava/lang/StringBuffer;
    //   947: pop
    //   948: goto -404 -> 544
    //   951: aload 5
    //   953: aload_0
    //   954: aload_0
    //   955: getfield 161	com/tencent/mobileqq/activity/qwallet/SendHbActivity:w	Ljava/lang/String;
    //   958: invokespecial 561	com/tencent/mobileqq/activity/qwallet/SendHbActivity:a	(Ljava/lang/String;)Ljava/lang/String;
    //   961: invokevirtual 181	java/lang/StringBuffer:append	(Ljava/lang/String;)Ljava/lang/StringBuffer;
    //   964: pop
    //   965: goto -421 -> 544
    //   968: aload_0
    //   969: aload_3
    //   970: ldc_w 1118
    //   973: invokevirtual 463	org/json/JSONObject:optString	(Ljava/lang/String;)Ljava/lang/String;
    //   976: invokevirtual 1480	com/tencent/mobileqq/activity/qwallet/SendHbActivity:a	(Ljava/lang/String;)V
    //   979: return
    //   980: iload_2
    //   981: ifle +29 -> 1010
    //   984: aload_0
    //   985: ldc_w 1481
    //   988: invokevirtual 438	com/tencent/mobileqq/activity/qwallet/SendHbActivity:getString	(I)Ljava/lang/String;
    //   991: astore_3
    //   992: aload 4
    //   994: ifnull +10 -> 1004
    //   997: aload_0
    //   998: aload 4
    //   1000: invokevirtual 440	com/tencent/mobileqq/activity/qwallet/SendHbActivity:a	(Ljava/lang/CharSequence;)V
    //   1003: return
    //   1004: aload_0
    //   1005: aload_3
    //   1006: invokevirtual 440	com/tencent/mobileqq/activity/qwallet/SendHbActivity:a	(Ljava/lang/CharSequence;)V
    //   1009: return
    //   1010: iload_2
    //   1011: bipush -10
    //   1013: if_icmpge -861 -> 152
    //   1016: aload_0
    //   1017: new 291	java/lang/StringBuilder
    //   1020: dup
    //   1021: invokespecial 292	java/lang/StringBuilder:<init>	()V
    //   1024: ldc_w 1483
    //   1027: invokevirtual 302	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1030: iload_2
    //   1031: invokevirtual 1136	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   1034: invokevirtual 309	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1037: invokevirtual 440	com/tencent/mobileqq/activity/qwallet/SendHbActivity:a	(Ljava/lang/CharSequence;)V
    //   1040: return
    //   1041: astore 4
    //   1043: goto -251 -> 792
    //   1046: astore 5
    //   1048: goto -930 -> 118
    //   1051: aconst_null
    //   1052: astore_3
    //   1053: aconst_null
    //   1054: astore 4
    //   1056: goto -945 -> 111
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	1059	0	this	SendHbActivity
    //   0	1059	1	paramInt1	int
    //   0	1059	2	paramInt2	int
    //   0	1059	3	paramIntent	Intent
    //   41	119	4	localObject1	Object
    //   164	3	4	localException1	Exception
    //   175	824	4	localObject2	Object
    //   1041	1	4	localException2	Exception
    //   1054	1	4	localObject3	Object
    //   102	850	5	localObject4	Object
    //   1046	1	5	localException3	Exception
    //   410	442	6	str	String
    // Exception table:
    //   from	to	target	type
    //   33	43	153	java/lang/Exception
    //   90	101	164	java/lang/Exception
    //   290	323	346	org/json/JSONException
    //   739	792	1041	java/lang/Exception
    //   111	118	1046	java/lang/Exception
  }
  
  public void onAnimationEnd(Animation paramAnimation)
  {
    d();
    jdField_b_of_type_AndroidWidgetLinearLayout.setVisibility(0);
    jdField_b_of_type_AndroidViewView.setVisibility(0);
    jdField_b_of_type_AndroidWidgetTextView.setVisibility(0);
  }
  
  public void onAnimationRepeat(Animation paramAnimation) {}
  
  public void onAnimationStart(Animation paramAnimation) {}
  
  public void onClick(View paramView)
  {
    int i1 = paramView.getId();
    if (i1 == 2131297035) {
      if (jdField_a_of_type_Boolean) {
        if (jdField_c_of_type_Boolean)
        {
          a(jdField_c_of_type_JavaLangString, a(), "theme.pack.keyback", "", "", 2, "");
          a(-1, null);
          ((InputMethodManager)getSystemService("input_method")).hideSoftInputFromWindow(jdField_c_of_type_AndroidWidgetEditText.getWindowToken(), 0);
          finish();
        }
      }
    }
    label260:
    label354:
    label389:
    label503:
    label529:
    label561:
    label681:
    label707:
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
                do
                {
                  return;
                  a(jdField_c_of_type_JavaLangString, a(), "hongbao.wrap.keyback", "", "", 2, "");
                  break;
                  a(jdField_c_of_type_JavaLangString, a(), "hongbao.wrap.back", "", "", 2, "");
                  break;
                  if (i1 == 2131297763)
                  {
                    paramView = new StringBuffer();
                    paramView.append("number#");
                    String str;
                    if (jdField_b_of_type_AndroidWidgetEditText != null)
                    {
                      str = jdField_b_of_type_AndroidWidgetEditText.getText().toString();
                      if (TextUtils.isEmpty(str))
                      {
                        paramView.append("1");
                        paramView.append(",type#");
                        if ((!"1".equals(jdField_e_of_type_JavaLangString)) && (!"7".equals(jdField_e_of_type_JavaLangString)) && (!"4".equals(jdField_e_of_type_JavaLangString)) && (!"5".equals(jdField_e_of_type_JavaLangString))) {
                          break label354;
                        }
                        paramView.append("person");
                        paramView.append(",channel#");
                        paramView.append(a());
                        paramView.append(",money#");
                        if (!jdField_c_of_type_Boolean) {
                          break label389;
                        }
                        paramView.append(a(w));
                      }
                    }
                    for (;;)
                    {
                      a(jdField_c_of_type_JavaLangString, a(), "hongbao.wrap.go", paramView.toString(), null, 2, "");
                      b(1);
                      return;
                      paramView.append(str);
                      break;
                      paramView.append("1");
                      break;
                      if ("2".equals(jdField_e_of_type_JavaLangString))
                      {
                        paramView.append("crowd");
                        break label260;
                      }
                      paramView.append("group");
                      break label260;
                      if ((jdField_b_of_type_AndroidWidgetEditText == null) || ("2".equals(u))) {
                        paramView.append(a(jdField_a_of_type_AndroidWidgetEditText.getText().toString()));
                      } else {
                        paramView.append(a(w));
                      }
                    }
                  }
                  if (i1 != 2131300151) {
                    break label529;
                  }
                  if ((!"1".equals(jdField_e_of_type_JavaLangString)) && (!"7".equals(jdField_e_of_type_JavaLangString))) {
                    break label503;
                  }
                } while (jdField_a_of_type_AndroidSupportV4ViewViewPager.getCurrentItem() == 0);
                a(1);
                jdField_a_of_type_AndroidSupportV4ViewViewPager.setCurrentItem(0, true);
                return;
              } while (jdField_a_of_type_AndroidSupportV4ViewViewPager.getCurrentItem() == 1);
              a(1);
              jdField_a_of_type_AndroidSupportV4ViewViewPager.setCurrentItem(1, true);
              return;
              if (i1 != 2131300150) {
                break label561;
              }
            } while (jdField_a_of_type_AndroidSupportV4ViewViewPager.getCurrentItem() == 0);
            a(0);
            jdField_a_of_type_AndroidSupportV4ViewViewPager.setCurrentItem(0, true);
            return;
            if ((i1 != 2131300153) && (i1 != 2131300152)) {
              break label707;
            }
            paramView = getSharedPreferences("qb_tenpay_hb_ling", 0);
            if (!paramView.getBoolean("is_clicked", false))
            {
              jdField_a_of_type_AndroidWidgetImageView.setVisibility(8);
              paramView = paramView.edit();
              paramView.putBoolean("is_clicked", true);
              paramView.commit();
            }
            if ((!"1".equals(jdField_e_of_type_JavaLangString)) && (!"7".equals(jdField_e_of_type_JavaLangString))) {
              break label681;
            }
          } while (jdField_a_of_type_AndroidSupportV4ViewViewPager.getCurrentItem() == 1);
          a(2);
          jdField_a_of_type_AndroidSupportV4ViewViewPager.setCurrentItem(1, true);
          return;
        } while (jdField_a_of_type_AndroidSupportV4ViewViewPager.getCurrentItem() == 2);
        a(2);
        jdField_a_of_type_AndroidSupportV4ViewViewPager.setCurrentItem(2, true);
        return;
        if (i1 == 2131300160)
        {
          paramView = new Intent();
          paramView.putExtra("hb_id", v);
          paramView.putExtra("send_uin", jdField_c_of_type_JavaLangString);
          paramView.putExtra("hb_type", "1");
          paramView.putExtra("forward_text", "发红包啦!");
          paramView.putExtra("forward_type", 17);
          ForwardBaseOption.a(this, paramView);
          a(jdField_c_of_type_JavaLangString, a(), "hongbao.wrapped.send", "", "", 2, "");
          return;
        }
        if (i1 == 2131300159)
        {
          a("未发送的红包可在“红包记录>发出的红包”里找到并继续发送", "稍后再发", "现在发送");
          if (jdField_a_of_type_Boolean)
          {
            a(jdField_c_of_type_JavaLangString, a(), "hongbao.wrapped.keyback", "", "", 2, "");
            return;
          }
          a(jdField_c_of_type_JavaLangString, a(), "hongbao.wrapped.close", "", "", 2, "");
          return;
        }
        if (i1 == 2131297081)
        {
          a(jdField_c_of_type_JavaLangString, a(), "hongbao.wrap.vip", "", "", 2, "");
          paramView = new Intent();
          paramView.setClass(jdField_a_of_type_AndroidContentContext, QQBrowserActivity.class);
          paramView.putExtra("url", o);
          paramView.putExtra("hide_operation_bar", true);
          paramView.putExtra("hide_more_button", true);
          paramView.putExtra("startOpenPageTime", System.currentTimeMillis());
          startActivity(paramView);
          return;
        }
        if (i1 == 2131300164)
        {
          a(jdField_c_of_type_JavaLangString, a(), "theme.pack.back", "", "", 2, "");
          if (("64".equals(l)) || ((jdField_i_of_type_Int & 0x40) > 0)) {
            setResult(-1, a(54535, "", ""));
          }
          finish();
          super.overridePendingTransition(0, 0);
          return;
        }
        if (i1 == 2131300176)
        {
          a(jdField_c_of_type_JavaLangString, a(), "theme.pack.go", "", "", 2, "");
          b(jdField_e_of_type_Int);
          return;
        }
        if (i1 == 2131300173)
        {
          a(jdField_c_of_type_JavaLangString, a(), "theme.pack.change", "", "", 2, "");
          d();
          return;
        }
        if (i1 == 2131300162)
        {
          a(jdField_c_of_type_JavaLangString, a(), "theme.pack.back", "", "", 2, "");
          if (("64".equals(l)) || ((jdField_i_of_type_Int & 0x40) > 0)) {
            setResult(-1, a(54535, "", ""));
          }
          finish();
          super.overridePendingTransition(0, 0);
          return;
        }
      } while (i1 != 2131298451);
      a(jdField_c_of_type_JavaLangString, a(), "hongbao.wrap.notice", "", "", 2, "");
    } while (TextUtils.isEmpty(s));
    paramView = new Intent();
    paramView.setClass(jdField_a_of_type_AndroidContentContext, QQBrowserActivity.class);
    paramView.putExtra("url", s);
    paramView.putExtra("hide_operation_bar", true);
    paramView.putExtra("hide_more_button", true);
    paramView.putExtra("startOpenPageTime", System.currentTimeMillis());
    startActivity(paramView);
  }
  
  public boolean onKeyDown(int paramInt, KeyEvent paramKeyEvent)
  {
    if (paramInt == 4)
    {
      jdField_a_of_type_Boolean = true;
      if (jdField_a_of_type_AndroidViewView.getVisibility() == 8)
      {
        jdField_a_of_type_AndroidWidgetTextView.performClick();
        return true;
      }
      jdField_e_of_type_AndroidWidgetButton.performClick();
      return true;
    }
    return super.onKeyDown(paramInt, paramKeyEvent);
  }
  
  public void onPageScrollStateChanged(int paramInt) {}
  
  public void onPageScrolled(int paramInt1, float paramFloat, int paramInt2) {}
  
  public void onPageSelected(int paramInt)
  {
    if (paramInt == 1) {
      a(jdField_c_of_type_JavaLangString, a(), "hongbao.wrap.identical", "", "", 2, "");
    }
    for (;;)
    {
      int i1 = jdField_g_of_type_Int * 2 + jdField_f_of_type_Int;
      TranslateAnimation localTranslateAnimation = new TranslateAnimation(jdField_h_of_type_Int * i1, i1 * paramInt, 0.0F, 0.0F);
      jdField_h_of_type_Int = paramInt;
      localTranslateAnimation.setFillAfter(true);
      localTranslateAnimation.setDuration(300L);
      jdField_f_of_type_AndroidWidgetLinearLayout.startAnimation(localTranslateAnimation);
      if (("1".equals(jdField_e_of_type_JavaLangString)) || ("7".equals(jdField_e_of_type_JavaLangString))) {
        break;
      }
      a(paramInt);
      return;
      if (paramInt == 0) {
        a(jdField_c_of_type_JavaLangString, a(), "hongbao.wrap.random", "", "", 2, "");
      } else if (paramInt == 2) {
        a(jdField_c_of_type_JavaLangString, a(), "hongbao.wrap.hopngbaokey", "", "", 2, "");
      }
    }
    a(paramInt + 1);
  }
  
  protected void requestWindowFeature(Intent paramIntent)
  {
    requestWindowFeature(1);
  }
}
