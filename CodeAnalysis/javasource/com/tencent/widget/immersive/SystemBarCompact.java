package com.tencent.widget.immersive;

import android.app.Activity;
import android.app.Dialog;
import android.graphics.drawable.Drawable;
import android.view.Window;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.theme.ThemeUtil;
import com.tencent.qphone.base.util.QLog;

public class SystemBarCompact
{
  public int a;
  public Drawable a;
  private Window jdField_a_of_type_AndroidViewWindow;
  private SystemBarTintManager jdField_a_of_type_ComTencentWidgetImmersiveSystemBarTintManager;
  public boolean a;
  private int b;
  public boolean b;
  public boolean c;
  
  public SystemBarCompact(Activity paramActivity, boolean paramBoolean, int paramInt)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Boolean = true;
    jdField_a_of_type_Int = 0;
    jdField_b_of_type_Boolean = true;
    jdField_a_of_type_AndroidViewWindow = paramActivity.getWindow();
    jdField_a_of_type_Boolean = paramBoolean;
    jdField_b_of_type_Int = paramInt;
  }
  
  public SystemBarCompact(Dialog paramDialog, boolean paramBoolean, int paramInt)
  {
    jdField_a_of_type_Boolean = true;
    jdField_a_of_type_Int = 0;
    jdField_b_of_type_Boolean = true;
    jdField_a_of_type_AndroidViewWindow = paramDialog.getWindow();
    jdField_a_of_type_Boolean = paramBoolean;
    jdField_b_of_type_Int = paramInt;
  }
  
  private void a()
  {
    if (jdField_a_of_type_ComTencentWidgetImmersiveSystemBarTintManager == null) {
      jdField_a_of_type_ComTencentWidgetImmersiveSystemBarTintManager = new SystemBarTintManager(jdField_a_of_type_AndroidViewWindow, jdField_a_of_type_Boolean);
    }
  }
  
  public void a(int paramInt)
  {
    jdField_b_of_type_Int = paramInt;
  }
  
  public void a(Drawable paramDrawable)
  {
    jdField_a_of_type_AndroidGraphicsDrawableDrawable = paramDrawable;
    if ((jdField_a_of_type_ComTencentWidgetImmersiveSystemBarTintManager != null) && (ImmersiveUtils.isSupporImmersive() == 1)) {
      jdField_a_of_type_ComTencentWidgetImmersiveSystemBarTintManager.b(paramDrawable);
    }
  }
  
  public void a(boolean paramBoolean)
  {
    if (ImmersiveUtils.a())
    {
      if (!ThemeUtil.isDefaultOrDIYTheme()) {
        paramBoolean = false;
      }
      ImmersiveUtils.a(jdField_a_of_type_AndroidViewWindow, paramBoolean);
    }
  }
  
  public void a(boolean paramBoolean, int paramInt)
  {
    if (QLog.isColorLevel()) {
      QLog.i("status", 2, "setgetStatusBarVisible=" + paramBoolean);
    }
    jdField_b_of_type_Boolean = paramBoolean;
    if (jdField_a_of_type_ComTencentWidgetImmersiveSystemBarTintManager != null) {
      jdField_a_of_type_ComTencentWidgetImmersiveSystemBarTintManager.a(paramBoolean, paramInt);
    }
  }
  
  public void b(int paramInt)
  {
    if ((jdField_a_of_type_Boolean) && (jdField_a_of_type_Int != paramInt))
    {
      jdField_a_of_type_Int = paramInt;
      if ((jdField_a_of_type_ComTencentWidgetImmersiveSystemBarTintManager != null) && (ImmersiveUtils.isSupporImmersive() == 1)) {
        jdField_a_of_type_ComTencentWidgetImmersiveSystemBarTintManager.c(paramInt);
      }
    }
  }
  
  public void init()
  {
    if (c) {
      return;
    }
    if (QLog.isColorLevel()) {
      QLog.d("systembar", 2, "mChatBarComp init()");
    }
    if (ImmersiveUtils.isSupporImmersive() == 1)
    {
      a();
      jdField_a_of_type_ComTencentWidgetImmersiveSystemBarTintManager.a(jdField_a_of_type_Boolean);
    }
    b(jdField_b_of_type_Int);
    jdField_b_of_type_Boolean = true;
    c = true;
  }
}
