package com.tencent.mobileqq.widget;

import android.app.Dialog;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.drawable.Animatable;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.view.LayoutInflater;
import android.view.View;
import android.view.Window;
import android.view.WindowManager.LayoutParams;
import android.view.accessibility.AccessibilityEvent;
import android.widget.ImageView;
import android.widget.TextView;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.memoryleak.ActivityLeakSolution;
import svr;
import svs;

public class QQProgressDialog
  extends Dialog
{
  private float jdField_a_of_type_Float;
  private int jdField_a_of_type_Int = 0;
  private Context jdField_a_of_type_AndroidContentContext;
  private Animatable jdField_a_of_type_AndroidGraphicsDrawableAnimatable;
  private LayoutInflater jdField_a_of_type_AndroidViewLayoutInflater;
  private View jdField_a_of_type_AndroidViewView;
  private ImageView jdField_a_of_type_AndroidWidgetImageView = null;
  private TextView jdField_a_of_type_AndroidWidgetTextView;
  private QQProgressDialog.Callback jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog$Callback;
  String jdField_a_of_type_JavaLangString;
  private int jdField_b_of_type_Int = 48;
  private ImageView jdField_b_of_type_AndroidWidgetImageView = null;
  
  public QQProgressDialog(Context paramContext)
  {
    this(paramContext, 0);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public QQProgressDialog(Context paramContext, int paramInt)
  {
    this(paramContext, paramInt, 2130904246, 48);
  }
  
  public QQProgressDialog(Context paramContext, int paramInt1, int paramInt2, int paramInt3)
  {
    super(paramContext, 2131558942);
    jdField_a_of_type_AndroidContentContext = paramContext;
    jdField_a_of_type_AndroidViewLayoutInflater = LayoutInflater.from(paramContext);
    jdField_a_of_type_Float = jdField_a_of_type_AndroidContentContext.getResources().getDisplayMetrics().density;
    jdField_a_of_type_AndroidViewView = jdField_a_of_type_AndroidViewLayoutInflater.inflate(paramInt2, null);
    jdField_a_of_type_AndroidWidgetTextView = ((TextView)jdField_a_of_type_AndroidViewView.findViewById(2131297321));
    jdField_a_of_type_Int = paramInt1;
    jdField_b_of_type_Int = paramInt3;
    jdField_a_of_type_AndroidWidgetImageView = ((ImageView)jdField_a_of_type_AndroidViewView.findViewById(2131301940));
    jdField_b_of_type_AndroidWidgetImageView = ((ImageView)jdField_a_of_type_AndroidViewView.findViewById(2131297320));
    jdField_a_of_type_AndroidGraphicsDrawableAnimatable = ((Animatable)jdField_b_of_type_AndroidWidgetImageView.getDrawable());
  }
  
  public void a(int paramInt)
  {
    jdField_a_of_type_Int = paramInt;
  }
  
  public void a(Bitmap paramBitmap)
  {
    if (jdField_a_of_type_AndroidWidgetImageView == null) {
      return;
    }
    jdField_a_of_type_AndroidWidgetImageView.setVisibility(0);
    jdField_a_of_type_AndroidWidgetImageView.setImageBitmap(paramBitmap);
  }
  
  public void a(QQProgressDialog.Callback paramCallback)
  {
    jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog$Callback = paramCallback;
  }
  
  public void a(String paramString)
  {
    jdField_a_of_type_AndroidWidgetTextView.setText(paramString);
  }
  
  public void a(boolean paramBoolean)
  {
    if (jdField_a_of_type_AndroidWidgetImageView == null) {
      return;
    }
    if (paramBoolean)
    {
      jdField_a_of_type_AndroidWidgetImageView.setVisibility(0);
      return;
    }
    jdField_a_of_type_AndroidWidgetImageView.setVisibility(8);
  }
  
  public void b(int paramInt)
  {
    jdField_a_of_type_AndroidWidgetTextView.setText(paramInt);
  }
  
  public void b(String paramString)
  {
    jdField_a_of_type_JavaLangString = paramString;
  }
  
  public void b(boolean paramBoolean)
  {
    if (jdField_b_of_type_AndroidWidgetImageView == null) {
      return;
    }
    if (paramBoolean)
    {
      if (!jdField_a_of_type_AndroidGraphicsDrawableAnimatable.isRunning()) {
        jdField_a_of_type_AndroidGraphicsDrawableAnimatable.start();
      }
      jdField_b_of_type_AndroidWidgetImageView.setVisibility(0);
      return;
    }
    if (jdField_a_of_type_AndroidGraphicsDrawableAnimatable.isRunning()) {
      jdField_a_of_type_AndroidGraphicsDrawableAnimatable.stop();
    }
    jdField_b_of_type_AndroidWidgetImageView.setVisibility(8);
  }
  
  public void c(int paramInt)
  {
    if (jdField_a_of_type_AndroidWidgetImageView == null) {
      return;
    }
    jdField_a_of_type_AndroidWidgetImageView.setVisibility(0);
    jdField_a_of_type_AndroidWidgetImageView.setImageResource(paramInt);
  }
  
  public void c(boolean paramBoolean)
  {
    if (jdField_a_of_type_AndroidViewView != null)
    {
      if (paramBoolean) {
        jdField_a_of_type_AndroidViewView.setVisibility(0);
      }
    }
    else {
      return;
    }
    jdField_a_of_type_AndroidViewView.setVisibility(8);
  }
  
  public void d(boolean paramBoolean)
  {
    setOnKeyListener(new svs(this, paramBoolean));
  }
  
  public void dismiss()
  {
    try
    {
      super.dismiss();
      ActivityLeakSolution.a(this);
      return;
    }
    catch (Exception localException)
    {
      localException = localException;
      ActivityLeakSolution.a(this);
      return;
    }
    finally
    {
      localObject = finally;
      ActivityLeakSolution.a(this);
      throw localObject;
    }
  }
  
  public boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent paramAccessibilityEvent)
  {
    if (TextUtils.isEmpty(jdField_a_of_type_JavaLangString)) {
      return super.dispatchPopulateAccessibilityEvent(paramAccessibilityEvent);
    }
    if (AppSetting.i) {
      QQAppInterface.f(jdField_a_of_type_JavaLangString);
    }
    return true;
  }
  
  public void onBackPressed()
  {
    super.onBackPressed();
    if (jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog$Callback != null) {
      jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog$Callback.a();
    }
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    paramBundle = getWindow();
    paramBundle.setContentView(jdField_a_of_type_AndroidViewView);
    WindowManager.LayoutParams localLayoutParams = paramBundle.getAttributes();
    width = -1;
    height = -2;
    gravity = jdField_b_of_type_Int;
    y += jdField_a_of_type_Int;
    paramBundle.setAttributes(localLayoutParams);
    setCanceledOnTouchOutside(false);
  }
  
  protected void onStart()
  {
    jdField_b_of_type_AndroidWidgetImageView.postDelayed(new svr(this), 50L);
    super.onStart();
  }
  
  public void onStop()
  {
    if (jdField_a_of_type_AndroidGraphicsDrawableAnimatable.isRunning()) {
      jdField_a_of_type_AndroidGraphicsDrawableAnimatable.stop();
    }
    super.onStop();
  }
}
