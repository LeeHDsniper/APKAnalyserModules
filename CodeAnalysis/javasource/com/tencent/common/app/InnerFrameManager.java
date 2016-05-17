package com.tencent.common.app;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewStub;
import android.view.ViewStub.OnInflateListener;
import android.widget.FrameLayout.LayoutParams;
import android.widget.ViewFlipper;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class InnerFrameManager
  extends ViewFlipper
  implements ViewStub.OnInflateListener
{
  private static final int jdField_a_of_type_Int = 0;
  private static final int b = 1;
  public Activity a;
  private Bundle jdField_a_of_type_AndroidOsBundle;
  private QQAppInterface jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = null;
  private Set jdField_a_of_type_JavaUtilSet = new HashSet();
  private boolean jdField_a_of_type_Boolean = false;
  
  public InnerFrameManager(Context paramContext)
  {
    this(paramContext, null);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public InnerFrameManager(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    jdField_a_of_type_AndroidAppActivity = null;
    paramContext = new InnerFrame(paramContext);
    paramContext.setLayoutParams(new FrameLayout.LayoutParams(-1, -1));
    addView(paramContext, 0);
  }
  
  public int a()
  {
    return getDisplayedChild() - 1;
  }
  
  public void a()
  {
    jdField_a_of_type_Boolean = true;
    ((InnerFrame)getChildAt(getDisplayedChild())).a();
  }
  
  public void a(int paramInt)
  {
    jdField_a_of_type_AndroidOsBundle = null;
    a(paramInt, true);
  }
  
  public void a(int paramInt1, int paramInt2, Intent paramIntent)
  {
    Iterator localIterator = jdField_a_of_type_JavaUtilSet.iterator();
    while (localIterator.hasNext()) {
      ((InnerFrame)localIterator.next()).a(paramInt1, paramInt2, paramIntent);
    }
  }
  
  public void a(int paramInt, Bundle paramBundle)
  {
    jdField_a_of_type_AndroidOsBundle = paramBundle;
    a(paramInt, true);
  }
  
  public void a(int paramInt, boolean paramBoolean)
  {
    paramInt += 1;
    if (getDisplayedChild() == paramInt) {
      return;
    }
    if (jdField_a_of_type_Boolean) {
      ((InnerFrame)getChildAt(getDisplayedChild())).b();
    }
    ((InnerFrame)getChildAt(getDisplayedChild())).c();
    getChildAt(paramInt).setVisibility(0);
    if (paramBoolean) {
      if (getDisplayedChild() != 0)
      {
        if (getDisplayedChild() >= paramInt) {
          break label135;
        }
        setInAnimation(jdField_a_of_type_AndroidAppActivity, 2130968626);
        setOutAnimation(jdField_a_of_type_AndroidAppActivity, 2130968627);
      }
    }
    for (;;)
    {
      setDisplayedChild(paramInt);
      ((InnerFrame)getChildAt(paramInt)).b(jdField_a_of_type_AndroidOsBundle);
      if (!jdField_a_of_type_Boolean) {
        break;
      }
      ((InnerFrame)getChildAt(paramInt)).a();
      return;
      label135:
      setInAnimation(jdField_a_of_type_AndroidAppActivity, 2130968622);
      setOutAnimation(jdField_a_of_type_AndroidAppActivity, 2130968623);
      continue;
      setInAnimation(jdField_a_of_type_AndroidAppActivity, 2130968648);
      setOutAnimation(jdField_a_of_type_AndroidAppActivity, 2130968648);
    }
  }
  
  public void a(Activity paramActivity)
  {
    jdField_a_of_type_AndroidAppActivity = paramActivity;
    int j = getChildCount();
    int i = 1;
    while (i < j)
    {
      ((ViewStub)getChildAt(i)).setOnInflateListener(this);
      i += 1;
    }
  }
  
  public void b()
  {
    jdField_a_of_type_Boolean = false;
    ((InnerFrame)getChildAt(getDisplayedChild())).b();
  }
  
  public void c()
  {
    Iterator localIterator = jdField_a_of_type_JavaUtilSet.iterator();
    while (localIterator.hasNext()) {
      ((InnerFrame)localIterator.next()).c();
    }
  }
  
  public void d()
  {
    Iterator localIterator = jdField_a_of_type_JavaUtilSet.iterator();
    while (localIterator.hasNext()) {
      ((InnerFrame)localIterator.next()).d();
    }
  }
  
  public void onInflate(ViewStub paramViewStub, View paramView)
  {
    paramViewStub = (InnerFrame)paramView;
    jdField_a_of_type_JavaUtilSet.add(paramViewStub);
    paramViewStub.setActivity(jdField_a_of_type_AndroidAppActivity);
    paramViewStub.setInnerFrameManager(this);
    paramViewStub.setAppIntf(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
    paramViewStub.a(jdField_a_of_type_AndroidOsBundle);
  }
  
  public void setAppIntf(QQAppInterface paramQQAppInterface)
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    Iterator localIterator = jdField_a_of_type_JavaUtilSet.iterator();
    while (localIterator.hasNext()) {
      ((InnerFrame)localIterator.next()).setAppIntf(paramQQAppInterface);
    }
  }
}
