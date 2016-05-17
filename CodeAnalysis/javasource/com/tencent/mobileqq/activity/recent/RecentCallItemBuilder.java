package com.tencent.mobileqq.activity.recent;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnLongClickListener;
import android.view.View.OnTouchListener;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import com.tencent.av.gaudio.AVPhoneUserInfo;
import com.tencent.av.gaudio.AVPhoneUserInfo.TelInfo;
import com.tencent.av.utils.PstnUtils;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.recent.cur.DragFrameLayout.OnDragModeChangedListener;
import com.tencent.mobileqq.activity.recent.data.RecentCallItem;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.PhoneContactHelper;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.PhoneContact;
import com.tencent.mobileqq.data.QCallRecent;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.model.PhoneContactManager;
import com.tencent.mobileqq.qcall.PstnManager;
import com.tencent.mobileqq.util.AccessibilityUtil;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.mobileqq.widget.ShaderAnimLayout;
import com.tencent.qphone.base.util.QLog;
import cooperation.huangye.HuangyeImageUtils;
import java.util.ArrayList;
import java.util.List;
import mgy;

public class RecentCallItemBuilder
  extends RecentItemBaseBuilder
  implements View.OnTouchListener
{
  private int jdField_a_of_type_Int;
  private List jdField_a_of_type_JavaUtilList;
  
  public RecentCallItemBuilder()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Int = 0;
  }
  
  public RecentCallItemBuilder(int paramInt)
  {
    jdField_a_of_type_Int = 0;
    jdField_a_of_type_Int = paramInt;
  }
  
  public View a(int paramInt, Object paramObject, RecentFaceDecoder paramRecentFaceDecoder, View paramView, ViewGroup paramViewGroup, Context paramContext, View.OnClickListener paramOnClickListener, View.OnLongClickListener paramOnLongClickListener, DragFrameLayout.OnDragModeChangedListener paramOnDragModeChangedListener)
  {
    paramOnDragModeChangedListener = null;
    paramViewGroup = paramOnDragModeChangedListener;
    if (paramView != null)
    {
      paramViewGroup = paramOnDragModeChangedListener;
      if ((paramView.getTag() instanceof RecentCallItemBuilder.RecentCallItemBuilderViewHolder)) {
        paramViewGroup = (RecentCallItemBuilder.RecentCallItemBuilderViewHolder)paramView.getTag();
      }
    }
    if (paramViewGroup == null)
    {
      paramViewGroup = new RecentCallItemBuilder.RecentCallItemBuilderViewHolder();
      if (jdField_a_of_type_Int == 1)
      {
        paramView = a(paramContext, 2130904053, paramViewGroup);
        paramView.findViewById(2131299611).setPadding(0, 0, getResourcesgetDisplayMetricswidthPixels * 25 / 360, 0);
        jdField_a_of_type_ComTencentMobileqqWidgetShaderAnimLayout = ((ShaderAnimLayout)paramView.findViewById(2131296705));
        jdField_a_of_type_AndroidWidgetImageView = ((ImageView)paramView.findViewById(2131296683));
        jdField_a_of_type_AndroidWidgetTextView = ((TextView)paramView.findViewById(2131301068));
        jdField_e_of_type_AndroidWidgetTextView = ((TextView)paramView.findViewById(2131301069));
        jdField_b_of_type_AndroidWidgetTextView = ((TextView)paramView.findViewById(2131297636));
        jdField_b_of_type_AndroidWidgetTextView.setMaxWidth(getResourcesgetDisplayMetricswidthPixels * 145 / 360);
        jdField_b_of_type_AndroidWidgetImageView = ((ImageView)paramView.findViewById(2131301074));
        jdField_c_of_type_AndroidWidgetTextView = ((TextView)paramView.findViewById(2131301076));
        jdField_d_of_type_AndroidWidgetTextView = ((TextView)paramView.findViewById(16908309));
        jdField_c_of_type_AndroidWidgetImageView = ((ImageView)paramView.findViewById(2131301071));
        f = ((TextView)paramView.findViewById(2131301072));
        jdField_e_of_type_AndroidWidgetImageView = ((ImageView)paramView.findViewById(2131301075));
        jdField_d_of_type_AndroidWidgetImageView = ((ImageView)paramView.findViewById(2131301070));
        paramView.setTag(paramViewGroup);
      }
    }
    for (;;)
    {
      if (AppSetting.i) {
        paramView.setContentDescription(null);
      }
      if ((paramObject instanceof RecentBaseData))
      {
        RecentBaseData localRecentBaseData = (RecentBaseData)paramObject;
        paramOnDragModeChangedListener = null;
        if (paramRecentFaceDecoder != null)
        {
          if ((jdField_a_of_type_ComTencentMobileqqActivityRecentRecentAdapter.a() == 4) && ((localRecentBaseData instanceof RecentCallItem)) && (localRecentBaseData.a() == 3000)) {
            jdField_a_of_type_Boolean = true;
          }
          paramOnDragModeChangedListener = paramRecentFaceDecoder.a(localRecentBaseData);
        }
        a(paramView, localRecentBaseData, paramContext, paramOnDragModeChangedListener);
      }
      for (;;)
      {
        a(paramContext, paramView, paramInt, paramObject, paramViewGroup, paramOnClickListener);
        jdField_c_of_type_AndroidWidgetImageView.setOnClickListener(paramOnClickListener);
        jdField_c_of_type_AndroidWidgetImageView.setOnTouchListener(this);
        jdField_c_of_type_AndroidWidgetImageView.setTag(-1, Integer.valueOf(paramInt));
        jdField_d_of_type_AndroidWidgetImageView.setOnClickListener(paramOnClickListener);
        jdField_d_of_type_AndroidWidgetImageView.setOnLongClickListener(paramOnLongClickListener);
        jdField_d_of_type_AndroidWidgetImageView.setTag(-1, Integer.valueOf(paramInt));
        jdField_d_of_type_AndroidWidgetImageView.setTag(paramView);
        jdField_d_of_type_AndroidWidgetImageView.setOnTouchListener(new mgy(this));
        paramView.setOnClickListener(paramOnClickListener);
        paramView.setOnLongClickListener(paramOnLongClickListener);
        paramView.setTag(-1, Integer.valueOf(paramInt));
        return paramView;
        paramView = a(paramContext, 2130904049, paramViewGroup);
        break;
        jdField_a_of_type_ComTencentMobileqqWidgetShaderAnimLayout.setVisibility(8);
        jdField_b_of_type_AndroidWidgetTextView.setText("");
        jdField_e_of_type_AndroidWidgetTextView.setText("");
        jdField_c_of_type_AndroidWidgetTextView.setVisibility(8);
        jdField_d_of_type_AndroidWidgetTextView.setText("");
        jdField_b_of_type_AndroidWidgetImageView.setVisibility(8);
        jdField_d_of_type_AndroidWidgetImageView.setVisibility(8);
      }
    }
  }
  
  public List a(RecentBaseData paramRecentBaseData, Context paramContext)
  {
    paramRecentBaseData = paramContext.getResources();
    if (jdField_a_of_type_JavaUtilList == null) {
      jdField_a_of_type_JavaUtilList = new ArrayList();
    }
    for (;;)
    {
      jdField_a_of_type_JavaUtilList.add(paramRecentBaseData.getString(2131368024));
      return jdField_a_of_type_JavaUtilList;
      jdField_a_of_type_JavaUtilList.clear();
    }
  }
  
  public void a(View paramView, Drawable paramDrawable)
  {
    if ((paramView == null) || (paramDrawable == null)) {}
    do
    {
      do
      {
        return;
        paramView = paramView.getTag();
      } while (!(paramView instanceof RecentCallItemBuilder.RecentCallItemBuilderViewHolder));
      paramView = (RecentCallItemBuilder.RecentCallItemBuilderViewHolder)paramView;
    } while (jdField_a_of_type_AndroidWidgetImageView == null);
    jdField_a_of_type_AndroidWidgetImageView.setImageDrawable(paramDrawable);
  }
  
  public void a(View paramView, RecentBaseData paramRecentBaseData)
  {
    if ((paramView == null) || (paramRecentBaseData == null)) {}
    RecentCallItemBuilder.RecentCallItemBuilderViewHolder localRecentCallItemBuilderViewHolder;
    do
    {
      do
      {
        return;
        paramView = paramView.getTag();
      } while (!(paramView instanceof RecentCallItemBuilder.RecentCallItemBuilderViewHolder));
      localRecentCallItemBuilderViewHolder = (RecentCallItemBuilder.RecentCallItemBuilderViewHolder)paramView;
    } while (jdField_b_of_type_AndroidWidgetTextView == null);
    paramView = a;
    if (((paramRecentBaseData instanceof RecentCallItem)) && (((RecentCallItem)paramRecentBaseData).b())) {
      paramView = ContactUtils.e(jdField_a_of_type_ComTencentMobileqqActivityRecentRecentAdapter.a, paramRecentBaseData.a());
    }
    for (;;)
    {
      jdField_b_of_type_AndroidWidgetTextView.setText(paramView);
      return;
    }
  }
  
  public void a(View paramView, RecentBaseData paramRecentBaseData, Context paramContext, Drawable paramDrawable)
  {
    if ((paramView == null) || (paramRecentBaseData == null))
    {
      if (QLog.isColorLevel()) {
        QLog.i("Q.recent", 2, "bindView|param invalidate");
      }
      return;
    }
    Object localObject1 = paramView.getTag();
    if ((localObject1 instanceof RecentCallItemBuilder.RecentCallItemBuilderViewHolder)) {}
    for (RecentCallItemBuilder.RecentCallItemBuilderViewHolder localRecentCallItemBuilderViewHolder = (RecentCallItemBuilder.RecentCallItemBuilderViewHolder)localObject1;; localRecentCallItemBuilderViewHolder = null)
    {
      if (localRecentCallItemBuilderViewHolder == null)
      {
        if (!QLog.isColorLevel()) {
          break;
        }
        QLog.i("Q.recent", 2, "bindView|holder is null, tag = " + localObject1);
        return;
      }
      jdField_a_of_type_AndroidWidgetImageView.setImageDrawable(paramDrawable);
      int m = I;
      localObject1 = (RecentCallItem)paramRecentBaseData;
      long l = jdField_a_of_type_Long;
      if (QLog.isColorLevel()) {
        QLog.d("RecentCallItemBuilder", 2, "zswzsw number = " + l);
      }
      Object localObject2 = ((RecentCallItem)localObject1).a();
      label252:
      int j;
      int i;
      if ((type == 56938) || (type == 3) || (type == 4) || (type == 5) || (type == 2016))
      {
        jdField_a_of_type_AndroidWidgetImageView.setImageResource(2130838859);
        if (jdField_a_of_type_AndroidWidgetTextView != null)
        {
          jdField_a_of_type_AndroidWidgetTextView.setVisibility(0);
          if (a != null) {
            jdField_a_of_type_AndroidWidgetTextView.setText(ContactUtils.d(a));
          }
        }
        if (m != 0) {
          break label1103;
        }
        j = H;
        i = 2130840305;
      }
      for (;;)
      {
        label268:
        int k = i;
        if (l > 0L)
        {
          k = i;
          if (m != 3) {
            k = 2130840308;
          }
        }
        if (m == 6)
        {
          k = 2130840308;
          label306:
          if (k != 0) {
            break label1181;
          }
          jdField_b_of_type_AndroidWidgetImageView.setVisibility(8);
          label321:
          if (m != 0) {
            break label1203;
          }
          i = 2131428240;
          label331:
          paramDrawable = a;
          if ((!(paramRecentBaseData instanceof RecentCallItem)) || (!((RecentCallItem)paramRecentBaseData).b())) {
            break label2146;
          }
          paramDrawable = ContactUtils.e(jdField_a_of_type_ComTencentMobileqqActivityRecentRecentAdapter.a, paramRecentBaseData.a());
        }
        label502:
        label636:
        label644:
        label763:
        label945:
        label1103:
        label1181:
        label1203:
        label1250:
        label1258:
        label1313:
        label1335:
        label1526:
        label1576:
        label1797:
        label1826:
        label1860:
        label1934:
        label1963:
        label2063:
        label2096:
        label2138:
        label2140:
        label2146:
        for (;;)
        {
          localObject1 = jdField_b_of_type_AndroidWidgetTextView.getText();
          if (paramDrawable == null) {
            paramDrawable = "";
          }
          for (;;)
          {
            k = 0;
            if ((jdField_b_of_type_AndroidWidgetTextView.getTag() instanceof Integer)) {
              k = ((Integer)jdField_b_of_type_AndroidWidgetTextView.getTag()).intValue();
            }
            if (k != i)
            {
              jdField_b_of_type_AndroidWidgetTextView.setTextColor(paramContext.getResources().getColorStateList(i));
              jdField_b_of_type_AndroidWidgetTextView.setTag(Integer.valueOf(i));
            }
            if (!paramDrawable.equals(localObject1)) {
              jdField_b_of_type_AndroidWidgetTextView.setText(paramDrawable);
            }
            if ((m == 0) && (j >= 2)) {
              if (j > 99)
              {
                paramDrawable = " [99+]";
                if (!paramDrawable.equals(jdField_e_of_type_AndroidWidgetTextView.getText())) {
                  jdField_e_of_type_AndroidWidgetTextView.setText(paramDrawable);
                }
                paramDrawable = (PstnManager)((QQAppInterface)BaseApplicationImpl.a().a()).getManager(142);
                j = 0;
                i = j;
                if (paramDrawable != null)
                {
                  i = j;
                  if (paramDrawable.a() == 1) {
                    i = 1;
                  }
                }
                localObject1 = null;
                k = 0xF000 & M;
                if ((k != 12288) || (isSystemCall == 1)) {
                  break label1258;
                }
                if (jdField_c_of_type_AndroidWidgetTextView.getVisibility() != 0) {
                  jdField_c_of_type_AndroidWidgetTextView.setVisibility(0);
                }
                if (i == 0) {
                  break label1250;
                }
                j = 2131370749;
                paramDrawable = paramContext.getString(j);
                localObject1 = jdField_c_of_type_AndroidWidgetTextView.getText();
                if (paramDrawable != null) {
                  break label2140;
                }
                paramDrawable = "";
              }
            }
            for (;;)
            {
              if (!paramDrawable.equals(localObject1)) {
                jdField_c_of_type_AndroidWidgetTextView.setText(paramDrawable);
              }
              if ((I == 3) || (l > 0L) || (I == 4) || (I == 5) || (I == 6) || (I == 7))
              {
                if (!TextUtils.isEmpty(g))
                {
                  jdField_c_of_type_AndroidWidgetTextView.setText(g);
                  jdField_c_of_type_AndroidWidgetTextView.setVisibility(0);
                }
              }
              else
              {
                if (i == 0) {
                  break label1797;
                }
                f.setText(b);
                f.setVisibility(0);
                jdField_c_of_type_AndroidWidgetImageView.setImageResource(2130838675);
                jdField_c_of_type_AndroidWidgetImageView.setContentDescription(paramContext.getString(2131363841));
                if ((I != 3) && (l <= 0L)) {
                  break label1335;
                }
                if ((TextUtils.isEmpty(pstnInfo)) || (pstnInfo.equals("[]"))) {
                  break label1313;
                }
                jdField_e_of_type_AndroidWidgetImageView.setVisibility(0);
                paramDrawable = paramContext.getString(2131370789);
              }
              for (;;)
              {
                if (QLog.isColorLevel()) {
                  QLog.d("RecentCallItemBuilder", 2, "item.mAuthenIconId：" + I + ", item.mTitleName:" + a);
                }
                if (isSystemCall == 1)
                {
                  if (i == 0) {
                    break label2096;
                  }
                  paramDrawable = paramContext.getString(2131370801);
                }
                localObject2 = jdField_d_of_type_AndroidWidgetTextView.getText();
                localObject1 = paramDrawable;
                if (paramDrawable == null) {
                  localObject1 = "";
                }
                if (!localObject1.equals(localObject2)) {
                  jdField_d_of_type_AndroidWidgetTextView.setText((CharSequence)localObject1);
                }
                a(localRecentCallItemBuilderViewHolder, paramRecentBaseData, paramContext);
                jdField_a_of_type_ComTencentMobileqqWidgetShaderAnimLayout.setVisibility(8);
                if (!AppSetting.i) {
                  break;
                }
                paramView.setContentDescription(c);
                return;
                if (type == 9502)
                {
                  if (jdField_a_of_type_AndroidWidgetTextView != null) {
                    jdField_a_of_type_AndroidWidgetTextView.setVisibility(8);
                  }
                  HuangyeImageUtils.a(jdField_a_of_type_AndroidWidgetImageView, businessLogo, true, true, a);
                  break label252;
                }
                jdField_a_of_type_AndroidWidgetImageView.setImageDrawable(paramDrawable);
                if (jdField_a_of_type_AndroidWidgetTextView == null) {
                  break label252;
                }
                jdField_a_of_type_AndroidWidgetTextView.setVisibility(8);
                break label252;
                if (m <= 1)
                {
                  i = 2130840294;
                  j = 0;
                  break label268;
                }
                if (m <= 2)
                {
                  i = 2130840299;
                  j = 0;
                  break label268;
                }
                if (m > 3) {
                  break label2149;
                }
                i = 2130840297;
                j = 0;
                break label268;
                if ((m != 5) && (m != 4) && (m != 7)) {
                  break label306;
                }
                k = 2130840297;
                break label306;
                jdField_b_of_type_AndroidWidgetImageView.setVisibility(0);
                jdField_b_of_type_AndroidWidgetImageView.setImageResource(k);
                break label321;
                i = 2131428178;
                break label331;
                paramDrawable = " [" + j + "]";
                break label502;
                paramDrawable = "";
                break label502;
                j = 2131370748;
                break label636;
                paramDrawable = (Drawable)localObject1;
                if (jdField_c_of_type_AndroidWidgetTextView.getVisibility() != 0) {
                  break label644;
                }
                jdField_c_of_type_AndroidWidgetTextView.setVisibility(8);
                paramDrawable = (Drawable)localObject1;
                break label644;
                jdField_c_of_type_AndroidWidgetTextView.setText("");
                jdField_c_of_type_AndroidWidgetTextView.setVisibility(8);
                break label763;
                jdField_e_of_type_AndroidWidgetImageView.setVisibility(8);
                paramDrawable = paramContext.getString(2131370788);
                continue;
                if (I == 4)
                {
                  paramDrawable = paramContext.getString(2131370794);
                  jdField_e_of_type_AndroidWidgetImageView.setVisibility(8);
                }
                else if ((I == 5) || (I == 7))
                {
                  paramDrawable = paramContext.getString(2131370795);
                  if (I == 7) {
                    jdField_e_of_type_AndroidWidgetImageView.setVisibility(0);
                  } else {
                    jdField_e_of_type_AndroidWidgetImageView.setVisibility(8);
                  }
                }
                else if (I == 6)
                {
                  paramDrawable = paramContext.getString(2131370796);
                  jdField_e_of_type_AndroidWidgetImageView.setVisibility(8);
                }
                else
                {
                  if (type != 3000) {
                    break label1526;
                  }
                  if ((!TextUtils.isEmpty(pstnInfo)) && (!pstnInfo.equals("[]")))
                  {
                    jdField_e_of_type_AndroidWidgetImageView.setVisibility(0);
                  }
                  else
                  {
                    jdField_e_of_type_AndroidWidgetImageView.setVisibility(8);
                    paramDrawable = paramContext.getString(2131363339);
                  }
                }
              }
              if (callType == 2) {
                switch (type)
                {
                }
              }
              for (;;)
              {
                jdField_e_of_type_AndroidWidgetImageView.setVisibility(0);
                break;
                paramDrawable = displayName;
                continue;
                paramDrawable = PstnUtils.a(displayName);
                if (paramDrawable != null)
                {
                  paramDrawable = telInfo.mobile;
                }
                else
                {
                  paramDrawable = displayName;
                  continue;
                  if (phoneNumber != null) {
                    localObject1 = phoneNumber;
                  }
                  for (;;)
                  {
                    if (localObject1 == null) {
                      break label2138;
                    }
                    paramDrawable = PhoneContactHelper.a((String)localObject1);
                    break label1576;
                    if ((paramContext instanceof BaseActivity))
                    {
                      localObject1 = ((PhoneContactManager)app.getManager(10)).a(uin);
                      if (localObject1 != null)
                      {
                        localObject1 = mobileNo;
                        continue;
                        if ((callType == 1) && (k != 12288))
                        {
                          if (type == 8)
                          {
                            jdField_e_of_type_AndroidWidgetImageView.setVisibility(0);
                            paramDrawable = "";
                            break;
                          }
                          jdField_e_of_type_AndroidWidgetImageView.setVisibility(8);
                          paramDrawable = paramContext.getString(2131363339);
                          break;
                        }
                        paramDrawable = "";
                        jdField_e_of_type_AndroidWidgetImageView.setVisibility(8);
                        break;
                        f.setVisibility(8);
                        if (type == 8)
                        {
                          jdField_e_of_type_AndroidWidgetImageView.setVisibility(0);
                          if (!((QCallRecent)localObject2).isVideo()) {
                            break label1934;
                          }
                          jdField_c_of_type_AndroidWidgetImageView.setImageResource(2130840779);
                          jdField_c_of_type_AndroidWidgetImageView.setContentDescription(paramContext.getString(2131363840));
                          if ((I != 3) && (l <= 0L)) {
                            break label1963;
                          }
                          localObject1 = paramContext.getString(2131370788);
                          jdField_e_of_type_AndroidWidgetImageView.setVisibility(8);
                        }
                        for (;;)
                        {
                          if (isSystemCall != 1) {
                            break label2063;
                          }
                          jdField_c_of_type_AndroidWidgetImageView.setImageResource(2130841026);
                          paramDrawable = (Drawable)localObject1;
                          break;
                          jdField_e_of_type_AndroidWidgetImageView.setVisibility(8);
                          break label1826;
                          jdField_c_of_type_AndroidWidgetImageView.setImageResource(2130839004);
                          jdField_c_of_type_AndroidWidgetImageView.setContentDescription(paramContext.getString(2131363839));
                          break label1860;
                          if (I == 4)
                          {
                            localObject1 = paramContext.getString(2131370794);
                            jdField_e_of_type_AndroidWidgetImageView.setVisibility(8);
                          }
                          else if (I == 5)
                          {
                            localObject1 = paramContext.getString(2131370795);
                            jdField_e_of_type_AndroidWidgetImageView.setVisibility(8);
                          }
                          else if (I == 6)
                          {
                            localObject1 = paramContext.getString(2131370796);
                            jdField_e_of_type_AndroidWidgetImageView.setVisibility(8);
                          }
                          else
                          {
                            localObject1 = b;
                          }
                        }
                        paramDrawable = (Drawable)localObject1;
                        if (type != 9502) {
                          break;
                        }
                        jdField_c_of_type_AndroidWidgetImageView.setImageResource(2130841026);
                        paramDrawable = (Drawable)localObject1;
                        break;
                        paramDrawable = paramContext.getString(2131370802) + " " + b;
                        break label945;
                      }
                    }
                    localObject1 = null;
                  }
                }
              }
            }
          }
        }
        label2149:
        j = 0;
        i = 0;
      }
    }
  }
  
  protected void a(RecentCallItemBuilder.RecentCallItemBuilderViewHolder paramRecentCallItemBuilderViewHolder, RecentBaseData paramRecentBaseData, Context paramContext)
  {
    if ((paramRecentCallItemBuilderViewHolder == null) || (paramRecentBaseData == null)) {
      return;
    }
    if (P == 0)
    {
      jdField_d_of_type_AndroidWidgetImageView.setVisibility(8);
      return;
    }
    int i;
    switch (F)
    {
    default: 
      i = 0;
      label63:
      AccessibilityUtil.a(jdField_d_of_type_AndroidWidgetImageView);
      if (i == 0) {
        jdField_d_of_type_AndroidWidgetImageView.setVisibility(8);
      }
      break;
    }
    for (;;)
    {
      if (jdField_a_of_type_Int == 1) {
        jdField_d_of_type_AndroidWidgetImageView.setVisibility(8);
      }
      if (!(paramRecentBaseData instanceof RecentCallItem)) {
        break;
      }
      paramContext = (PstnManager)((QQAppInterface)BaseApplicationImpl.a().a()).getManager(142);
      if ((paramContext == null) || (paramContext.a() != 1)) {
        break;
      }
      paramRecentBaseData = ((RecentCallItem)paramRecentBaseData).a();
      if ((paramRecentBaseData == null) || (callType != 2)) {
        break;
      }
      jdField_d_of_type_AndroidWidgetImageView.setVisibility(8);
      return;
      i = 2130840284;
      break label63;
      i = 2130840286;
      break label63;
      i = 2130840290;
      break label63;
      i = 2130840282;
      break label63;
      jdField_d_of_type_AndroidWidgetImageView.setVisibility(0);
      jdField_d_of_type_AndroidWidgetImageView.setImageResource(i);
    }
  }
  
  public boolean onTouch(View paramView, MotionEvent paramMotionEvent)
  {
    paramView.onTouchEvent(paramMotionEvent);
    switch (paramMotionEvent.getAction())
    {
    case 2: 
    default: 
      return true;
    case 0: 
      paramView.setDuplicateParentStateEnabled(false);
      paramView.setPressed(true);
      return true;
    }
    paramView.setDuplicateParentStateEnabled(true);
    paramView.setPressed(false);
    return true;
  }
}
