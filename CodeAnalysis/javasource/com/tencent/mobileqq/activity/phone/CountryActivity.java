package com.tencent.mobileqq.activity.phone;

import android.content.Intent;
import android.content.res.Resources;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.animation.TranslateAnimation;
import android.widget.EditText;
import android.widget.TextView;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.app.IphoneTitleBarActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.util.AccessibilityUtil;
import com.tencent.mobileqq.utils.DisplayUtils;
import com.tencent.mobileqq.widget.IndexView;
import com.tencent.mobileqq.widget.IndexView.OnIndexChangedListener;
import com.tencent.mobileqq.widget.PinnedDividerListView;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Set;
import lyo;
import lyp;
import lyq;
import lyr;
import lys;
import lyt;
import lyv;

public class CountryActivity
  extends IphoneTitleBarActivity
  implements View.OnClickListener, IndexView.OnIndexChangedListener
{
  public static final String a = "k_name";
  public static final String b = "k_code";
  public View a;
  private EditText jdField_a_of_type_AndroidWidgetEditText;
  public IndexView a;
  private PinnedDividerListView jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView;
  public ArrayList a;
  public LinkedHashMap a;
  private lyr jdField_a_of_type_Lyr;
  public lyv a;
  public View b;
  private View c;
  
  public CountryActivity()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaUtilLinkedHashMap = new LinkedHashMap();
  }
  
  public static void a(View paramView, lys paramLys)
  {
    paramView = (lyt)paramView.getTag();
    jdField_a_of_type_AndroidWidgetTextView.setText(b);
    b.setText("+" + c);
    jdField_a_of_type_Lys = paramLys;
  }
  
  private static View b(ViewGroup paramViewGroup, LayoutInflater paramLayoutInflater, boolean paramBoolean)
  {
    paramViewGroup = paramLayoutInflater.inflate(2130903430, paramViewGroup, false);
    if (paramBoolean) {
      paramViewGroup.setPadding(paramViewGroup.getPaddingLeft(), paramViewGroup.getPaddingTop(), (int)DisplayUtils.a(BaseApplicationImpl.a, 40.0F), paramViewGroup.getPaddingBottom());
    }
    paramLayoutInflater = new lyt(null);
    jdField_a_of_type_AndroidWidgetTextView = ((TextView)paramViewGroup.findViewById(2131298530));
    b = ((TextView)paramViewGroup.findViewById(2131298486));
    paramViewGroup.setTag(paramLayoutInflater);
    return paramViewGroup;
  }
  
  public void a(View paramView)
  {
    paramView = (lyt)paramView.getTag();
    if (jdField_a_of_type_Lys != null)
    {
      if ((jdField_a_of_type_Lyv != null) && (jdField_a_of_type_Lyv.isShowing())) {
        jdField_a_of_type_Lyv.dismiss();
      }
      Intent localIntent = new Intent();
      localIntent.putExtra("k_name", jdField_a_of_type_Lys.b);
      localIntent.putExtra("k_code", jdField_a_of_type_Lys.c);
      setResult(-1, localIntent);
      finish();
    }
  }
  
  public void b(String paramString)
  {
    if ("$".equals(paramString))
    {
      jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView.setSelection(0);
      return;
    }
    PinnedDividerListView localPinnedDividerListView = jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView;
    int i = jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView.m();
    localPinnedDividerListView.setSelection(((Integer)jdField_a_of_type_JavaUtilLinkedHashMap.get(paramString)).intValue() + i);
  }
  
  protected boolean doOnCreate(Bundle paramBundle)
  {
    super.doOnCreate(paramBundle);
    setContentView(2130903428);
    String[] arrayOfString1 = getResources().getStringArray(2131230803);
    Object localObject1 = getResources().getStringArray(2131230802);
    String[] arrayOfString2 = getResources().getStringArray(2131230801);
    Object localObject2 = getResources().getStringArray(2131230800);
    paramBundle = new String[arrayOfString1.length + arrayOfString2.length];
    System.arraycopy(arrayOfString2, 0, paramBundle, 0, arrayOfString2.length);
    System.arraycopy(arrayOfString1, 0, paramBundle, arrayOfString2.length, arrayOfString1.length);
    arrayOfString2 = new String[localObject1.length + localObject2.length];
    System.arraycopy(localObject2, 0, arrayOfString2, 0, localObject2.length);
    System.arraycopy(localObject1, 0, arrayOfString2, localObject2.length, localObject1.length);
    int j = paramBundle.length;
    int i = 0;
    while (i < j)
    {
      localObject1 = paramBundle[i];
      jdField_a_of_type_JavaUtilLinkedHashMap.put(localObject1, Integer.valueOf(0));
      i += 1;
    }
    localObject2 = new ArrayList(paramBundle.length);
    paramBundle = "#";
    j = arrayOfString2.length;
    i = 0;
    lys localLys;
    if (i < j)
    {
      localLys = new lys(arrayOfString2[i]);
      localObject1 = a;
      if (paramBundle.equals(localObject1)) {
        break label604;
      }
      ((ArrayList)localObject2).add(new lys((String)localObject1));
      paramBundle = (Bundle)localObject1;
    }
    label599:
    label604:
    for (;;)
    {
      ((ArrayList)localObject2).add(localLys);
      jdField_a_of_type_JavaUtilLinkedHashMap.put(localObject1, Integer.valueOf(((Integer)jdField_a_of_type_JavaUtilLinkedHashMap.get(localObject1)).intValue() + 1));
      i += 1;
      break;
      paramBundle = jdField_a_of_type_JavaUtilLinkedHashMap.keySet().iterator();
      i = 0;
      if (paramBundle.hasNext())
      {
        localObject1 = (String)paramBundle.next();
        j = ((Integer)jdField_a_of_type_JavaUtilLinkedHashMap.get(localObject1)).intValue();
        if (j == 0) {
          break label599;
        }
      }
      for (j = j + i + 1;; j = i)
      {
        jdField_a_of_type_JavaUtilLinkedHashMap.put(localObject1, Integer.valueOf(i));
        i = j;
        break;
        jdField_a_of_type_JavaUtilArrayList = ((ArrayList)localObject2);
        setTitle("选择国家和地区");
        leftView.setText(2131367694);
        jdField_a_of_type_AndroidViewView = ((View)findViewById(2131297322).getParent());
        b = ((View)jdField_a_of_type_AndroidViewView.getParent());
        jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView = ((PinnedDividerListView)findViewById(2131298529));
        c = ((LayoutInflater)getSystemService("layout_inflater")).inflate(2130904750, jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView, false);
        c.setPadding(0, 0, 40, 0);
        c.findViewById(2131300492).setVisibility(8);
        jdField_a_of_type_AndroidWidgetEditText = ((EditText)c.findViewById(2131300511));
        jdField_a_of_type_AndroidWidgetEditText.setFocusableInTouchMode(false);
        jdField_a_of_type_AndroidWidgetEditText.setCursorVisible(false);
        jdField_a_of_type_AndroidWidgetEditText.setOnClickListener(this);
        AccessibilityUtil.c(c);
        jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView.a(c);
        jdField_a_of_type_Lyr = new lyr(this, null);
        jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView.setAdapter(jdField_a_of_type_Lyr);
        jdField_a_of_type_ComTencentMobileqqWidgetIndexView = ((IndexView)findViewById(2131298500));
        jdField_a_of_type_ComTencentMobileqqWidgetIndexView.setIndex(arrayOfString1, true);
        jdField_a_of_type_ComTencentMobileqqWidgetIndexView.setOnIndexChangedListener(this);
        return true;
      }
    }
  }
  
  public void onClick(View paramView)
  {
    if (paramView == jdField_a_of_type_AndroidWidgetEditText)
    {
      jdField_a_of_type_Lyv = new lyv(this, this);
      jdField_a_of_type_Lyv.setCanceledOnTouchOutside(true);
      int i = jdField_a_of_type_AndroidViewView.getHeight();
      paramView = new TranslateAnimation(0.0F, 0.0F, 0.0F, -i);
      paramView.setDuration(300L);
      paramView.setFillAfter(true);
      paramView.setAnimationListener(new lyo(this));
      TranslateAnimation localTranslateAnimation = new TranslateAnimation(0.0F, 0.0F, -i, 0.0F);
      localTranslateAnimation.setDuration(300L);
      localTranslateAnimation.setAnimationListener(new lyp(this, i));
      jdField_a_of_type_Lyv.setOnDismissListener(new lyq(this, i, localTranslateAnimation));
      b.startAnimation(paramView);
      return;
    }
    a(paramView);
  }
}
