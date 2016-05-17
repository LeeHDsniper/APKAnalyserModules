package com.tencent.common.galleryactivity;

import android.app.Activity;
import android.app.Dialog;
import android.content.res.Resources;
import android.graphics.Rect;
import android.view.Display;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.WindowManager;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.tencent.mobileqq.activity.aio.photo.AIOGalleryActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.QQCustomDialog;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.AdapterView.OnItemClickListener;
import com.tencent.widget.GestureSelectGridView;
import com.tencent.widget.GestureSelectGridView.OnSelectListener;
import com.tencent.widget.immersive.ImmersiveUtils;
import com.tencent.widget.immersive.SystemBarCompact;
import hdb;
import hdc;
import hdd;
import hde;

public abstract class AbstractImageListScene
  extends ImageScene
  implements AnimationLister
{
  int jdField_a_of_type_Int;
  protected Activity a;
  protected Dialog a;
  protected View a;
  protected ImageView a;
  protected RelativeLayout a;
  protected TextView a;
  protected AbstractAnimationManager a;
  public AbstractImageAdapter a;
  protected AbstractImageListModel a;
  AnimationLister jdField_a_of_type_ComTencentCommonGalleryactivityAnimationLister;
  protected QQCustomDialog a;
  protected GestureSelectGridView a;
  protected boolean a;
  int b;
  protected ImageView b;
  protected TextView b;
  private int jdField_c_of_type_Int;
  private TextView jdField_c_of_type_AndroidWidgetTextView;
  private int d;
  private int e;
  
  public AbstractImageListScene(Activity paramActivity, AbstractImageListModel paramAbstractImageListModel)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_ComTencentCommonGalleryactivityAnimationLister = new hde(this);
    jdField_a_of_type_AndroidAppActivity = paramActivity;
    jdField_a_of_type_ComTencentCommonGalleryactivityAbstractImageListModel = paramAbstractImageListModel;
  }
  
  private void c(ViewGroup paramViewGroup)
  {
    jdField_a_of_type_AndroidWidgetRelativeLayout = ((RelativeLayout)LayoutInflater.from(jdField_a_of_type_AndroidAppActivity).inflate(2130904001, null));
    if (paramViewGroup == null) {
      jdField_a_of_type_AndroidAppActivity.addContentView(jdField_a_of_type_AndroidWidgetRelativeLayout, new ViewGroup.LayoutParams(-1, -1));
    }
    for (;;)
    {
      b(jdField_a_of_type_AndroidWidgetRelativeLayout);
      jdField_c_of_type_AndroidWidgetTextView = ((TextView)jdField_a_of_type_AndroidAppActivity.findViewById(2131297018));
      jdField_a_of_type_AndroidWidgetTextView = ((TextView)jdField_a_of_type_AndroidAppActivity.findViewById(2131299919));
      jdField_b_of_type_AndroidWidgetTextView = ((TextView)jdField_a_of_type_AndroidAppActivity.findViewById(2131300877));
      jdField_a_of_type_AndroidWidgetImageView = ((ImageView)jdField_a_of_type_AndroidAppActivity.findViewById(2131300879));
      jdField_b_of_type_AndroidWidgetImageView = ((ImageView)jdField_a_of_type_AndroidAppActivity.findViewById(2131300880));
      jdField_a_of_type_AndroidViewView = jdField_a_of_type_AndroidAppActivity.findViewById(2131300878);
      jdField_a_of_type_ComTencentWidgetGestureSelectGridView = ((GestureSelectGridView)jdField_a_of_type_AndroidAppActivity.findViewById(2131300881));
      jdField_a_of_type_ComTencentWidgetGestureSelectGridView.setGravity(17);
      jdField_a_of_type_ComTencentWidgetGestureSelectGridView.setScrollBarStyle(0);
      jdField_a_of_type_ComTencentWidgetGestureSelectGridView.setNumColumns(4);
      jdField_a_of_type_ComTencentWidgetGestureSelectGridView.setColumnWidth(jdField_a_of_type_Int);
      jdField_a_of_type_ComTencentWidgetGestureSelectGridView.setHorizontalSpacing(jdField_c_of_type_Int);
      jdField_a_of_type_ComTencentWidgetGestureSelectGridView.setVerticalSpacing(d);
      jdField_a_of_type_ComTencentWidgetGestureSelectGridView.setPadding(e, jdField_a_of_type_ComTencentWidgetGestureSelectGridView.getPaddingTop(), e, jdField_a_of_type_ComTencentWidgetGestureSelectGridView.getPaddingBottom());
      jdField_a_of_type_ComTencentWidgetGestureSelectGridView.setOnItemClickListener(a());
      jdField_a_of_type_ComTencentWidgetGestureSelectGridView.setOnIndexChangedListener(a());
      jdField_a_of_type_ComTencentCommonGalleryactivityAbstractImageAdapter = a(jdField_a_of_type_AndroidAppActivity, jdField_a_of_type_Int);
      jdField_a_of_type_ComTencentWidgetGestureSelectGridView.setAdapter(jdField_a_of_type_ComTencentCommonGalleryactivityAbstractImageAdapter);
      jdField_c_of_type_AndroidWidgetTextView.setText(2131370483);
      p();
      q();
      jdField_a_of_type_AndroidWidgetRelativeLayout.setVisibility(4);
      return;
      paramViewGroup.addView(jdField_a_of_type_AndroidWidgetRelativeLayout, 0);
    }
  }
  
  private void o()
  {
    Display localDisplay = ((WindowManager)jdField_a_of_type_AndroidAppActivity.getSystemService("window")).getDefaultDisplay();
    e = jdField_a_of_type_AndroidAppActivity.getResources().getDimensionPixelSize(2131493036);
    jdField_c_of_type_Int = jdField_a_of_type_AndroidAppActivity.getResources().getDimensionPixelSize(2131493034);
    d = jdField_a_of_type_AndroidAppActivity.getResources().getDimensionPixelSize(2131493035);
    jdField_a_of_type_Int = ((localDisplay.getWidth() - e * 2 - jdField_c_of_type_Int * 3) / 4);
  }
  
  private void p()
  {
    if (jdField_a_of_type_AndroidWidgetTextView != null)
    {
      jdField_a_of_type_AndroidWidgetTextView.setText(2131370492);
      jdField_a_of_type_AndroidWidgetTextView.setOnClickListener(new hdb(this));
    }
    if (jdField_b_of_type_AndroidWidgetTextView != null)
    {
      jdField_b_of_type_AndroidWidgetTextView.setVisibility(0);
      jdField_b_of_type_AndroidWidgetTextView.setText(2131370490);
      jdField_b_of_type_AndroidWidgetTextView.setOnClickListener(a());
    }
  }
  
  private void q()
  {
    if (jdField_a_of_type_Boolean) {
      jdField_a_of_type_AndroidViewView.setVisibility(0);
    }
    for (;;)
    {
      jdField_a_of_type_AndroidWidgetImageView.setOnClickListener(new hdc(this));
      jdField_b_of_type_AndroidWidgetImageView.setOnClickListener(new hdd(this));
      return;
      jdField_a_of_type_AndroidViewView.setVisibility(8);
    }
  }
  
  public Rect a()
  {
    int i = jdField_a_of_type_ComTencentWidgetGestureSelectGridView.s();
    int j = jdField_a_of_type_ComTencentCommonGalleryactivityAbstractImageListModel.b();
    View localView = jdField_a_of_type_ComTencentWidgetGestureSelectGridView.getChildAt(j - i);
    if (localView != null) {
      return AnimationUtils.a(localView);
    }
    return null;
  }
  
  protected abstract View.OnClickListener a();
  
  protected abstract AbstractImageAdapter a(Activity paramActivity, int paramInt);
  
  protected abstract AdapterView.OnItemClickListener a();
  
  protected abstract GestureSelectGridView.OnSelectListener a();
  
  public void a()
  {
    jdField_a_of_type_ComTencentCommonGalleryactivityGalleryManager.a().a(jdField_a_of_type_ComTencentCommonGalleryactivityAnimationLister);
  }
  
  public void a(ViewGroup paramViewGroup)
  {
    jdField_a_of_type_ComTencentCommonGalleryactivityAbstractAnimationManager = jdField_a_of_type_ComTencentCommonGalleryactivityGalleryManager.a();
    o();
    c(paramViewGroup);
  }
  
  public boolean a()
  {
    return false;
  }
  
  public void b() {}
  
  public void c() {}
  
  public void d() {}
  
  public void e() {}
  
  public boolean e()
  {
    i();
    jdField_a_of_type_AndroidAppActivity.finish();
    jdField_a_of_type_AndroidAppActivity.overridePendingTransition(2130968583, 2130968584);
    return true;
  }
  
  public void f()
  {
    super.f();
    jdField_a_of_type_Boolean = false;
    jdField_a_of_type_ComTencentCommonGalleryactivityAbstractImageAdapter = null;
    jdField_a_of_type_ComTencentCommonGalleryactivityAbstractImageListModel = null;
  }
  
  public void h()
  {
    jdField_a_of_type_ComTencentCommonGalleryactivityGalleryManager.a().a(jdField_a_of_type_ComTencentCommonGalleryactivityAnimationLister);
  }
  
  public void i() {}
  
  public void j()
  {
    if ((jdField_a_of_type_AndroidAppActivity instanceof AIOGalleryActivity))
    {
      if (QLog.isColorLevel()) {
        QLog.d("ImmerseTest", 2, "imagelist setColor blue");
      }
      int i;
      if ((ImmersiveUtils.isSupporImmersive() == 1) && (jdField_a_of_type_AndroidWidgetRelativeLayout != null))
      {
        RelativeLayout.LayoutParams localLayoutParams = (RelativeLayout.LayoutParams)jdField_a_of_type_AndroidWidgetRelativeLayout.getLayoutParams();
        i = ImmersiveUtils.a(jdField_a_of_type_AndroidAppActivity);
        if (localLayoutParams != null) {
          localLayoutParams.setMargins(0, i, 0, 0);
        }
      }
      if (jdField_a_of_type_AndroidAppActivity).a != null)
      {
        i = jdField_a_of_type_AndroidAppActivity.getResources().getColor(2131428205);
        jdField_a_of_type_AndroidAppActivity).a.a(i);
        jdField_a_of_type_AndroidAppActivity).a.b(i);
      }
    }
    jdField_c_of_type_AndroidWidgetTextView.setText(String.format(jdField_a_of_type_AndroidAppActivity.getResources().getString(2131370484), new Object[] { Integer.valueOf(jdField_a_of_type_ComTencentCommonGalleryactivityAbstractImageListModel.a()) }));
    jdField_a_of_type_AndroidWidgetRelativeLayout.setVisibility(0);
    if (QLog.isColorLevel()) {
      QLog.d("GalleryComponent", 2, "imagelist onstart");
    }
  }
  
  public void k()
  {
    super.k();
    jdField_a_of_type_AndroidViewViewGroup.setVisibility(4);
    if (QLog.isColorLevel()) {
      QLog.d("GalleryComponent", 2, "imagelist onStop");
    }
  }
  
  public abstract void l();
  
  public abstract void m();
}
