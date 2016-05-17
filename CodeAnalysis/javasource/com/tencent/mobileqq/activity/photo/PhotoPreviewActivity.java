package com.tencent.mobileqq.activity.photo;

import android.content.Intent;
import android.content.res.Resources;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.CompoundButton.OnCheckedChangeListener;
import android.widget.TextView;
import com.tencent.av.smallscreen.SmallScreenUtils;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.image.URLDrawable;
import com.tencent.mobileqq.activity.aio.photo.AIOGalleryUtils;
import com.tencent.mobileqq.activity.aio.photo.PeakActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pic.IPresendPicMgr.Stub;
import com.tencent.mobileqq.pic.PresendPicMgr;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.utils.AlbumUtil;
import com.tencent.mobileqq.utils.FileUtils;
import com.tencent.mobileqq.widget.NumberCheckBox;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.QLog;
import com.tencent.util.BinderWarpper;
import cooperation.qzone.QZoneHelper;
import cooperation.qzone.model.BaseBusinessAlbumInfo;
import java.io.File;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import mbm;
import mbn;
import mbo;
import mbp;
import mbq;
import mbs;
import mbt;
import mbu;
import mbv;

public class PhotoPreviewActivity
  extends PeakActivity
  implements CompoundButton.OnCheckedChangeListener
{
  static int jdField_a_of_type_Int = 19922944;
  public static final String a = "FROM_WHERE";
  public static final String b = "FromCamera";
  public static final String c = "FromFastImage";
  public static final String d = "back_btn_text";
  public long a;
  public View a;
  public Button a;
  public CheckBox a;
  TextView jdField_a_of_type_AndroidWidgetTextView;
  public ProGallery a;
  public NumberCheckBox a;
  public ArrayList a;
  HashMap jdField_a_of_type_JavaUtilHashMap;
  mbv jdField_a_of_type_Mbv;
  public boolean a;
  public int b;
  public View b;
  public Button b;
  TextView b;
  public ArrayList b;
  public boolean b;
  public int c;
  View jdField_c_of_type_AndroidViewView;
  public TextView c;
  public ArrayList c;
  boolean jdField_c_of_type_Boolean = false;
  public int d;
  TextView jdField_d_of_type_AndroidWidgetTextView;
  boolean jdField_d_of_type_Boolean = false;
  public int e;
  public String e;
  boolean e;
  int jdField_f_of_type_Int = 0;
  public String f;
  boolean jdField_f_of_type_Boolean = false;
  public int g;
  public String g;
  boolean g;
  public int h;
  public String h;
  boolean h;
  public int i;
  public String i;
  boolean i;
  public int j;
  String j;
  public boolean j;
  String jdField_k_of_type_JavaLangString;
  boolean jdField_k_of_type_Boolean = false;
  String l;
  public boolean l;
  String m;
  String n;
  String o;
  String p;
  String q;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public PhotoPreviewActivity()
  {
    jdField_a_of_type_Boolean = true;
    jdField_c_of_type_JavaUtilArrayList = new ArrayList();
    jdField_b_of_type_Boolean = false;
    jdField_e_of_type_Boolean = false;
    jdField_g_of_type_Boolean = false;
    jdField_h_of_type_Boolean = false;
    jdField_e_of_type_Int = 0;
    jdField_i_of_type_Boolean = false;
    jdField_j_of_type_JavaLangString = null;
    jdField_j_of_type_Boolean = false;
    jdField_i_of_type_Int = 1007;
  }
  
  ArrayList a()
  {
    ArrayList localArrayList = new ArrayList();
    if (jdField_b_of_type_JavaUtilArrayList.size() == 0)
    {
      int i1 = jdField_a_of_type_ComTencentMobileqqActivityPhotoProGallery.s();
      if (i1 < jdField_a_of_type_JavaUtilArrayList.size()) {
        localArrayList.add(jdField_a_of_type_JavaUtilArrayList.get(i1));
      }
      return localArrayList;
    }
    localArrayList.addAll(jdField_b_of_type_JavaUtilArrayList);
    return localArrayList;
  }
  
  void a()
  {
    Intent localIntent = getIntent();
    jdField_h_of_type_JavaLangString = localIntent.getStringExtra("FROM_WHERE");
    jdField_j_of_type_Boolean = localIntent.getBooleanExtra("PhotoConst.IS_SINGLE_MODE", false);
    Object localObject;
    String str;
    if ((!jdField_j_of_type_Boolean) && (("FromCamera".equals(jdField_h_of_type_JavaLangString)) || ("FromFastImage".equals(jdField_h_of_type_JavaLangString))))
    {
      localObject = (BinderWarpper)localIntent.getParcelableExtra("binder_presendService");
      if (localObject != null)
      {
        if (PresendPicMgr.a(null) != null) {
          PresendPicMgr.a(null).b();
        }
        localObject = PresendPicMgr.b(IPresendPicMgr.Stub.a(a));
        if (!"FromFastImage".equals(jdField_h_of_type_JavaLangString)) {
          break label830;
        }
        jdField_i_of_type_Int = 1037;
        str = (String)localIntent.getStringArrayListExtra("PhotoConst.PHOTO_PATHS").get(0);
        ((PresendPicMgr)localObject).a(str, jdField_i_of_type_Int);
        if (QLog.isColorLevel()) {
          QLog.d(v, 2, "  initData , presendMgr = " + localObject + ",picpath = " + str + ",from = " + jdField_h_of_type_JavaLangString + ",mBusiType = " + jdField_i_of_type_Int);
        }
      }
    }
    jdField_l_of_type_Boolean = localIntent.getBooleanExtra("callFromFastImage", false);
    if ("FromFastImage".equals(jdField_h_of_type_JavaLangString)) {
      StatisticConstants.c();
    }
    if ("FromCamera".equals(jdField_h_of_type_JavaLangString)) {
      StatisticConstants.a();
    }
    localIntent.removeExtra("FROM_WHERE");
    jdField_c_of_type_Int = localIntent.getIntExtra("PhotoConst.MAXUM_SELECTED_NUM", 1);
    jdField_g_of_type_Boolean = localIntent.getBooleanExtra("PhotoConst.SHOW_ALBUM", false);
    jdField_h_of_type_Boolean = localIntent.getBooleanExtra("PhotoConst.IS_OVERLOAD", false);
    o = localIntent.getStringExtra("back_btn_text");
    localIntent.removeExtra("PhotoConst.SHOW_ALBUM");
    localIntent.removeExtra("PhotoConst.IS_OVERLOAD");
    if (jdField_g_of_type_Boolean) {
      if (jdField_h_of_type_Boolean)
      {
        jdField_a_of_type_JavaUtilArrayList = PhotoListActivity.jdField_a_of_type_JavaUtilArrayList;
        label329:
        jdField_b_of_type_JavaUtilArrayList = localIntent.getStringArrayListExtra("PhotoConst.SELECTED_PATHS");
        jdField_c_of_type_JavaUtilArrayList = localIntent.getIntegerArrayListExtra("PhotoConst.SELECTED_INDEXS");
        if ((jdField_c_of_type_JavaUtilArrayList != null) && (jdField_a_of_type_JavaUtilArrayList != null)) {
          break label1074;
        }
        if (QLog.isColorLevel()) {
          QLog.d(v, 2, "initData(): Error! selectedItem or sSelectedIndex is null");
        }
        finish();
      }
    }
    label830:
    label1043:
    label1051:
    label1074:
    for (int i1 = 0;; i1 = 1)
    {
      if (i1 != 0)
      {
        jdField_f_of_type_Int = jdField_a_of_type_JavaUtilArrayList.size();
        jdField_j_of_type_Int = localIntent.getIntExtra("PhotoConst.CURRENT_SELECTED_INDEX", jdField_a_of_type_JavaUtilArrayList.size() - 1);
        localIntent.removeExtra("PhotoConst.CURRENT_SELECTED_INDEX");
        jdField_b_of_type_Boolean = localIntent.getBooleanExtra("PhotoConst.HANDLE_DEST_RESULT", false);
        jdField_c_of_type_Boolean = localIntent.getBooleanExtra("PhotoConst.SHOULD_SEND_RAW_PHOTO", false);
        if (jdField_c_of_type_Boolean)
        {
          jdField_e_of_type_JavaLangString = localIntent.getStringExtra("PhotoConst.MY_UIN");
          jdField_f_of_type_JavaLangString = localIntent.getStringExtra("PhotoConst.MY_NICK");
          jdField_g_of_type_JavaLangString = localIntent.getStringExtra("PhotoConst.MY_HEAD_DIR");
        }
        jdField_d_of_type_Boolean = localIntent.getBooleanExtra("PhotoConst.SHOW_MAGIC_USE_PASTER", false);
        if (jdField_d_of_type_Boolean)
        {
          jdField_a_of_type_JavaUtilHashMap = ((HashMap)localIntent.getSerializableExtra("PasterConstants.pasters_data"));
          p = localIntent.getStringExtra("PasterConstants.paster_id");
          q = localIntent.getStringExtra("PasterConstants.paster_cate_id");
        }
        if (jdField_e_of_type_JavaLangString != null) {
          break label1043;
        }
      }
      for (localObject = w;; localObject = jdField_e_of_type_JavaLangString)
      {
        jdField_e_of_type_JavaLangString = ((String)localObject);
        jdField_b_of_type_Int = localIntent.getIntExtra("uintype", -1);
        jdField_e_of_type_Boolean = localIntent.getBooleanExtra("PhotoConst.IS_CALL_IN_PLUGIN", false);
        jdField_f_of_type_Boolean = localIntent.getBooleanExtra("PhotoConst.IS_SINGLE_DERECTBACK_MODE", false);
        jdField_e_of_type_Int = localIntent.getIntExtra("PhotoConst.CURRENT_QUALITY_TYPE", 0);
        jdField_k_of_type_Boolean = localIntent.getBooleanExtra("PhotoConst.SEND_FLAG", false);
        if (jdField_k_of_type_Boolean)
        {
          localIntent.removeExtra("PhotoConst.SEND_FLAG");
          localObject = PresendPicMgr.a(null);
          if (localObject != null)
          {
            if (QLog.isColorLevel()) {
              QLog.d(v, 2, "Photo+ send pic,cancel presend!");
            }
            ((PresendPicMgr)localObject).a(1003);
          }
          PhotoUtils.a(this, getIntent(), jdField_b_of_type_JavaUtilArrayList, jdField_e_of_type_Int, true);
        }
        jdField_j_of_type_JavaLangString = localIntent.getStringExtra("PhotoConst.CUSTOM_SENDBTN_TEXT");
        jdField_i_of_type_Boolean = localIntent.getBooleanExtra("PhotoConst.IS_JUMPTO_TROOP_ALBUM", false);
        if (jdField_i_of_type_Boolean)
        {
          jdField_l_of_type_JavaLangString = localIntent.getStringExtra("uinname");
          jdField_k_of_type_JavaLangString = localIntent.getStringExtra("uin");
        }
        if ((jdField_b_of_type_Int == 1) && (jdField_e_of_type_JavaLangString != null))
        {
          localObject = QZoneHelper.a(jdField_e_of_type_JavaLangString, jdField_k_of_type_JavaLangString);
          if ((localObject == null) || (((BaseBusinessAlbumInfo)localObject).b() == null) || (((BaseBusinessAlbumInfo)localObject).b().equals(""))) {
            break label1051;
          }
          m = ((BaseBusinessAlbumInfo)localObject).b();
          n = ((BaseBusinessAlbumInfo)localObject).c();
          localIntent.putExtra("UploadPhoto.key_album_id", m);
          localIntent.putExtra("UploadPhoto.key_album_name", n);
        }
        return;
        jdField_i_of_type_Int = 1008;
        break;
        jdField_a_of_type_JavaUtilArrayList = localIntent.getStringArrayListExtra("PhotoConst.PHOTO_PATHS");
        break label329;
        jdField_a_of_type_JavaUtilArrayList = localIntent.getStringArrayListExtra("PhotoConst.PHOTO_PATHS");
        if (jdField_a_of_type_JavaUtilArrayList == null) {
          jdField_a_of_type_JavaUtilArrayList = new ArrayList();
        }
        if (jdField_a_of_type_JavaUtilArrayList.isEmpty())
        {
          localObject = localIntent.getStringExtra("PhotoConst.SINGLE_PHOTO_PATH");
          jdField_a_of_type_JavaUtilArrayList.add(localObject);
        }
        localObject = jdField_a_of_type_JavaUtilArrayList.iterator();
        while (((Iterator)localObject).hasNext())
        {
          str = (String)((Iterator)localObject).next();
          if (str != null)
          {
            if (!new File(str).exists()) {
              ((Iterator)localObject).remove();
            }
          }
          else {
            ((Iterator)localObject).remove();
          }
        }
        jdField_b_of_type_JavaUtilArrayList = new ArrayList();
        jdField_b_of_type_JavaUtilArrayList.addAll(jdField_a_of_type_JavaUtilArrayList);
        jdField_c_of_type_JavaUtilArrayList.clear();
        if (jdField_j_of_type_Boolean) {
          break label1074;
        }
        i1 = 0;
        while (i1 < jdField_a_of_type_JavaUtilArrayList.size())
        {
          jdField_c_of_type_JavaUtilArrayList.add(Integer.valueOf(i1));
          i1 += 1;
        }
      }
      localIntent.putExtra("UploadPhoto.key_album_id", "");
      localIntent.putExtra("UploadPhoto.key_album_name", "");
      return;
    }
  }
  
  protected boolean a()
  {
    return false;
  }
  
  public int b()
  {
    Iterator localIterator = jdField_c_of_type_JavaUtilArrayList.iterator();
    int i1 = 0;
    if (localIterator.hasNext())
    {
      Integer localInteger = (Integer)localIterator.next();
      if ((localInteger == null) || (localInteger.intValue() < 0) || (localInteger.intValue() >= jdField_a_of_type_JavaUtilArrayList.size()) || (new File((String)jdField_a_of_type_JavaUtilArrayList.get(localInteger.intValue())).length() <= jdField_a_of_type_Int)) {
        break label95;
      }
      i1 += 1;
    }
    label95:
    for (;;)
    {
      break;
      return i1;
    }
  }
  
  void b()
  {
    G = true;
    H = false;
    jdField_a_of_type_AndroidViewView = findViewById(2131298563);
    jdField_b_of_type_AndroidViewView = findViewById(2131297846);
    if (jdField_a_of_type_Boolean)
    {
      jdField_a_of_type_AndroidViewView.setVisibility(0);
      jdField_b_of_type_AndroidViewView.setVisibility(0);
    }
    jdField_a_of_type_AndroidWidgetButton = ((Button)findViewById(2131298576));
    jdField_a_of_type_AndroidWidgetCheckBox = ((CheckBox)findViewById(2131298577));
    jdField_a_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131298578));
    jdField_a_of_type_AndroidWidgetCheckBox.setOnCheckedChangeListener(this);
    jdField_a_of_type_AndroidWidgetTextView.setOnClickListener(new mbm(this));
    if (jdField_c_of_type_Boolean)
    {
      jdField_a_of_type_AndroidWidgetButton.setVisibility(0);
      jdField_a_of_type_AndroidWidgetCheckBox.setVisibility(0);
      jdField_a_of_type_AndroidWidgetTextView.setVisibility(0);
      jdField_d_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131298575));
      jdField_b_of_type_AndroidWidgetButton = ((Button)findViewById(2131298579));
      jdField_a_of_type_ComTencentMobileqqWidgetNumberCheckBox = ((NumberCheckBox)findViewById(2131298574));
      jdField_c_of_type_AndroidViewView = findViewById(2131298573);
      jdField_c_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131297018));
      jdField_c_of_type_AndroidViewView.setOnClickListener(new mbn(this));
      jdField_b_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131298564));
      jdField_b_of_type_AndroidWidgetTextView.setOnClickListener(new mbo(this));
      jdField_a_of_type_AndroidWidgetButton.setOnClickListener(new mbp(this));
      jdField_b_of_type_AndroidWidgetButton.setOnClickListener(new mbq(this));
      jdField_a_of_type_ComTencentMobileqqActivityPhotoProGallery = ((ProGallery)findViewById(2131298267));
      jdField_a_of_type_Mbv = new mbv(this);
      jdField_a_of_type_ComTencentMobileqqActivityPhotoProGallery.setAdapter(jdField_a_of_type_Mbv);
      jdField_a_of_type_ComTencentMobileqqActivityPhotoProGallery.setOnNoBlankListener(jdField_a_of_type_Mbv);
      jdField_a_of_type_ComTencentMobileqqActivityPhotoProGallery.setOnItemSelectedListener(new mbs(this));
      jdField_a_of_type_ComTencentMobileqqActivityPhotoProGallery.setSpacing(getResources().getDimensionPixelSize(2131492970));
      jdField_a_of_type_ComTencentMobileqqActivityPhotoProGallery.setSelection(jdField_j_of_type_Int);
      c();
      if ((jdField_f_of_type_Boolean) || (jdField_j_of_type_Boolean))
      {
        jdField_a_of_type_ComTencentMobileqqWidgetNumberCheckBox.setVisibility(8);
        jdField_c_of_type_AndroidViewView.setVisibility(8);
        jdField_a_of_type_AndroidWidgetButton.setVisibility(8);
        jdField_a_of_type_AndroidWidgetCheckBox.setVisibility(8);
        jdField_a_of_type_AndroidWidgetTextView.setVisibility(8);
      }
      jdField_a_of_type_ComTencentMobileqqActivityPhotoProGallery.setOnItemClickListener(new mbt(this));
      if (("FromCamera".equals(jdField_h_of_type_JavaLangString)) || ("FromFastImage".equals(jdField_h_of_type_JavaLangString)) || ("FROM_PHOTO_LIST_FLOW".equals(jdField_h_of_type_JavaLangString)))
      {
        jdField_b_of_type_AndroidWidgetTextView.setText(2131369981);
        jdField_d_of_type_AndroidWidgetTextView.setVisibility(4);
        if (!"FROM_PHOTO_LIST_FLOW".equals(jdField_h_of_type_JavaLangString))
        {
          jdField_a_of_type_ComTencentMobileqqWidgetNumberCheckBox.setVisibility(8);
          jdField_c_of_type_AndroidViewView.setVisibility(8);
        }
      }
      jdField_d_of_type_AndroidWidgetTextView.setOnClickListener(new mbu(this));
      if (jdField_j_of_type_Boolean) {
        jdField_d_of_type_AndroidWidgetTextView.setVisibility(0);
      }
      if (!TextUtils.isEmpty(o)) {
        jdField_b_of_type_AndroidWidgetTextView.setText(o);
      }
      if (jdField_b_of_type_Int == 1001)
      {
        jdField_a_of_type_AndroidWidgetCheckBox.setVisibility(8);
        jdField_a_of_type_AndroidWidgetTextView.setVisibility(8);
      }
      return;
    }
    if (jdField_d_of_type_Boolean) {
      jdField_a_of_type_AndroidWidgetButton.setVisibility(0);
    }
    for (;;)
    {
      jdField_a_of_type_AndroidWidgetCheckBox.setVisibility(8);
      jdField_a_of_type_AndroidWidgetTextView.setVisibility(8);
      break;
      jdField_a_of_type_AndroidWidgetButton.setVisibility(8);
    }
  }
  
  public void c()
  {
    if (jdField_c_of_type_Boolean) {}
    for (Object localObject = getString(2131369797);; localObject = getString(2131369798))
    {
      if (jdField_i_of_type_Boolean) {
        localObject = getString(2131369799);
      }
      if (jdField_j_of_type_JavaLangString != null) {
        localObject = jdField_j_of_type_JavaLangString;
      }
      if (jdField_b_of_type_JavaUtilArrayList.size() <= 0) {
        break label195;
      }
      if ((!jdField_f_of_type_Boolean) && (!jdField_j_of_type_Boolean)) {
        break;
      }
      jdField_b_of_type_AndroidWidgetButton.setEnabled(true);
      jdField_b_of_type_AndroidWidgetButton.setText((CharSequence)localObject);
      return;
    }
    jdField_b_of_type_AndroidWidgetButton.setEnabled(true);
    jdField_a_of_type_AndroidWidgetTextView.setEnabled(true);
    if ((jdField_b_of_type_JavaUtilArrayList.size() == 1) && (!jdField_i_of_type_Boolean)) {
      jdField_a_of_type_AndroidWidgetButton.setEnabled(true);
    }
    for (;;)
    {
      d();
      jdField_b_of_type_AndroidWidgetButton.setText((String)localObject + "(" + jdField_b_of_type_JavaUtilArrayList.size() + ")");
      return;
      jdField_a_of_type_AndroidWidgetButton.setEnabled(false);
    }
    label195:
    jdField_b_of_type_AndroidWidgetButton.setText((CharSequence)localObject);
    jdField_a_of_type_AndroidWidgetCheckBox.setOnCheckedChangeListener(null);
    localObject = jdField_a_of_type_AndroidWidgetCheckBox;
    if (jdField_e_of_type_Int == 2) {}
    for (boolean bool = true;; bool = false)
    {
      ((CheckBox)localObject).setChecked(bool);
      jdField_a_of_type_AndroidWidgetCheckBox.setOnCheckedChangeListener(this);
      return;
    }
  }
  
  void d()
  {
    switch (jdField_e_of_type_Int)
    {
    case 1: 
    default: 
      return;
    case 0: 
      jdField_a_of_type_AndroidWidgetTextView.setText(getString(2131369796));
      jdField_a_of_type_AndroidWidgetCheckBox.setChecked(false);
      return;
    }
    e();
    jdField_a_of_type_AndroidWidgetCheckBox.setChecked(true);
  }
  
  void e()
  {
    Object localObject = jdField_b_of_type_JavaUtilArrayList.iterator();
    int i1 = 0;
    int i2 = 0;
    while (((Iterator)localObject).hasNext())
    {
      String str = (String)((Iterator)localObject).next();
      long l1 = new File(str).length();
      int i3 = i2;
      if (l1 > jdField_a_of_type_Int) {
        i3 = i2 + 1;
      }
      int i4 = (int)(i1 + l1);
      i1 = i4;
      i2 = i3;
      if (QLog.isColorLevel())
      {
        QLog.d("_photo", 2, "setQualityTextViewText, path:" + str + ",len:" + l1);
        i1 = i4;
        i2 = i3;
      }
    }
    localObject = PhotoUtils.a(this, i1);
    if (((String)localObject).equals("0")) {}
    for (localObject = getString(2131369796);; localObject = getString(2131369796) + "(" + "共" + (String)localObject + ")")
    {
      jdField_a_of_type_AndroidWidgetTextView.setText((CharSequence)localObject);
      return;
    }
  }
  
  public void f()
  {
    Object localObject;
    if ("FROM_PHOTO_LIST".equals(jdField_h_of_type_JavaLangString))
    {
      localObject = getIntent();
      ((Intent)localObject).setClass(this, PhotoListActivity.class);
      ((Intent)localObject).putExtra("PhotoConst.CURRENT_QUALITY_TYPE", jdField_e_of_type_Int);
      if (jdField_j_of_type_Boolean)
      {
        ((Intent)localObject).removeExtra("PhotoConst.PHOTO_PATHS");
        startActivity((Intent)localObject);
      }
    }
    label214:
    do
    {
      do
      {
        for (;;)
        {
          if (getIntent().getBooleanExtra("keep_selected_status_after_finish", false))
          {
            localObject = new Intent();
            ((Intent)localObject).putStringArrayListExtra("PhotoConst.SELECTED_PATHS", jdField_b_of_type_JavaUtilArrayList);
            ((Intent)localObject).putIntegerArrayListExtra("PhotoConst.SELECTED_INDEXS", jdField_c_of_type_JavaUtilArrayList);
            ((Intent)localObject).putExtra("PhotoConst.CURRENT_QUALITY_TYPE", jdField_e_of_type_Int);
            setResult(-1, (Intent)localObject);
          }
          super.finish();
          AlbumUtil.a(this, true, false);
          return;
          ((Intent)localObject).putStringArrayListExtra("PhotoConst.PHOTO_PATHS", jdField_b_of_type_JavaUtilArrayList);
          break;
          if ((!"FROM_PHOTO_LIST_FLOW".equals(jdField_h_of_type_JavaLangString)) || (jdField_j_of_type_Boolean)) {
            break label214;
          }
          localObject = new Intent();
          ((Intent)localObject).putStringArrayListExtra("PhotoConst.SELECTED_PATHS", jdField_b_of_type_JavaUtilArrayList);
          ((Intent)localObject).putIntegerArrayListExtra("PhotoConst.SELECTED_INDEXS", jdField_c_of_type_JavaUtilArrayList);
          ((Intent)localObject).putExtra("PhotoConst.CURRENT_QUALITY_TYPE", jdField_e_of_type_Int);
          setResult(-1, (Intent)localObject);
        }
      } while ((!"FromCamera".equals(jdField_h_of_type_JavaLangString)) && (!"FromFastImage".equals(jdField_h_of_type_JavaLangString)));
      localObject = PresendPicMgr.a(null);
    } while (localObject == null);
    if ("FromCamera".equals(jdField_h_of_type_JavaLangString)) {}
    for (int i1 = 1016;; i1 = 1017)
    {
      ((PresendPicMgr)localObject).a(i1);
      break;
    }
  }
  
  public void g()
  {
    if (jdField_i_of_type_Boolean)
    {
      localObject1 = PresendPicMgr.a(null);
      if (localObject1 != null) {
        ((PresendPicMgr)localObject1).a(1009);
      }
      localObject1 = a();
      if (localObject1 != null) {
        StatisticConstants.b(getIntent(), ((ArrayList)localObject1).size());
      }
      localObject2 = getIntent();
      ((Intent)localObject2).putExtra("open_chatfragment_fromphoto", true);
      AIOGalleryUtils.a(this, (Intent)localObject2, jdField_e_of_type_JavaLangString, jdField_k_of_type_JavaLangString, jdField_l_of_type_JavaLangString, m, n, jdField_e_of_type_Int, (ArrayList)localObject1);
    }
    for (;;)
    {
      Intent localIntent = getIntent();
      if ((localIntent != null) && (localIntent.getBooleanExtra("custom_photopreview_sendbtn_report", false)))
      {
        localObject3 = localIntent.getStringExtra("custom_photopreview_sendbtn_reportActionName");
        localObject2 = localIntent.getStringExtra("custom_photopreview_sendbtn_album_reportReverse2");
        localObject1 = localObject2;
        if (localObject2 == null) {
          localObject1 = localIntent.getStringExtra("custom_photopreview_sendbtn_camera_reportReverse2");
        }
        localObject2 = localObject1;
        if (localObject1 == null) {
          localObject2 = localIntent.getStringExtra("custom_photopreview_sendbtn_reportReverse2");
        }
        localObject1 = localObject2;
        if (localObject2 == null) {
          localObject1 = "";
        }
        if ((localObject3 != null) && (localObject1 != null)) {
          ReportController.b(null, "CliOper", "", "", (String)localObject3, (String)localObject3, 0, 0, (String)localObject1, "", "", "");
        }
      }
      return;
      if ((!jdField_d_of_type_Boolean) || ((TextUtils.isEmpty(p)) && (TextUtils.isEmpty(q)))) {
        break;
      }
      jdField_a_of_type_AndroidWidgetButton.performClick();
    }
    if ("FromFastImage".equals(jdField_h_of_type_JavaLangString))
    {
      ReportController.b(null, "CliOper", "", "", "0X8004D93", "0X8004D93", 0, 0, "", "", "", "");
      StatisticConstants.d();
    }
    if ("FromCamera".equals(jdField_h_of_type_JavaLangString)) {
      StatisticConstants.b();
    }
    Object localObject1 = a();
    if (localObject1 != null)
    {
      StatisticConstants.a(((ArrayList)localObject1).size(), jdField_f_of_type_Int);
      StatisticConstants.a(getIntent(), ((ArrayList)localObject1).size(), jdField_e_of_type_Int);
    }
    Object localObject2 = getIntent();
    Object localObject3 = PresendPicMgr.a(null);
    if (jdField_e_of_type_Int == 2)
    {
      if ((jdField_c_of_type_JavaUtilArrayList.size() == 0) && (((ArrayList)localObject1).size() == 1) && (FileUtils.a((String)((ArrayList)localObject1).get(0)) > 19922944L))
      {
        QQToast.a(this, getResources().getString(2131369812), 0).b(getResources().getDimensionPixelSize(2131492908));
        jdField_b_of_type_AndroidWidgetButton.setClickable(true);
        return;
      }
      if (localObject3 != null)
      {
        ((PresendPicMgr)localObject3).a(1010);
        ((PresendPicMgr)localObject3).a();
      }
      if (("FromCamera".equals(jdField_h_of_type_JavaLangString)) || ("FromFastImage".equals(jdField_h_of_type_JavaLangString))) {
        ReportController.b(null, "CliOper", "", "", "0X8005147", "0X8005147", 0, 0, "", "", "", "");
      }
    }
    for (;;)
    {
      if (jdField_b_of_type_Boolean) {
        jdField_a_of_type_AndroidViewView.setVisibility(4);
      }
      PhotoUtils.a(this, (Intent)localObject2, (ArrayList)localObject1, jdField_e_of_type_Int, jdField_b_of_type_Boolean);
      break;
      ReportController.b(null, "CliOper", "", "", "0X800515C", "0X800515C", 0, 0, "", "", "", "");
      continue;
      if ((localObject3 != null) && (jdField_c_of_type_JavaUtilArrayList.size() > 0)) {
        ((PresendPicMgr)localObject3).a((Intent)localObject2);
      }
    }
  }
  
  protected void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    super.onActivityResult(paramInt1, paramInt2, paramIntent);
    if (QLog.isDevelopLevel()) {
      QLog.d(v, 4, "[PhotoPreviewActivity] [onActivityResult] requestCode = " + paramInt1 + "  resultCode:" + paramInt2 + "  ok:" + -1);
    }
    label134:
    String str;
    if ((paramInt2 == -1) && (paramInt1 == 100003))
    {
      if (jdField_i_of_type_JavaLangString != null)
      {
        if (!jdField_d_of_type_Boolean)
        {
          PhotoMagicStickUtils.a(jdField_i_of_type_JavaLangString, this, jdField_b_of_type_Boolean, jdField_b_of_type_Int, jdField_e_of_type_JavaLangString, jdField_f_of_type_JavaLangString, jdField_g_of_type_JavaLangString);
          overridePendingTransition(2130968619, 2130968620);
        }
      }
      else {
        return;
      }
      if (jdField_a_of_type_JavaUtilHashMap == null)
      {
        paramIntent = null;
        str = jdField_i_of_type_JavaLangString;
        HashMap localHashMap = (HashMap)getIntent().getSerializableExtra("PasterConstants.original_to_bottom");
        if ((localHashMap == null) || (!localHashMap.containsKey(jdField_i_of_type_JavaLangString))) {
          break label274;
        }
        str = (String)localHashMap.get(jdField_i_of_type_JavaLangString);
      }
    }
    label274:
    for (;;)
    {
      PhotoMagicStickUtils.a(str, jdField_i_of_type_JavaLangString, this, jdField_b_of_type_Boolean, jdField_b_of_type_Int, jdField_e_of_type_JavaLangString, jdField_f_of_type_JavaLangString, jdField_g_of_type_JavaLangString, 9, p, q, paramIntent);
      p = null;
      q = null;
      break;
      paramIntent = (byte[])jdField_a_of_type_JavaUtilHashMap.get(jdField_i_of_type_JavaLangString);
      break label134;
      PhotoUtils.a(this, paramInt1, paramInt2, paramIntent, jdField_e_of_type_Boolean, jdField_e_of_type_JavaLangString);
      return;
    }
  }
  
  public void onBackPressed()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityPhotoProGallery.a(false)) {
      return;
    }
    f();
  }
  
  public void onCheckedChanged(CompoundButton paramCompoundButton, boolean paramBoolean)
  {
    if (paramBoolean)
    {
      if (b() > 0)
      {
        QQToast.a(this, getResources().getString(2131369812), 0).b(getResources().getDimensionPixelSize(2131492908));
        jdField_e_of_type_Int = 0;
        jdField_a_of_type_AndroidWidgetTextView.setText(getString(2131369796));
        jdField_a_of_type_AndroidWidgetCheckBox.setChecked(false);
      }
      do
      {
        do
        {
          do
          {
            do
            {
              int i1;
              do
              {
                return;
                if (!jdField_b_of_type_JavaUtilArrayList.isEmpty()) {
                  break;
                }
                i1 = jdField_a_of_type_ComTencentMobileqqActivityPhotoProGallery.s();
              } while (i1 >= jdField_a_of_type_JavaUtilArrayList.size());
              if (new File((String)jdField_a_of_type_JavaUtilArrayList.get(i1)).length() > 19922944L)
              {
                QQToast.a(this, getResources().getString(2131369812), 0).b(getResources().getDimensionPixelSize(2131492908));
                jdField_e_of_type_Int = 0;
                jdField_a_of_type_AndroidWidgetTextView.setText(getString(2131369796));
                jdField_a_of_type_AndroidWidgetCheckBox.setChecked(false);
                return;
              }
              jdField_a_of_type_ComTencentMobileqqWidgetNumberCheckBox.setChecked(true);
              jdField_b_of_type_JavaUtilArrayList.add(jdField_a_of_type_JavaUtilArrayList.get(i1));
              jdField_c_of_type_JavaUtilArrayList.add(Integer.valueOf(i1));
              jdField_a_of_type_AndroidWidgetCheckBox.setChecked(true);
              jdField_e_of_type_Int = 2;
              e();
              c();
              paramCompoundButton = getIntent();
            } while ((paramCompoundButton == null) || (!paramCompoundButton.hasExtra("custom_photopreview_rawcheckbox_reportActionName")));
            paramCompoundButton = paramCompoundButton.getStringExtra("custom_photopreview_rawcheckbox_reportActionName");
          } while (paramCompoundButton == null);
          ReportController.b(null, "CliOper", "", "", paramCompoundButton, paramCompoundButton, 0, 0, "", "", "", "");
          return;
          jdField_a_of_type_AndroidWidgetCheckBox.setChecked(true);
          jdField_e_of_type_Int = 2;
          e();
          paramCompoundButton = getIntent();
        } while ((paramCompoundButton == null) || (!paramCompoundButton.hasExtra("custom_photopreview_rawcheckbox_reportActionName")));
        paramCompoundButton = paramCompoundButton.getStringExtra("custom_photopreview_rawcheckbox_reportActionName");
      } while (paramCompoundButton == null);
      ReportController.b(null, "CliOper", "", "", paramCompoundButton, paramCompoundButton, 0, 0, "", "", "", "");
      return;
    }
    jdField_a_of_type_AndroidWidgetCheckBox.setChecked(false);
    jdField_e_of_type_Int = 0;
    jdField_a_of_type_AndroidWidgetTextView.setText(getString(2131369796));
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    super.setContentView(2130903443);
    jdField_g_of_type_Int = getResourcesgetDisplayMetricswidthPixels;
    jdField_h_of_type_Int = getResourcesgetDisplayMetricsheightPixels;
    a();
    b();
  }
  
  protected void onDestroy()
  {
    super.onDestroy();
    try
    {
      Iterator localIterator = jdField_b_of_type_JavaUtilArrayList.iterator();
      while (localIterator.hasNext())
      {
        Object localObject = (String)localIterator.next();
        if (localObject != null)
        {
          localObject = new File((String)localObject);
          URLDrawable.removeMemoryCacheByUrl(((File)localObject).toURL().toString());
          URLDrawable.removeMemoryCacheByUrl(((File)localObject).toURL().toString() + "#NOSAMPLE");
        }
      }
      return;
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.e("PhotoPreviewActivity", 2, "remove file error");
      }
    }
  }
  
  protected void onNewIntent(Intent paramIntent)
  {
    super.onNewIntent(paramIntent);
    setIntent(paramIntent);
    a();
    b();
  }
  
  protected void onPause()
  {
    super.onPause();
    SmallScreenUtils.a(BaseApplicationImpl.getContext(), false);
  }
  
  protected void onResume()
  {
    super.onResume();
    if ((jdField_a_of_type_Boolean) && (jdField_a_of_type_AndroidViewView != null)) {
      jdField_a_of_type_AndroidViewView.setVisibility(0);
    }
    SmallScreenUtils.a(BaseApplicationImpl.getContext(), true);
    if (jdField_a_of_type_AndroidWidgetButton != null) {
      jdField_a_of_type_AndroidWidgetButton.setClickable(true);
    }
  }
}
