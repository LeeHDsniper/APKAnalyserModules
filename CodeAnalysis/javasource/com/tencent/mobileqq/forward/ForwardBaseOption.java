package com.tencent.mobileqq.forward;

import android.app.Activity;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.DialogInterface.OnDismissListener;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.view.Display;
import android.view.View.OnClickListener;
import android.view.WindowManager;
import android.widget.TextView;
import com.dataline.activities.LiteActivity;
import com.tencent.biz.eqq.CrmUtils;
import com.tencent.biz.widgets.ShareResultDialog;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.device.datadef.DeviceInfo;
import com.tencent.device.devicemgr.SmartDeviceProxyMgr;
import com.tencent.device.utils.LightAppSettingInfo;
import com.tencent.image.URLDrawable;
import com.tencent.mobileqq.activity.DirectForwardActivity;
import com.tencent.mobileqq.activity.ForwardRecentActivity;
import com.tencent.mobileqq.app.AppConstants;
import com.tencent.mobileqq.app.DiscussionManager;
import com.tencent.mobileqq.app.DiscussionObserver;
import com.tencent.mobileqq.app.FriendsManager;
import com.tencent.mobileqq.app.HotChatManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.RouterHandler;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.app.TroopManager;
import com.tencent.mobileqq.data.DiscussionInfo;
import com.tencent.mobileqq.data.Groups;
import com.tencent.mobileqq.data.RecentUser;
import com.tencent.mobileqq.filemanager.data.FileInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.model.PhoneContactManager;
import com.tencent.mobileqq.multimsg.MultiMsgManager;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.transfile.URLDrawableHelper;
import com.tencent.mobileqq.util.BitmapManager;
import com.tencent.mobileqq.util.Utils;
import com.tencent.mobileqq.utils.DialogUtil;
import com.tencent.mobileqq.utils.ImageUtil;
import com.tencent.mobileqq.utils.QQCustomDialog;
import com.tencent.mobileqq.widget.QQProgressDialog;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import cooperation.photoplus.PhotoPlusBridgeActivity;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import pfk;
import pfl;
import pfm;
import pfn;
import pfp;
import pfq;
import pfr;
import pfs;

public abstract class ForwardBaseOption
  implements DialogInterface.OnDismissListener, ForwardAbility, ForwardAbility.ForwardAbilityType, ForwardConstants, ForwardDialogBuilder
{
  public static int a = 0;
  public static final String b = "ForwardOption.ForwardBaseOption";
  public float a;
  public long a;
  public Activity a;
  protected Context a;
  DialogInterface.OnClickListener jdField_a_of_type_AndroidContentDialogInterface$OnClickListener;
  public Intent a;
  public Bundle a;
  View.OnClickListener jdField_a_of_type_AndroidViewView$OnClickListener;
  protected ShareResultDialog a;
  DiscussionObserver jdField_a_of_type_ComTencentMobileqqAppDiscussionObserver;
  public QQAppInterface a;
  public QQCustomDialog a;
  private QQProgressDialog jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog;
  protected Set a;
  public boolean a;
  DialogInterface.OnClickListener b;
  protected boolean b;
  DialogInterface.OnClickListener c;
  protected String c;
  public boolean c;
  public String d;
  public boolean d;
  public String e;
  public String f;
  
  public ForwardBaseOption(Intent paramIntent)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_ComTencentBizWidgetsShareResultDialog = null;
    jdField_c_of_type_Boolean = false;
    jdField_a_of_type_Long = 0L;
    jdField_d_of_type_Boolean = false;
    jdField_a_of_type_ComTencentMobileqqAppDiscussionObserver = new pfs(this);
    jdField_a_of_type_AndroidContentIntent = paramIntent;
    if (paramIntent.getExtras() != null) {}
    for (paramIntent = paramIntent.getExtras();; paramIntent = new Bundle())
    {
      jdField_a_of_type_AndroidOsBundle = paramIntent;
      jdField_a_of_type_AndroidContentContext = BaseApplicationImpl.a().getApplicationContext();
      jdField_b_of_type_Boolean = false;
      return;
    }
  }
  
  public static void a(Activity paramActivity, Intent paramIntent, int paramInt)
  {
    a(paramActivity, paramIntent, ForwardRecentActivity.class, paramInt);
  }
  
  public static void a(Activity paramActivity, Intent paramIntent, Class paramClass, int paramInt)
  {
    paramIntent.setClass(paramActivity, paramClass);
    paramActivity.startActivityForResult(paramIntent, paramInt);
  }
  
  public static void a(Context paramContext, Intent paramIntent)
  {
    a(paramContext, paramIntent, ForwardRecentActivity.class);
  }
  
  public static void a(Context paramContext, Intent paramIntent, Class paramClass)
  {
    paramIntent.setClass(paramContext, paramClass);
    paramContext.startActivity(paramIntent);
  }
  
  private void a(String paramString1, String paramString2)
  {
    if (QLog.isColorLevel()) {
      QLog.d("ForwardOption.ForwardBaseOption", 2, "startPhotoPlus: path=" + paramString1);
    }
    Intent localIntent = new Intent(BaseApplication.getContext(), PhotoPlusBridgeActivity.class);
    localIntent.putExtra("photo_path", paramString1);
    localIntent.putExtra("iswaitforsult", true);
    localIntent.putExtra("uin", paramString2);
    jdField_a_of_type_AndroidOsBundle.putString("EditImagePath", paramString1);
    jdField_a_of_type_AndroidAppActivity.startActivityForResult(localIntent, 100003);
  }
  
  private void u()
  {
    if (jdField_a_of_type_Int <= 0)
    {
      Display localDisplay = ((WindowManager)jdField_a_of_type_AndroidContentContext.getSystemService("window")).getDefaultDisplay();
      int i = jdField_a_of_type_AndroidContentContext.getResources().getDimensionPixelSize(2131493036);
      int j = jdField_a_of_type_AndroidContentContext.getResources().getDimensionPixelSize(2131493034);
      jdField_a_of_type_Int = (localDisplay.getWidth() - i * 2 - j * 3) / 4;
    }
  }
  
  public int a()
  {
    return 2131366996;
  }
  
  protected final DialogInterface.OnClickListener a()
  {
    if (jdField_a_of_type_AndroidContentDialogInterface$OnClickListener == null) {
      jdField_a_of_type_AndroidContentDialogInterface$OnClickListener = new pfk(this);
    }
    return jdField_a_of_type_AndroidContentDialogInterface$OnClickListener;
  }
  
  public Bitmap a(String paramString)
  {
    return BitmapManager.a(paramString);
  }
  
  public Bundle a()
  {
    return jdField_a_of_type_AndroidOsBundle;
  }
  
  public String a()
  {
    String str2 = jdField_a_of_type_AndroidContentIntent.getStringExtra("k_forward_title");
    String str1 = str2;
    if (TextUtils.isEmpty(str2)) {
      str1 = "发送到";
    }
    return str1;
  }
  
  public List a(List paramList)
  {
    ArrayList localArrayList = new ArrayList();
    paramList = paramList.iterator();
    while (paramList.hasNext())
    {
      RecentUser localRecentUser = (RecentUser)paramList.next();
      if ((localRecentUser != null) && (!Utils.a(uin)) && (type != 1020) && (type != 1008) && (type != 1005) && ((type != 1006) || (a(ForwardAbility.ForwardAbilityType.i))) && (type != 1009) && (type != 1021) && (type != 1001) && (type != 1022) && (type != 7000) && (type != 1025) && (type != 1024) && (type != 9501) && ((type != 1) || (!a(uin))) && ((type != 0) || (!CrmUtils.d(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, uin))) && (((type != 1004) && (type != 1000)) || (jdField_b_of_type_Boolean))) {
        localArrayList.add(localRecentUser);
      }
    }
    return localArrayList;
  }
  
  public Set a()
  {
    if (jdField_a_of_type_JavaUtilSet == null)
    {
      jdField_a_of_type_JavaUtilSet = new HashSet();
      a();
    }
    return jdField_a_of_type_JavaUtilSet;
  }
  
  protected void a()
  {
    if (j()) {
      jdField_a_of_type_JavaUtilSet.add(jdField_b_of_type_JavaLangInteger);
    }
    if (h()) {
      jdField_a_of_type_JavaUtilSet.add(jdField_d_of_type_JavaLangInteger);
    }
    if (i()) {
      jdField_a_of_type_JavaUtilSet.add(jdField_c_of_type_JavaLangInteger);
    }
    if (g()) {
      jdField_a_of_type_JavaUtilSet.add(i);
    }
    if (k()) {
      jdField_a_of_type_JavaUtilSet.add(jdField_e_of_type_JavaLangInteger);
    }
    jdField_a_of_type_JavaUtilSet.add(j);
  }
  
  public void a(int paramInt)
  {
    if (jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog == null) {
      jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog = new QQProgressDialog(jdField_a_of_type_AndroidAppActivity, jdField_a_of_type_AndroidContentContext.getResources().getDimensionPixelSize(2131492908));
    }
    jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.b(paramInt);
    jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.show();
  }
  
  public void a(int paramInt1, int paramInt2, Intent paramIntent) {}
  
  public void a(int paramInt, Bundle paramBundle)
  {
    if (!c()) {
      return;
    }
    jdField_a_of_type_AndroidOsBundle.putAll(paramBundle);
    jdField_a_of_type_AndroidOsBundle.putInt("key_forward_ability_type", paramInt);
    h();
  }
  
  protected void a(Intent paramIntent) {}
  
  public void a(Drawable paramDrawable, boolean paramBoolean)
  {
    if (paramBoolean) {
      URLDrawableHelper.a((URLDrawable)paramDrawable, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), true);
    }
    if (paramDrawable == null) {
      return;
    }
    paramDrawable.setBounds(ImageUtil.a(paramDrawable, 36, 100, jdField_a_of_type_Float));
  }
  
  public void a(Drawable paramDrawable, boolean paramBoolean, int paramInt)
  {
    jdField_a_of_type_AndroidAppActivity.runOnUiThread(new pfp(this, paramDrawable, paramBoolean, paramInt));
  }
  
  public void a(QQAppInterface paramQQAppInterface, Activity paramActivity)
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    jdField_a_of_type_AndroidAppActivity = paramActivity;
    jdField_a_of_type_Float = jdField_a_of_type_AndroidAppActivity.getResources().getDisplayMetrics().density;
  }
  
  public void a(QQCustomDialog paramQQCustomDialog) {}
  
  public void a(Integer paramInteger)
  {
    if ((jdField_a_of_type_JavaUtilSet != null) && (jdField_a_of_type_JavaUtilSet.contains(paramInteger))) {
      jdField_a_of_type_JavaUtilSet.remove(paramInteger);
    }
  }
  
  protected void a(String paramString)
  {
    Object localObject1 = (SmartDeviceProxyMgr)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(51);
    Object localObject2 = ((SmartDeviceProxyMgr)localObject1).a(Long.parseLong(paramString));
    ((SmartDeviceProxyMgr)localObject1).a(jdField_a_of_type_AndroidAppActivity, (DeviceInfo)localObject2, false);
    if (jdField_a_of_type_AndroidContentIntent.getBooleanExtra("sendMultiple", false)) {
      localObject1 = jdField_a_of_type_AndroidContentIntent.getStringExtra("forward_filepath");
    }
    for (;;)
    {
      localObject2 = (RouterHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(48);
      ArrayList localArrayList = new ArrayList();
      try
      {
        localArrayList.add(new FileInfo((String)localObject1));
        ((RouterHandler)localObject2).a(localArrayList, null, null, Long.parseLong(paramString));
        return;
        localObject1 = jdField_a_of_type_AndroidContentIntent.getStringExtra("forward_filepath");
      }
      catch (FileNotFoundException localFileNotFoundException)
      {
        for (;;) {}
      }
    }
  }
  
  protected final void a(String paramString, QQCustomDialog paramQQCustomDialog)
  {
    if (QLog.isColorLevel()) {
      QLog.d("ForwardOption.ForwardBaseOption", 2, "addSourceNameView start! sourceName =" + paramString);
    }
    if ((paramString == null) || ("".equals(paramString)) || (paramQQCustomDialog == null)) {
      return;
    }
    TextView localTextView = new TextView(jdField_a_of_type_AndroidAppActivity);
    localTextView.setText(paramString);
    localTextView.setTextSize(12.0F);
    localTextView.setPadding(0, 0, 0, 0);
    localTextView.setIncludeFontPadding(false);
    localTextView.setTextColor(-8355712);
    paramQQCustomDialog.addView(localTextView);
  }
  
  public void a(String paramString1, String paramString2, Bundle paramBundle)
  {
    jdField_d_of_type_Boolean = true;
    Bundle localBundle = new Bundle();
    if (paramBundle != null) {
      localBundle.putAll(paramBundle);
    }
    localBundle.putString("uin", paramString1);
    localBundle.putInt("uintype", 3000);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(jdField_a_of_type_ComTencentMobileqqAppDiscussionObserver);
    paramBundle = ((DiscussionManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(52)).a(paramString1);
    paramString1 = paramString2;
    if (paramBundle != null)
    {
      paramString1 = paramString2;
      if (!TextUtils.isEmpty(discussionName))
      {
        paramString2 = discussionName;
        paramString1 = paramString2;
        if (QLog.isColorLevel())
        {
          QLog.d("ForwardOption.ForwardBaseOption", 4, "afterCreateDiscuss disName=" + paramString2);
          paramString1 = paramString2;
        }
      }
    }
    localBundle.putString("uinname", "讨论组" + paramString1);
    a(ForwardAbility.ForwardAbilityType.jdField_d_of_type_JavaLangInteger.intValue(), localBundle);
  }
  
  public void a(boolean paramBoolean) {}
  
  public boolean a()
  {
    jdField_d_of_type_JavaLangString = jdField_a_of_type_AndroidContentIntent.getStringExtra("forward_thumb");
    jdField_a_of_type_Boolean = jdField_a_of_type_AndroidContentIntent.getBooleanExtra("forward_urldrawable", false);
    jdField_e_of_type_JavaLangString = jdField_a_of_type_AndroidContentIntent.getStringExtra("forward_urldrawable_thumb_url");
    jdField_f_of_type_JavaLangString = jdField_a_of_type_AndroidContentIntent.getStringExtra("forward_urldrawable_big_url");
    jdField_c_of_type_JavaLangString = jdField_a_of_type_AndroidContentIntent.getStringExtra("forward_text");
    if (jdField_a_of_type_AndroidOsBundle != null)
    {
      if (jdField_a_of_type_AndroidOsBundle.getInt("forward_type", -1) == 11) {
        jdField_c_of_type_Boolean = true;
      }
      jdField_a_of_type_Long = jdField_a_of_type_AndroidOsBundle.getLong("req_share_id", 0L);
    }
    u();
    return true;
  }
  
  protected boolean a(Intent paramIntent)
  {
    boolean bool2 = jdField_a_of_type_AndroidOsBundle.getBoolean("isFromFavorites");
    boolean bool1 = bool2;
    if (!bool2)
    {
      String str = jdField_a_of_type_AndroidOsBundle.getString("app_name");
      bool1 = bool2;
      if (!TextUtils.isEmpty(str))
      {
        bool1 = bool2;
        if (str.equals(jdField_a_of_type_AndroidAppActivity.getString(2131365793))) {
          bool1 = true;
        }
      }
    }
    if (bool1)
    {
      jdField_a_of_type_AndroidOsBundle.putBoolean("isBack2Root", true);
      jdField_a_of_type_AndroidOsBundle.putString("leftBackText", jdField_a_of_type_AndroidAppActivity.getString(2131367297));
      paramIntent.putExtras(jdField_a_of_type_AndroidOsBundle);
    }
    bool2 = jdField_a_of_type_AndroidOsBundle.getBoolean("isFromAIOPlus");
    return (bool1) && (bool2);
  }
  
  protected boolean a(LightAppSettingInfo paramLightAppSettingInfo)
  {
    boolean bool = true;
    if (paramLightAppSettingInfo == null) {}
    do
    {
      return false;
      paramLightAppSettingInfo = a;
    } while ((paramLightAppSettingInfo == null) || (jdField_a_of_type_AndroidOsBundle == null));
    switch (jdField_a_of_type_AndroidOsBundle.getInt("req_type"))
    {
    default: 
      bool = false;
    }
    for (;;)
    {
      return bool;
      if (!paramLightAppSettingInfo.contains(Integer.valueOf(11005))) {
        break;
      }
      continue;
      if (!paramLightAppSettingInfo.contains(Integer.valueOf(11003))) {
        break;
      }
    }
  }
  
  protected boolean a(QQCustomDialog paramQQCustomDialog)
  {
    return true;
  }
  
  public boolean a(Integer paramInteger)
  {
    return (jdField_a_of_type_JavaUtilSet != null) && (jdField_a_of_type_JavaUtilSet.contains(paramInteger));
  }
  
  public boolean a(String paramString)
  {
    HotChatManager localHotChatManager = (HotChatManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(59);
    return (localHotChatManager != null) && (localHotChatManager.b(paramString));
  }
  
  public DeviceInfo[] a(DeviceInfo[] paramArrayOfDeviceInfo)
  {
    return null;
  }
  
  public int b()
  {
    return 2131367607;
  }
  
  protected final DialogInterface.OnClickListener b()
  {
    if (jdField_b_of_type_AndroidContentDialogInterface$OnClickListener == null) {
      jdField_b_of_type_AndroidContentDialogInterface$OnClickListener = new pfl(this);
    }
    return jdField_b_of_type_AndroidContentDialogInterface$OnClickListener;
  }
  
  public String b()
  {
    int i = jdField_a_of_type_AndroidOsBundle.getInt("key_forward_ability_type");
    String str1;
    if (i == jdField_e_of_type_JavaLangInteger.intValue()) {
      str1 = "QQ空间";
    }
    for (;;)
    {
      String str2 = str1;
      if (!TextUtils.isEmpty(str1)) {
        str2 = "发送到 " + str1;
      }
      if (QLog.isColorLevel()) {
        QLog.d("ForwardOption.ForwardBaseOption", 2, "dialogTitle=" + str2);
      }
      return str2;
      if (i == jdField_f_of_type_JavaLangInteger.intValue()) {
        str1 = "我的电脑";
      } else if (i == l.intValue()) {
        str1 = "我的iPad";
      } else if (i == g.intValue()) {
        str1 = "我的收藏";
      } else {
        str1 = jdField_a_of_type_AndroidOsBundle.getString("uinname");
      }
    }
  }
  
  protected void b()
  {
    jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.setMessageWithEmo(jdField_c_of_type_JavaLangString, jdField_a_of_type_Float);
  }
  
  public void b(int paramInt)
  {
    if (QLog.isColorLevel()) {
      QLog.d("ForwardOption.ForwardBaseOption", 2, "-->forwardToDataLine--type = " + paramInt);
    }
    Intent localIntent = new Intent(jdField_a_of_type_AndroidAppActivity, LiteActivity.class);
    if (paramInt == l.intValue())
    {
      localIntent.putExtra("targetUin", AppConstants.aj);
      localIntent.putExtra("device_type", 1);
      if (jdField_a_of_type_AndroidContentIntent.getBooleanExtra("isFromShare", false))
      {
        jdField_a_of_type_AndroidOsBundle.putString("leftBackText", "消息");
        localIntent.addFlags(268435456);
        localIntent.addFlags(67108864);
        jdField_a_of_type_AndroidOsBundle.putBoolean("isBack2Root", true);
      }
      localIntent.putExtras(jdField_a_of_type_AndroidOsBundle);
      localIntent.putExtra("MigSdkShareNotDone", false);
      if (!jdField_a_of_type_AndroidContentIntent.getBooleanExtra("sendMultiple", false)) {
        break label236;
      }
      a(localIntent);
    }
    for (;;)
    {
      jdField_a_of_type_AndroidAppActivity.startActivity(localIntent);
      jdField_a_of_type_AndroidOsBundle.putBoolean("isBack2Root", false);
      localIntent.putExtras(jdField_a_of_type_AndroidOsBundle);
      jdField_a_of_type_AndroidAppActivity.setResult(0, localIntent);
      jdField_a_of_type_AndroidAppActivity.finish();
      return;
      localIntent.putExtra("targetUin", AppConstants.ai);
      localIntent.putExtra("device_type", 0);
      break;
      label236:
      b(localIntent);
    }
  }
  
  protected void b(Intent paramIntent) {}
  
  protected final void b(String paramString, QQCustomDialog paramQQCustomDialog)
  {
    if (QLog.isColorLevel()) {
      QLog.d("ForwardOption.ForwardBaseOption", 2, "updateImageView: filepath=" + paramString);
    }
    ThreadManager.a(new pfq(this, paramString, paramQQCustomDialog), 8, null, false);
    if (QLog.isColorLevel()) {
      QLog.d("ForwardOption.ForwardBaseOption", 2, "updateImageView end! ");
    }
  }
  
  public boolean b()
  {
    return false;
  }
  
  protected int c()
  {
    return jdField_a_of_type_AndroidOsBundle.getInt("emoInputType", 0);
  }
  
  protected final DialogInterface.OnClickListener c()
  {
    if (jdField_c_of_type_AndroidContentDialogInterface$OnClickListener == null) {
      jdField_c_of_type_AndroidContentDialogInterface$OnClickListener = new pfm(this);
    }
    return jdField_c_of_type_AndroidContentDialogInterface$OnClickListener;
  }
  
  public String c()
  {
    if (QLog.isColorLevel()) {
      QLog.d("ForwardOption.ForwardBaseOption", 2, "DialogContent:mForwardText=" + jdField_c_of_type_JavaLangString);
    }
    return jdField_c_of_type_JavaLangString;
  }
  
  public void c()
  {
    ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005A0F", "0X8005A0F", 0, 0, "0", "", "", "");
  }
  
  protected void c(int paramInt)
  {
    if (QLog.isColorLevel()) {
      QLog.d("ForwardOption.ForwardBaseOption", 2, "-->showQfavResultDialog--code = " + paramInt);
    }
    if ((jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog != null) && (jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.isShowing())) {
      jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.dismiss();
    }
    r();
    pfr localPfr = new pfr(this);
    if (jdField_a_of_type_ComTencentBizWidgetsShareResultDialog == null) {
      jdField_a_of_type_ComTencentBizWidgetsShareResultDialog = new ShareResultDialog(jdField_a_of_type_AndroidAppActivity);
    }
    for (;;)
    {
      String str = jdField_a_of_type_AndroidAppActivity.getString(2131367694);
      Object localObject = str;
      if (!TextUtils.isEmpty(jdField_a_of_type_AndroidOsBundle.getString("app_name"))) {
        localObject = str + jdField_a_of_type_AndroidOsBundle.getString("app_name");
      }
      jdField_a_of_type_ComTencentBizWidgetsShareResultDialog.a((String)localObject, localPfr);
      jdField_a_of_type_ComTencentBizWidgetsShareResultDialog.a(2131364235);
      localObject = jdField_a_of_type_ComTencentBizWidgetsShareResultDialog;
      boolean bool;
      if (paramInt == 0)
      {
        bool = true;
        ((ShareResultDialog)localObject).a(bool);
        jdField_a_of_type_ComTencentBizWidgetsShareResultDialog.a(2131365780);
        jdField_a_of_type_ComTencentBizWidgetsShareResultDialog.b(0);
        jdField_a_of_type_ComTencentBizWidgetsShareResultDialog.c(2131365779);
        jdField_a_of_type_ComTencentBizWidgetsShareResultDialog.b(jdField_a_of_type_AndroidAppActivity.getString(2131365782), localPfr);
      }
      try
      {
        jdField_a_of_type_ComTencentBizWidgetsShareResultDialog.show();
        return;
        jdField_a_of_type_ComTencentBizWidgetsShareResultDialog.dismiss();
        continue;
        bool = false;
      }
      catch (Exception localException)
      {
        while (!QLog.isColorLevel()) {}
        QLog.d("ForwardOption.ForwardBaseOption", 2, "-->showQfavResultDialog--resultDlg.show() failed");
      }
    }
  }
  
  protected boolean c()
  {
    if ((jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog != null) && (jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.isShowing())) {
      return false;
    }
    if ((jdField_a_of_type_ComTencentBizWidgetsShareResultDialog != null) && (jdField_a_of_type_ComTencentBizWidgetsShareResultDialog.isShowing())) {
      jdField_a_of_type_ComTencentBizWidgetsShareResultDialog.dismiss();
    }
    r();
    return true;
  }
  
  protected int d()
  {
    return -1;
  }
  
  public void d() {}
  
  protected boolean d()
  {
    Intent localIntent = new Intent();
    localIntent.putExtras(jdField_a_of_type_AndroidOsBundle);
    jdField_a_of_type_AndroidAppActivity.setResult(-1, localIntent);
    jdField_a_of_type_AndroidAppActivity.finish();
    return false;
  }
  
  public void e() {}
  
  public boolean e()
  {
    return false;
  }
  
  public void f()
  {
    jdField_a_of_type_JavaUtilSet = new HashSet();
    a();
  }
  
  public boolean f()
  {
    return jdField_b_of_type_Boolean;
  }
  
  protected void g()
  {
    if (jdField_a_of_type_AndroidContentIntent.getBooleanExtra("k_favorites", true)) {
      jdField_a_of_type_JavaUtilSet.add(g);
    }
  }
  
  protected boolean g()
  {
    PhoneContactManager localPhoneContactManager = (PhoneContactManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(10);
    if ((localPhoneContactManager != null) && (localPhoneContactManager.c())) {}
    for (boolean bool = true;; bool = false)
    {
      if (QLog.isColorLevel()) {
        QLog.d("ForwardOption.ForwardBaseOption", 2, "-->allowPhoneContactAbility--allow = " + bool);
      }
      return bool;
    }
  }
  
  public final void h()
  {
    int i = c();
    if (QLog.isColorLevel()) {
      QLog.d("ForwardOption.ForwardBaseOption", 2, "-->buildConfirmDialog--editTextType = " + i);
    }
    if (i == 0) {
      jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog = DialogUtil.a(jdField_a_of_type_AndroidAppActivity, 230, b(), c(), a(), b(), a(), b());
    }
    for (;;)
    {
      jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.setOnDismissListener(this);
      jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.adjustTitle();
      b();
      jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.setMsgMaxLineWithEnd(jdField_c_of_type_JavaLangString, 3);
      if (a(jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog)) {
        b(jdField_d_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog);
      }
      if (!jdField_a_of_type_AndroidAppActivity.isFinishing()) {
        jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.show();
      }
      return;
      if (i == 1) {
        jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog = DialogUtil.a(jdField_a_of_type_AndroidAppActivity, b(), c(), null, a(), b());
      } else if (i == 2) {
        jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog = DialogUtil.b(jdField_a_of_type_AndroidAppActivity, b(), c(), null, a(), b());
      } else {
        jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog = DialogUtil.a(jdField_a_of_type_AndroidAppActivity, 230, b(), c(), a(), b(), a(), b());
      }
    }
  }
  
  protected boolean h()
  {
    Object localObject = (DiscussionManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(52);
    if (localObject != null)
    {
      localObject = ((DiscussionManager)localObject).a();
      if ((localObject == null) || (((ArrayList)localObject).size() <= 0)) {}
    }
    for (boolean bool = true;; bool = false)
    {
      if (QLog.isColorLevel()) {
        QLog.d("ForwardOption.ForwardBaseOption", 2, "-->allowDiscussAbility--allow = " + bool);
      }
      return bool;
    }
  }
  
  public void i() {}
  
  protected boolean i()
  {
    Object localObject = (TroopManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(51);
    if (localObject != null)
    {
      localObject = ((TroopManager)localObject).a();
      if ((localObject == null) || (((ArrayList)localObject).size() <= 0)) {}
    }
    for (boolean bool = true;; bool = false)
    {
      if (QLog.isColorLevel()) {
        QLog.d("ForwardOption.ForwardBaseOption", 2, "-->allowTroopAbility--allow = " + bool);
      }
      return bool;
    }
  }
  
  public void j() {}
  
  protected boolean j()
  {
    FriendsManager localFriendsManager = (FriendsManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(50);
    if (localFriendsManager != null)
    {
      Object localObject = localFriendsManager.c();
      if (localObject != null)
      {
        localObject = ((ArrayList)localObject).iterator();
        ArrayList localArrayList;
        do
        {
          if (!((Iterator)localObject).hasNext()) {
            break;
          }
          localArrayList = localFriendsManager.a(String.valueOf(nextgroup_id));
        } while ((localArrayList == null) || (localArrayList.size() <= 0));
      }
    }
    for (boolean bool = true;; bool = false)
    {
      if (QLog.isColorLevel()) {
        QLog.d("ForwardOption.ForwardBaseOption", 2, "-->allowFriendAbility--allow = " + bool);
      }
      return bool;
    }
  }
  
  public void k()
  {
    if (jdField_d_of_type_Boolean)
    {
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005793", "0X8005793", 0, 0, "", "", "", "");
      jdField_d_of_type_Boolean = false;
    }
    p();
  }
  
  protected boolean k()
  {
    if (QLog.isColorLevel()) {
      QLog.d("ForwardOption.ForwardBaseOption", 2, "-->allowQZoneAbility--allow = false");
    }
    return false;
  }
  
  public void l()
  {
    jdField_d_of_type_Boolean = false;
  }
  
  protected boolean l()
  {
    boolean bool2 = false;
    boolean bool1 = false;
    boolean bool3 = jdField_a_of_type_AndroidContentIntent.getBooleanExtra("sendMultiple", false);
    int i;
    if (MultiMsgManager.a().d() > 1)
    {
      i = 1;
      int j = jdField_a_of_type_AndroidOsBundle.getInt("from_busi_type");
      if ((!bool3) && (i == 0) && (j != 2)) {
        break label84;
      }
      bool2 = bool1;
      if (QLog.isColorLevel())
      {
        QLog.d("ForwardOption.ForwardBaseOption", 2, "-->allowSmartDeviceAbility--allow = false");
        bool2 = bool1;
      }
    }
    label84:
    do
    {
      return bool2;
      i = 0;
      break;
      Object localObject = (SmartDeviceProxyMgr)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(51);
      bool1 = bool2;
      if (localObject != null)
      {
        bool1 = bool2;
        if (((SmartDeviceProxyMgr)localObject).a())
        {
          localObject = ((SmartDeviceProxyMgr)localObject).a();
          bool1 = bool2;
          if (localObject != null)
          {
            bool1 = bool2;
            if (localObject.length > 0) {
              bool1 = true;
            }
          }
        }
      }
      bool2 = bool1;
    } while (!QLog.isColorLevel());
    QLog.d("ForwardOption.ForwardBaseOption", 2, "-->allowSmartDeviceAbility--allow = " + bool1);
    return bool1;
  }
  
  public void m() {}
  
  protected void n()
  {
    String str = jdField_a_of_type_AndroidOsBundle.getString("uin");
    if (jdField_a_of_type_AndroidViewView$OnClickListener == null) {
      jdField_a_of_type_AndroidViewView$OnClickListener = new pfn(this, str);
    }
    jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.setImageOnClickListener(jdField_a_of_type_AndroidViewView$OnClickListener);
  }
  
  public void o()
  {
    int i = d();
    if (jdField_a_of_type_AndroidAppActivity.isFinishing()) {
      return;
    }
    c(i);
  }
  
  public void onDismiss(DialogInterface paramDialogInterface)
  {
    if ((jdField_a_of_type_AndroidAppActivity instanceof DirectForwardActivity)) {
      jdField_a_of_type_AndroidAppActivity.finish();
    }
  }
  
  protected void p()
  {
    jdField_a_of_type_AndroidOsBundle.putBoolean("isBack2Root", true);
    if (jdField_a_of_type_AndroidOsBundle.getInt("uintype") == 6002) {
      a(jdField_a_of_type_AndroidOsBundle.getString("uin"));
    }
    while (d()) {
      return;
    }
    ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8004047", "0X8004047", 0, 0, "", "", "", "");
  }
  
  public void q()
  {
    if ((jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog != null) && (jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.isShowing())) {
      jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.dismiss();
    }
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.b(jdField_a_of_type_ComTencentMobileqqAppDiscussionObserver);
  }
  
  public void r()
  {
    if ((jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog != null) && (jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.isShowing())) {
      jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.dismiss();
    }
  }
  
  public void s()
  {
    b(jdField_f_of_type_JavaLangInteger.intValue());
  }
  
  public void t() {}
}
