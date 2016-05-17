package com.tencent.mobileqq.activity.activateFriend;

import android.content.Intent;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.StateListDrawable;
import android.os.Bundle;
import android.os.Looper;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.Window;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.app.IphoneTitleBarActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.activateFriends.ActivateFriendsManager;
import com.tencent.mobileqq.app.activateFriends.ActivateFriendsObserver;
import com.tencent.mobileqq.data.ActivateFriendItem;
import com.tencent.mobileqq.emoticonview.EmoticonCallback;
import com.tencent.mobileqq.emoticonview.EmoticonInfo;
import com.tencent.mobileqq.emoticonview.SystemEmoticonInfo;
import com.tencent.mobileqq.emoticonview.SystemEmoticonPanel;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.text.QQTextBuilder;
import com.tencent.mobileqq.util.Utils;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.widget.QQProgressDialog;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.QLog;
import com.tencent.theme.SkinEngine;
import com.tencent.widget.XPanelContainer;
import com.tencent.widget.XPanelContainer.PanelCallback;
import java.util.ArrayList;
import kpe;
import kpf;
import kpg;
import kph;
import mqq.os.MqqHandler;

public class SendBirthdayWishesActivity
  extends IphoneTitleBarActivity
  implements TextWatcher, View.OnClickListener, EmoticonCallback, XPanelContainer.PanelCallback
{
  public static final String a = "key_msg_type";
  private static final int jdField_b_of_type_Int = 560;
  public static final String b = "key_friend_list";
  private static final int c = 2;
  public static final String c = "key_time_list";
  public static final String d = "key_roam_city";
  private static final String e = "ActivateFriend.SendActivity";
  int jdField_a_of_type_Int;
  View jdField_a_of_type_AndroidViewView;
  Button jdField_a_of_type_AndroidWidgetButton;
  public EditText a;
  public ImageButton a;
  TextView jdField_a_of_type_AndroidWidgetTextView;
  ActivateFriendGrid jdField_a_of_type_ComTencentMobileqqActivityActivateFriendActivateFriendGrid;
  ActivateFriendsManager jdField_a_of_type_ComTencentMobileqqAppActivateFriendsActivateFriendsManager;
  ActivateFriendsObserver jdField_a_of_type_ComTencentMobileqqAppActivateFriendsActivateFriendsObserver;
  QQProgressDialog jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog;
  public XPanelContainer a;
  private Runnable jdField_a_of_type_JavaLangRunnable;
  private MqqHandler jdField_a_of_type_MqqOsMqqHandler;
  boolean jdField_a_of_type_Boolean;
  long[] jdField_a_of_type_ArrayOfLong;
  long[] jdField_b_of_type_ArrayOfLong;
  
  public SendBirthdayWishesActivity()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Int = 1;
    jdField_a_of_type_MqqOsMqqHandler = new MqqHandler(Looper.getMainLooper());
    jdField_a_of_type_ComTencentMobileqqAppActivateFriendsActivateFriendsObserver = new kpf(this);
    jdField_a_of_type_JavaLangRunnable = new kpg(this);
    jdField_a_of_type_Boolean = false;
  }
  
  private void a(int paramInt)
  {
    int i = 0;
    if (jdField_a_of_type_Int == 2)
    {
      if (paramInt != 0) {
        break label49;
      }
      if (jdField_a_of_type_Int != 1) {
        break label43;
      }
      paramInt = 2131371061;
      i = 2;
    }
    for (;;)
    {
      QQToast.a(this, i, paramInt, 1).b(getTitleBarHeight());
      return;
      label43:
      paramInt = 2131371060;
      break;
      label49:
      if (paramInt == 1)
      {
        paramInt = 2131371062;
      }
      else if (paramInt == 2)
      {
        paramInt = 2131371063;
        i = 1;
      }
      else
      {
        paramInt = 0;
      }
    }
  }
  
  private void f()
  {
    setRightHighlightButton(2131366996, new kpe(this));
    Object localObject1;
    if (jdField_a_of_type_Int == 1) {
      if (jdField_a_of_type_ArrayOfLong.length == 1) {
        localObject1 = getString(2131371027);
      }
    }
    for (;;)
    {
      setTitle((CharSequence)localObject1);
      enableRightHighlight(true);
      leftView.setVisibility(8);
      jdField_a_of_type_AndroidWidgetEditText = ((EditText)findViewById(2131297345));
      jdField_a_of_type_AndroidWidgetEditText.setMaxLines(8);
      jdField_a_of_type_AndroidWidgetEditText.setEditableFactory(QQTextBuilder.a);
      jdField_a_of_type_ComTencentWidgetXPanelContainer = ((XPanelContainer)findViewById(2131296923));
      jdField_a_of_type_ComTencentWidgetXPanelContainer.setOnPanelChangeListener(this);
      jdField_a_of_type_ComTencentWidgetXPanelContainer.a(jdField_a_of_type_AndroidWidgetEditText);
      try
      {
        localObject1 = getResources().getDrawable(2130838046);
        jdField_a_of_type_ComTencentWidgetXPanelContainer.setBackgroundDrawable((Drawable)localObject1);
        jdField_a_of_type_AndroidWidgetImageButton = ((ImageButton)findViewById(2131297759));
        jdField_a_of_type_AndroidWidgetImageButton.setOnClickListener(this);
        jdField_a_of_type_AndroidWidgetButton = ((Button)findViewById(2131297346));
        jdField_a_of_type_AndroidWidgetButton.setOnClickListener(this);
        jdField_a_of_type_AndroidViewView = findViewById(2131297035);
        jdField_a_of_type_AndroidViewView.setOnClickListener(this);
        localObject1 = new StateListDrawable();
        localObject2 = getResources().getDrawable(2130842532);
        ((StateListDrawable)localObject1).addState(new int[] { 16842919 }, (Drawable)localObject2);
        localObject2 = getResources().getDrawable(2130842531);
        ((StateListDrawable)localObject1).addState(new int[0], (Drawable)localObject2);
        jdField_a_of_type_AndroidWidgetButton.setBackgroundDrawable((Drawable)localObject1);
        boolean bool = ((Boolean)SkinEngine.getInstances().getThemeConfig("aio_big_input_bar", Boolean.FALSE)).booleanValue();
        localObject1 = findViewById(2131297342);
        if (bool)
        {
          localObject2 = ((View)localObject1).findViewById(2131297343);
          ((View)localObject2).setBackgroundResource(2130838054);
          ((View)localObject2).setVisibility(0);
          ((View)localObject1).getBackground().setVisible(false, false);
          jdField_a_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131300836));
          localObject1 = jdField_a_of_type_AndroidWidgetTextView;
          if (jdField_a_of_type_Int != 1) {
            break label579;
          }
          i = 2131371055;
          ((TextView)localObject1).setText(i);
          jdField_a_of_type_AndroidWidgetTextView.setBackgroundColor(getResources().getColor(2131428165));
          jdField_a_of_type_ComTencentMobileqqActivityActivateFriendActivateFriendGrid = ((ActivateFriendGrid)findViewById(2131300817));
          jdField_a_of_type_ComTencentMobileqqActivityActivateFriendActivateFriendGrid.setCheckAbilityEnable(false);
          jdField_a_of_type_ComTencentMobileqqActivityActivateFriendActivateFriendGrid.setSkinable(true);
          localObject1 = findViewById(2131300835);
          localObject2 = new StringBuilder();
          ((StringBuilder)localObject2).append(jdField_a_of_type_AndroidWidgetTextView.getText());
          long[] arrayOfLong = jdField_a_of_type_ArrayOfLong;
          int j = arrayOfLong.length;
          i = 0;
          for (;;)
          {
            if (i < j)
            {
              long l = arrayOfLong[i];
              ((StringBuilder)localObject2).append(ContactUtils.k(app, String.valueOf(l))).append(",");
              i += 1;
              continue;
              localObject1 = getString(2131371028);
              break;
              localObject1 = getString(2131371029);
            }
          }
        }
      }
      catch (Exception localException)
      {
        Object localObject2;
        Drawable localDrawable;
        for (;;)
        {
          if (QLog.isColorLevel()) {
            localException.printStackTrace();
          }
          localDrawable = getResources().getDrawable(2130842571);
          continue;
          localDrawable.getBackground().setVisible(true, false);
          localDrawable.findViewById(2131297343).setVisibility(8);
          continue;
          label579:
          int i = 2131371056;
        }
        localDrawable.setContentDescription(((StringBuilder)localObject2).toString());
      }
    }
  }
  
  private void g()
  {
    Object localObject;
    if (jdField_a_of_type_Int == 1) {
      localObject = String.format(getString(2131371064), new Object[] { getIntent().getStringExtra("key_roam_city") });
    }
    String str;
    for (;;)
    {
      jdField_a_of_type_AndroidWidgetEditText.setText((CharSequence)localObject);
      jdField_a_of_type_AndroidWidgetEditText.setSelection(((String)localObject).length());
      jdField_a_of_type_AndroidWidgetEditText.addTextChangedListener(this);
      localObject = new ArrayList(jdField_a_of_type_ArrayOfLong.length);
      int i = 0;
      while (i < jdField_a_of_type_ArrayOfLong.length)
      {
        ActivateFriendItem localActivateFriendItem = new ActivateFriendItem(jdField_a_of_type_Int, jdField_a_of_type_ArrayOfLong[i]);
        if (jdField_a_of_type_Int == 2) {
          birthSendTime = b[i];
        }
        ((ArrayList)localObject).add(localActivateFriendItem);
        i += 1;
      }
      try
      {
        localObject = ActivateFriendsManager.a(this);
      }
      catch (Exception localException)
      {
        str = getString(2131371065);
      }
    }
    jdField_a_of_type_ComTencentMobileqqActivityActivateFriendActivateFriendGrid.setData(app, str);
  }
  
  public View a(int paramInt)
  {
    if (paramInt == 2)
    {
      SystemEmoticonPanel localSystemEmoticonPanel = new SystemEmoticonPanel(this, this);
      View localView = localSystemEmoticonPanel.findViewById(2131298063);
      RelativeLayout.LayoutParams localLayoutParams = (RelativeLayout.LayoutParams)localView.getLayoutParams();
      bottomMargin = AIOUtils.a(15.0F, getResources());
      localView.setLayoutParams(localLayoutParams);
      localSystemEmoticonPanel.setBackgroundResource(2130839718);
      return localSystemEmoticonPanel;
    }
    return null;
  }
  
  void a()
  {
    if (jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog == null) {
      jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog = new QQProgressDialog(this, getTitleBarHeight());
    }
    jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.b(2131371048);
    jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.show();
    jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.setCancelable(false);
  }
  
  public void a(int paramInt1, int paramInt2)
  {
    jdField_a_of_type_MqqOsMqqHandler.post(new kph(this, paramInt2));
  }
  
  public void a(EmoticonInfo paramEmoticonInfo)
  {
    if ((paramEmoticonInfo instanceof SystemEmoticonInfo))
    {
      int i = jdField_a_of_type_AndroidWidgetEditText.getSelectionStart();
      int j = jdField_a_of_type_AndroidWidgetEditText.getSelectionEnd();
      if ((i >= 0) && (j >= 0) && (j >= i)) {
        jdField_a_of_type_AndroidWidgetEditText.getEditableText().replace(i, j, com.tencent.mobileqq.text.TextUtils.b(jdField_a_of_type_Int));
      }
    }
  }
  
  public void a(EmoticonInfo paramEmoticonInfo1, EmoticonInfo paramEmoticonInfo2, Drawable paramDrawable) {}
  
  public boolean a(EmoticonInfo paramEmoticonInfo)
  {
    return true;
  }
  
  public void afterTextChanged(Editable paramEditable)
  {
    if (!jdField_a_of_type_Boolean)
    {
      ReportController.b(app, "CliOper", "", "", "0X8004E0B", "0X8004E0B", 0, 0, "", "", "", "");
      jdField_a_of_type_Boolean = true;
    }
  }
  
  public void b()
  {
    if (jdField_a_of_type_AndroidWidgetEditText.getSelectionStart() == 0) {}
    for (;;)
    {
      return;
      try
      {
        Editable localEditable = jdField_a_of_type_AndroidWidgetEditText.getEditableText();
        int i = jdField_a_of_type_AndroidWidgetEditText.getSelectionStart();
        int j = android.text.TextUtils.getOffsetBefore(jdField_a_of_type_AndroidWidgetEditText.getText(), i);
        if (i != j)
        {
          localEditable.delete(Math.min(i, j), Math.max(i, j));
          return;
        }
      }
      catch (Exception localException)
      {
        localException.printStackTrace();
      }
    }
  }
  
  public void b(EmoticonInfo paramEmoticonInfo) {}
  
  public void beforeTextChanged(CharSequence paramCharSequence, int paramInt1, int paramInt2, int paramInt3) {}
  
  public void c() {}
  
  public void d() {}
  
  protected boolean doOnCreate(Bundle paramBundle)
  {
    int j = -1;
    super.doOnCreate(paramBundle);
    setContentView(2130903991);
    getWindow().setBackgroundDrawable(null);
    getWindow().setSoftInputMode(20);
    jdField_a_of_type_ComTencentMobileqqAppActivateFriendsActivateFriendsManager = ((ActivateFriendsManager)app.getManager(84));
    jdField_a_of_type_Int = getIntent().getIntExtra("key_msg_type", jdField_a_of_type_Int);
    jdField_a_of_type_ArrayOfLong = getIntent().getLongArrayExtra("key_friend_list");
    b = getIntent().getLongArrayExtra("key_time_list");
    if ((jdField_a_of_type_ArrayOfLong == null) || (jdField_a_of_type_ArrayOfLong.length == 0) || ((jdField_a_of_type_Int == 2) && ((b == null) || (jdField_a_of_type_ArrayOfLong.length != b.length))))
    {
      if (QLog.isColorLevel())
      {
        paramBundle = new StringBuilder().append("intent data is invaild, msgType = ").append(jdField_a_of_type_Int).append(" | uin count = ");
        if (jdField_a_of_type_ArrayOfLong == null) {
          break label227;
        }
      }
      label227:
      for (int i = jdField_a_of_type_ArrayOfLong.length;; i = -1)
      {
        paramBundle = paramBundle.append(i).append(" | time count = ");
        i = j;
        if (b != null) {
          i = b.length;
        }
        QLog.d("ActivateFriend.SendActivity", 2, i);
        finish();
        return false;
      }
    }
    f();
    g();
    app.registObserver(jdField_a_of_type_ComTencentMobileqqAppActivateFriendsActivateFriendsObserver);
    return true;
  }
  
  protected void doOnDestroy()
  {
    app.unRegistObserver(jdField_a_of_type_ComTencentMobileqqAppActivateFriendsActivateFriendsObserver);
    jdField_a_of_type_ComTencentMobileqqActivityActivateFriendActivateFriendGrid.a();
    super.doOnDestroy();
  }
  
  public void e()
  {
    if (jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog != null) {
      jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.dismiss();
    }
  }
  
  public void finish()
  {
    super.finish();
    overridePendingTransition(0, 2130968584);
  }
  
  protected boolean isWrapContent()
  {
    return false;
  }
  
  protected boolean onBackEvent()
  {
    if (jdField_a_of_type_ComTencentWidgetXPanelContainer.a() != 0)
    {
      jdField_a_of_type_ComTencentWidgetXPanelContainer.a();
      return true;
    }
    ReportController.b(app, "CliOper", "", "", "0X8004E0A", "0X8004E0A", 0, 0, "", "", "", "");
    return super.onBackEvent();
  }
  
  public void onClick(View paramView)
  {
    if (paramView == jdField_a_of_type_AndroidWidgetImageButton) {
      if (jdField_a_of_type_ComTencentWidgetXPanelContainer.a() == 2) {
        jdField_a_of_type_ComTencentWidgetXPanelContainer.a(1);
      }
    }
    do
    {
      do
      {
        return;
        jdField_a_of_type_ComTencentWidgetXPanelContainer.a(2);
        return;
        if (paramView != jdField_a_of_type_AndroidWidgetButton) {
          break;
        }
        paramView = jdField_a_of_type_AndroidWidgetEditText.getEditableText().toString();
      } while (paramView.length() == 0);
      if (!NetworkUtil.e(this))
      {
        QQToast.a(this, 2131368714, 0).b(getTitleBarHeight());
        return;
      }
      ArrayList localArrayList = Utils.a(paramView, 560, 20, null, new ArrayList());
      if ((QLog.isColorLevel()) && (localArrayList.size() > 1)) {
        QLog.d("ActivateFriend.SendActivity", 2, "onclick | bytes = " + paramView.getBytes().length + " | partArray.size = " + localArrayList.size());
      }
      if (localArrayList.size() > 1)
      {
        QQToast.a(this, 2131367352, 0).b(getTitleBarHeight());
        return;
      }
      jdField_a_of_type_ComTencentMobileqqAppActivateFriendsActivateFriendsManager.a(jdField_a_of_type_Int, jdField_a_of_type_ArrayOfLong, b, paramView);
      ReportController.b(app, "CliOper", "", "", "0X8004E09", "0X8004E09", 0, 0, jdField_a_of_type_ArrayOfLong.length + "", "", "", "");
      a();
      return;
    } while (paramView != jdField_a_of_type_AndroidViewView);
    if (jdField_a_of_type_ComTencentWidgetXPanelContainer.a() == 1) {
      jdField_a_of_type_ComTencentWidgetXPanelContainer.a();
    }
    finish();
  }
  
  public void onTextChanged(CharSequence paramCharSequence, int paramInt1, int paramInt2, int paramInt3) {}
  
  public void p() {}
  
  public void setting() {}
}
