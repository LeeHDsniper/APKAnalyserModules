package com.tencent.mobileqq.activity.photo;

import android.content.Intent;
import android.content.res.Resources;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.Environment;
import android.util.DisplayMetrics;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.TextView;
import com.tencent.image.AbstractGifImage;
import com.tencent.mobileqq.activity.aio.photo.AIOPhotoListUtils;
import com.tencent.mobileqq.app.IphoneTitleBarActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.DialogUtil;
import com.tencent.mobileqq.utils.QQCustomDialog;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.widget.Gallery;
import java.io.File;
import java.util.ArrayList;
import mad;
import mae;
import maf;
import mag;
import mah;
import mai;
import maj;
import mak;

public class CameraPreviewActivity
  extends IphoneTitleBarActivity
  implements View.OnClickListener
{
  private int jdField_a_of_type_Int;
  private Drawable jdField_a_of_type_AndroidGraphicsDrawableDrawable;
  private ViewGroup jdField_a_of_type_AndroidViewViewGroup;
  public QQCustomDialog a;
  private Gallery jdField_a_of_type_ComTencentWidgetGallery;
  String jdField_a_of_type_JavaLangString;
  private ArrayList jdField_a_of_type_JavaUtilArrayList;
  private mak jdField_a_of_type_Mak;
  boolean jdField_a_of_type_Boolean;
  private int b;
  public boolean b;
  
  public CameraPreviewActivity()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_AndroidGraphicsDrawableDrawable = new ColorDrawable(0);
    jdField_a_of_type_JavaUtilArrayList = new ArrayList();
    jdField_a_of_type_JavaLangString = null;
  }
  
  private void a()
  {
    boolean bool = false;
    Intent localIntent = getIntent();
    jdField_b_of_type_Boolean = localIntent.getBooleanExtra("callFromFastImage", false);
    if (jdField_b_of_type_Boolean) {
      StatisticConstants.c();
    }
    for (;;)
    {
      jdField_a_of_type_JavaUtilArrayList = localIntent.getStringArrayListExtra("PhotoConst.PHOTO_PATHS");
      int i = localIntent.getIntExtra("uintype", 1003);
      if ((i == 0) || (i == 1) || (i == 3000) || (i == 7)) {
        bool = true;
      }
      jdField_a_of_type_Boolean = bool;
      jdField_a_of_type_JavaLangString = localIntent.getStringExtra("PhotoConst.CUSTOM_SENDBTN_TEXT");
      return;
      StatisticConstants.a();
    }
  }
  
  private void a(int paramInt)
  {
    String str1;
    String str2;
    if (paramInt == 6)
    {
      str1 = getString(2131367418);
      str2 = getString(2131367419);
    }
    for (;;)
    {
      jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog = DialogUtil.a(this, 230, str1, str2, new mah(this), null);
      jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.setOnCancelListener(new mai(this));
      jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.setOnDismissListener(new maj(this));
      jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.show();
      return;
      if (paramInt == 7)
      {
        str1 = getString(2131367414);
        str2 = getString(2131367415);
      }
      else
      {
        if (jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog != null)
        {
          jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.dismiss();
          return;
        }
        str1 = null;
        str2 = null;
      }
    }
  }
  
  private boolean a()
  {
    if (!Environment.getExternalStorageState().equalsIgnoreCase("mounted"))
    {
      a(7);
      return true;
    }
    if (AIOPhotoListUtils.a() < 10L)
    {
      a(6);
      return true;
    }
    return false;
  }
  
  private boolean a(String paramString)
  {
    boolean bool = false;
    if (new File(paramString).length() > 19922944L)
    {
      QQToast.a(this, getResources().getString(2131369812), 0).b(getResources().getDimensionPixelSize(2131492908));
      bool = true;
    }
    return bool;
  }
  
  private void b()
  {
    jdField_a_of_type_ComTencentWidgetGallery = new Gallery(this);
    jdField_a_of_type_ComTencentWidgetGallery.setSpacing(getResources().getDimensionPixelSize(2131492970));
    jdField_a_of_type_AndroidViewViewGroup.addView(jdField_a_of_type_ComTencentWidgetGallery, -1, -1);
    jdField_a_of_type_Mak = new mak(this);
    jdField_a_of_type_ComTencentWidgetGallery.setAdapter(jdField_a_of_type_Mak);
  }
  
  protected void doOnDestroy()
  {
    super.doOnDestroy();
    if ((jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog != null) && (jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.isShowing())) {
      jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.hide();
    }
    jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog = null;
  }
  
  protected void doOnPause()
  {
    super.doOnPause();
    AbstractGifImage.pauseAll();
  }
  
  protected void doOnResume()
  {
    super.doOnResume();
    AbstractGifImage.resumeAll();
  }
  
  protected boolean isWrapContent()
  {
    return false;
  }
  
  protected void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    super.onActivityResult(paramInt1, paramInt2, paramIntent);
    PhotoUtils.a(this, paramInt1, paramInt2, paramIntent, false);
  }
  
  public void onClick(View paramView) {}
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    a();
    jdField_a_of_type_AndroidViewViewGroup = ((ViewGroup)getLayoutInflater().inflate(2130903440, null));
    b();
    getLayoutInflater().inflate(2130903442, jdField_a_of_type_AndroidViewViewGroup);
    jdField_a_of_type_Int = getResourcesgetDisplayMetricswidthPixels;
    jdField_b_of_type_Int = getResourcesgetDisplayMetricsheightPixels;
    super.setContentView(jdField_a_of_type_AndroidViewViewGroup);
    if (jdField_a_of_type_Boolean) {
      setRightButton(2131369965, new mad(this));
    }
    setTitle(2131368464);
    setLeftButton(2131369624, new mae(this));
    paramBundle = (TextView)jdField_a_of_type_AndroidViewViewGroup.findViewById(2131298572);
    if (jdField_a_of_type_JavaLangString != null) {
      paramBundle.setText(jdField_a_of_type_JavaLangString);
    }
    paramBundle.setOnClickListener(new maf(this));
    jdField_a_of_type_AndroidViewViewGroup.findViewById(2131298571).setOnClickListener(new mag(this));
  }
}
