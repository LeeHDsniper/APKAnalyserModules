package com.tencent.mobileqq.activity.qqcard;

import android.content.Intent;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout.LayoutParams;
import android.widget.TextView;
import com.tencent.image.URLDrawable;
import com.tencent.image.URLDrawableDownListener;
import com.tencent.image.URLImageView;
import com.tencent.mobileqq.activity.QQBrowserActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.transfile.URLDrawableHelper;
import com.tencent.mobileqq.utils.DeviceInfoUtil;
import com.tencent.mobileqq.widget.ADView;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.ActionSheet;
import com.tencent.widget.ActionSheet.OnButtonClickListener;
import cooperation.qqwifi.VacContentServlet;
import java.util.ArrayList;
import java.util.List;
import mcl;
import mqq.app.NewIntent;
import mqq.observer.BusinessObserver;
import org.json.JSONArray;
import org.json.JSONObject;

public class QQCardHeader
  implements View.OnClickListener, ActionSheet.OnButtonClickListener, BusinessObserver
{
  public static final String a;
  int jdField_a_of_type_Int = 0;
  View jdField_a_of_type_AndroidViewView;
  ImageView jdField_a_of_type_AndroidWidgetImageView;
  TextView jdField_a_of_type_AndroidWidgetTextView;
  private URLDrawableDownListener jdField_a_of_type_ComTencentImageURLDrawableDownListener = new mcl(this);
  private QQCardActivity jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardActivity;
  private QQCardManager jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardManager;
  private QQAppInterface jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
  public ADView a;
  ActionSheet jdField_a_of_type_ComTencentWidgetActionSheet;
  List jdField_a_of_type_JavaUtilList = new ArrayList();
  NewIntent jdField_a_of_type_MqqAppNewIntent;
  JSONArray jdField_a_of_type_OrgJsonJSONArray;
  View b;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaLangString = QQCardHeader.class.getSimpleName();
  }
  
  public QQCardHeader(QQCardActivity paramQQCardActivity, View paramView)
  {
    jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardActivity = paramQQCardActivity;
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = app;
    jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardManager = ((QQCardManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(116));
    jdField_a_of_type_AndroidWidgetImageView = rightViewImg;
    jdField_a_of_type_ComTencentMobileqqWidgetADView = ((ADView)paramView.findViewById(2131302628));
    jdField_a_of_type_AndroidViewView = paramView.findViewById(2131302626);
    jdField_a_of_type_AndroidWidgetTextView = ((TextView)jdField_a_of_type_AndroidViewView.findViewById(2131301038));
    b = jdField_a_of_type_AndroidViewView.findViewById(2131302627);
    jdField_a_of_type_MqqAppNewIntent = new NewIntent(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication(), VacContentServlet.class);
    jdField_a_of_type_MqqAppNewIntent.putExtra("content_id", 8);
    jdField_a_of_type_MqqAppNewIntent.setObserver(this);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.startServlet(jdField_a_of_type_MqqAppNewIntent);
  }
  
  public void OnClick(View paramView, int paramInt)
  {
    try
    {
      paramView = (JSONObject)jdField_a_of_type_JavaUtilList.get(paramInt);
      Intent localIntent;
      if ("附近卡券".equals(paramView.getString("menu_title")))
      {
        localIntent = new Intent(jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardActivity, NearbyQQCardActivity.class);
        jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardActivity.startActivity(localIntent);
      }
      for (;;)
      {
        if (paramView.has("report_id")) {
          jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardManager.a(paramView.getString("report_id"), 0);
        }
        jdField_a_of_type_ComTencentWidgetActionSheet.dismiss();
        return;
        localIntent = new Intent(jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardActivity, QQBrowserActivity.class);
        localIntent.putExtra("url", paramView.getString("jump_url"));
        jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardActivity.startActivity(localIntent);
      }
      return;
    }
    catch (Exception paramView)
    {
      if (QLog.isColorLevel()) {
        QLog.e(jdField_a_of_type_JavaLangString, 2, "", paramView);
      }
    }
  }
  
  public void a()
  {
    Object localObject = VacContentServlet.a("qqcard");
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "initBannerAndTip, " + (String)localObject);
    }
    if (TextUtils.isEmpty((CharSequence)localObject)) {}
    do
    {
      for (;;)
      {
        return;
        try
        {
          localObject = new JSONObject((String)localObject);
          if (((JSONObject)localObject).has("cornerMenu"))
          {
            jdField_a_of_type_OrgJsonJSONArray = ((JSONObject)localObject).getJSONArray("cornerMenu");
            if (jdField_a_of_type_OrgJsonJSONArray.length() > 0)
            {
              jdField_a_of_type_AndroidWidgetImageView.setContentDescription("菜单");
              jdField_a_of_type_AndroidWidgetImageView.setVisibility(0);
              jdField_a_of_type_AndroidWidgetImageView.setImageResource(2130838440);
              jdField_a_of_type_AndroidWidgetImageView.setOnClickListener(this);
            }
          }
          if (((JSONObject)localObject).has("tip"))
          {
            localObject = ((JSONObject)localObject).getJSONObject("tip");
            int i = ((JSONObject)localObject).getInt("end_time");
            int j = ((JSONObject)localObject).getInt("start_time");
            long l = System.currentTimeMillis() / 1000L;
            if ((i != 0) && (l < i) && (l > j))
            {
              i = ((JSONObject)localObject).getInt("id");
              if (!jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardManager.a(i))
              {
                jdField_a_of_type_AndroidWidgetTextView.setText(((JSONObject)localObject).getString("text"));
                jdField_a_of_type_AndroidViewView.setVisibility(0);
                jdField_a_of_type_AndroidViewView.setOnClickListener(this);
                jdField_a_of_type_AndroidViewView.setTag(localObject);
                return;
              }
            }
          }
        }
        catch (Exception localException) {}
      }
    } while (!QLog.isColorLevel());
    QLog.e(jdField_a_of_type_JavaLangString, 2, "", localException);
  }
  
  public boolean a()
  {
    return jdField_a_of_type_Int == 1;
  }
  
  protected void b()
  {
    if (jdField_a_of_type_MqqAppNewIntent != null) {
      jdField_a_of_type_MqqAppNewIntent.setObserver(null);
    }
  }
  
  public void onClick(View paramView)
  {
    switch (paramView.getId())
    {
    }
    do
    {
      return;
      paramView = (String)paramView.getTag();
      jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardActivity.a(paramView);
      return;
      paramView = (JSONObject)paramView.getTag();
      try
      {
        jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardManager.a(paramView.getInt("id"), true);
        paramView = paramView.getString("url");
        if (!TextUtils.isEmpty(paramView)) {
          jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardActivity.a(paramView);
        }
        jdField_a_of_type_AndroidViewView.setVisibility(8);
        return;
      }
      catch (Exception paramView)
      {
        for (;;)
        {
          if (QLog.isColorLevel()) {
            QLog.e(jdField_a_of_type_JavaLangString, 2, "", paramView);
          }
        }
      }
    } while (((jdField_a_of_type_ComTencentWidgetActionSheet != null) && (jdField_a_of_type_ComTencentWidgetActionSheet.isShowing())) || (jdField_a_of_type_OrgJsonJSONArray == null) || (jdField_a_of_type_OrgJsonJSONArray.length() <= 0));
    jdField_a_of_type_ComTencentWidgetActionSheet = ActionSheet.c(jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardActivity);
    int i = 0;
    try
    {
      while (i < jdField_a_of_type_OrgJsonJSONArray.length())
      {
        paramView = jdField_a_of_type_OrgJsonJSONArray.getJSONObject(i);
        jdField_a_of_type_JavaUtilList.add(paramView);
        jdField_a_of_type_ComTencentWidgetActionSheet.c(paramView.getString("menu_title"));
        jdField_a_of_type_ComTencentWidgetActionSheet.a(this);
        i += 1;
      }
      jdField_a_of_type_ComTencentWidgetActionSheet.d(jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardActivity.getString(2131366996));
    }
    catch (Exception paramView)
    {
      for (;;)
      {
        if (QLog.isColorLevel()) {
          QLog.e(jdField_a_of_type_JavaLangString, 2, "", paramView);
        }
      }
    }
    jdField_a_of_type_ComTencentWidgetActionSheet.show();
  }
  
  public void onReceive(int paramInt, boolean paramBoolean, Bundle paramBundle)
  {
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "onReceive, " + paramInt + ", " + paramBoolean);
    }
    if (!paramBoolean) {
      return;
    }
    paramBundle = paramBundle.getString("key_data");
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "onReceive, json=" + paramBundle);
    }
    for (;;)
    {
      long l;
      Object localObject;
      int i;
      try
      {
        l = System.currentTimeMillis() / 1000L;
        paramBundle = new JSONObject(paramBundle);
        if (!paramBundle.has("banner")) {
          break label391;
        }
        localObject = paramBundle.getJSONArray("banner");
        Drawable localDrawable = jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardActivity.getResources().getDrawable(2130838245);
        paramInt = 0;
        if (paramInt >= ((JSONArray)localObject).length()) {
          break label364;
        }
        JSONObject localJSONObject = ((JSONArray)localObject).getJSONObject(paramInt);
        i = localJSONObject.getInt("end_time");
        int j = localJSONObject.getInt("start_time");
        if ((l >= i) || (l <= j)) {
          break label738;
        }
        FrameLayout localFrameLayout = (FrameLayout)jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardActivity.getLayoutInflater().inflate(2130904425, null);
        URLImageView localURLImageView = (URLImageView)localFrameLayout.findViewById(2131296302);
        URLDrawable localURLDrawable = URLDrawableHelper.a(localJSONObject.getString("img_url"), localDrawable, localDrawable);
        if (localURLDrawable.getStatus() == 1)
        {
          i = (int)(localURLDrawable.getIntrinsicHeight() / localURLDrawable.getIntrinsicWidth() * (float)DeviceInfoUtil.f() + 0.5F);
          jdField_a_of_type_ComTencentMobileqqWidgetADView.getLayoutParams()).height = i;
          localURLImageView.setImageDrawable(localURLDrawable);
          localURLImageView.setTag(localJSONObject.getString("jump_url"));
          localURLImageView.setOnClickListener(this);
          jdField_a_of_type_ComTencentMobileqqWidgetADView.a(localFrameLayout, paramInt);
          break label738;
        }
        localURLImageView.setURLDrawableDownListener(jdField_a_of_type_ComTencentImageURLDrawableDownListener);
        continue;
        if (!QLog.isColorLevel()) {
          break;
        }
      }
      catch (Exception paramBundle) {}
      QLog.e(jdField_a_of_type_JavaLangString, 2, "", paramBundle);
      return;
      label364:
      if (paramInt > 0)
      {
        jdField_a_of_type_ComTencentMobileqqWidgetADView.setVisibility(0);
        jdField_a_of_type_ComTencentMobileqqWidgetADView.setCircle(true);
        jdField_a_of_type_ComTencentMobileqqWidgetADView.b();
        label391:
        if (!paramBundle.has("cornerMenu")) {
          break label678;
        }
        jdField_a_of_type_OrgJsonJSONArray = paramBundle.getJSONArray("cornerMenu");
        if (jdField_a_of_type_OrgJsonJSONArray.length() <= 0) {
          break label642;
        }
        jdField_a_of_type_AndroidWidgetImageView.setContentDescription("菜单");
        jdField_a_of_type_AndroidWidgetImageView.setVisibility(0);
        jdField_a_of_type_AndroidWidgetImageView.setImageResource(2130838440);
        jdField_a_of_type_AndroidWidgetImageView.setOnClickListener(this);
        label455:
        if (!paramBundle.has("tip")) {
          break label726;
        }
        localObject = paramBundle.getJSONObject("tip");
        paramInt = ((JSONObject)localObject).getInt("end_time");
        i = ((JSONObject)localObject).getInt("start_time");
        if ((paramInt == 0) || (l >= paramInt) || (l <= i)) {
          break label714;
        }
        paramInt = ((JSONObject)localObject).getInt("id");
        if (!jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardManager.a(paramInt))
        {
          jdField_a_of_type_AndroidWidgetTextView.setText(((JSONObject)localObject).getString("text"));
          jdField_a_of_type_AndroidViewView.setVisibility(0);
          jdField_a_of_type_AndroidViewView.setOnClickListener(this);
          jdField_a_of_type_AndroidViewView.setTag(localObject);
        }
      }
      for (;;)
      {
        if (!paramBundle.has("switch")) {
          break label736;
        }
        jdField_a_of_type_Int = paramBundle.getJSONObject("switch").getInt("is_recommend_open");
        if ((!jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardActivity.b) || (jdField_a_of_type_Int != 1)) {
          break;
        }
        jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardActivity.a.a();
        return;
        jdField_a_of_type_ComTencentMobileqqWidgetADView.setVisibility(8);
        break label391;
        label642:
        jdField_a_of_type_AndroidWidgetImageView.setVisibility(8);
        if ((jdField_a_of_type_ComTencentWidgetActionSheet == null) || (!jdField_a_of_type_ComTencentWidgetActionSheet.isShowing())) {
          break label455;
        }
        jdField_a_of_type_ComTencentWidgetActionSheet.dismiss();
        break label455;
        label678:
        jdField_a_of_type_AndroidWidgetImageView.setVisibility(8);
        if ((jdField_a_of_type_ComTencentWidgetActionSheet == null) || (!jdField_a_of_type_ComTencentWidgetActionSheet.isShowing())) {
          break label455;
        }
        jdField_a_of_type_ComTencentWidgetActionSheet.dismiss();
        break label455;
        label714:
        jdField_a_of_type_AndroidViewView.setVisibility(8);
        continue;
        label726:
        jdField_a_of_type_AndroidViewView.setVisibility(8);
      }
      label736:
      break;
      label738:
      paramInt += 1;
    }
  }
}
