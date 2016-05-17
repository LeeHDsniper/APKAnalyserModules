package com.tencent.mobileqq.utils;

import android.content.Context;
import android.content.res.Resources;
import android.os.Build;
import android.os.Handler;
import android.text.InputFilter;
import android.text.InputFilter.LengthFilter;
import android.util.DisplayMetrics;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup.LayoutParams;
import android.view.Window;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import com.tencent.devicelib.DeviceLib;
import com.tencent.mobileqq.emoticonview.SystemAndEmojiEmoticonPanel;
import com.tencent.mobileqq.emoticonview.SystemEmoticonPanel;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.text.QQTextBuilder;
import com.tencent.mobileqq.text.QzoneTextBuilder;
import com.tencent.util.InputMethodUtil;
import java.lang.ref.SoftReference;
import sne;
import snf;
import sng;
import snh;

public class QQCustomDialogWtihEmoticonInput
  extends QQCustomDialog
  implements View.OnClickListener
{
  protected int a;
  protected Handler a;
  private EditText jdField_a_of_type_AndroidWidgetEditText;
  public ImageView a;
  public SystemEmoticonPanel a;
  private SoftReference jdField_a_of_type_JavaLangRefSoftReference;
  
  public QQCustomDialogWtihEmoticonInput(Context paramContext, int paramInt)
  {
    super(paramContext, paramInt);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Int = 1;
    jdField_a_of_type_AndroidWidgetImageView = null;
    jdField_a_of_type_ComTencentMobileqqEmoticonviewSystemEmoticonPanel = null;
    jdField_a_of_type_AndroidOsHandler = new Handler();
    jdField_a_of_type_JavaLangRefSoftReference = new SoftReference(paramContext);
    getWindow().setSoftInputMode(19);
  }
  
  public String a()
  {
    if (jdField_a_of_type_AndroidWidgetEditText == null) {
      return "";
    }
    Object localObject;
    if ((jdField_a_of_type_AndroidWidgetEditText.getText() instanceof QzoneTextBuilder))
    {
      localObject = (QzoneTextBuilder)jdField_a_of_type_AndroidWidgetEditText.getText();
      if (localObject != null) {
        return ((QzoneTextBuilder)localObject).a();
      }
    }
    else if ((jdField_a_of_type_AndroidWidgetEditText.getText() instanceof QQTextBuilder))
    {
      localObject = (QQTextBuilder)jdField_a_of_type_AndroidWidgetEditText.getText();
      if (localObject != null) {
        return ((QQTextBuilder)localObject).a();
      }
    }
    return jdField_a_of_type_AndroidWidgetEditText.getEditableText().toString();
  }
  
  public void a()
  {
    if (jdField_a_of_type_AndroidWidgetEditText != null) {
      jdField_a_of_type_AndroidWidgetEditText.setEditableFactory(QzoneTextBuilder.b);
    }
  }
  
  public void a(int paramInt)
  {
    jdField_a_of_type_Int = paramInt;
  }
  
  protected void a(Context paramContext)
  {
    snf localSnf = new snf(this);
    if (jdField_a_of_type_Int == 7)
    {
      jdField_a_of_type_ComTencentMobileqqEmoticonviewSystemEmoticonPanel = new SystemAndEmojiEmoticonPanel(paramContext, localSnf);
      return;
    }
    jdField_a_of_type_ComTencentMobileqqEmoticonviewSystemEmoticonPanel = new SystemEmoticonPanel(paramContext, localSnf);
  }
  
  public void a(String paramString)
  {
    if (paramString != null) {
      jdField_a_of_type_AndroidWidgetEditText.setText(paramString);
    }
  }
  
  public void b(int paramInt)
  {
    if (jdField_a_of_type_AndroidWidgetEditText != null) {
      jdField_a_of_type_AndroidWidgetEditText.setFilters(new InputFilter[] { new InputFilter.LengthFilter(paramInt) });
    }
  }
  
  public EditText getEditText()
  {
    return jdField_a_of_type_AndroidWidgetEditText;
  }
  
  public String getInputValue()
  {
    return jdField_a_of_type_AndroidWidgetEditText.getText().toString();
  }
  
  public void onClick(View paramView)
  {
    if (paramView.getId() == 2131297759)
    {
      if (jdField_a_of_type_ComTencentMobileqqEmoticonviewSystemEmoticonPanel != null)
      {
        if (jdField_a_of_type_ComTencentMobileqqEmoticonviewSystemEmoticonPanel.getVisibility() == 0)
        {
          jdField_a_of_type_ComTencentMobileqqEmoticonviewSystemEmoticonPanel.setVisibility(8);
          jdField_a_of_type_AndroidWidgetImageView.setImageResource(2130841586);
          jdField_a_of_type_AndroidOsHandler.postDelayed(new sng(this), 200L);
        }
      }
      else {
        return;
      }
      InputMethodUtil.b(jdField_a_of_type_AndroidWidgetEditText);
      jdField_a_of_type_AndroidWidgetImageView.setImageResource(2130841587);
      jdField_a_of_type_AndroidOsHandler.postDelayed(new snh(this), 200L);
      return;
    }
    if ((jdField_a_of_type_ComTencentMobileqqEmoticonviewSystemEmoticonPanel != null) && (jdField_a_of_type_ComTencentMobileqqEmoticonviewSystemEmoticonPanel.getVisibility() == 0)) {
      jdField_a_of_type_ComTencentMobileqqEmoticonviewSystemEmoticonPanel.setVisibility(8);
    }
    for (;;)
    {
      jdField_a_of_type_AndroidWidgetImageView.setImageResource(2130841586);
      return;
      InputMethodUtil.b(jdField_a_of_type_AndroidWidgetEditText);
    }
  }
  
  public void setContentView(int paramInt)
  {
    super.setContentView(paramInt);
    Object localObject = (RelativeLayout)findViewById(2131297735);
    paramInt = 0;
    while (paramInt < ((RelativeLayout)localObject).getChildCount())
    {
      ((RelativeLayout)localObject).getChildAt(paramInt).setOnClickListener(this);
      paramInt += 1;
    }
    jdField_a_of_type_AndroidWidgetEditText = ((EditText)findViewById(2131297345));
    jdField_a_of_type_AndroidWidgetImageView = ((ImageView)findViewById(2131297759));
    jdField_a_of_type_AndroidWidgetImageView.setOnClickListener(this);
    jdField_a_of_type_AndroidWidgetEditText.setEditableFactory(QQTextBuilder.a);
    jdField_a_of_type_AndroidWidgetEditText.setSingleLine(false);
    jdField_a_of_type_AndroidWidgetEditText.setOnTouchListener(new sne(this));
    localObject = Build.MODEL;
    localObject = (Context)jdField_a_of_type_JavaLangRefSoftReference.get();
    if (localObject == null) {
      return;
    }
    DeviceLib.a((Context)localObject, jdField_a_of_type_AndroidWidgetEditText);
    a((Context)localObject);
    jdField_a_of_type_ComTencentMobileqqEmoticonviewSystemEmoticonPanel.setBackgroundResource(2130837543);
    localObject = new RelativeLayout.LayoutParams(-1, (int)(getResourcesgetDisplayMetricsdensity * 150.0F));
    ((FrameLayout)findViewById(2131297760)).addView(jdField_a_of_type_ComTencentMobileqqEmoticonviewSystemEmoticonPanel, (ViewGroup.LayoutParams)localObject);
    jdField_a_of_type_ComTencentMobileqqEmoticonviewSystemEmoticonPanel.setVisibility(8);
  }
}
