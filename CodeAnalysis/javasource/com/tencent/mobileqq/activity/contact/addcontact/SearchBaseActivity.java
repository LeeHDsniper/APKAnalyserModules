package com.tencent.mobileqq.activity.contact.addcontact;

import android.content.Intent;
import android.content.res.Resources;
import android.os.Bundle;
import android.os.Handler;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.text.InputFilter;
import android.text.InputFilter.LengthFilter;
import android.view.Window;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.ImageView;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.regex.Pattern;
import lqo;
import lqp;
import lqq;
import lqr;
import lqs;

public class SearchBaseActivity
  extends FragmentActivity
{
  public static final String a = "from_key";
  public static final Pattern a;
  public static final int b = 0;
  public static final String b = "last_key_words";
  public static final Pattern b = Pattern.compile("[^0-9]");
  public static final int c = 1;
  public static final String c = "start_search_key";
  public static final Pattern c = Pattern.compile("^1[0-9]{2}\\d{8}$");
  public static final int d = 2;
  public static final int e = 3;
  public static final int f = 4;
  public static final int g = 5;
  public final int a;
  private Handler jdField_a_of_type_AndroidOsHandler = new lqs(this);
  public Button a;
  public EditText a;
  public ImageButton a;
  ImageView jdField_a_of_type_AndroidWidgetImageView;
  public SearchBaseFragment a;
  protected String d;
  protected int h;
  protected int i;
  private int j;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaUtilRegexPattern = Pattern.compile("^[_a-z0-9-]+(\\.[_a-z0-9-]+)*@[a-z0-9-]+(\\.[a-z0-9-]+)*(\\.[a-z]{2,3})$", 2);
  }
  
  public SearchBaseActivity()
  {
    jdField_a_of_type_Int = 64;
  }
  
  public int a()
  {
    return j;
  }
  
  protected SearchBaseFragment a()
  {
    return new SearchBaseFragment();
  }
  
  protected void a()
  {
    jdField_a_of_type_AndroidWidgetButton = ((Button)findViewById(2131300492));
    jdField_a_of_type_AndroidWidgetButton.setTextColor(getResources().getColor(2131428179));
    jdField_a_of_type_AndroidWidgetButton.setOnClickListener(new lqo(this));
    if (AppSetting.i) {
      jdField_a_of_type_AndroidWidgetButton.setContentDescription(jdField_a_of_type_AndroidWidgetButton.getText());
    }
    jdField_a_of_type_AndroidWidgetEditText = ((EditText)findViewById(2131300511));
    jdField_a_of_type_AndroidWidgetEditText.setHint(getResources().getString(2131368322));
    jdField_a_of_type_AndroidWidgetEditText.setFilters(new InputFilter[] { new InputFilter.LengthFilter(64) });
    jdField_a_of_type_AndroidWidgetEditText.setTextSize(0, getResources().getDimension(2131492920));
    jdField_a_of_type_AndroidWidgetEditText.setImeOptions(3);
    jdField_a_of_type_AndroidWidgetEditText.setSingleLine();
    jdField_a_of_type_AndroidWidgetEditText.setOnEditorActionListener(new lqp(this));
    jdField_a_of_type_AndroidWidgetImageButton = ((ImageButton)findViewById(2131300496));
    jdField_a_of_type_AndroidWidgetImageButton.setOnClickListener(new lqq(this));
    jdField_a_of_type_AndroidWidgetImageView = ((ImageView)findViewById(2131301989));
    if (AppSetting.i) {
      jdField_a_of_type_AndroidWidgetImageView.setContentDescription("返回");
    }
    jdField_a_of_type_AndroidWidgetImageView.setOnClickListener(new lqr(this));
  }
  
  protected void b()
  {
    Intent localIntent = getIntent();
    if (localIntent.hasExtra("from_key"))
    {
      h = localIntent.getIntExtra("from_key", 0);
      d = localIntent.getStringExtra("last_key_words");
      j = localIntent.getIntExtra("jump_src_key", 1);
    }
    if (localIntent.hasExtra("fromType")) {
      i = localIntent.getIntExtra("fromType", -1);
    }
  }
  
  protected boolean doOnCreate(Bundle paramBundle)
  {
    mNeedStatusTrans = false;
    super.doOnCreate(paramBundle);
    setContentView(2130904261);
    super.getWindow().setBackgroundDrawable(null);
    b();
    a();
    jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchBaseFragment = a();
    paramBundle = new Bundle();
    paramBundle.putInt("from_key", h);
    paramBundle.putString("last_key_words", d);
    paramBundle.putString("start_search_key", getIntent().getStringExtra("start_search_key"));
    jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchBaseFragment.setArguments(paramBundle);
    jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchBaseFragment.a(jdField_a_of_type_AndroidOsHandler);
    paramBundle = getSupportFragmentManager().beginTransaction();
    paramBundle.replace(2131297781, jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchBaseFragment);
    paramBundle.commit();
    return true;
  }
  
  protected void doOnDestroy()
  {
    super.doOnDestroy();
    ViewFactory.a().a();
  }
  
  protected void doOnResume()
  {
    super.doOnResume();
    setContentBackgroundResource(2130837739);
  }
  
  protected void requestWindowFeature(Intent paramIntent)
  {
    requestWindowFeature(1);
  }
}
