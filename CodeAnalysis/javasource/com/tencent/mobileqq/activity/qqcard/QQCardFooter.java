package com.tencent.mobileqq.activity.qqcard;

import QCARD.CouponMobileItem;
import android.app.Dialog;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Handler.Callback;
import android.os.Message;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout.LayoutParams;
import android.widget.TextView;
import com.tencent.image.URLDrawable;
import com.tencent.mobileqq.activity.QQBrowserActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.QQCardHandler;
import com.tencent.mobileqq.app.QQCardObserver;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.transfile.URLDrawableHelper;
import com.tencent.mobileqq.urldrawable.URLDrawableDecodeHandler;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.AbsListView;
import com.tencent.widget.AbsListView.OnScrollListener;
import com.tencent.widget.immersive.ImmersiveUtils;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import mck;

public class QQCardFooter
  implements Handler.Callback, View.OnClickListener, AbsListView.OnScrollListener
{
  public static final int a = 1;
  public static final String a;
  public static final int b = 2;
  public static final int c = 3;
  public static final int d = 4;
  private Dialog jdField_a_of_type_AndroidAppDialog;
  private Resources jdField_a_of_type_AndroidContentResResources;
  private Drawable jdField_a_of_type_AndroidGraphicsDrawableDrawable;
  private Handler jdField_a_of_type_AndroidOsHandler;
  View jdField_a_of_type_AndroidViewView;
  private ViewGroup jdField_a_of_type_AndroidViewViewGroup;
  private QQCardActivity jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardActivity;
  public QQCardManager a;
  private RefreshFooter jdField_a_of_type_ComTencentMobileqqActivityQqcardRefreshFooter;
  private QQAppInterface jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
  QQCardHandler jdField_a_of_type_ComTencentMobileqqAppQQCardHandler;
  QQCardObserver jdField_a_of_type_ComTencentMobileqqAppQQCardObserver = new mck(this);
  public HashMap a;
  List jdField_a_of_type_JavaUtilList = new ArrayList();
  private boolean jdField_a_of_type_Boolean = false;
  private View jdField_b_of_type_AndroidViewView;
  private ViewGroup jdField_b_of_type_AndroidViewViewGroup;
  private String jdField_b_of_type_JavaLangString = null;
  private View c;
  private View d;
  private int e;
  private int f;
  private int g = 1000;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaLangString = QQCardFooter.class.getSimpleName();
  }
  
  public QQCardFooter(QQCardActivity paramQQCardActivity, QQAppInterface paramQQAppInterface, View paramView)
  {
    jdField_a_of_type_JavaUtilHashMap = null;
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardActivity = paramQQCardActivity;
    jdField_a_of_type_AndroidViewView = paramView;
    jdField_a_of_type_AndroidOsHandler = new Handler(this);
    jdField_a_of_type_AndroidContentResResources = paramQQCardActivity.getResources();
    jdField_a_of_type_ComTencentMobileqqAppQQCardHandler = ((QQCardHandler)paramQQAppInterface.a(69));
    jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardManager = ((QQCardManager)paramQQAppInterface.getManager(116));
    jdField_a_of_type_AndroidGraphicsDrawableDrawable = jdField_a_of_type_AndroidContentResResources.getDrawable(2130841259);
    jdField_a_of_type_AndroidViewViewGroup = ((ViewGroup)paramView.findViewById(2131302625));
    c = paramView.findViewById(2131302618);
    jdField_b_of_type_AndroidViewView = paramView.findViewById(2131302623);
    d = paramView.findViewById(2131302622);
    jdField_b_of_type_AndroidViewViewGroup = ((ViewGroup)paramView.findViewById(2131302621));
    jdField_a_of_type_ComTencentMobileqqActivityQqcardRefreshFooter = new RefreshFooter(paramQQCardActivity, paramQQCardActivity, jdField_b_of_type_AndroidViewViewGroup);
    d.setOnClickListener(this);
    paramQQAppInterface.a(jdField_a_of_type_ComTencentMobileqqAppQQCardObserver);
    paramQQAppInterface = LayoutInflater.from(paramQQCardActivity).inflate(2130904426, null);
    jdField_a_of_type_AndroidAppDialog = new Dialog(paramQQCardActivity, 2131558913);
    jdField_a_of_type_AndroidAppDialog.setContentView(paramQQAppInterface);
    jdField_a_of_type_JavaUtilHashMap = new HashMap();
    ImmersiveUtils.a(paramQQCardActivity);
    int i = ImmersiveUtils.b() - ImmersiveUtils.a(paramQQCardActivity) - paramQQCardActivity.getTitleBarHeight();
    e = (i - QQCardConstant.w - QQCardConstant.x - QQCardConstant.v);
    f = (i - QQCardConstant.x - QQCardConstant.v);
  }
  
  private View a(String paramString, int paramInt)
  {
    int j = jdField_a_of_type_JavaUtilList.size();
    int i = 0;
    while (i < j)
    {
      if (paramString.equals(jdField_a_of_type_JavaUtilList.get(i)).card_id))
      {
        paramString = jdField_a_of_type_AndroidViewViewGroup.getChildAt(i);
        if (paramString == null) {
          break;
        }
        paramString = (TextView)paramString.findViewById(2131302629);
        a(paramString, paramInt);
        return paramString;
      }
      i += 1;
    }
    return null;
  }
  
  private List a(List paramList)
  {
    Object localObject1;
    Object localObject2;
    int i;
    if (QLog.isColorLevel())
    {
      localObject1 = jdField_a_of_type_JavaLangString;
      localObject2 = new StringBuilder().append("setData, size=");
      if (paramList == null) {
        break label450;
      }
      i = paramList.size();
    }
    for (;;)
    {
      QLog.d((String)localObject1, 2, i);
      if ((paramList == null) || (paramList.size() < 1))
      {
        jdField_b_of_type_AndroidViewView.setVisibility(8);
        localObject1 = new ArrayList();
        jdField_a_of_type_JavaUtilList.clear();
        jdField_a_of_type_JavaUtilList.addAll(paramList);
        jdField_a_of_type_AndroidViewViewGroup.removeAllViews();
      }
      try
      {
        paramList = jdField_a_of_type_JavaUtilList.iterator();
        while (paramList.hasNext())
        {
          localObject2 = (CouponMobileItem)paramList.next();
          View localView = LayoutInflater.from(jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardActivity).inflate(2130904429, jdField_a_of_type_AndroidViewViewGroup, false);
          LinearLayout.LayoutParams localLayoutParams = new LinearLayout.LayoutParams(-1, -2);
          TextView localTextView1 = (TextView)localView.findViewById(2131302629);
          Object localObject3 = (TextView)localView.findViewById(2131297018);
          TextView localTextView2 = (TextView)localView.findViewById(2131296925);
          ImageView localImageView = (ImageView)localView.findViewById(2131296683);
          StringBuffer localStringBuffer = new StringBuffer();
          if (!TextUtils.isEmpty(distance)) {
            localStringBuffer.append(distance).append("  ");
          }
          localStringBuffer.append(QQCardConstant.a.format(new Date(expire_time * 1000L)));
          if (!TextUtils.isEmpty(from)) {
            localStringBuffer.append("  ").append(from);
          }
          ((TextView)localObject3).setText(title);
          localTextView2.setText(localStringBuffer.toString());
          localObject3 = URLDrawableHelper.a(icon_url, QQCardConstant.t, QQCardConstant.t, jdField_a_of_type_AndroidGraphicsDrawableDrawable, jdField_a_of_type_AndroidGraphicsDrawableDrawable);
          ((URLDrawable)localObject3).setDecodeHandler(URLDrawableDecodeHandler.a);
          localImageView.setImageDrawable((Drawable)localObject3);
          localTextView1.setTag(localObject2);
          localTextView1.setOnClickListener(this);
          a(localTextView1, status);
          if (status == 9) {
            ((List)localObject1).add(localObject2);
          }
          jdField_a_of_type_AndroidViewViewGroup.addView(localView, localLayoutParams);
        }
      }
      catch (IllegalArgumentException paramList)
      {
        if (QLog.isColorLevel()) {
          QLog.e(jdField_a_of_type_JavaLangString, 2, "", paramList);
        }
        return localObject1;
        i = 0;
        continue;
        jdField_b_of_type_AndroidViewView.setVisibility(0);
      }
      catch (Exception paramList)
      {
        label450:
        while (!QLog.isColorLevel()) {}
        QLog.e(jdField_a_of_type_JavaLangString, 2, "", paramList);
      }
    }
    return localObject1;
  }
  
  private void a(CouponMobileItem paramCouponMobileItem, int paramInt)
  {
    paramCouponMobileItem = jdField_a_of_type_AndroidOsHandler.obtainMessage(1, paramCouponMobileItem);
    jdField_a_of_type_AndroidOsHandler.sendMessageDelayed(paramCouponMobileItem, paramInt);
  }
  
  private void a(TextView paramTextView, int paramInt)
  {
    CouponMobileItem localCouponMobileItem;
    if (paramTextView != null)
    {
      localCouponMobileItem = (CouponMobileItem)paramTextView.getTag();
      if (localCouponMobileItem != null) {}
    }
    else
    {
      return;
    }
    status = paramInt;
    switch (paramInt)
    {
    default: 
      paramTextView.setText(jdField_a_of_type_AndroidContentResResources.getString(2131366377));
      paramTextView.setEnabled(false);
      return;
    case 0: 
      paramTextView.setText(jdField_a_of_type_AndroidContentResResources.getString(2131366374));
      return;
    case 9: 
      paramTextView.setText(jdField_a_of_type_AndroidContentResResources.getString(2131366376));
      paramTextView.setEnabled(false);
      return;
    }
    paramTextView.setText(jdField_a_of_type_AndroidContentResResources.getString(2131366375));
    paramTextView.setEnabled(false);
  }
  
  public void a()
  {
    if (!jdField_a_of_type_Boolean)
    {
      jdField_a_of_type_Boolean = true;
      jdField_a_of_type_ComTencentMobileqqAppQQCardHandler.a(0L, 4, 1, null, null);
    }
  }
  
  public void a(int paramInt)
  {
    jdField_a_of_type_ComTencentMobileqqActivityQqcardRefreshFooter.a(paramInt);
  }
  
  public void a(int paramInt, boolean paramBoolean)
  {
    c.setVisibility(paramInt);
    LinearLayout.LayoutParams localLayoutParams;
    if (paramInt == 0)
    {
      localLayoutParams = (LinearLayout.LayoutParams)c.getLayoutParams();
      if (!paramBoolean) {
        break label53;
      }
    }
    label53:
    for (paramInt = e;; paramInt = f)
    {
      height = paramInt;
      c.setLayoutParams(localLayoutParams);
      c.requestLayout();
      return;
    }
  }
  
  public void a(AbsListView paramAbsListView, int paramInt)
  {
    jdField_a_of_type_ComTencentMobileqqActivityQqcardRefreshFooter.a(paramAbsListView, paramInt);
  }
  
  public void a(AbsListView paramAbsListView, int paramInt1, int paramInt2, int paramInt3)
  {
    jdField_a_of_type_ComTencentMobileqqActivityQqcardRefreshFooter.a(paramAbsListView, paramInt1, paramInt2, paramInt3);
  }
  
  public void a(String paramString)
  {
    if (!TextUtils.isEmpty(paramString)) {
      d.setVisibility(0);
    }
    for (;;)
    {
      d.setTag(paramString);
      return;
      d.setVisibility(8);
    }
  }
  
  public void b()
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.b(jdField_a_of_type_ComTencentMobileqqAppQQCardObserver);
  }
  
  public boolean handleMessage(Message paramMessage)
  {
    switch (what)
    {
    }
    for (;;)
    {
      return false;
      paramMessage = (CouponMobileItem)obj;
      if (paramMessage != null)
      {
        jdField_a_of_type_ComTencentMobileqqAppQQCardHandler.b(paramMessage);
        continue;
        if (jdField_a_of_type_AndroidAppDialog.isShowing())
        {
          jdField_a_of_type_AndroidAppDialog.dismiss();
          continue;
          if (!jdField_a_of_type_AndroidAppDialog.isShowing())
          {
            jdField_a_of_type_AndroidAppDialog.show();
            jdField_a_of_type_AndroidOsHandler.sendEmptyMessageDelayed(2, g);
          }
          if (jdField_b_of_type_JavaLangString != null)
          {
            jdField_b_of_type_JavaLangString = null;
            jdField_a_of_type_AndroidOsHandler.sendEmptyMessageDelayed(4, g);
            continue;
            QQToast.a(jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardActivity, 2, jdField_a_of_type_AndroidContentResResources.getString(2131366395), 1).a();
          }
        }
      }
    }
  }
  
  public void onClick(View paramView)
  {
    switch (paramView.getId())
    {
    }
    do
    {
      do
      {
        do
        {
          return;
          localObject = (TextView)paramView;
          paramView = (CouponMobileItem)paramView.getTag();
        } while (paramView == null);
        if (QLog.isColorLevel()) {
          QLog.d(jdField_a_of_type_JavaLangString, 2, "onClick item.status=" + status);
        }
      } while ((status != 0) || (jdField_b_of_type_JavaLangString != null));
      jdField_b_of_type_JavaLangString = card_id;
      a((TextView)localObject, 9);
      jdField_a_of_type_ComTencentMobileqqAppQQCardHandler.a(paramView);
      jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardManager.a("qqcard.click.collectCoupon", 0);
      return;
      paramView = (String)paramView.getTag();
    } while (TextUtils.isEmpty(paramView));
    Object localObject = new Intent(jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardActivity, QQBrowserActivity.class);
    ((Intent)localObject).putExtra("url", paramView);
    jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardActivity.startActivity((Intent)localObject);
    jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardManager.a("cardindex.disable.click", 0);
  }
}
