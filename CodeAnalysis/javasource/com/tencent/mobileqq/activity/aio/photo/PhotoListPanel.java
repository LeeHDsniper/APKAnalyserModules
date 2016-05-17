package com.tencent.mobileqq.activity.aio.photo;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.res.Resources;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Environment;
import android.os.Handler;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.util.SparseArray;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.AdapterView.OnItemLongClickListener;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.CompoundButton.OnCheckedChangeListener;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.dataline.activities.LiteActivity;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.activity.ChatActivity;
import com.tencent.mobileqq.activity.SplashActivity;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.PlusPanelUtils;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.photo.DynamicImageMediaFileFilter;
import com.tencent.mobileqq.activity.photo.FlowThumbDecoder;
import com.tencent.mobileqq.activity.photo.LocalMediaInfo;
import com.tencent.mobileqq.activity.photo.MediaFileFilter;
import com.tencent.mobileqq.activity.photo.PhotoMagicStickUtils;
import com.tencent.mobileqq.activity.photo.PhotoPreviewActivity;
import com.tencent.mobileqq.activity.photo.PhotoUtils;
import com.tencent.mobileqq.activity.photo.SendPhotoActivity;
import com.tencent.mobileqq.activity.photo.SendPhotoActivity.sendPhotoTask;
import com.tencent.mobileqq.activity.shortvideo.SendVideoActivity;
import com.tencent.mobileqq.activity.shortvideo.SendVideoActivity.SendVideoTask;
import com.tencent.mobileqq.activity.shortvideo.ShortVideoPreviewActivity;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.app.TroopHandler;
import com.tencent.mobileqq.drawable.EmptyDrawable;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pic.IPresendPicMgr;
import com.tencent.mobileqq.pic.Logger;
import com.tencent.mobileqq.pic.PresendPicMgrService;
import com.tencent.mobileqq.richmedia.RichmediaService;
import com.tencent.mobileqq.shortvideo.ShortVideoUtils;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.util.Utils;
import com.tencent.mobileqq.utils.AlbumConstants;
import com.tencent.mobileqq.utils.AlbumUtil;
import com.tencent.mobileqq.utils.DialogUtil;
import com.tencent.mobileqq.utils.DialogUtil.DialogOnClickAdapter;
import com.tencent.mobileqq.utils.FileUtils;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.utils.QQCustomDialog;
import com.tencent.mobileqq.widget.NumberCheckBox;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import com.tencent.util.BinderWarpper;
import com.tencent.widget.HorizontalListView;
import cooperation.photoplus.PhotoPlusBridgeActivity;
import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import len;
import leo;
import lep;
import leq;
import leu;
import mqq.app.AccountNotMatchException;
import mqq.os.MqqHandler;

public class PhotoListPanel
  extends RelativeLayout
  implements View.OnClickListener, AdapterView.OnItemClickListener, AdapterView.OnItemLongClickListener, CompoundButton.OnCheckedChangeListener
{
  public static int a = 0;
  public static final String a = "PhotoListPanel";
  public static final String e = "key_disable_presend";
  public static final String f = "key_allow_mix_select";
  public static final String g = "key_disable_quality_cb";
  public static final String h = "key_disable_edit_btn";
  public static final String i = "key_disable_send_btn";
  public static final String j = "key_new_lbs_client";
  public static final String k = "key_my_uin";
  public static final String l = "key_my_nick";
  public static final String m = "key_my_head_dir";
  public long a;
  public Activity a;
  Intent jdField_a_of_type_AndroidContentIntent;
  Handler jdField_a_of_type_AndroidOsHandler = new Handler();
  View jdField_a_of_type_AndroidViewView;
  Button jdField_a_of_type_AndroidWidgetButton;
  public CheckBox a;
  TextView jdField_a_of_type_AndroidWidgetTextView;
  SessionInfo jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo;
  PhotoListPanel.BottomBtnClickListener jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$BottomBtnClickListener;
  public PhotoListPanel.MyAdapter a;
  PhotoListPanel.SwipeUpAndDragListener jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$SwipeUpAndDragListener;
  public MediaFileFilter a;
  EmptyDrawable jdField_a_of_type_ComTencentMobileqqDrawableEmptyDrawable;
  HorizontalListView jdField_a_of_type_ComTencentWidgetHorizontalListView;
  public ArrayList a;
  public LinkedList a;
  public volatile boolean a;
  int jdField_b_of_type_Int;
  View jdField_b_of_type_AndroidViewView;
  Button jdField_b_of_type_AndroidWidgetButton;
  TextView jdField_b_of_type_AndroidWidgetTextView;
  EmptyDrawable jdField_b_of_type_ComTencentMobileqqDrawableEmptyDrawable;
  String jdField_b_of_type_JavaLangString;
  public ArrayList b;
  boolean jdField_b_of_type_Boolean;
  public int c;
  Button jdField_c_of_type_AndroidWidgetButton;
  String jdField_c_of_type_JavaLangString;
  ArrayList jdField_c_of_type_JavaUtilArrayList;
  boolean jdField_c_of_type_Boolean;
  public int d;
  String jdField_d_of_type_JavaLangString;
  boolean jdField_d_of_type_Boolean;
  public int e;
  boolean e;
  public int f;
  boolean f;
  int jdField_g_of_type_Int = 278921216;
  boolean jdField_g_of_type_Boolean;
  int h;
  public boolean h;
  int jdField_i_of_type_Int;
  boolean jdField_i_of_type_Boolean = false;
  public int j;
  boolean j;
  boolean k = false;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Int = 19922944;
  }
  
  public PhotoListPanel(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    jdField_f_of_type_Int = 0;
    jdField_a_of_type_JavaUtilLinkedList = new LinkedList();
    jdField_a_of_type_JavaUtilArrayList = new ArrayList();
    jdField_h_of_type_Int = -16777216;
    jdField_j_of_type_Boolean = false;
    jdField_j_of_type_Int = 4097;
  }
  
  int a()
  {
    Iterator localIterator = jdField_a_of_type_JavaUtilLinkedList.iterator();
    int n = 0;
    if (localIterator.hasNext())
    {
      if (new File((String)localIterator.next()).length() <= jdField_a_of_type_Int) {
        break label55;
      }
      n += 1;
    }
    label55:
    for (;;)
    {
      break;
      return n;
    }
  }
  
  public void a()
  {
    if (AlbumUtil.a(jdField_a_of_type_AndroidAppActivity, "$RecentAlbumId", null, 10, jdField_a_of_type_ComTencentMobileqqActivityPhotoMediaFileFilter))
    {
      jdField_a_of_type_ComTencentWidgetHorizontalListView.setVisibility(0);
      jdField_a_of_type_AndroidViewView.setVisibility(8);
      ThreadManager.a().post(new leu(this));
      return;
    }
    jdField_a_of_type_ComTencentWidgetHorizontalListView.setVisibility(8);
    TextView localTextView = (TextView)jdField_a_of_type_AndroidViewView.findViewById(2131300889);
    int n = getResourcesgetDisplayMetricsdensityDpi;
    if (QLog.isColorLevel()) {
      QLog.d("PhotoListPanel", 2, "densityDpi = " + n);
    }
    if (n < 320) {
      localTextView.setCompoundDrawables(null, null, null, null);
    }
    jdField_a_of_type_AndroidViewView.setVisibility(0);
  }
  
  public void a(int paramInt)
  {
    if (jdField_b_of_type_Boolean) {}
    while (!jdField_c_of_type_Boolean) {
      return;
    }
    if (QLog.isColorLevel()) {
      QLog.d("PhotoListPanel", 2, "cancelAllPresendPic, type = " + paramInt);
    }
    Bundle localBundle = new Bundle();
    localBundle.putInt("key_presend_cancel_type", paramInt);
    RichmediaService.d(localBundle);
  }
  
  public void a(int paramInt, Intent paramIntent)
  {
    if (QLog.isColorLevel()) {
      QLog.d("PhotoListPanel", 2, "onActivityResult, requestCode = " + paramInt);
    }
    switch (paramInt)
    {
    default: 
    case 100003: 
      do
      {
        return;
        if (QLog.isColorLevel()) {
          QLog.d("PhotoListPanel", 2, "onActivityResult, PhotoPlusBridgeActivity.RESULT_PLUGIN_OK");
        }
      } while ((jdField_a_of_type_JavaUtilLinkedList.size() <= 0) || (jdField_a_of_type_JavaUtilLinkedList.get(0) == null));
      PhotoMagicStickUtils.a((String)jdField_a_of_type_JavaUtilLinkedList.get(0), jdField_a_of_type_AndroidAppActivity, jdField_i_of_type_Boolean, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, jdField_b_of_type_JavaLangString, jdField_c_of_type_JavaLangString, jdField_d_of_type_JavaLangString);
      jdField_a_of_type_AndroidAppActivity.overridePendingTransition(2130968619, 2130968620);
      return;
    case 100004: 
    case 100006: 
      if (QLog.isColorLevel()) {
        QLog.d("PhotoListPanel", 2, "onActivityResult, PeakConstants.REQUEST_PHOTOPREVIEW_RETURE");
      }
      Object localObject1 = jdField_a_of_type_JavaUtilLinkedList.iterator();
      while (((Iterator)localObject1).hasNext())
      {
        Object localObject2 = (String)((Iterator)localObject1).next();
        localObject2 = jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$MyAdapter.a((String)localObject2);
        if (localObject2 != null) {
          jdField_a_of_type_Boolean = false;
        }
      }
      jdField_f_of_type_Int = paramIntent.getIntExtra("PhotoConst.CURRENT_QUALITY_TYPE", 0);
      paramIntent = paramIntent.getStringArrayListExtra("PhotoConst.SELECTED_PATHS");
      jdField_a_of_type_JavaUtilLinkedList.clear();
      jdField_a_of_type_JavaUtilArrayList.clear();
      paramIntent = paramIntent.iterator();
      while (paramIntent.hasNext())
      {
        localObject1 = (String)paramIntent.next();
        jdField_a_of_type_JavaUtilLinkedList.add(localObject1);
        localObject1 = jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$MyAdapter.a((String)localObject1);
        if (localObject1 != null)
        {
          if (!jdField_a_of_type_Boolean) {
            jdField_a_of_type_Boolean = true;
          }
          jdField_a_of_type_JavaUtilArrayList.add(jdField_a_of_type_JavaLangInteger);
        }
      }
      jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$MyAdapter.notifyDataSetChanged();
      h();
      return;
    }
    if (QLog.isColorLevel()) {
      QLog.d("PhotoListPanel", 2, "onActivityResult, PeakConstants.REQUEST_PHOTOLIST_PANEL_SEND_RETURN");
    }
    b();
  }
  
  public void a(int paramInt, ArrayList paramArrayList, boolean paramBoolean1, boolean paramBoolean2, String paramString1, String paramString2, String paramString3)
  {
    if (QLog.isColorLevel()) {
      QLog.d("PhotoListPanel", 2, "sendMedias, type = " + paramInt + ", paths.size() = " + paramArrayList.size() + ",allowPresend = " + paramBoolean1 + ",sendInBackground = " + paramBoolean2 + ",reportActionName = " + paramString1 + ",reverse2 = " + paramString2 + ",reverse3 = " + paramString3);
    }
    Object localObject;
    if (paramInt == 0)
    {
      paramInt = 1;
      localObject = paramArrayList.iterator();
      if (((Iterator)localObject).hasNext())
      {
        if (FileUtils.b((String)((Iterator)localObject).next())) {
          paramInt = 1;
        }
      }
      else
      {
        if (paramInt != 0) {
          break label201;
        }
        if (QLog.isColorLevel()) {
          QLog.e("PhotoListPanel", 2, "PhotoListPanel sendMedias,pics not exits, just return.");
        }
        QQToast.a(jdField_a_of_type_AndroidAppActivity, 2131368411, 0).a();
        a();
        jdField_a_of_type_JavaUtilLinkedList.clear();
        jdField_a_of_type_JavaUtilArrayList.clear();
        h();
      }
    }
    label201:
    label840:
    label845:
    do
    {
      do
      {
        return;
        paramInt = 0;
        break;
        if (paramBoolean2)
        {
          localObject = new Intent();
          ((Intent)localObject).putExtra("PhotoConst.SEND_BUSINESS_TYPE", jdField_i_of_type_Int);
          ((Intent)localObject).putStringArrayListExtra("PhotoConst.PHOTO_PATHS", paramArrayList);
          ((Intent)localObject).putExtra("uin", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
          ((Intent)localObject).putExtra("uintype", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
          ((Intent)localObject).putExtra("troop_uin", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_b_of_type_JavaLangString);
          ((Intent)localObject).putExtra("PhotoConst.SEND_SIZE_SPEC", jdField_f_of_type_Int);
          ((Intent)localObject).putExtra("PhotoConst.HANDLE_DEST_RESULT", true);
          ((Intent)localObject).putExtra("send_in_background", true);
          if (paramArrayList.size() == 1) {
            ((Intent)localObject).putExtra("PhotoConst.SINGLE_PHOTO_PATH", paramArrayList);
          }
          ThreadManager.a(new SendPhotoActivity.sendPhotoTask((BaseActivity)jdField_a_of_type_AndroidAppActivity, (Intent)localObject), 8, null, false);
        }
        for (;;)
        {
          ReportController.b(null, "CliOper", "", "", paramString1, paramString1, 0, 0, paramString2, paramString3, "", "");
          return;
          localObject = new Intent(jdField_a_of_type_AndroidAppActivity, SendPhotoActivity.class);
          ((Intent)localObject).putExtra("PhotoConst.SEND_BUSINESS_TYPE", jdField_i_of_type_Int);
          ((Intent)localObject).putStringArrayListExtra("PhotoConst.PHOTO_PATHS", paramArrayList);
          ((Intent)localObject).putExtra("PhotoConst.PHOTO_COUNT", paramArrayList.size());
          ((Intent)localObject).putExtra("uin", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
          ((Intent)localObject).putExtra("uintype", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
          ((Intent)localObject).putExtra("troop_uin", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_b_of_type_JavaLangString);
          ((Intent)localObject).putExtra("PhotoConst.SEND_SIZE_SPEC", jdField_f_of_type_Int);
          ((Intent)localObject).putExtra("PhotoConst.HANDLE_DEST_RESULT", true);
          if (paramArrayList.size() == 1) {
            ((Intent)localObject).putExtra("PhotoConst.SINGLE_PHOTO_PATH", paramArrayList);
          }
          ((Intent)localObject).addFlags(603979776);
          if (paramBoolean1)
          {
            if (jdField_f_of_type_Int == 2)
            {
              paramArrayList = BaseApplication.getContext();
              if (Build.VERSION.SDK_INT > 10) {}
              for (paramInt = 4;; paramInt = 0)
              {
                paramArrayList = paramArrayList.getSharedPreferences("presend_config_sp", paramInt);
                paramArrayList.edit().putBoolean("key_presend_off_flag", true).commit();
                paramArrayList.edit().putLong("key_presend_off_time", System.currentTimeMillis()).commit();
                a(1020);
                jdField_a_of_type_AndroidAppActivity.startActivityForResult((Intent)localObject, 100005);
                break;
              }
            }
            if (RichmediaService.a((Intent)localObject))
            {
              if (QLog.isColorLevel()) {
                QLog.d("PhotoListPanel", 2, "sendMedias,start sendPhotoAcitivy,  addPresendMgrHandlerToIntent OK");
              }
              jdField_a_of_type_AndroidAppActivity.startActivityForResult((Intent)localObject, 100005);
            }
            else
            {
              if (QLog.isColorLevel()) {
                QLog.d("PhotoListPanel", 2, "sendMedias,start sendPhotoAcitivy,  addPresendMgrHandlerToIntent failed");
              }
              jdField_a_of_type_AndroidAppActivity.startActivity((Intent)localObject);
            }
          }
          else
          {
            if (QLog.isColorLevel()) {
              QLog.d("PhotoListPanel", 2, "sendMedias,start sendPhotoAcitivy, not presend");
            }
            jdField_a_of_type_AndroidAppActivity.startActivity((Intent)localObject);
          }
        }
      } while (paramInt != 1);
      localObject = (String)paramArrayList.get(0);
      paramArrayList = jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$MyAdapter.a((String)localObject);
      File localFile = Environment.getExternalStorageDirectory();
      if ((localFile.exists()) && (localFile.canWrite()))
      {
        paramInt = 1;
        if ((!Environment.getExternalStorageState().equals("mounted")) || (paramInt == 0)) {
          break label840;
        }
      }
      for (paramInt = 1;; paramInt = 0)
      {
        if (paramInt != 0) {
          break label845;
        }
        QQToast.a(jdField_a_of_type_AndroidAppActivity, 1, 2131368675, 0).b(getResources().getDimensionPixelSize(2131492908));
        return;
        paramInt = 0;
        break;
      }
      if (Utils.b() <= 512000L) {
        break label1012;
      }
      if (!NetworkUtil.c(jdField_a_of_type_AndroidAppActivity)) {
        break label971;
      }
      long l1 = new File((String)localObject).length();
      localObject = ShortVideoUtils.a(jdField_a_of_type_AndroidAppActivity, l1);
      localObject = String.format(getResources().getString(2131371168), new Object[] { localObject });
      DialogUtil.a(jdField_a_of_type_AndroidAppActivity, 232, null, (String)localObject, new lep(this, paramArrayList, paramBoolean2, paramString1, paramString2, paramString3), new leq(this)).show();
    } while (!QLog.isColorLevel());
    QLog.i("PhotoListPanel", 2, "show shortvideo_mobile_send_confirm dialog");
    return;
    label971:
    if (paramArrayList != null) {
      a(paramArrayList, paramBoolean2);
    }
    ReportController.b(null, "CliOper", "", "", paramString1, paramString1, 0, 0, paramString2, paramString3, "", "");
    return;
    label1012:
    ShortVideoPreviewActivity.a(jdField_a_of_type_AndroidAppActivity, 2131371165);
  }
  
  public void a(Activity paramActivity, SessionInfo paramSessionInfo, Intent paramIntent)
  {
    jdField_a_of_type_AndroidContentIntent = paramIntent;
    if (jdField_a_of_type_AndroidContentIntent == null) {
      jdField_a_of_type_AndroidContentIntent = new Intent();
    }
    jdField_b_of_type_Boolean = jdField_a_of_type_AndroidContentIntent.getBooleanExtra("key_disable_presend", false);
    jdField_e_of_type_Boolean = jdField_a_of_type_AndroidContentIntent.getBooleanExtra("key_disable_quality_cb", false);
    jdField_f_of_type_Boolean = jdField_a_of_type_AndroidContentIntent.getBooleanExtra("key_disable_edit_btn", false);
    jdField_g_of_type_Boolean = jdField_a_of_type_AndroidContentIntent.getBooleanExtra("key_disable_send_btn", false);
    jdField_d_of_type_Boolean = jdField_a_of_type_AndroidContentIntent.getBooleanExtra("key_new_lbs_client", false);
    jdField_h_of_type_Boolean = jdField_a_of_type_AndroidContentIntent.getBooleanExtra("key_allow_mix_select", false);
    jdField_b_of_type_JavaLangString = jdField_a_of_type_AndroidContentIntent.getStringExtra("key_my_uin");
    jdField_c_of_type_JavaLangString = jdField_a_of_type_AndroidContentIntent.getStringExtra("key_my_nick");
    jdField_d_of_type_JavaLangString = jdField_a_of_type_AndroidContentIntent.getStringExtra("key_my_head_dir");
    if (QLog.isColorLevel()) {
      QLog.d("PhotoListPanel", 2, "init, mDisablePresend = " + jdField_b_of_type_Boolean);
    }
    jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo = paramSessionInfo;
    jdField_a_of_type_AndroidAppActivity = paramActivity;
    paramActivity = jdField_a_of_type_AndroidAppActivity.getIntent();
    jdField_d_of_type_Int = jdField_a_of_type_AndroidContentIntent.getIntExtra("PhotoConst.MAXUM_SELECTED_NUM", 20);
    if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 9501)
    {
      jdField_d_of_type_Int = 5;
      jdField_a_of_type_AndroidContentIntent.putExtra("PhotoConst.MAXUM_SELECTED_NUM", 5);
    }
    jdField_e_of_type_Int = jdField_a_of_type_AndroidContentIntent.getIntExtra("PhotoConst.MAXUM_SELECTED_NUM_VIDEO", 1);
    jdField_a_of_type_Long = jdField_a_of_type_AndroidContentIntent.getLongExtra("PhotoConst.PHOTOLIST_KEY_VIDEO_SIZE", 293601280L);
    int n = jdField_a_of_type_AndroidContentIntent.getIntExtra("PhotoConst.PHOTOLIST_KEY_SHOW_MEDIA", 0);
    jdField_a_of_type_ComTencentMobileqqActivityPhotoMediaFileFilter = ((MediaFileFilter)MediaFileFilter.a.get(n));
    jdField_j_of_type_Boolean = jdField_a_of_type_AndroidContentIntent.getBooleanExtra("PhotoConst.PHOTOLIST_KEY_FILTER_GIF_VIDEO", false);
    k = jdField_a_of_type_AndroidContentIntent.getBooleanExtra("PhotoConst.IS_SINGLE_MODE", false);
    jdField_i_of_type_Int = jdField_a_of_type_AndroidContentIntent.getIntExtra("PhotoConst.SEND_BUSINESS_TYPE", 1007);
    if (jdField_j_of_type_Boolean) {
      jdField_a_of_type_ComTencentMobileqqActivityPhotoMediaFileFilter = new DynamicImageMediaFileFilter(MediaFileFilter.b);
    }
    jdField_b_of_type_Int = ((int)getResources().getDimension(2131494435));
    jdField_c_of_type_Int = ((int)getResources().getDimension(2131494434));
    jdField_a_of_type_ComTencentMobileqqDrawableEmptyDrawable = new EmptyDrawable(jdField_g_of_type_Int, jdField_c_of_type_Int, jdField_c_of_type_Int);
    jdField_b_of_type_ComTencentMobileqqDrawableEmptyDrawable = new EmptyDrawable(jdField_h_of_type_Int, jdField_c_of_type_Int, jdField_c_of_type_Int);
    if (paramActivity.hasExtra("PhotoConst.SELECTED_PATHS"))
    {
      paramSessionInfo = paramActivity.getStringArrayListExtra("PhotoConst.SELECTED_PATHS");
      if (paramSessionInfo != null) {
        jdField_a_of_type_JavaUtilLinkedList.addAll(paramSessionInfo);
      }
      paramActivity = paramActivity.getIntegerArrayListExtra("PhotoConst.SELECTED_INDEXS");
      if (paramActivity != null) {
        jdField_a_of_type_JavaUtilArrayList.addAll(paramActivity);
      }
    }
    jdField_b_of_type_AndroidViewView = findViewById(2131300884);
    jdField_a_of_type_AndroidWidgetButton = ((Button)findViewById(2131300885));
    jdField_b_of_type_AndroidWidgetButton = ((Button)findViewById(2131298576));
    jdField_a_of_type_AndroidWidgetCheckBox = ((CheckBox)findViewById(2131298577));
    jdField_a_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131298578));
    jdField_b_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131300886));
    jdField_a_of_type_AndroidViewView = findViewById(2131300888);
    jdField_c_of_type_AndroidWidgetButton = ((Button)findViewById(2131298579));
    jdField_a_of_type_AndroidWidgetButton.setOnClickListener(this);
    jdField_b_of_type_AndroidWidgetButton.setOnClickListener(this);
    if (jdField_e_of_type_Boolean)
    {
      jdField_a_of_type_AndroidWidgetCheckBox.setVisibility(4);
      jdField_a_of_type_AndroidWidgetTextView.setVisibility(4);
      jdField_b_of_type_AndroidWidgetTextView.setVisibility(4);
    }
    for (;;)
    {
      if (jdField_f_of_type_Boolean) {
        jdField_b_of_type_AndroidWidgetButton.setVisibility(4);
      }
      if (jdField_g_of_type_Boolean) {
        jdField_c_of_type_AndroidWidgetButton.setVisibility(4);
      }
      jdField_c_of_type_AndroidWidgetButton.setOnClickListener(this);
      jdField_a_of_type_ComTencentWidgetHorizontalListView = ((HorizontalListView)findViewById(2131300887));
      jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$MyAdapter = new PhotoListPanel.MyAdapter(this);
      jdField_a_of_type_ComTencentWidgetHorizontalListView.setAdapter(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$MyAdapter);
      jdField_a_of_type_ComTencentWidgetHorizontalListView.setOnItemClickListener(this);
      jdField_a_of_type_ComTencentWidgetHorizontalListView.setOnScrollStateChangedListener(new len(this));
      jdField_a_of_type_ComTencentWidgetHorizontalListView.setOnTouchListener(new leo(this));
      paramActivity = getResources();
      FlowThumbDecoder.a = paramActivity.getDimension(2131494434);
      FlowThumbDecoder.b = paramActivity.getDimension(2131494436);
      FlowThumbDecoder.c = paramActivity.getDimension(2131494435);
      FlowThumbDecoder.d = FlowThumbDecoder.b / FlowThumbDecoder.a;
      FlowThumbDecoder.e = FlowThumbDecoder.c / FlowThumbDecoder.a;
      if ((jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$MyAdapter == null) || (jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$MyAdapter.getCount() <= 0)) {
        a();
      }
      h();
      b();
      return;
      jdField_a_of_type_AndroidWidgetCheckBox.setOnCheckedChangeListener(this);
      jdField_a_of_type_AndroidWidgetTextView.setOnClickListener(this);
      jdField_a_of_type_AndroidWidgetTextView.setContentDescription("原图，未选中");
      jdField_b_of_type_AndroidWidgetTextView.setOnClickListener(this);
    }
  }
  
  public void a(LocalMediaInfo paramLocalMediaInfo, boolean paramBoolean)
  {
    Logger.a("TAG", "sendVideo", "info = " + paramLocalMediaInfo + ",sendInBackground = " + paramBoolean);
    Intent localIntent = new Intent(jdField_a_of_type_AndroidAppActivity, SendVideoActivity.class);
    localIntent.putExtra("send_in_background", paramBoolean);
    localIntent.putExtra("file_send_path", jdField_a_of_type_JavaLangString);
    localIntent.putExtra("file_send_size", jdField_b_of_type_Long);
    localIntent.putExtra("file_send_duration", e);
    localIntent.putExtra("uin", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
    localIntent.putExtra("uintype", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
    localIntent.putExtra("file_source", "album_flow");
    String str1 = jdField_a_of_type_AndroidAppActivity.getIntent().getStringExtra("PhotoConst.INIT_ACTIVITY_CLASS_NAME");
    String str2 = jdField_a_of_type_AndroidAppActivity.getIntent().getStringExtra("PhotoConst.INIT_ACTIVITY_PACKAGE_NAME");
    localIntent.putExtra("PhotoConst.INIT_ACTIVITY_CLASS_NAME", str1);
    localIntent.putExtra("PhotoConst.INIT_ACTIVITY_PACKAGE_NAME", str2);
    if (!jdField_b_of_type_Boolean) {
      ReportController.b(null, "CliOper", "", "", "0X8006130", "0X8006130", 0, 0, "", "", "", "");
    }
    localIntent.putExtra("start_init_activity_after_sended", false);
    if (paramBoolean)
    {
      new SendVideoActivity.SendVideoTask((BaseActivity)jdField_a_of_type_AndroidAppActivity, localIntent).execute(new Void[0]);
      return;
    }
    jdField_a_of_type_AndroidAppActivity.startActivity(localIntent);
  }
  
  public void a(String paramString)
  {
    if (jdField_b_of_type_Boolean) {}
    while (!jdField_c_of_type_Boolean) {
      return;
    }
    if (QLog.isColorLevel()) {
      QLog.d("PhotoListPanel", 2, "presendPic, path = " + paramString);
    }
    Bundle localBundle = new Bundle();
    localBundle.putString("key_presend_path", paramString);
    RichmediaService.b(localBundle);
  }
  
  public void b()
  {
    if (jdField_b_of_type_Boolean) {}
    do
    {
      return;
      jdField_c_of_type_Boolean = PlusPanelUtils.a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_d_of_type_Boolean);
      if (QLog.isColorLevel()) {
        QLog.d("PhotoListPanel", 2, "initPresend! mAllowPresend = " + jdField_c_of_type_Boolean);
      }
    } while (!jdField_c_of_type_Boolean);
    BinderWarpper localBinderWarpper = new BinderWarpper(new PresendPicMgrService(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_b_of_type_JavaLangString, jdField_b_of_type_JavaLangString).asBinder());
    Bundle localBundle = new Bundle();
    localBundle.putParcelable("binder_presendService", localBinderWarpper);
    RichmediaService.a(localBundle);
  }
  
  public void b(String paramString)
  {
    if (jdField_b_of_type_Boolean) {}
    while (!jdField_c_of_type_Boolean) {
      return;
    }
    if (QLog.isColorLevel()) {
      QLog.d("PhotoListPanel", 2, "cancelPresendPic, path = " + paramString);
    }
    Bundle localBundle = new Bundle();
    localBundle.putString("key_presend_path", paramString);
    localBundle.putInt("key_presend_cancel_type", 1018);
    RichmediaService.c(localBundle);
  }
  
  public void c()
  {
    int n = jdField_a_of_type_ComTencentWidgetHorizontalListView.getFirstVisiblePosition();
    int i1 = jdField_a_of_type_ComTencentWidgetHorizontalListView.getLastVisiblePosition();
    if (QLog.isColorLevel()) {
      QLog.d("check", 2, "updateCheckView first=" + n + "lastvisible=" + i1);
    }
    if (n <= i1)
    {
      View localView = jdField_a_of_type_ComTencentWidgetHorizontalListView.b(n);
      LocalMediaInfo localLocalMediaInfo = jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$MyAdapter.a(n);
      if (localLocalMediaInfo != null)
      {
        int i2 = jdField_a_of_type_JavaUtilLinkedList.indexOf(jdField_a_of_type_JavaLangString);
        if (QLog.isColorLevel()) {
          QLog.d("check", 2, "updateCheckView mIndex=" + i2);
        }
        if ((i2 < 0) || (localView == null)) {
          break label183;
        }
        getTaga.setCheckedNumber(i2 + 1);
        getTagb.setVisibility(0);
      }
      for (;;)
      {
        n += 1;
        break;
        label183:
        if (localView == null)
        {
          if (QLog.isColorLevel()) {
            QLog.d("check", 2, "updateCheckView view is null?????=");
          }
        }
        else {
          getTagb.setVisibility(4);
        }
      }
    }
  }
  
  void c(String paramString)
  {
    Intent localIntent = new Intent();
    localIntent.putExtras(jdField_a_of_type_AndroidContentIntent);
    localIntent.putExtra("ALBUM_ID", "$RecentAlbumId");
    localIntent.putExtra("PhotoConst.SEND_BUSINESS_TYPE", jdField_i_of_type_Int);
    localIntent.putExtra("uin", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
    localIntent.putExtra("uintype", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
    localIntent.putExtra("troop_uin", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_b_of_type_JavaLangString);
    localIntent.putExtra("uinname", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_d_of_type_JavaLangString);
    new ArrayList(jdField_a_of_type_JavaUtilLinkedList);
    if ((jdField_a_of_type_AndroidAppActivity instanceof SplashActivity))
    {
      localIntent.putExtra("PhotoConst.INIT_ACTIVITY_CLASS_NAME", SplashActivity.class.getName());
      localIntent = AIOUtils.a(localIntent, null);
      localIntent.putExtra("PhotoConst.INIT_ACTIVITY_PACKAGE_NAME", "com.tencent.mobileqq");
      if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int != 9501) {
        break label394;
      }
      if (!(jdField_a_of_type_AndroidAppActivity instanceof SplashActivity)) {
        break label377;
      }
      localIntent.putExtra("PhotoConst.DEST_ACTIVITY_CLASS_NAME", SplashActivity.class.getName());
      localIntent = AIOUtils.a(localIntent, null);
      label195:
      localIntent.putExtra(AlbumConstants.i, 80);
      localIntent.putExtra("PhotoConst.DEST_ACTIVITY_PACKAGE_NAME", "com.tencent.mobileqq");
      localIntent.putExtra("PhotoConst.SHOULD_SEND_RAW_PHOTO", false);
    }
    for (;;)
    {
      localIntent.putExtra("PhotoConst.DEST_VIDEO_ACTIVITY_CLASS_NAME", SendVideoActivity.class.getName());
      localIntent.putExtra("PhotoConst.DEST_VIDEO_ACTIVITY_PACKAGE_NAME", "com.tencent.mobileqq");
      localIntent.putExtra("PhotoConst.CURRENT_QUALITY_TYPE", jdField_f_of_type_Int);
      localIntent.putExtra("PhotoConst.IS_OVERLOAD", false);
      localIntent.setClass(jdField_a_of_type_AndroidAppActivity, PhotoPreviewActivity.class);
      localIntent.addFlags(603979776);
      localIntent.putExtra("PhotoConst.IS_SINGLE_MODE", true);
      localIntent.putExtra("PhotoConst.SINGLE_PHOTO_PATH", paramString);
      localIntent.putExtra("PhotoConst.SEND_BUSINESS_TYPE", jdField_i_of_type_Int);
      localIntent.putExtra("PhotoConst.ALLOW_LOCK", false);
      localIntent.setClass(jdField_a_of_type_AndroidAppActivity, PhotoPreviewActivity.class);
      localIntent.addFlags(603979776);
      jdField_a_of_type_AndroidAppActivity.startActivityForResult(localIntent, 2);
      return;
      localIntent.putExtra("PhotoConst.INIT_ACTIVITY_CLASS_NAME", ChatActivity.class.getName());
      break;
      label377:
      localIntent.putExtra("PhotoConst.DEST_ACTIVITY_CLASS_NAME", ChatActivity.class.getName());
      break label195;
      label394:
      localIntent.putExtra("PhotoConst.DEST_ACTIVITY_CLASS_NAME", SendPhotoActivity.class.getName());
      localIntent.putExtra("PhotoConst.DEST_ACTIVITY_PACKAGE_NAME", "com.tencent.mobileqq");
      localIntent.putExtra("PhotoConst.SHOULD_SEND_RAW_PHOTO", true);
    }
  }
  
  public void d()
  {
    if (QLog.isColorLevel()) {
      QLog.d("PhotoListPanel", 2, "onEditBtnClicked");
    }
    if (jdField_a_of_type_JavaUtilLinkedList.size() > 0)
    {
      ArrayList localArrayList = new ArrayList(jdField_a_of_type_JavaUtilLinkedList);
      jdField_a_of_type_AndroidAppActivity.getIntent().putStringArrayListExtra("PhotoConst.PHOTO_PATHS", localArrayList);
      if ((jdField_a_of_type_AndroidContentIntent != null) && (jdField_a_of_type_AndroidContentIntent.hasExtra("custom_photolist_panel_editbtn_reportActionName")))
      {
        localObject = jdField_a_of_type_AndroidContentIntent.getStringExtra("custom_photolist_panel_editbtn_reportActionName");
        if (localObject != null) {
          ReportController.b(null, "CliOper", "", "", (String)localObject, (String)localObject, 0, 0, "", "", "", "");
        }
      }
      Object localObject = new Intent(jdField_a_of_type_AndroidAppActivity, PhotoPlusBridgeActivity.class);
      ((Intent)localObject).putExtra("photo_path", (String)localArrayList.get(0));
      ((Intent)localObject).putExtra("iswaitforsult", jdField_i_of_type_Boolean);
      ((Intent)localObject).putExtra("type", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
      ((Intent)localObject).putExtra("uin", jdField_b_of_type_JavaLangString);
      ((Intent)localObject).putExtra("nick", jdField_c_of_type_JavaLangString);
      ((Intent)localObject).putExtra("headDir", jdField_d_of_type_JavaLangString);
      jdField_a_of_type_AndroidAppActivity.startActivityForResult((Intent)localObject, 100003);
    }
  }
  
  protected void e()
  {
    if (QLog.isColorLevel()) {
      QLog.d("PhotoListPanel", 2, "onAlbumBtnClicked");
    }
    if (jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$BottomBtnClickListener != null)
    {
      jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$BottomBtnClickListener.a(this);
      return;
    }
    if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1) {}
    try
    {
      ((TroopHandler)((QQAppInterface)BaseApplicationImpl.a.getAppRuntime(jdField_b_of_type_JavaLangString)).a(20)).d(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, true);
      if ((!jdField_a_of_type_JavaUtilLinkedList.isEmpty()) && (jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$MyAdapter.a((String)jdField_a_of_type_JavaUtilLinkedList.peek()) == 1))
      {
        QQCustomDialog localQQCustomDialog = DialogUtil.a(jdField_a_of_type_AndroidAppActivity, 2131366969);
        localQQCustomDialog.setPositiveButton(2131366997, new DialogUtil.DialogOnClickAdapter());
        localQQCustomDialog.show();
        return;
      }
    }
    catch (AccountNotMatchException localAccountNotMatchException)
    {
      for (;;)
      {
        if (QLog.isColorLevel()) {
          QLog.d("PhotoListPanel", 2, "onAlbumBtnClicked() getAppRuntime ERROR");
        }
      }
    }
    if (!jdField_a_of_type_JavaUtilLinkedList.isEmpty()) {}
    for (ArrayList localArrayList = new ArrayList(jdField_a_of_type_JavaUtilLinkedList);; localArrayList = null)
    {
      if (k) {
        jdField_a_of_type_AndroidContentIntent.putExtra("PhotoConst.MAXUM_SELECTED_NUM", 1);
      }
      jdField_a_of_type_AndroidContentIntent.putExtra("PhotoConst.SEND_BUSINESS_TYPE", jdField_i_of_type_Int);
      jdField_a_of_type_AndroidContentIntent.putExtra("peakconstant.request_code", 100006);
      jdField_a_of_type_AndroidContentIntent.putExtra("PhotoConst.CURRENT_QUALITY_TYPE", jdField_f_of_type_Int);
      PlusPanelUtils.a(jdField_a_of_type_AndroidAppActivity, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, localArrayList, jdField_a_of_type_AndroidContentIntent);
      g();
      ReportController.b(null, "CliOper", "", "", "0X8005E05", "0X8005E05", 0, 0, "", "", "", "");
      return;
    }
  }
  
  protected void f()
  {
    if (QLog.isColorLevel()) {
      QLog.d("PhotoListPanel", 2, "onSendBtnClicked");
    }
    if (jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$BottomBtnClickListener != null)
    {
      jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$BottomBtnClickListener.b(this);
      return;
    }
    int n = jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$MyAdapter.a((String)jdField_a_of_type_JavaUtilLinkedList.peek());
    ArrayList localArrayList = new ArrayList(jdField_a_of_type_JavaUtilLinkedList);
    String str1;
    if (n == 0) {
      str1 = "0X8005A2F";
    }
    for (String str2 = localArrayList.size() + "";; str2 = "")
    {
      a(n, localArrayList, jdField_c_of_type_Boolean, false, str1, str2, "");
      g();
      return;
      str1 = "0X80058E2";
    }
  }
  
  public void g()
  {
    if (jdField_a_of_type_JavaUtilLinkedList.size() > 0) {
      jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$MyAdapter.a();
    }
    jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$MyAdapter.notifyDataSetChanged();
    jdField_a_of_type_JavaUtilLinkedList.clear();
    jdField_a_of_type_JavaUtilArrayList.clear();
    jdField_a_of_type_AndroidWidgetCheckBox.setChecked(false);
    h();
  }
  
  public void h()
  {
    String str = getResources().getString(2131369797);
    if (jdField_a_of_type_JavaUtilLinkedList.size() > 0)
    {
      bool = true;
      localObject = str;
      if (bool)
      {
        jdField_c_of_type_AndroidWidgetButton.setContentDescription(str + jdField_a_of_type_JavaUtilLinkedList.size() + "张");
        localObject = str + "(" + jdField_a_of_type_JavaUtilLinkedList.size() + ")";
      }
      jdField_c_of_type_AndroidWidgetButton.setText((CharSequence)localObject);
      jdField_c_of_type_AndroidWidgetButton.setEnabled(bool);
      if (bool) {
        break label173;
      }
      jdField_b_of_type_AndroidWidgetButton.setEnabled(false);
      jdField_a_of_type_AndroidWidgetCheckBox.setEnabled(true);
      jdField_a_of_type_AndroidWidgetTextView.setEnabled(true);
      jdField_b_of_type_AndroidWidgetTextView.setEnabled(true);
      jdField_a_of_type_AndroidWidgetButton.setEnabled(true);
      i();
    }
    label173:
    do
    {
      return;
      bool = false;
      break;
      if (jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$MyAdapter.a((String)jdField_a_of_type_JavaUtilLinkedList.peek()) != 1) {
        break label250;
      }
      jdField_b_of_type_AndroidWidgetButton.setEnabled(false);
      jdField_a_of_type_AndroidWidgetCheckBox.setChecked(false);
      jdField_a_of_type_AndroidWidgetCheckBox.setEnabled(false);
      jdField_a_of_type_AndroidWidgetTextView.setEnabled(false);
      jdField_b_of_type_AndroidWidgetTextView.setEnabled(false);
    } while (jdField_h_of_type_Boolean);
    jdField_a_of_type_AndroidWidgetButton.setEnabled(false);
    return;
    label250:
    jdField_a_of_type_AndroidWidgetCheckBox.setEnabled(true);
    jdField_a_of_type_AndroidWidgetTextView.setEnabled(true);
    jdField_b_of_type_AndroidWidgetTextView.setEnabled(true);
    Object localObject = jdField_b_of_type_AndroidWidgetButton;
    if (jdField_a_of_type_JavaUtilLinkedList.size() == 1) {}
    for (boolean bool = true;; bool = false)
    {
      ((Button)localObject).setEnabled(bool);
      i();
      return;
    }
  }
  
  void i()
  {
    if (jdField_e_of_type_Boolean) {
      return;
    }
    switch (jdField_f_of_type_Int)
    {
    case 1: 
    default: 
      return;
    case 0: 
      jdField_a_of_type_AndroidWidgetCheckBox.setChecked(false);
      return;
    }
    setQualityTvRawPhotoText();
    jdField_a_of_type_AndroidWidgetCheckBox.setChecked(true);
  }
  
  public void onCheckedChanged(CompoundButton paramCompoundButton, boolean paramBoolean)
  {
    switch (paramCompoundButton.getId())
    {
    default: 
      return;
    }
    if (paramBoolean)
    {
      if (a() > 0)
      {
        QQToast.a(jdField_a_of_type_AndroidAppActivity, getResources().getString(2131369812), 0).b(getResources().getDimensionPixelSize(2131492908));
        jdField_f_of_type_Int = 0;
        jdField_a_of_type_AndroidWidgetCheckBox.setChecked(false);
        jdField_b_of_type_AndroidWidgetTextView.setVisibility(4);
        return;
      }
      jdField_a_of_type_AndroidWidgetCheckBox.setChecked(true);
      jdField_f_of_type_Int = 2;
      setQualityTvRawPhotoText();
      jdField_a_of_type_AndroidWidgetTextView.setContentDescription("原图，已选中");
      ReportController.b(null, "CliOper", "", "", "0X8005E07", "0X8005E07", 0, 0, "", "", "", "");
      return;
    }
    jdField_f_of_type_Int = 0;
    jdField_a_of_type_AndroidWidgetCheckBox.setChecked(false);
    jdField_b_of_type_AndroidWidgetTextView.setVisibility(4);
    jdField_a_of_type_AndroidWidgetTextView.setContentDescription("原图，未选中");
  }
  
  public void onClick(View paramView)
  {
    switch (paramView.getId())
    {
    default: 
      return;
    case 2131300885: 
      e();
      return;
    case 2131298576: 
      d();
      return;
    case 2131298578: 
    case 2131300886: 
      if (!jdField_a_of_type_AndroidWidgetCheckBox.isChecked())
      {
        if (a() > 0)
        {
          QQToast.a(jdField_a_of_type_AndroidAppActivity, getResources().getString(2131369812), 0).b(getResources().getDimensionPixelSize(2131492908));
          return;
        }
        jdField_a_of_type_AndroidWidgetCheckBox.setChecked(true);
        return;
      }
      jdField_a_of_type_AndroidWidgetCheckBox.setChecked(false);
      return;
    }
    f();
  }
  
  public void onItemClick(AdapterView paramAdapterView, View paramView, int paramInt, long paramLong)
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$MyAdapter == null) {
      return;
    }
    int n = jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$MyAdapter.getItemViewType(paramInt);
    if (k)
    {
      c(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$MyAdapter.a(paramInt).jdField_a_of_type_JavaLangString);
      return;
    }
    int i1 = jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$MyAdapter.a((String)jdField_a_of_type_JavaUtilLinkedList.peek());
    if ((!jdField_h_of_type_Boolean) && (i1 != -1) && (i1 != n))
    {
      paramAdapterView = DialogUtil.a(jdField_a_of_type_AndroidAppActivity, 2131366968);
      paramAdapterView.setPositiveButton(2131366997, new DialogUtil.DialogOnClickAdapter());
      paramAdapterView.show();
      return;
    }
    paramView = new ArrayList(jdField_a_of_type_JavaUtilLinkedList);
    if (n == 0)
    {
      paramAdapterView = jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$MyAdapter.a(paramInt).jdField_a_of_type_JavaLangString;
      if ((TextUtils.isEmpty(paramAdapterView)) || (!FileUtils.b(paramAdapterView)))
      {
        if (QLog.isColorLevel()) {
          QLog.e("PhotoListPanel", 2, "PhotoListPanel onItemClick,clickPath not exits, just return.");
        }
        QQToast.a(jdField_a_of_type_AndroidAppActivity, 2131368411, 0).a();
        a();
        jdField_a_of_type_JavaUtilLinkedList.clear();
        jdField_a_of_type_JavaUtilArrayList.clear();
        h();
        return;
      }
      paramAdapterView = new Intent();
      paramAdapterView.putExtra("ALBUM_ID", "$RecentAlbumId");
      paramAdapterView.putExtra("PhotoConst.SEND_BUSINESS_TYPE", jdField_i_of_type_Int);
      paramAdapterView.putExtra("uin", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
      paramAdapterView.putExtra("uintype", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
      paramAdapterView.putExtra("troop_uin", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_b_of_type_JavaLangString);
      paramAdapterView.putExtra("uinname", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_d_of_type_JavaLangString);
      paramAdapterView.putExtra("PhotoConst.SHOW_ALBUM", true);
      paramAdapterView.putStringArrayListExtra("PhotoConst.PHOTO_PATHS", jdField_b_of_type_JavaUtilArrayList);
      paramAdapterView.putExtra("PhotoConst.CURRENT_SELECTED_INDEX", jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$MyAdapter.a(paramInt).jdField_a_of_type_JavaLangInteger);
      paramAdapterView.putStringArrayListExtra("PhotoConst.SELECTED_PATHS", paramView);
      paramAdapterView.putIntegerArrayListExtra("PhotoConst.SELECTED_INDEXS", jdField_a_of_type_JavaUtilArrayList);
      if ((jdField_a_of_type_AndroidAppActivity instanceof SplashActivity))
      {
        paramAdapterView.putExtra("PhotoConst.INIT_ACTIVITY_CLASS_NAME", SplashActivity.class.getName());
        paramAdapterView = AIOUtils.a(paramAdapterView, null);
        paramAdapterView.putExtra("PhotoConst.INIT_ACTIVITY_PACKAGE_NAME", "com.tencent.mobileqq");
        if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int != 9501) {
          break label704;
        }
        if (!(jdField_a_of_type_AndroidAppActivity instanceof SplashActivity)) {
          break label687;
        }
        paramAdapterView.putExtra("PhotoConst.DEST_ACTIVITY_CLASS_NAME", SplashActivity.class.getName());
        paramAdapterView = AIOUtils.a(paramAdapterView, null);
        label442:
        paramAdapterView.putExtra(AlbumConstants.i, 80);
        paramAdapterView.putExtra("PhotoConst.DEST_ACTIVITY_PACKAGE_NAME", "com.tencent.mobileqq");
        paramAdapterView.putExtra("PhotoConst.SHOULD_SEND_RAW_PHOTO", true);
        label472:
        paramAdapterView.putExtra("PhotoConst.CURRENT_QUALITY_TYPE", jdField_f_of_type_Int);
        paramAdapterView.putExtra("keep_selected_status_after_finish", true);
        paramAdapterView.putExtra("PhotoConst.IS_OVERLOAD", false);
        paramAdapterView.putExtra("PhotoConst.MAXUM_SELECTED_NUM", jdField_d_of_type_Int);
        paramAdapterView.putExtra("custom_photopreview_sendbtn_report", true);
        paramAdapterView.putExtra("custom_photopreview_sendbtn_reportActionName", "0X8005E0A");
        paramAdapterView.putExtra("custom_photopreview_sendbtn_reportReverse2", "0");
        paramAdapterView.putExtra("custom_photopreview_editbtn_reportActionName", "0X8005E0B");
        paramAdapterView.putExtra("custom_photopreview_rawcheckbox_reportActionName", "0X8005E0C");
        paramAdapterView.setClass(jdField_a_of_type_AndroidAppActivity, PhotoPreviewActivity.class);
        paramAdapterView.addFlags(603979776);
        jdField_a_of_type_AndroidAppActivity.startActivityForResult(paramAdapterView, 100004);
        label598:
        paramAdapterView = "";
        if (n != 0) {
          break label1199;
        }
        paramAdapterView = "0";
      }
    }
    for (;;)
    {
      ReportController.b(null, "CliOper", "", "", "0X8005E09", "0X8005E09", 0, 0, paramAdapterView, "", "", "");
      return;
      if ((jdField_a_of_type_AndroidAppActivity instanceof LiteActivity))
      {
        paramAdapterView.putExtra("PhotoConst.INIT_ACTIVITY_CLASS_NAME", LiteActivity.class.getName());
        break;
      }
      paramAdapterView.putExtra("PhotoConst.INIT_ACTIVITY_CLASS_NAME", ChatActivity.class.getName());
      break;
      label687:
      paramAdapterView.putExtra("PhotoConst.DEST_ACTIVITY_CLASS_NAME", ChatActivity.class.getName());
      break label442;
      label704:
      if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 6000)
      {
        paramAdapterView.putExtra(AlbumConstants.i, 55);
        paramAdapterView.putExtra("PhotoConst.SHOULD_SEND_RAW_PHOTO", false);
        paramAdapterView.putExtra("PhotoConst.IS_SEND_FILESIZE_LIMIT", true);
        break label472;
      }
      paramAdapterView.putExtra("PhotoConst.DEST_ACTIVITY_CLASS_NAME", SendPhotoActivity.class.getName());
      paramAdapterView.putExtra("PhotoConst.DEST_ACTIVITY_PACKAGE_NAME", "com.tencent.mobileqq");
      paramAdapterView.putExtra("PhotoConst.SHOULD_SEND_RAW_PHOTO", true);
      break label472;
      if (n != 1) {
        break label598;
      }
      paramAdapterView = (String)jdField_a_of_type_JavaUtilLinkedList.peek();
      LocalMediaInfo localLocalMediaInfo = jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$MyAdapter.a(paramInt);
      if (jdField_b_of_type_Long > jdField_a_of_type_Long)
      {
        paramAdapterView = DialogUtil.a(jdField_a_of_type_AndroidAppActivity, 2131366967);
        paramAdapterView.setPositiveButton(2131366997, new DialogUtil.DialogOnClickAdapter());
        paramAdapterView.show();
        return;
      }
      if ((jdField_a_of_type_JavaUtilLinkedList.size() >= jdField_e_of_type_Int) && (paramAdapterView != null) && (!paramAdapterView.equals(jdField_a_of_type_JavaLangString)))
      {
        paramAdapterView = DialogUtil.a(jdField_a_of_type_AndroidAppActivity, 2131366969);
        paramAdapterView.setPositiveButton(2131366997, new DialogUtil.DialogOnClickAdapter());
        paramAdapterView.show();
        return;
      }
      paramAdapterView = new Intent(jdField_a_of_type_AndroidAppActivity, ShortVideoPreviewActivity.class);
      paramAdapterView.putExtra("file_send_path", jdField_a_of_type_JavaLangString);
      paramAdapterView.putExtra("file_send_size", jdField_b_of_type_Long);
      paramAdapterView.putExtra("file_send_duration", e);
      paramAdapterView.putExtra("uin", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
      paramAdapterView.putExtra("uintype", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
      paramAdapterView.putExtra("file_source", "album");
      paramAdapterView.putExtra("custom_shortvideopreview_sendbtn_reportActionName", "0X8005E0A");
      paramAdapterView.putExtra("custom_shortvideopreview_sendbtn_reportReverse2", "1");
      if ((jdField_a_of_type_AndroidAppActivity instanceof SplashActivity))
      {
        paramAdapterView.putExtra("PhotoConst.INIT_ACTIVITY_CLASS_NAME", SplashActivity.class.getName());
        paramAdapterView = AIOUtils.a(paramAdapterView, null);
        label1064:
        paramAdapterView.putExtra("PhotoConst.INIT_ACTIVITY_PACKAGE_NAME", "com.tencent.mobileqq");
        if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int != 6000) {
          break label1171;
        }
        paramAdapterView.putExtra(AlbumConstants.i, 55);
        paramAdapterView.putExtra("PhotoConst.IS_SUPPORT_VIDEO_CHECKBOX", true);
        paramAdapterView.putExtra("PhotoConst.PHOTO_PATHS", paramView);
      }
      for (;;)
      {
        jdField_a_of_type_AndroidAppActivity.startActivity(paramAdapterView);
        break;
        if ((jdField_a_of_type_AndroidAppActivity instanceof LiteActivity))
        {
          paramAdapterView.putExtra("PhotoConst.INIT_ACTIVITY_CLASS_NAME", LiteActivity.class.getName());
          break label1064;
        }
        paramAdapterView.putExtra("PhotoConst.INIT_ACTIVITY_CLASS_NAME", ChatActivity.class.getName());
        break label1064;
        label1171:
        paramAdapterView.putExtra("PhotoConst.DEST_VIDEO_ACTIVITY_CLASS_NAME", SendVideoActivity.class.getName());
        paramAdapterView.putExtra("PhotoConst.DEST_VIDEO_ACTIVITY_PACKAGE_NAME", "com.tencent.mobileqq");
      }
      label1199:
      if (n == 1) {
        paramAdapterView = "1";
      }
    }
  }
  
  public boolean onItemLongClick(AdapterView paramAdapterView, View paramView, int paramInt, long paramLong)
  {
    if (QLog.isColorLevel()) {
      QLog.d("PhotoListPanel", 2, "onItemLongClick position" + paramInt);
    }
    return true;
  }
  
  public void setCustomOnClickListener(PhotoListPanel.BottomBtnClickListener paramBottomBtnClickListener)
  {
    jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$BottomBtnClickListener = paramBottomBtnClickListener;
  }
  
  public void setOnSwipeUpAndDragListener(PhotoListPanel.SwipeUpAndDragListener paramSwipeUpAndDragListener)
  {
    jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$SwipeUpAndDragListener = paramSwipeUpAndDragListener;
    jdField_a_of_type_ComTencentWidgetHorizontalListView.setOnTouchListener(paramSwipeUpAndDragListener);
  }
  
  public void setQualityTvRawPhotoText()
  {
    int i1 = 0;
    Object localObject = jdField_a_of_type_JavaUtilLinkedList.iterator();
    int n = 0;
    int i2;
    while (((Iterator)localObject).hasNext())
    {
      String str = (String)((Iterator)localObject).next();
      long l1 = new File(str).length();
      i2 = (int)(n + l1);
      n = i2;
      if (QLog.isColorLevel())
      {
        QLog.d("PhotoListPanel", 2, "setQualityTextViewText, path:" + str + ",len:" + l1);
        n = i2;
      }
    }
    localObject = PhotoUtils.a(jdField_a_of_type_AndroidAppActivity, n);
    if (((String)localObject).equals("0"))
    {
      localObject = "(999K)";
      jdField_b_of_type_AndroidWidgetTextView.setVisibility(4);
    }
    for (;;)
    {
      i2 = ((String)localObject).length();
      n = i1;
      while (n < 6 - i2)
      {
        localObject = (String)localObject + " ";
        n += 1;
      }
      localObject = "(" + (String)localObject + ")";
      jdField_b_of_type_AndroidWidgetTextView.setVisibility(0);
    }
    jdField_b_of_type_AndroidWidgetTextView.setText((CharSequence)localObject);
    if (jdField_a_of_type_JavaUtilLinkedList.isEmpty()) {
      jdField_b_of_type_AndroidWidgetTextView.setVisibility(4);
    }
  }
}
