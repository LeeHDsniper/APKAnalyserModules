package com.tencent.mobileqq.activity.photo;

import android.app.Dialog;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.res.Resources;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Environment;
import android.os.Handler;
import android.os.Message;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.util.Pair;
import android.util.SparseArray;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.Window;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.CompoundButton.OnCheckedChangeListener;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.tencent.av.camera.QavCameraUsage;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.photo.AIOGalleryUtils;
import com.tencent.mobileqq.activity.aio.photo.PeakActivity;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.filemanager.util.FMDialogUtil;
import com.tencent.mobileqq.filemanager.util.FileManagerUtil;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pic.IPresendPicMgr.Stub;
import com.tencent.mobileqq.pic.PresendPicMgr;
import com.tencent.mobileqq.servlet.QZoneAlbumListNumServlet;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.utils.AlbumUtil;
import com.tencent.mobileqq.utils.FileUtils;
import com.tencent.mobileqq.utils.QQCustomDialog;
import com.tencent.mobileqq.widget.NumberCheckBox;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import com.tencent.util.BinderWarpper;
import com.tencent.widget.AdapterView.OnItemClickListener;
import com.tencent.widget.GestureSelectGridView;
import com.tencent.widget.GestureSelectGridView.OnSelectListener;
import com.tencent.widget.immersive.ImmersiveUtils;
import common.config.service.QzoneConfig;
import cooperation.photoplus.PhotoPlusBridgeActivity;
import cooperation.plugin.IPluginManager;
import cooperation.plugin.IPluginManager.PluginParams;
import cooperation.qqfav.QfavHelper;
import cooperation.qzone.LocalMultiProcConfig;
import cooperation.qzone.QZoneClickReport;
import cooperation.qzone.QZoneHelper;
import cooperation.qzone.QZoneHelper.UserInfo;
import cooperation.qzone.QzonePluginProxyActivity;
import cooperation.qzone.model.BaseBusinessAlbumInfo;
import cooperation.zebra.ZebraPluginProxyActivity;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import max;
import may;
import mba;
import mbb;
import mbc;
import mbd;
import mbe;
import mbf;
import mbh;
import mbi;
import mbj;
import mbk;
import mqq.app.AppRuntime;
import mqq.app.NewIntent;

public class PhotoListActivity
  extends PeakActivity
  implements View.OnClickListener, CompoundButton.OnCheckedChangeListener, MediaScanner.OnMediaScannerListener
{
  static int jdField_a_of_type_Int = 0;
  static final String jdField_a_of_type_JavaLangString;
  public static ArrayList a;
  private static mbk jdField_a_of_type_Mbk = new mbk();
  public static final int b = 0;
  public static final String b = "FROM_WHERE";
  static final int jdField_c_of_type_Int = 100;
  public static final String c = "FROM_PHOTO_LIST";
  static final int jdField_d_of_type_Int = -1;
  public static long d = 0L;
  public static final String d = "FROM_PHOTO_LIST_FLOW";
  public static final int e = 1000;
  public static final String e = "FROM_NEARBY_PROFILE";
  static final int jdField_f_of_type_Int = 3;
  public static final String f = "FROM_TROOP_ORG_PROFILE";
  public static final String g = "ALBUMLIST_POSITION";
  public static final String h = "ALBUMLIST_ITEM_DURATION";
  public static int q;
  public boolean A = false;
  public boolean B = false;
  public boolean C = false;
  long jdField_a_of_type_Long;
  Dialog jdField_a_of_type_AndroidAppDialog;
  public SharedPreferences a;
  public AsyncTask a;
  Handler jdField_a_of_type_AndroidOsHandler = new mbh(this);
  View jdField_a_of_type_AndroidViewView;
  Button jdField_a_of_type_AndroidWidgetButton;
  CheckBox jdField_a_of_type_AndroidWidgetCheckBox;
  TextView jdField_a_of_type_AndroidWidgetTextView;
  public LocalMediaInfo a;
  public MediaFileFilter a;
  AdapterView.OnItemClickListener jdField_a_of_type_ComTencentWidgetAdapterView$OnItemClickListener = new mbb(this);
  GestureSelectGridView.OnSelectListener jdField_a_of_type_ComTencentWidgetGestureSelectGridView$OnSelectListener = new max(this);
  public GestureSelectGridView a;
  public HashMap a;
  public mbi a;
  boolean jdField_a_of_type_Boolean = false;
  public long b;
  View jdField_b_of_type_AndroidViewView;
  Button jdField_b_of_type_AndroidWidgetButton;
  public CheckBox b;
  TextView jdField_b_of_type_AndroidWidgetTextView;
  public ArrayList b;
  public HashMap b;
  public HashSet b;
  boolean jdField_b_of_type_Boolean = false;
  public long c;
  public Button c;
  TextView jdField_c_of_type_AndroidWidgetTextView;
  public ArrayList c;
  public HashSet c;
  public boolean c;
  TextView jdField_d_of_type_AndroidWidgetTextView;
  public ArrayList d;
  public boolean d;
  TextView e;
  public boolean e;
  TextView jdField_f_of_type_AndroidWidgetTextView;
  public boolean f;
  public int g;
  TextView jdField_g_of_type_AndroidWidgetTextView;
  boolean jdField_g_of_type_Boolean = false;
  public int h;
  boolean h;
  int jdField_i_of_type_Int;
  public String i;
  boolean jdField_i_of_type_Boolean = false;
  int jdField_j_of_type_Int;
  public String j;
  boolean jdField_j_of_type_Boolean = true;
  int k;
  public String k;
  public boolean k;
  int jdField_l_of_type_Int;
  public String l;
  boolean jdField_l_of_type_Boolean = false;
  int jdField_m_of_type_Int;
  public String m;
  boolean jdField_m_of_type_Boolean = false;
  public int n;
  String jdField_n_of_type_JavaLangString;
  boolean jdField_n_of_type_Boolean = false;
  public int o;
  String jdField_o_of_type_JavaLangString;
  boolean jdField_o_of_type_Boolean;
  public int p;
  String p;
  public boolean p;
  String jdField_q_of_type_JavaLangString;
  boolean jdField_q_of_type_Boolean = false;
  public int r;
  public String r;
  boolean r;
  public int s;
  String s;
  public boolean s;
  String t;
  public boolean t;
  public String u;
  boolean u;
  public boolean v = false;
  public boolean w;
  boolean x = true;
  boolean y = false;
  public boolean z = false;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaLangString = PhotoListActivity.class.getSimpleName();
    jdField_a_of_type_Int = 19922944;
    jdField_a_of_type_JavaUtilArrayList = null;
    jdField_q_of_type_Int = -1;
  }
  
  public PhotoListActivity()
  {
    jdField_e_of_type_Boolean = true;
    jdField_a_of_type_Mbi = null;
    jdField_n_of_type_Int = 1;
    jdField_f_of_type_Boolean = true;
    jdField_h_of_type_Boolean = false;
    jdField_k_of_type_Boolean = false;
    jdField_p_of_type_Boolean = false;
    jdField_r_of_type_Boolean = false;
    jdField_s_of_type_Boolean = false;
    jdField_p_of_type_Int = 0;
    jdField_p_of_type_JavaLangString = null;
    jdField_w_of_type_Boolean = false;
    jdField_s_of_type_Int = 0;
    jdField_a_of_type_ComTencentMobileqqActivityPhotoLocalMediaInfo = null;
    jdField_b_of_type_JavaUtilHashSet = new HashSet();
    jdField_c_of_type_JavaUtilHashSet = new HashSet();
  }
  
  private void a(int paramInt, boolean paramBoolean)
  {
    int i2 = jdField_a_of_type_ComTencentWidgetGestureSelectGridView.s();
    int i3 = jdField_a_of_type_ComTencentWidgetGestureSelectGridView.t();
    int i1 = i2;
    if (i1 <= i3)
    {
      if ((paramBoolean) && (paramInt != i1)) {}
      label404:
      for (;;)
      {
        i1 += 1;
        break;
        Object localObject = jdField_a_of_type_ComTencentWidgetGestureSelectGridView.getChildAt(i1 - i2);
        LocalMediaInfo localLocalMediaInfo = jdField_a_of_type_Mbi.a(i1);
        if (localObject == null)
        {
          if (QLog.isColorLevel()) {
            QLog.d(jdField_a_of_type_JavaLangString, 2, "updateCheckbox view = null at " + i1);
          }
        }
        else if (localLocalMediaInfo == null)
        {
          if (QLog.isColorLevel()) {
            QLog.d(jdField_a_of_type_JavaLangString, 2, "updateCheckbox info = null at " + i1);
          }
        }
        else
        {
          int i4;
          if (paramInt != i1)
          {
            i4 = jdField_c_of_type_JavaUtilArrayList.indexOf(jdField_a_of_type_JavaLangString);
            if (i4 >= 0) {
              getTaga.setCheckedNumber(i4 + 1);
            }
          }
          else
          {
            i4 = AlbumUtil.a(localLocalMediaInfo);
            if ((i4 == 0) || (i4 == 1))
            {
              mbj localMbj = (mbj)((View)localObject).getTag();
              ImageView localImageView = b;
              int i5 = jdField_b_of_type_Int;
              if (i5 == 1)
              {
                localImageView.setVisibility(0);
                a.setCheckedNumber(jdField_c_of_type_JavaUtilArrayList.indexOf(jdField_a_of_type_JavaLangString) + 1);
                if (((View)localObject).getBackground() != null) {
                  ((View)localObject).setBackgroundDrawable(null);
                }
              }
              for (;;)
              {
                if (!AppSetting.jdField_i_of_type_Boolean) {
                  break label404;
                }
                localObject = PhotoUtils.a(i4, localLocalMediaInfo, i1, a.isChecked());
                a.setContentDescription((CharSequence)localObject);
                break;
                if (i5 == 3)
                {
                  localImageView.setVisibility(4);
                  a.setChecked(false);
                  if (!jdField_t_of_type_Boolean)
                  {
                    if (((View)localObject).getBackground() == null) {
                      ((View)localObject).setBackgroundResource(2130837632);
                    }
                  }
                  else {
                    ((View)localObject).setBackgroundDrawable(null);
                  }
                }
                else
                {
                  localImageView.setVisibility(4);
                  a.setChecked(false);
                  if (((View)localObject).getBackground() != null) {
                    ((View)localObject).setBackgroundDrawable(null);
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  
  File a()
  {
    Object localObject = new SimpleDateFormat("yyyyMMdd_HHmmss").format(new Date());
    String str = "JPEG_" + (String)localObject + "_";
    if ("mounted".equals(Environment.getExternalStorageState()))
    {
      boolean bool = false;
      if (Build.VERSION.SDK_INT > 7)
      {
        localObject = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DCIM);
        bool = true;
      }
      while (bool)
      {
        localObject = File.createTempFile(str, ".jpg", (File)localObject);
        jdField_u_of_type_JavaLangString = ((File)localObject).getAbsolutePath();
        return localObject;
        File localFile = new File(Environment.getExternalStorageDirectory(), "DCIM");
        localObject = localFile;
        if (!localFile.exists())
        {
          bool = localFile.mkdirs();
          localObject = localFile;
        }
      }
    }
    return null;
  }
  
  void a()
  {
    Object localObject = (RelativeLayout)findViewById(2131296923);
    if (ImmersiveUtils.isSupporImmersive() == 1)
    {
      ((RelativeLayout)localObject).setFitsSystemWindows(true);
      ((RelativeLayout)localObject).setPadding(0, ImmersiveUtils.a(this), 0, 0);
    }
    jdField_e_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131297035));
    jdField_e_of_type_AndroidWidgetTextView.setText("相册");
    jdField_e_of_type_AndroidWidgetTextView.setOnClickListener(this);
    jdField_f_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131297081));
    jdField_f_of_type_AndroidWidgetTextView.setVisibility(0);
    jdField_f_of_type_AndroidWidgetTextView.setText("取消");
    jdField_f_of_type_AndroidWidgetTextView.setOnClickListener(this);
    jdField_g_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131297034));
    label449:
    int i1;
    if (jdField_i_of_type_JavaLangString != null)
    {
      localObject = jdField_i_of_type_JavaLangString;
      setTitle((CharSequence)localObject);
      jdField_a_of_type_AndroidWidgetButton = ((Button)findViewById(2131298576));
      jdField_a_of_type_AndroidWidgetCheckBox = ((CheckBox)findViewById(2131298577));
      jdField_a_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131298578));
      jdField_b_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131300886));
      f();
      jdField_b_of_type_AndroidWidgetButton = ((Button)findViewById(2131301824));
      jdField_c_of_type_AndroidWidgetButton = ((Button)findViewById(2131298579));
      jdField_a_of_type_AndroidViewView = findViewById(2131300884);
      jdField_b_of_type_AndroidViewView = findViewById(2131301820);
      jdField_d_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131301822));
      jdField_a_of_type_ComTencentWidgetGestureSelectGridView = ((GestureSelectGridView)findViewById(2131301825));
      jdField_a_of_type_ComTencentWidgetGestureSelectGridView.setScrollBarStyle(0);
      jdField_a_of_type_ComTencentWidgetGestureSelectGridView.setNumColumns(3);
      jdField_a_of_type_ComTencentWidgetGestureSelectGridView.setColumnWidth(jdField_g_of_type_Int);
      jdField_a_of_type_ComTencentWidgetGestureSelectGridView.setHorizontalSpacing(jdField_i_of_type_Int);
      jdField_a_of_type_ComTencentWidgetGestureSelectGridView.setVerticalSpacing(jdField_j_of_type_Int);
      jdField_a_of_type_ComTencentWidgetGestureSelectGridView.setPadding(jdField_k_of_type_Int, jdField_a_of_type_ComTencentWidgetGestureSelectGridView.getPaddingTop(), jdField_k_of_type_Int, jdField_a_of_type_ComTencentWidgetGestureSelectGridView.getPaddingBottom());
      jdField_a_of_type_ComTencentWidgetGestureSelectGridView.setOnItemClickListener(jdField_a_of_type_ComTencentWidgetAdapterView$OnItemClickListener);
      jdField_a_of_type_ComTencentWidgetGestureSelectGridView.setOnIndexChangedListener(jdField_a_of_type_ComTencentWidgetGestureSelectGridView$OnSelectListener);
      jdField_a_of_type_ComTencentWidgetGestureSelectGridView.setMaximumVelocity((int)(2500.0F * getResourcesgetDisplayMetricsdensity));
      jdField_a_of_type_Mbi = new mbi(this);
      jdField_a_of_type_ComTencentWidgetGestureSelectGridView.setAdapter(jdField_a_of_type_Mbi);
      String str = jdField_p_of_type_JavaLangString;
      localObject = str;
      if (TextUtils.isEmpty(str))
      {
        if (!y) {
          break label731;
        }
        localObject = getString(2131369799);
      }
      jdField_c_of_type_AndroidWidgetButton.setText((CharSequence)localObject);
      localObject = jdField_a_of_type_AndroidViewView;
      if ((!jdField_f_of_type_Boolean) && (jdField_m_of_type_Int != 2)) {
        break label760;
      }
      i1 = 8;
      label480:
      ((View)localObject).setVisibility(i1);
      jdField_b_of_type_AndroidWidgetButton.setOnClickListener(this);
      jdField_c_of_type_AndroidWidgetButton.setOnClickListener(this);
      if (!jdField_h_of_type_Boolean) {
        break label765;
      }
      jdField_a_of_type_AndroidWidgetButton.setVisibility(0);
      jdField_a_of_type_AndroidWidgetCheckBox.setVisibility(0);
      jdField_a_of_type_AndroidWidgetButton.setOnClickListener(this);
      jdField_a_of_type_AndroidWidgetCheckBox.setOnCheckedChangeListener(this);
      jdField_a_of_type_AndroidWidgetTextView.setOnClickListener(this);
      jdField_b_of_type_AndroidWidgetTextView.setOnClickListener(this);
    }
    for (;;)
    {
      if (jdField_i_of_type_Boolean) {
        jdField_a_of_type_AndroidWidgetCheckBox.setOnCheckedChangeListener(this);
      }
      d();
      if ((jdField_u_of_type_Boolean) && (jdField_m_of_type_JavaLangString != null))
      {
        jdField_b_of_type_AndroidViewView.setVisibility(0);
        jdField_c_of_type_AndroidWidgetTextView = ((TextView)jdField_b_of_type_AndroidViewView.findViewById(2131301823));
        jdField_b_of_type_AndroidWidgetCheckBox = ((CheckBox)jdField_b_of_type_AndroidViewView.findViewById(2131301821));
        jdField_b_of_type_AndroidWidgetCheckBox.setOnClickListener(this);
        jdField_d_of_type_AndroidWidgetTextView.setOnClickListener(this);
        jdField_c_of_type_AndroidWidgetTextView.setOnClickListener(this);
        jdField_b_of_type_AndroidWidgetCheckBox.setOnCheckedChangeListener(this);
        c(getIntent());
      }
      if (jdField_o_of_type_Int == 1001)
      {
        jdField_a_of_type_AndroidWidgetCheckBox.setVisibility(8);
        jdField_a_of_type_AndroidWidgetTextView.setVisibility(8);
        jdField_b_of_type_AndroidWidgetTextView.setVisibility(8);
      }
      return;
      if (jdField_m_of_type_Int == 2)
      {
        localObject = "视频";
        break;
      }
      localObject = "最近照片";
      break;
      label731:
      if (jdField_h_of_type_Boolean)
      {
        localObject = getString(2131369797);
        break label449;
      }
      localObject = getString(2131369798);
      break label449;
      label760:
      i1 = 0;
      break label480;
      label765:
      if (jdField_k_of_type_Boolean)
      {
        jdField_a_of_type_AndroidWidgetButton.setVisibility(0);
        jdField_a_of_type_AndroidWidgetButton.setOnClickListener(this);
      }
      else
      {
        jdField_a_of_type_AndroidWidgetButton.setVisibility(8);
      }
    }
  }
  
  public void a(int paramInt, LocalMediaInfo paramLocalMediaInfo)
  {
    if (jdField_a_of_type_AndroidOsHandler == null) {}
    do
    {
      do
      {
        return;
      } while ((jdField_a_of_type_Mbi == null) || (jdField_a_of_type_Mbi.jdField_a_of_type_JavaUtilArrayList == null));
      localObject = (LocalMediaInfo)jdField_a_of_type_Mbi.jdField_a_of_type_JavaUtilArrayList.get(paramInt);
    } while ((localObject == null) || (paramLocalMediaInfo == null) || (jdField_a_of_type_JavaLangString == null) || (jdField_a_of_type_JavaLangString == null) || (!jdField_a_of_type_JavaLangString.equals(jdField_a_of_type_JavaLangString)));
    Object localObject = jdField_a_of_type_AndroidOsHandler.obtainMessage();
    what = 0;
    Bundle localBundle = new Bundle();
    localBundle.putInt("ALBUMLIST_POSITION", paramInt);
    localBundle.putLong("ALBUMLIST_ITEM_DURATION", e);
    ((Message)localObject).setData(localBundle);
    jdField_a_of_type_AndroidOsHandler.sendMessage((Message)localObject);
  }
  
  void a(Intent paramIntent)
  {
    paramIntent = (BinderWarpper)paramIntent.getParcelableExtra("binder_presendService");
    if (paramIntent != null) {}
    for (paramIntent = PresendPicMgr.b(IPresendPicMgr.Stub.a(a));; paramIntent = null)
    {
      if (QLog.isColorLevel()) {
        QLog.d("SelectPhotoTrace", 2, jdField_a_of_type_JavaLangString + "  initPresendMgr , presendMgr = " + paramIntent);
      }
      return;
      if (QLog.isColorLevel()) {
        QLog.d("SelectPhotoTrace", 2, jdField_a_of_type_JavaLangString + "  initPresendMgr , bw is null ! ");
      }
    }
  }
  
  public void a(String paramString)
  {
    if (jdField_p_of_type_Boolean)
    {
      AlbumUtil.jdField_c_of_type_Long = System.currentTimeMillis();
      AlbumUtil.jdField_a_of_type_JavaUtilHashMap.put(jdField_j_of_type_JavaLangString, Integer.valueOf(jdField_a_of_type_Mbi.getCount()));
      if (!TextUtils.isEmpty(paramString))
      {
        AlbumUtil.jdField_a_of_type_JavaLangString = paramString;
        HashMap localHashMap = AlbumUtil.jdField_c_of_type_JavaUtilHashMap;
        if (localHashMap.containsKey(paramString))
        {
          paramString = (Pair)localHashMap.get(paramString);
          AlbumUtil.jdField_b_of_type_JavaLangString = (String)first;
          AlbumUtil.jdField_c_of_type_JavaLangString = (String)second;
          AlbumUtil.a(this, AlbumUtil.jdField_b_of_type_JavaLangString, AlbumUtil.jdField_c_of_type_JavaLangString);
        }
      }
    }
    AlbumUtil.c();
  }
  
  void a(boolean paramBoolean)
  {
    AlbumUtil.a();
    Intent localIntent = getIntent();
    if (!paramBoolean)
    {
      localIntent.putStringArrayListExtra("PhotoConst.PHOTO_PATHS", jdField_c_of_type_JavaUtilArrayList);
      if ((jdField_c_of_type_JavaUtilArrayList != null) && (jdField_c_of_type_JavaUtilArrayList.size() > 0)) {
        ReportController.b(null, "CliOper", "", jdField_m_of_type_JavaLangString, "0X8004072", "0X8004072", 0, jdField_c_of_type_JavaUtilArrayList.size(), 0, "", "", "", "");
      }
    }
    for (;;)
    {
      localIntent.putExtra("ALBUM_NAME", jdField_i_of_type_JavaLangString);
      localIntent.putExtra("ALBUM_ID", jdField_j_of_type_JavaLangString);
      localIntent.putExtra("FROM_WHERE", "FROM_PHOTO_LIST");
      localIntent.putExtra("PhotoConst.CURRENT_QUALITY_TYPE", jdField_p_of_type_Int);
      localIntent.putExtra("PasterConstants.pasters_data", jdField_b_of_type_JavaUtilHashMap);
      jdField_q_of_type_Int = jdField_a_of_type_ComTencentWidgetGestureSelectGridView.s();
      localIntent.setClass(this, PhotoPreviewActivity.class);
      localIntent.addFlags(603979776);
      startActivity(localIntent);
      super.finish();
      AlbumUtil.a(this, true, true);
      return;
      localIntent.putExtra("PhotoConst.SINGLE_PHOTO_PATH", jdField_u_of_type_JavaLangString);
    }
  }
  
  protected boolean a()
  {
    return false;
  }
  
  public boolean a(LocalMediaInfo paramLocalMediaInfo, boolean paramBoolean)
  {
    Object localObject = MimeHelper.a(jdField_b_of_type_JavaLangString);
    if ((!B) && (localObject != null) && (!"image".equals(localObject[0]))) {}
    long l1;
    do
    {
      int i1;
      do
      {
        return false;
        i1 = jdField_b_of_type_Int;
      } while (((i1 == 1) && (paramBoolean)) || ((i1 == 2) && (!paramBoolean)));
      if ((i1 != 2) || (!paramBoolean) || (jdField_c_of_type_JavaUtilArrayList.size() < jdField_n_of_type_Int)) {
        break;
      }
      l1 = System.currentTimeMillis();
    } while (l1 - jdField_a_of_type_Long < 700L);
    QQToast.a(this, "最多只能选择" + jdField_n_of_type_Int + "张图片", 1000).b(jdField_r_of_type_Int);
    jdField_a_of_type_Long = l1;
    C = true;
    return false;
    C = false;
    String str = jdField_a_of_type_JavaLangString;
    PresendPicMgr.a();
    if (paramBoolean)
    {
      if ((B) && (localObject != null) && ("video".equals(localObject[0])))
      {
        jdField_s_of_type_Int += 1;
        if (jdField_s_of_type_Int == 1) {
          jdField_a_of_type_ComTencentMobileqqActivityPhotoLocalMediaInfo = paramLocalMediaInfo;
        }
      }
      jdField_c_of_type_JavaUtilArrayList.add(str);
      jdField_d_of_type_JavaUtilArrayList.add(jdField_a_of_type_JavaLangInteger);
      if (jdField_c_of_type_JavaUtilHashSet.contains(str)) {
        jdField_c_of_type_JavaUtilHashSet.remove(str);
      }
      jdField_b_of_type_JavaUtilHashSet.add(str);
      StatisticConstants.a(getIntent(), "param_totalSelNum");
      localObject = getIntent();
      if (!((Intent)localObject).hasExtra("param_initTime")) {
        ((Intent)localObject).putExtra("param_initTime", System.currentTimeMillis());
      }
      jdField_b_of_type_Int = 1;
      localObject = (LinkedHashMap)AlbumUtil.jdField_b_of_type_JavaUtilHashMap.get(jdField_j_of_type_JavaLangString);
      paramLocalMediaInfo = (LocalMediaInfo)localObject;
      if (localObject == null)
      {
        paramLocalMediaInfo = new LinkedHashMap();
        AlbumUtil.jdField_b_of_type_JavaUtilHashMap.put(jdField_j_of_type_JavaLangString, paramLocalMediaInfo);
      }
      paramLocalMediaInfo.put(str, Integer.valueOf(jdField_a_of_type_ComTencentWidgetGestureSelectGridView.s()));
      paramLocalMediaInfo = AlbumUtil.jdField_c_of_type_JavaUtilHashMap;
      if (!paramLocalMediaInfo.containsKey(str)) {
        paramLocalMediaInfo.put(str, new Pair(jdField_j_of_type_JavaLangString, jdField_i_of_type_JavaLangString));
      }
      return true;
    }
    if ((B) && (localObject != null) && ("video".equals(localObject[0])))
    {
      jdField_s_of_type_Int -= 1;
      if (jdField_s_of_type_Int == 1) {
        jdField_a_of_type_ComTencentMobileqqActivityPhotoLocalMediaInfo = paramLocalMediaInfo;
      }
    }
    jdField_c_of_type_JavaUtilArrayList.remove(jdField_a_of_type_JavaLangString);
    jdField_d_of_type_JavaUtilArrayList.remove(jdField_a_of_type_JavaLangInteger);
    if (jdField_b_of_type_JavaUtilHashSet.contains(jdField_a_of_type_JavaLangString)) {
      jdField_b_of_type_JavaUtilHashSet.remove(jdField_a_of_type_JavaLangString);
    }
    for (;;)
    {
      jdField_b_of_type_Int = 2;
      StatisticConstants.a(getIntent(), "param_cancelSelNum");
      paramLocalMediaInfo = (HashMap)AlbumUtil.jdField_b_of_type_JavaUtilHashMap.get(jdField_j_of_type_JavaLangString);
      if (paramLocalMediaInfo != null) {
        paramLocalMediaInfo.remove(str);
      }
      paramLocalMediaInfo = AlbumUtil.jdField_c_of_type_JavaUtilHashMap;
      if (!paramLocalMediaInfo.containsKey(str)) {
        break;
      }
      paramLocalMediaInfo.remove(str);
      break;
      jdField_c_of_type_JavaUtilHashSet.add(jdField_a_of_type_JavaLangString);
    }
  }
  
  int b()
  {
    Iterator localIterator = jdField_c_of_type_JavaUtilArrayList.iterator();
    int i1 = 0;
    if (localIterator.hasNext())
    {
      if (new File((String)localIterator.next()).length() <= jdField_a_of_type_Int) {
        break label55;
      }
      i1 += 1;
    }
    label55:
    for (;;)
    {
      break;
      return i1;
    }
  }
  
  public void b()
  {
    try
    {
      if (jdField_a_of_type_AndroidAppDialog != null) {
        c();
      }
      while (!jdField_a_of_type_AndroidAppDialog.isShowing())
      {
        jdField_a_of_type_AndroidAppDialog.show();
        return;
        jdField_a_of_type_AndroidAppDialog = new Dialog(this, 2131558942);
        jdField_a_of_type_AndroidAppDialog.setCancelable(true);
        jdField_a_of_type_AndroidAppDialog.show();
        jdField_a_of_type_AndroidAppDialog.setContentView(2130903444);
      }
      return;
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.e("PhotoListActivity", 2, "dialog error");
      }
      jdField_a_of_type_AndroidAppDialog = null;
    }
  }
  
  void b(Intent paramIntent)
  {
    boolean bool2 = true;
    if (QLog.isColorLevel()) {
      QLog.d("SelectPhotoTrace", 2, jdField_a_of_type_JavaLangString + " initData(),intent extras is:" + paramIntent.getExtras());
    }
    jdField_p_of_type_Boolean = paramIntent.getBooleanExtra("PhotoConst.IS_RECODE_LAST_ALBUMPATH", true);
    label425:
    label452:
    Object localObject;
    if (paramIntent.getBooleanExtra("album_enter_directly", false))
    {
      long l1 = System.currentTimeMillis();
      long l2 = AlbumUtil.jdField_c_of_type_Long;
      if ((jdField_p_of_type_Boolean) && (l1 - l2 < 60000L))
      {
        jdField_i_of_type_JavaLangString = AlbumUtil.jdField_c_of_type_JavaLangString;
        jdField_j_of_type_JavaLangString = AlbumUtil.jdField_b_of_type_JavaLangString;
      }
      if (jdField_j_of_type_JavaLangString == null)
      {
        jdField_j_of_type_JavaLangString = "$RecentAlbumId";
        jdField_i_of_type_JavaLangString = null;
      }
      jdField_c_of_type_JavaUtilArrayList = paramIntent.getStringArrayListExtra("PhotoConst.PHOTO_PATHS");
      if (jdField_c_of_type_JavaUtilArrayList == null) {
        jdField_c_of_type_JavaUtilArrayList = new ArrayList();
      }
      jdField_d_of_type_JavaUtilArrayList = new ArrayList();
      jdField_n_of_type_Int = paramIntent.getIntExtra("PhotoConst.MAXUM_SELECTED_NUM", 1);
      jdField_f_of_type_Boolean = paramIntent.getBooleanExtra("PhotoConst.IS_SINGLE_MODE", true);
      jdField_g_of_type_Boolean = paramIntent.getBooleanExtra("PhotoConst.IS_SHOW_QZONE_ALBUM", false);
      jdField_a_of_type_JavaUtilHashMap = ((HashMap)paramIntent.getSerializableExtra("PhotoConst.PHOTO_INFOS"));
      jdField_h_of_type_Boolean = paramIntent.getBooleanExtra("PhotoConst.SHOULD_SEND_RAW_PHOTO", false);
      jdField_i_of_type_Boolean = paramIntent.getBooleanExtra("PhotoConst.original_button", false);
      jdField_j_of_type_Boolean = paramIntent.getBooleanExtra("PhotoConst.quality_count_tv", true);
      jdField_m_of_type_JavaLangString = paramIntent.getStringExtra("PhotoConst.MY_UIN");
      if (jdField_h_of_type_Boolean)
      {
        jdField_n_of_type_JavaLangString = paramIntent.getStringExtra("PhotoConst.MY_NICK");
        jdField_o_of_type_JavaLangString = paramIntent.getStringExtra("PhotoConst.MY_HEAD_DIR");
      }
      jdField_a_of_type_Boolean = paramIntent.getBooleanExtra("PhotoConst.HANDLE_DEST_RESULT", false);
      jdField_l_of_type_Boolean = paramIntent.getBooleanExtra("PhotoConst.IS_SINGLE_DERECTBACK_MODE", false);
      jdField_m_of_type_Boolean = paramIntent.getBooleanExtra("PhotoConst.IS_SINGLE_NEED_EDIT", false);
      jdField_n_of_type_Boolean = paramIntent.getBooleanExtra("PhotoConst.IS_CALL_IN_PLUGIN", false);
      jdField_o_of_type_Int = paramIntent.getIntExtra("uintype", -1);
      jdField_p_of_type_Int = paramIntent.getIntExtra("PhotoConst.CURRENT_QUALITY_TYPE", 0);
      if (jdField_n_of_type_Int > 1) {
        jdField_f_of_type_Boolean = false;
      }
      jdField_o_of_type_Boolean = paramIntent.getBooleanExtra("PhotoConst.IS_FINISH_RESTART_INIT_ACTIVITY", false);
      jdField_q_of_type_Boolean = paramIntent.getBooleanExtra("PhotoConst.SEND_FLAG", false);
      if ((jdField_o_of_type_Int != 1) || (paramIntent.getBooleanExtra("is_anonymous", false))) {
        break label958;
      }
      bool1 = true;
      jdField_u_of_type_Boolean = bool1;
      bool1 = paramIntent.getBooleanExtra("filter_photolist_troopalbum_toolbar", false);
      if ((!jdField_u_of_type_Boolean) || (bool1)) {
        break label963;
      }
      bool1 = true;
      jdField_u_of_type_Boolean = bool1;
      jdField_q_of_type_JavaLangString = paramIntent.getStringExtra("uinname");
      jdField_r_of_type_JavaLangString = paramIntent.getStringExtra("uin");
      if (jdField_o_of_type_Int == 9501) {
        A = paramIntent.getBooleanExtra("isdevicesupportmultiupload", false);
      }
      if (jdField_m_of_type_JavaLangString != null) {
        break label968;
      }
      localObject = jdField_w_of_type_JavaLangString;
      label514:
      jdField_m_of_type_JavaLangString = ((String)localObject);
      jdField_m_of_type_Int = paramIntent.getIntExtra("PhotoConst.PHOTOLIST_KEY_SHOW_MEDIA", 1);
      jdField_a_of_type_ComTencentMobileqqActivityPhotoMediaFileFilter = ((MediaFileFilter)MediaFileFilter.a.get(jdField_m_of_type_Int));
      jdField_b_of_type_Boolean = paramIntent.getBooleanExtra("PhotoConst.PHOTOLIST_KEY_FILTER_GIF_VIDEO", false);
      if (jdField_b_of_type_Boolean)
      {
        jdField_a_of_type_ComTencentMobileqqActivityPhotoMediaFileFilter = new DynamicImageMediaFileFilter(MediaFileFilter.b);
        jdField_m_of_type_Int = 1;
      }
      jdField_b_of_type_Long = paramIntent.getLongExtra("PhotoConst.PHOTOLIST_KEY_VIDEO_SIZE", 293601280L);
      jdField_c_of_type_Boolean = paramIntent.getBooleanExtra("PhotoConst.IS_PREVIEW_VIDEO", true);
      jdField_d_of_type_Boolean = paramIntent.getBooleanExtra("PhotoConst.IS_TRIM_VIDEO_BLACK_LIST", false);
      jdField_c_of_type_Long = paramIntent.getLongExtra("PhotoConst.PHOTOLIST_KEY_VIDEO_DURATION", Long.MAX_VALUE);
      if (jdField_q_of_type_Boolean)
      {
        paramIntent.removeExtra("PhotoConst.SEND_FLAG");
        localObject = PresendPicMgr.a();
        if (localObject != null)
        {
          if (QLog.isColorLevel()) {
            QLog.d(jdField_a_of_type_JavaLangString, 2, "Photo+ send pic,cancel presend!");
          }
          ((PresendPicMgr)localObject).a(1004);
        }
        PhotoUtils.a(this, paramIntent, jdField_c_of_type_JavaUtilArrayList, jdField_p_of_type_Int, true);
      }
      jdField_p_of_type_JavaLangString = paramIntent.getStringExtra("PhotoConst.CUSTOM_SENDBTN_TEXT");
      if ((jdField_u_of_type_Boolean) && (jdField_m_of_type_JavaLangString != null))
      {
        localObject = QZoneHelper.a(jdField_m_of_type_JavaLangString, jdField_r_of_type_JavaLangString);
        if ((localObject == null) || (((BaseBusinessAlbumInfo)localObject).b() == null) || (((BaseBusinessAlbumInfo)localObject).b().equals(""))) {
          break label977;
        }
        jdField_s_of_type_JavaLangString = ((BaseBusinessAlbumInfo)localObject).b();
        jdField_t_of_type_JavaLangString = ((BaseBusinessAlbumInfo)localObject).c();
        paramIntent.putExtra("UploadPhoto.key_album_id", jdField_s_of_type_JavaLangString);
        paramIntent.putExtra("UploadPhoto.key_album_name", jdField_t_of_type_JavaLangString);
      }
      label808:
      y = paramIntent.getBooleanExtra("PhotoConst.IS_JUMPTO_TROOP_ALBUM", false);
      z = paramIntent.getBooleanExtra("PhotoConst.IS_FROM_TROOP_BAR", false);
      if ((y) || (z)) {
        break label1002;
      }
    }
    label958:
    label963:
    label968:
    label977:
    label1002:
    for (boolean bool1 = bool2;; bool1 = false)
    {
      v = bool1;
      jdField_w_of_type_Boolean = paramIntent.getBooleanExtra("PhotoConst.IS_SHOW_CAMERA", false);
      jdField_k_of_type_Boolean = paramIntent.getBooleanExtra("PhotoConst.SHOW_MAGIC_USE_PASTER", false);
      if (jdField_k_of_type_Boolean)
      {
        jdField_b_of_type_JavaUtilHashMap = ((HashMap)paramIntent.getSerializableExtra("PasterConstants.pasters_data"));
        jdField_k_of_type_JavaLangString = paramIntent.getStringExtra("PasterConstants.paster_id");
        jdField_l_of_type_JavaLangString = paramIntent.getStringExtra("PasterConstants.paster_cate_id");
      }
      B = paramIntent.getBooleanExtra("PhotoConst.IS_SUPPORT_VIDEO_CHECKBOX", false);
      return;
      jdField_i_of_type_JavaLangString = paramIntent.getStringExtra("ALBUM_NAME");
      jdField_j_of_type_JavaLangString = paramIntent.getStringExtra("ALBUM_ID");
      break;
      bool1 = false;
      break label425;
      bool1 = false;
      break label452;
      localObject = jdField_m_of_type_JavaLangString;
      break label514;
      paramIntent.putExtra("UploadPhoto.key_album_id", "");
      paramIntent.putExtra("UploadPhoto.key_album_name", "");
      break label808;
    }
  }
  
  public void b(String paramString)
  {
    AlbumUtil.a();
    Intent localIntent = getIntent();
    localIntent.putExtra("ALBUM_NAME", jdField_i_of_type_JavaLangString);
    localIntent.putExtra("ALBUM_ID", jdField_j_of_type_JavaLangString);
    localIntent.putExtra("PhotoConst.IS_SINGLE_MODE", true);
    localIntent.putStringArrayListExtra("PhotoConst.PHOTO_PATHS", jdField_c_of_type_JavaUtilArrayList);
    localIntent.putExtra("PhotoConst.SINGLE_PHOTO_PATH", paramString);
    if (jdField_l_of_type_Boolean)
    {
      HashMap localHashMap = AlbumUtil.jdField_c_of_type_JavaUtilHashMap;
      if (!localHashMap.containsKey(paramString)) {
        localHashMap.put(paramString, new Pair(jdField_j_of_type_JavaLangString, jdField_i_of_type_JavaLangString));
      }
      a(paramString);
      PhotoUtils.a(this, localIntent, jdField_c_of_type_JavaUtilArrayList, 0, jdField_a_of_type_Boolean);
      return;
    }
    if (!jdField_m_of_type_Boolean)
    {
      localIntent.putExtra("PhotoConst.ALLOW_LOCK", false);
      localIntent.setClass(this, PhotoPreviewActivity.class);
      localIntent.putExtra("PasterConstants.pasters_data", jdField_b_of_type_JavaUtilHashMap);
      localIntent.putExtra("FROM_WHERE", "FROM_PHOTO_LIST");
      localIntent.addFlags(603979776);
      startActivity(localIntent);
      super.finish();
      AlbumUtil.a(this, true, true);
      return;
    }
    if (100 == localIntent.getIntExtra("Business_Origin", 0))
    {
      localIntent.setClass(this, PhotoCropForPortraitActivity.class);
      localIntent.putExtra("PhotoConst.EDIT_MASK_SHAPE_TYPE", 0);
    }
    for (;;)
    {
      AlbumUtil.a(localIntent, jdField_j_of_type_JavaLangString, paramString, jdField_p_of_type_Boolean);
      break;
      localIntent.setClass(this, PhotoCropActivity.class);
    }
  }
  
  public boolean b()
  {
    return QzoneConfig.a().a("PhotoUpload", "QunAioRememberUpload", 1) != 0;
  }
  
  public void c()
  {
    if (jdField_a_of_type_AndroidAppDialog != null) {}
    try
    {
      jdField_a_of_type_AndroidAppDialog.cancel();
      return;
    }
    catch (IllegalArgumentException localIllegalArgumentException) {}
  }
  
  void c(Intent paramIntent)
  {
    jdField_s_of_type_JavaLangString = paramIntent.getStringExtra("UploadPhoto.key_album_id");
    jdField_t_of_type_JavaLangString = paramIntent.getStringExtra("UploadPhoto.key_album_name");
    jdField_b_of_type_AndroidWidgetCheckBox.setChecked(y);
    ThreadManager.a(new may(this), 8, null, true);
    String str2 = "";
    String str1 = "";
    int i1;
    if (TextUtils.isEmpty(jdField_s_of_type_JavaLangString))
    {
      paramIntent = getString(2131369807);
      i1 = 2131369806;
    }
    for (;;)
    {
      jdField_c_of_type_AndroidWidgetTextView.setText(paramIntent);
      jdField_d_of_type_AndroidWidgetTextView.setText(i1);
      getIntent().putExtra("UploadPhoto.key_album_name", str2);
      getIntent().putExtra("UploadPhoto.key_album_id", str1);
      return;
      paramIntent = "《" + jdField_t_of_type_JavaLangString + "》";
      i1 = 2131369805;
      str2 = jdField_t_of_type_JavaLangString;
      str1 = jdField_s_of_type_JavaLangString;
    }
  }
  
  public void d()
  {
    Object localObject1;
    boolean bool1;
    if (jdField_p_of_type_JavaLangString != null)
    {
      localObject1 = jdField_p_of_type_JavaLangString;
      if (jdField_c_of_type_JavaUtilArrayList.size() <= 0) {
        break label393;
      }
      bool1 = true;
      label24:
      Object localObject2 = localObject1;
      if (bool1) {
        localObject2 = (String)localObject1 + "(" + jdField_c_of_type_JavaUtilArrayList.size() + ")";
      }
      if (QLog.isColorLevel()) {
        QLog.d("_photo", 2, "updateButton selectedPhotoList.size()=" + jdField_c_of_type_JavaUtilArrayList.size());
      }
      jdField_c_of_type_AndroidWidgetButton.setText((CharSequence)localObject2);
      jdField_c_of_type_AndroidWidgetButton.setEnabled(bool1);
      jdField_b_of_type_AndroidWidgetButton.setEnabled(bool1);
      if ((B) || ((jdField_a_of_type_JavaUtilHashMap != null) && (jdField_a_of_type_JavaUtilHashMap.size() > 0))) {
        jdField_b_of_type_AndroidWidgetButton.setVisibility(4);
      }
      if (!bool1)
      {
        jdField_a_of_type_AndroidWidgetButton.setEnabled(false);
        jdField_a_of_type_AndroidWidgetCheckBox.setChecked(false);
        jdField_a_of_type_AndroidWidgetCheckBox.setEnabled(false);
        jdField_a_of_type_AndroidWidgetTextView.setEnabled(false);
        jdField_b_of_type_AndroidWidgetTextView.setEnabled(false);
      }
      if (!jdField_h_of_type_Boolean) {
        break label403;
      }
      if (bool1)
      {
        jdField_a_of_type_AndroidWidgetCheckBox.setEnabled(true);
        jdField_a_of_type_AndroidWidgetTextView.setEnabled(true);
        jdField_b_of_type_AndroidWidgetTextView.setEnabled(true);
        localObject1 = jdField_a_of_type_AndroidWidgetButton;
        if ((jdField_c_of_type_JavaUtilArrayList.size() != 1) || (y)) {
          break label398;
        }
      }
    }
    label393:
    label398:
    for (boolean bool2 = true;; bool2 = false)
    {
      ((Button)localObject1).setEnabled(bool2);
      if (jdField_i_of_type_Boolean)
      {
        jdField_a_of_type_AndroidWidgetCheckBox.setVisibility(0);
        jdField_a_of_type_AndroidWidgetTextView.setVisibility(0);
        if (bool1)
        {
          jdField_a_of_type_AndroidWidgetCheckBox.setEnabled(true);
          jdField_a_of_type_AndroidWidgetTextView.setEnabled(true);
          jdField_b_of_type_AndroidWidgetTextView.setEnabled(true);
        }
      }
      f();
      if (!jdField_j_of_type_Boolean) {
        jdField_b_of_type_AndroidWidgetTextView.setVisibility(8);
      }
      return;
      if (y)
      {
        localObject1 = getString(2131369799);
        break;
      }
      if (jdField_h_of_type_Boolean)
      {
        localObject1 = getString(2131369797);
        break;
      }
      localObject1 = getString(2131369798);
      break;
      bool1 = false;
      break label24;
    }
    label403:
    if (jdField_k_of_type_Boolean) {
      if ((jdField_c_of_type_JavaUtilArrayList.size() == 1) && ((jdField_a_of_type_JavaUtilHashMap == null) || (jdField_a_of_type_JavaUtilHashMap.size() <= 0))) {
        jdField_a_of_type_AndroidWidgetButton.setEnabled(true);
      }
    }
    for (;;)
    {
      jdField_a_of_type_AndroidWidgetCheckBox.setVisibility(8);
      jdField_a_of_type_AndroidWidgetTextView.setVisibility(8);
      jdField_b_of_type_AndroidWidgetTextView.setVisibility(8);
      break;
      jdField_a_of_type_AndroidWidgetButton.setEnabled(false);
      continue;
      jdField_a_of_type_AndroidWidgetButton.setVisibility(8);
    }
  }
  
  public void e()
  {
    int i2 = 0;
    Object localObject = jdField_c_of_type_JavaUtilArrayList.iterator();
    int i1 = 0;
    int i3;
    while (((Iterator)localObject).hasNext())
    {
      String str = (String)((Iterator)localObject).next();
      long l1 = new File(str).length();
      i3 = (int)(i1 + l1);
      i1 = i3;
      if (QLog.isColorLevel())
      {
        QLog.d("_photo", 2, "setQualityTextViewText, path:" + str + ",len:" + l1);
        i1 = i3;
      }
    }
    localObject = PhotoUtils.a(this, i1);
    if (((String)localObject).equals("0"))
    {
      localObject = "(999K)";
      jdField_b_of_type_AndroidWidgetTextView.setVisibility(4);
    }
    for (;;)
    {
      i3 = ((String)localObject).length();
      i1 = i2;
      while (i1 < 6 - i3)
      {
        localObject = (String)localObject + " ";
        i1 += 1;
      }
      localObject = "(" + (String)localObject + ")";
      jdField_b_of_type_AndroidWidgetTextView.setVisibility(0);
    }
    jdField_b_of_type_AndroidWidgetTextView.setText((CharSequence)localObject);
  }
  
  public void f()
  {
    switch (jdField_p_of_type_Int)
    {
    case 1: 
    default: 
      return;
    case 0: 
      jdField_a_of_type_AndroidWidgetCheckBox.setChecked(false);
      return;
    }
    e();
    jdField_a_of_type_AndroidWidgetCheckBox.setChecked(true);
  }
  
  public void g()
  {
    if (QavCameraUsage.b(BaseApplicationImpl.getContext())) {}
    do
    {
      Intent localIntent;
      do
      {
        return;
        localIntent = new Intent("android.media.action.IMAGE_CAPTURE");
      } while (localIntent.resolveActivity(getPackageManager()) == null);
      Object localObject = null;
      try
      {
        File localFile = a();
        localObject = localFile;
      }
      catch (IOException localIOException)
      {
        for (;;) {}
      }
    } while (localObject == null);
    localIntent.putExtra("output", Uri.fromFile(localObject));
    startActivityForResult(localIntent, 16);
  }
  
  public void h()
  {
    Object localObject = PresendPicMgr.a();
    if (y)
    {
      if (localObject != null) {
        ((PresendPicMgr)localObject).a(1007);
      }
      StatisticConstants.b(getIntent(), jdField_c_of_type_JavaUtilArrayList.size());
      localIntent = getIntent();
      localIntent.putExtra("open_chatfragment_fromphoto", true);
      AIOGalleryUtils.a(this, localIntent, jdField_m_of_type_JavaLangString, jdField_r_of_type_JavaLangString, jdField_q_of_type_JavaLangString, jdField_s_of_type_JavaLangString, jdField_t_of_type_JavaLangString, jdField_p_of_type_Int, jdField_c_of_type_JavaUtilArrayList);
      return;
    }
    if ((jdField_k_of_type_Boolean) && ((!TextUtils.isEmpty(jdField_k_of_type_JavaLangString)) || (!TextUtils.isEmpty(jdField_l_of_type_JavaLangString))))
    {
      jdField_a_of_type_AndroidWidgetButton.performClick();
      return;
    }
    if (jdField_c_of_type_JavaUtilArrayList != null)
    {
      StatisticConstants.a(getIntent(), jdField_c_of_type_JavaUtilArrayList.size());
      StatisticConstants.a(getIntent(), jdField_c_of_type_JavaUtilArrayList.size(), jdField_p_of_type_Int);
    }
    Intent localIntent = getIntent();
    if (jdField_p_of_type_Int == 2)
    {
      if (localObject != null)
      {
        ((PresendPicMgr)localObject).a(1008);
        ((PresendPicMgr)localObject).a();
      }
      ReportController.b(null, "CliOper", "", "", "0X8005148", "0X8005148", 0, 0, "", "", "", "");
    }
    for (;;)
    {
      localObject = localIntent.getStringExtra("PhotoConst.PLUGIN_APK");
      String str = localIntent.getStringExtra("PhotoConst.INIT_ACTIVITY_CLASS_NAME");
      if (("qzone_plugin.apk".equals(localObject)) && ("com.qzone.video.activity.TrimVideoActivity".equals(str)))
      {
        localIntent.putExtra("PhotoConst.PLUGIN_NAME", "QZone");
        localIntent.putExtra("PhotoConst.PLUGIN_APK", "qzone_plugin.apk");
        localIntent.putExtra("PhotoConst.INIT_ACTIVITY_PACKAGE_NAME", "com.tencent.mobileqq");
        localIntent.putExtra("PhotoConst.INIT_ACTIVITY_CLASS_NAME", "com.qzone.publish.ui.activity.QZonePublishMoodActivity");
      }
      PhotoUtils.a(this, localIntent, jdField_c_of_type_JavaUtilArrayList, jdField_p_of_type_Int, jdField_a_of_type_Boolean);
      return;
      if (localObject != null) {
        ((PresendPicMgr)localObject).a(localIntent);
      }
    }
  }
  
  protected void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    super.onActivityResult(paramInt1, paramInt2, paramIntent);
    if ((QLog.isDevelopLevel()) && (jdField_c_of_type_JavaUtilArrayList != null) && (jdField_c_of_type_JavaUtilArrayList.size() != 0)) {
      QLog.d(jdField_a_of_type_JavaLangString, 4, "[PhotoListActivity] [onActivityResult] selectedPhotoList = " + jdField_c_of_type_JavaUtilArrayList.size());
    }
    if ((jdField_u_of_type_Boolean) && (paramIntent != null) && (paramInt1 == 100) && (paramInt2 == -1) && (paramInt1 != 100003))
    {
      c(paramIntent);
      jdField_b_of_type_AndroidWidgetCheckBox.setChecked(true);
    }
    do
    {
      return;
      if (paramInt2 != -1) {
        break;
      }
      switch (paramInt1)
      {
      default: 
        PhotoUtils.a(this, paramInt1, paramInt2, paramIntent, jdField_n_of_type_Boolean, jdField_m_of_type_JavaLangString);
        return;
      case 16: 
        paramIntent = PresendPicMgr.a();
        if (paramIntent != null) {
          paramIntent.a(jdField_u_of_type_JavaLangString, 1008);
        }
        a(true);
        return;
      }
    } while ((jdField_c_of_type_JavaUtilArrayList == null) || (jdField_c_of_type_JavaUtilArrayList.size() == 0));
    if (!jdField_k_of_type_Boolean)
    {
      PhotoMagicStickUtils.a((String)jdField_c_of_type_JavaUtilArrayList.get(0), this, jdField_a_of_type_Boolean, jdField_o_of_type_Int, jdField_m_of_type_JavaLangString, jdField_n_of_type_JavaLangString, jdField_o_of_type_JavaLangString);
      label248:
      overridePendingTransition(2130968619, 2130968620);
      return;
    }
    String str = (String)jdField_c_of_type_JavaUtilArrayList.get(0);
    if (jdField_b_of_type_JavaUtilHashMap == null)
    {
      paramIntent = null;
      label281:
      localObject = (HashMap)getIntent().getSerializableExtra("PasterConstants.original_to_bottom");
      if ((localObject == null) || (!((HashMap)localObject).containsKey(str))) {
        break label445;
      }
    }
    label445:
    for (Object localObject = (String)((HashMap)localObject).get(str);; localObject = str)
    {
      PhotoMagicStickUtils.a((String)localObject, str, this, jdField_a_of_type_Boolean, jdField_o_of_type_Int, jdField_m_of_type_JavaLangString, jdField_n_of_type_JavaLangString, jdField_o_of_type_JavaLangString, 8, jdField_k_of_type_JavaLangString, jdField_l_of_type_JavaLangString, paramIntent);
      jdField_k_of_type_JavaLangString = null;
      jdField_l_of_type_JavaLangString = null;
      break label248;
      paramIntent = (byte[])jdField_b_of_type_JavaUtilHashMap.get(str);
      break label281;
      paramIntent = new Intent();
      paramIntent.putStringArrayListExtra("PhotoConst.SELECTED_PATHS", jdField_c_of_type_JavaUtilArrayList);
      paramIntent.putExtra("PhotoConst.CURRENT_QUALITY_TYPE", jdField_p_of_type_Int);
      setResult(-1, paramIntent);
      super.finish();
      return;
      if (paramInt1 != 17) {
        break;
      }
      AlbumUtil.jdField_c_of_type_Long = 0L;
      return;
    }
  }
  
  public void onBackPressed()
  {
    jdField_r_of_type_Boolean = true;
    Intent localIntent = getIntent();
    localIntent.putStringArrayListExtra("PhotoConst.PHOTO_PATHS", jdField_c_of_type_JavaUtilArrayList);
    localIntent.putExtra("PhotoConst.CURRENT_QUALITY_TYPE", jdField_p_of_type_Int);
    localIntent.putExtra("PhotoConst.IS_SHOW_QZONE_ALBUM", jdField_g_of_type_Boolean);
    localIntent.putExtra("PhotoConst.PHOTO_INFOS", jdField_a_of_type_JavaUtilHashMap);
    localIntent.putExtra("PhotoConst.QZONE_ALBUM_NUM", jdField_d_of_type_Long);
    localIntent.putExtra("peak.myUin", jdField_m_of_type_JavaLangString);
    localIntent.setClass(this, AlbumListActivity.class);
    localIntent.addFlags(603979776);
    startActivity(localIntent);
    super.finish();
    AlbumUtil.a(this, true, false);
  }
  
  public void onCheckedChanged(CompoundButton paramCompoundButton, boolean paramBoolean)
  {
    boolean bool = true;
    switch (paramCompoundButton.getId())
    {
    default: 
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "onCheckedChanged, error, default id is checked");
      }
      break;
    }
    for (;;)
    {
      return;
      if (LocalMultiProcConfig.a(jdField_m_of_type_JavaLangString + "__qzone_pic_permission__" + jdField_r_of_type_JavaLangString, -1, jdField_m_of_type_JavaLangString) != 0)
      {
        x = bool;
        if (x) {
          break label288;
        }
        jdField_b_of_type_AndroidWidgetCheckBox.setChecked(false);
        paramCompoundButton = new QQCustomDialog(this, 2131558942);
        paramCompoundButton.setContentView(2130903232);
        paramCompoundButton.setTitle(getString(2131364202));
        paramCompoundButton.setMessage(getString(2131364204));
        paramCompoundButton.setNegativeButton(getString(2131364205), new mbc(this));
        paramCompoundButton.setCanceledOnTouchOutside(false);
        paramCompoundButton.setCancelable(false);
        paramCompoundButton.show();
        QZoneClickReport.a(jdField_m_of_type_JavaLangString, "40", "1");
      }
      for (;;)
      {
        if ((!b()) || (!v) || (jdField_b_of_type_AndroidWidgetCheckBox == null)) {
          break label313;
        }
        if ((Build.VERSION.SDK_INT < 9) || (!TextUtils.isEmpty(jdField_s_of_type_JavaLangString))) {
          break label315;
        }
        jdField_a_of_type_AndroidContentSharedPreferences.edit().putBoolean("qzone_will_upload_to_qun_album" + jdField_r_of_type_JavaLangString, paramBoolean).apply();
        return;
        bool = false;
        break;
        label288:
        y = paramBoolean;
        getIntent().putExtra("PhotoConst.IS_JUMPTO_TROOP_ALBUM", y);
        d();
      }
      label313:
      continue;
      label315:
      jdField_a_of_type_AndroidContentSharedPreferences.edit().putBoolean("qzone_will_upload_to_qun_album" + jdField_r_of_type_JavaLangString, paramBoolean).commit();
      return;
      if (paramBoolean) {
        if (b() > 0)
        {
          QQToast.a(this, getResources().getString(2131369812), 0).b(getResources().getDimensionPixelSize(2131492908));
          jdField_p_of_type_Int = 0;
          jdField_a_of_type_AndroidWidgetCheckBox.setChecked(false);
          jdField_b_of_type_AndroidWidgetTextView.setVisibility(4);
        }
      }
      while (!jdField_j_of_type_Boolean)
      {
        jdField_b_of_type_AndroidWidgetTextView.setVisibility(8);
        return;
        jdField_a_of_type_AndroidWidgetCheckBox.setChecked(true);
        jdField_p_of_type_Int = 2;
        e();
        continue;
        jdField_p_of_type_Int = 0;
        jdField_a_of_type_AndroidWidgetCheckBox.setChecked(false);
        jdField_b_of_type_AndroidWidgetTextView.setVisibility(4);
      }
    }
  }
  
  public void onClick(View paramView)
  {
    boolean bool2 = true;
    int i1 = 1;
    int i2 = paramView.getId();
    boolean bool1;
    if (LocalMultiProcConfig.a(jdField_m_of_type_JavaLangString + "__qzone_pic_permission__" + jdField_r_of_type_JavaLangString, -1, jdField_m_of_type_JavaLangString) != 0)
    {
      bool1 = true;
      x = bool1;
      switch (i2)
      {
      }
    }
    label837:
    label1129:
    do
    {
      do
      {
        do
        {
          do
          {
            return;
            bool1 = false;
            break;
            onBackPressed();
            return;
            AlbumUtil.c();
            AlbumUtil.a();
            paramView = PresendPicMgr.a();
            if (paramView != null) {
              paramView.a(1006);
            }
            paramView = getIntent();
            if (jdField_c_of_type_JavaUtilArrayList != null) {}
            for (i1 = jdField_c_of_type_JavaUtilArrayList.size();; i1 = 0)
            {
              StatisticConstants.b(paramView, i1);
              if (jdField_o_of_type_Boolean) {
                break;
              }
              super.finish();
              AlbumUtil.a(this, false, false);
              return;
            }
            paramView = getIntent();
            String str1 = paramView.getStringExtra("PhotoConst.INIT_ACTIVITY_CLASS_NAME");
            String str2 = paramView.getStringExtra("PhotoConst.INIT_ACTIVITY_PACKAGE_NAME");
            if (str1 == null)
            {
              QQToast.a(this, "请设置INIT_ACTIVITY_CLASS_NAME ", 0).a();
              return;
            }
            paramView.setClassName(str2, str1);
            paramView.removeExtra("PhotoConst.PHOTO_PATHS");
            paramView.removeExtra("PhotoConst.SINGLE_PHOTO_PATH");
            paramView.addFlags(603979776);
            if (!paramView.getBooleanExtra("PhotoConst.IS_CALL_IN_PLUGIN", false)) {
              startActivity(paramView);
            }
            for (;;)
            {
              super.finish();
              AlbumUtil.a(this, false, false);
              return;
              str2 = paramView.getStringExtra("PhotoConst.PLUGIN_NAME");
              String str3 = paramView.getStringExtra("PhotoConst.PLUGIN_APK");
              String str4 = paramView.getStringExtra("PhotoConst.UIN");
              if ("WaterMarkCamera.apk".equals(str2)) {
                paramView.putExtra("cleartop", true);
              }
              if ("qzone_plugin.apk".equals(str3))
              {
                QzonePluginProxyActivity.a(paramView, str1);
                QZoneHelper.a(this, str4, paramView, 2);
              }
              else if ("qqfav.apk".equals(str3))
              {
                QfavHelper.a(this, str4, paramView, 2);
              }
              else
              {
                IPluginManager.PluginParams localPluginParams = new IPluginManager.PluginParams(0);
                jdField_b_of_type_JavaLangString = str3;
                d = str2;
                jdField_a_of_type_JavaLangString = str4;
                e = str1;
                jdField_a_of_type_JavaLangClass = ZebraPluginProxyActivity.class;
                jdField_a_of_type_AndroidContentIntent = paramView;
                jdField_b_of_type_Int = 2;
                jdField_a_of_type_AndroidAppDialog = null;
                c = 10000;
                f = null;
                IPluginManager.a(this, localPluginParams);
              }
            }
            if (!jdField_a_of_type_AndroidWidgetCheckBox.isChecked())
            {
              if (b() > 0)
              {
                QQToast.a(this, getResources().getString(2131369812), 0).b(getResources().getDimensionPixelSize(2131492908));
                return;
              }
              jdField_a_of_type_AndroidWidgetCheckBox.setChecked(true);
              return;
            }
            jdField_a_of_type_AndroidWidgetCheckBox.setChecked(false);
            return;
          } while (jdField_c_of_type_JavaUtilArrayList.size() <= 0);
          getIntent().removeExtra("param_initTime");
          getIntent().putStringArrayListExtra("PhotoConst.PHOTO_PATHS", jdField_c_of_type_JavaUtilArrayList);
          ReportController.b(null, "CliOper", "", "", "0x8004B39", "0x8004B39", 0, 0, "", "", "", "");
          paramView = new Intent(BaseApplication.getContext(), PhotoPlusBridgeActivity.class);
          paramView.putExtra("photo_path", (String)jdField_c_of_type_JavaUtilArrayList.get(0));
          paramView.putExtra("iswaitforsult", jdField_a_of_type_Boolean);
          paramView.putExtra("type", jdField_o_of_type_Int);
          paramView.putExtra("uin", jdField_m_of_type_JavaLangString);
          paramView.putExtra("nick", jdField_n_of_type_JavaLangString);
          paramView.putExtra("headDir", jdField_o_of_type_JavaLangString);
          startActivityForResult(paramView, 100003);
          jdField_a_of_type_AndroidWidgetButton.setClickable(false);
          return;
          a(false);
          return;
          jdField_c_of_type_AndroidWidgetButton.setClickable(false);
          if (!jdField_c_of_type_JavaUtilArrayList.isEmpty()) {
            a((String)jdField_c_of_type_JavaUtilArrayList.get(jdField_c_of_type_JavaUtilArrayList.size() - 1));
          }
          AlbumUtil.a();
          if (jdField_c_of_type_JavaUtilArrayList.size() != 0) {
            break label837;
          }
        } while (!QLog.isColorLevel());
        QLog.e("PhotoList", 2, "size == 0");
        return;
        if (getIntent().getBooleanExtra("PhotoConst.IS_SEND_FILESIZE_LIMIT", false))
        {
          paramView = jdField_c_of_type_JavaUtilArrayList.iterator();
          for (long l1 = 0L; paramView.hasNext(); l1 = FileUtils.a((String)paramView.next()) + l1) {}
          if (l1 > 3145728L) {}
          while ((FileManagerUtil.a()) && (i1 != 0))
          {
            FMDialogUtil.a(this, 2131362794, 2131362790, new mbd(this));
            return;
            i1 = 0;
          }
        }
        h();
        return;
        if (!x)
        {
          jdField_b_of_type_AndroidWidgetCheckBox.setChecked(false);
          paramView = new QQCustomDialog(this, 2131558942);
          paramView.setContentView(2130903232);
          paramView.setTitle(getString(2131364202));
          paramView.setMessage(getString(2131364204));
          paramView.setNegativeButton(getString(2131364205), new mbe(this));
          paramView.setCanceledOnTouchOutside(false);
          paramView.setCancelable(false);
          paramView.show();
          QZoneClickReport.a(jdField_m_of_type_JavaLangString, "40", "1");
          return;
        }
        if (jdField_b_of_type_AndroidWidgetCheckBox != null)
        {
          paramView = jdField_b_of_type_AndroidWidgetCheckBox;
          if (jdField_b_of_type_AndroidWidgetCheckBox.isChecked()) {
            break label1129;
          }
          bool1 = bool2;
          paramView.setChecked(bool1);
        }
      } while (jdField_b_of_type_AndroidWidgetCheckBox == null);
      if (jdField_b_of_type_AndroidWidgetCheckBox.isChecked()) {}
      for (paramView = "0X80047F8";; paramView = "0X80047F9")
      {
        ReportController.b(null, "CliOper", "", "", paramView, paramView, 0, 0, jdField_m_of_type_JavaLangString, "", "", "");
        return;
        bool1 = false;
        break;
      }
      if (!x)
      {
        jdField_b_of_type_AndroidWidgetCheckBox.setChecked(false);
        paramView = new QQCustomDialog(this, 2131558942);
        paramView.setContentView(2130903232);
        paramView.setTitle(getString(2131364202));
        paramView.setMessage(getString(2131364204));
        paramView.setNegativeButton(getString(2131364205), new mbf(this));
        paramView.setCanceledOnTouchOutside(false);
        paramView.setCancelable(false);
        paramView.show();
        QZoneClickReport.a(jdField_m_of_type_JavaLangString, "40", "1");
        return;
      }
      paramView = QZoneHelper.UserInfo.a();
      jdField_a_of_type_JavaLangString = jdField_m_of_type_JavaLangString;
      jdField_b_of_type_JavaLangString = jdField_q_of_type_JavaLangString;
      QZoneHelper.c(this, paramView, jdField_r_of_type_JavaLangString, jdField_q_of_type_JavaLangString, 100);
      return;
    } while (jdField_b_of_type_AndroidWidgetCheckBox == null);
    if (jdField_b_of_type_AndroidWidgetCheckBox.isChecked()) {}
    for (paramView = "0X80047F8";; paramView = "0X80047F9")
    {
      ReportController.a(null, "CliOper", "", "", paramView, paramView, 0, 0, jdField_m_of_type_JavaLangString, "", "", "");
      return;
    }
  }
  
  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    getWindow().setBackgroundDrawable(null);
    try
    {
      super.setContentView(2130904216);
      getWindow().setBackgroundDrawable(null);
      jdField_a_of_type_AndroidContentSharedPreferences = BaseApplication.getContext().getSharedPreferences("share", 0);
      paramBundle = getResources();
      int i1 = getDisplayMetricswidthPixels;
      jdField_k_of_type_Int = paramBundle.getDimensionPixelSize(2131493036);
      jdField_i_of_type_Int = paramBundle.getDimensionPixelSize(2131493034);
      jdField_j_of_type_Int = paramBundle.getDimensionPixelSize(2131493035);
      jdField_l_of_type_Int = AIOUtils.a(1.0F, paramBundle);
      jdField_g_of_type_Int = ((i1 - jdField_k_of_type_Int * 2 - jdField_i_of_type_Int * 2) / 3);
      jdField_h_of_type_Int = jdField_g_of_type_Int;
      paramBundle = getIntent();
      b(paramBundle);
      a();
      if (QLog.isColorLevel()) {
        QLog.d("SelectPhotoTrace", 2, jdField_a_of_type_JavaLangString + " onCreate(),extra is:" + paramBundle.getExtras());
      }
      if (QLog.isColorLevel()) {
        QLog.d("SelectPhotoTrace", 2, jdField_a_of_type_JavaLangString + ",hashCode is:" + System.identityHashCode(this));
      }
      if (jdField_g_of_type_Boolean)
      {
        paramBundle = new NewIntent(BaseApplicationImpl.a(), QZoneAlbumListNumServlet.class);
        paramBundle.putExtra("selfuin", Long.valueOf(BaseApplicationImpl.a().a().getAccount()));
        BaseApplicationImpl.a().a().registObserver(jdField_a_of_type_Mbk);
        BaseApplicationImpl.a().a().startServlet(paramBundle);
      }
      return;
    }
    catch (Throwable paramBundle)
    {
      super.finish();
    }
  }
  
  protected void onDestroy()
  {
    super.onDestroy();
    if (!jdField_r_of_type_Boolean) {
      AlbumThumbManager.a(this).a();
    }
    if (jdField_a_of_type_Mbi != null)
    {
      int i1 = jdField_a_of_type_Mbi.getCount();
      AlbumUtil.jdField_a_of_type_JavaUtilHashMap.put(jdField_j_of_type_JavaLangString, Integer.valueOf(i1));
    }
    if (jdField_g_of_type_Boolean) {
      BaseApplicationImpl.a().a().unRegistObserver(jdField_a_of_type_Mbk);
    }
    jdField_a_of_type_JavaUtilArrayList = null;
  }
  
  protected void onNewIntent(Intent paramIntent)
  {
    super.onNewIntent(paramIntent);
    if (QLog.isColorLevel()) {
      QLog.d("SelectPhotoTrace", 2, jdField_a_of_type_JavaLangString + " onNewIntent() is called,extra is:" + paramIntent.getExtras());
    }
    if (QLog.isColorLevel()) {
      QLog.d("SelectPhotoTrace", 2, jdField_a_of_type_JavaLangString + "hashCode is:" + System.identityHashCode(this));
    }
    setIntent(paramIntent);
    b(paramIntent);
  }
  
  protected void onPause()
  {
    super.onPause();
    jdField_a_of_type_AndroidOsAsyncTask = null;
  }
  
  protected void onResume()
  {
    super.onResume();
    if (jdField_a_of_type_AndroidWidgetButton != null) {
      jdField_a_of_type_AndroidWidgetButton.setClickable(true);
    }
  }
  
  protected void onStart()
  {
    super.onStart();
    runOnUiThread(new mba(this));
  }
  
  public void setTitle(CharSequence paramCharSequence)
  {
    super.setTitle(paramCharSequence);
    jdField_g_of_type_AndroidWidgetTextView.setText(paramCharSequence);
  }
}
