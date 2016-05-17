package com.tencent.mobileqq.activity.photo;

import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.text.TextUtils;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.Button;
import com.tencent.mobileqq.activity.PortraitImageview;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.AlbumUtil;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.widget.immersive.ImmersiveUtils;
import java.util.ArrayList;
import mau;
import mav;

public class PhotoCropActivity
  extends BaseActivity
  implements View.OnClickListener
{
  public int a;
  Intent jdField_a_of_type_AndroidContentIntent;
  public Handler a;
  View jdField_a_of_type_AndroidViewView;
  public ViewGroup a;
  Button jdField_a_of_type_AndroidWidgetButton;
  public PortraitImageview a;
  PhotoCropAction jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoCropAction;
  public RegionView a;
  public String a;
  boolean jdField_a_of_type_Boolean;
  String[] jdField_a_of_type_ArrayOfJavaLangString;
  public int b;
  Button b;
  public String b;
  public int c;
  public String c;
  public int d;
  String d;
  public int e;
  public int f;
  
  public PhotoCropActivity()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Boolean = false;
  }
  
  private boolean a()
  {
    Intent localIntent = getIntent();
    jdField_a_of_type_AndroidContentIntent = localIntent;
    jdField_b_of_type_JavaLangString = localIntent.getStringExtra("FROM_WHERE");
    localIntent.removeExtra("FROM_WHERE");
    jdField_c_of_type_JavaLangString = localIntent.getStringExtra("PhotoConst.SINGLE_PHOTO_PATH");
    jdField_d_of_type_JavaLangString = localIntent.getStringExtra("PhotoConst.QZONE_COVER_CROP_LEFT_TITLE");
    jdField_b_of_type_Int = localIntent.getIntExtra("PhotoConst.CLIP_WIDTH", 400);
    jdField_c_of_type_Int = localIntent.getIntExtra("PhotoConst.CLIP_HEIGHT", 400);
    jdField_d_of_type_Int = localIntent.getIntExtra("PhotoConst.TARGET_WIDTH", 400);
    e = localIntent.getIntExtra("PhotoConst.TARGET_HEIGHT", 400);
    jdField_a_of_type_JavaLangString = localIntent.getStringExtra("PhotoConst.TARGET_PATH");
    if (jdField_a_of_type_JavaLangString == null)
    {
      QQToast.a(this, 2131369800, 0).a();
      return false;
    }
    f = localIntent.getIntExtra("PhotoConst.EDIT_MASK_SHAPE_TYPE", 1);
    jdField_a_of_type_Int = localIntent.getIntExtra("PhotoConst.COMPRESS_QUALITY", 100);
    jdField_a_of_type_ArrayOfJavaLangString = localIntent.getStringArrayExtra("PhotoConst.QZONE_COVER_SOURCE");
    return true;
  }
  
  public void a()
  {
    if (jdField_a_of_type_Boolean) {
      return;
    }
    jdField_a_of_type_Boolean = true;
    new mav(this, null).execute(new Void[0]);
  }
  
  void a(String paramString, int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5)
  {
    jdField_a_of_type_AndroidViewView = findViewById(2131296923);
    if (ImmersiveUtils.isSupporImmersive() == 1) {
      jdField_a_of_type_AndroidViewView.setFitsSystemWindows(true);
    }
    jdField_a_of_type_AndroidViewViewGroup = ((ViewGroup)findViewById(2131298565));
    jdField_a_of_type_AndroidWidgetButton = ((Button)findViewById(2131298562));
    jdField_b_of_type_AndroidWidgetButton = ((Button)findViewById(2131298564));
    jdField_a_of_type_AndroidWidgetButton.setOnClickListener(this);
    jdField_b_of_type_AndroidWidgetButton.setOnClickListener(this);
    if (!TextUtils.isEmpty(jdField_d_of_type_JavaLangString)) {
      jdField_b_of_type_AndroidWidgetButton.setText(jdField_d_of_type_JavaLangString);
    }
    jdField_a_of_type_ComTencentMobileqqActivityPortraitImageview = new PortraitImageview(this);
  }
  
  public boolean doOnCreate(Bundle paramBundle)
  {
    super.doOnCreate(paramBundle);
    super.setContentView(2130903438);
    if (!a())
    {
      finish();
      return false;
    }
    a(jdField_c_of_type_JavaLangString, jdField_b_of_type_Int, jdField_c_of_type_Int, jdField_d_of_type_Int, e, f);
    new mau(this, null).execute(new Void[0]);
    return true;
  }
  
  protected boolean isWrapContent()
  {
    return false;
  }
  
  protected boolean onBackEvent()
  {
    if ("FROM_PHOTO_LIST".equals(jdField_b_of_type_JavaLangString))
    {
      Intent localIntent = getIntent();
      localIntent.setClass(this, PhotoListActivity.class);
      localIntent.removeExtra("PhotoConst.PHOTO_PATHS");
      startActivity(localIntent);
    }
    for (;;)
    {
      finish();
      AlbumUtil.a(this, true, false);
      return true;
      if ("FROM_NEARBY_PROFILE".equals(jdField_b_of_type_JavaLangString)) {
        PhotoUtils.a(this, getIntent(), new ArrayList(), 0, false);
      }
    }
  }
  
  public void onClick(View paramView)
  {
    switch (paramView.getId())
    {
    case 2131298563: 
    default: 
      return;
    case 2131298562: 
      if (jdField_a_of_type_ArrayOfJavaLangString != null)
      {
        if (jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoCropAction == null)
        {
          jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoCropAction = new PhotoCropMenuForQzone(this);
          jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoCropAction.a(jdField_a_of_type_ArrayOfJavaLangString);
        }
        if (jdField_a_of_type_ComTencentMobileqqActivityPhotoRegionView != null) {
          jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoCropAction.a();
        }
      }
      for (;;)
      {
        AlbumUtil.c();
        AlbumUtil.a(jdField_a_of_type_AndroidContentIntent);
        return;
        if (jdField_a_of_type_ComTencentMobileqqActivityPhotoRegionView != null) {
          a();
        }
      }
    }
    onBackEvent();
  }
}
