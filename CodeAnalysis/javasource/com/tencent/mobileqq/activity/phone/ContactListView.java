package com.tencent.mobileqq.activity.phone;

import MyCarrier.Carrier;
import SecurityAccountServer.RespondQueryQQBindingStat;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.graphics.Bitmap;
import android.os.Bundle;
import android.os.Parcelable;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.inputmethod.InputMethodManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.AddFriendLogicActivity;
import com.tencent.mobileqq.activity.ChatActivityUtils;
import com.tencent.mobileqq.activity.Contacts;
import com.tencent.mobileqq.activity.ProfileActivity;
import com.tencent.mobileqq.activity.ProfileActivity.AllInOne;
import com.tencent.mobileqq.activity.ProfileActivity.CardContactInfo;
import com.tencent.mobileqq.activity.SplashActivity;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.FriendListObserver;
import com.tencent.mobileqq.app.FriendsManager;
import com.tencent.mobileqq.app.PhoneContactManagerImp;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.app.utils.QQPimUtil;
import com.tencent.mobileqq.data.Friends;
import com.tencent.mobileqq.data.PhoneContact;
import com.tencent.mobileqq.forward.ForwardAbility.ForwardAbilityType;
import com.tencent.mobileqq.forward.ForwardBaseOption;
import com.tencent.mobileqq.forward.ForwardOptionBuilder;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.model.PhoneContactManager;
import com.tencent.mobileqq.mybusiness.MyBusinessManager;
import com.tencent.mobileqq.qcall.QCallDetailActivity;
import com.tencent.mobileqq.search.activity.ContactSearchComponentActivity;
import com.tencent.mobileqq.search.util.SearchUtils;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.util.FaceDecoder;
import com.tencent.mobileqq.util.FaceDecoder.DecodeTaskCompletionListener;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.mobileqq.utils.ImageUtil;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.widget.IndexView;
import com.tencent.mobileqq.widget.IndexView.OnIndexChangedListener;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.AbsListView;
import com.tencent.widget.AbsListView.OnScrollListener;
import com.tencent.widget.ActionSheet;
import com.tencent.widget.ListView;
import com.tencent.widget.XListView;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Set;
import lye;
import lyf;
import lyg;
import lyh;
import lyi;
import lyj;
import lyk;
import lyl;
import lym;
import lyn;

public class ContactListView
  extends BaseActivityView
  implements DialogInterface.OnClickListener, View.OnClickListener, FaceDecoder.DecodeTaskCompletionListener, IndexView.OnIndexChangedListener, AbsListView.OnScrollListener
{
  protected static final String a = "QQwangting";
  private static final String[] jdField_a_of_type_ArrayOfJavaLangString;
  protected static final String b = "txl_show_bluebar";
  protected static final String c = "txl_clk_bluebar";
  protected static final String d = "txl_close_bluebar";
  protected static final String e = "show_bluebar";
  protected static final String f = "clk_bluebar";
  public static final int g = 2;
  protected static final String g = "close_bluebar";
  static final int jdField_h_of_type_Int = 3;
  private static final String jdField_h_of_type_JavaLangString = "未启用通讯录的联系人";
  static final int jdField_i_of_type_Int = 4;
  private static final String jdField_i_of_type_JavaLangString;
  public static final int j = 5;
  private static final String j = "contact_bind_info_global";
  public static final int k = 6;
  private static final String k = "business_show_count";
  public static final int l = 7;
  private static final int n = 1;
  private static final int o = 2;
  private static final int p = 3;
  private static final int q = 1;
  private static final int r = 1000;
  private static final int s = 1001;
  private static final int u = 3;
  private Bitmap jdField_a_of_type_AndroidGraphicsBitmap;
  View.OnClickListener jdField_a_of_type_AndroidViewView$OnClickListener = new lyf(this);
  private EditText jdField_a_of_type_AndroidWidgetEditText;
  private FriendListObserver jdField_a_of_type_ComTencentMobileqqAppFriendListObserver = new lyg(this);
  public ForwardBaseOption a;
  private FaceDecoder jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder;
  private IndexView jdField_a_of_type_ComTencentMobileqqWidgetIndexView;
  ActionSheet jdField_a_of_type_ComTencentWidgetActionSheet;
  private XListView jdField_a_of_type_ComTencentWidgetXListView;
  public ArrayList a;
  private HashMap jdField_a_of_type_JavaUtilHashMap;
  List jdField_a_of_type_JavaUtilList;
  public lyi a;
  lyk jdField_a_of_type_Lyk;
  private lyl jdField_a_of_type_Lyl;
  public lyn a;
  private boolean jdField_a_of_type_Boolean = false;
  public List b;
  private boolean b;
  private View jdField_c_of_type_AndroidViewView;
  private List jdField_c_of_type_JavaUtilList;
  private View d;
  private View e;
  public int m;
  private int t = 0;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_ArrayOfJavaLangString = new String[] { "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "#" };
    i = ContactListView.class.getSimpleName();
  }
  
  public ContactListView(Context paramContext, int paramInt)
  {
    super(paramContext, paramInt);
    jdField_b_of_type_Boolean = false;
    a(2130903425);
    jdField_a_of_type_Lyn = new lyn(this);
    jdField_a_of_type_ComTencentWidgetXListView = ((XListView)findViewById(2131298499));
    jdField_c_of_type_AndroidViewView = LayoutInflater.from(getContext()).inflate(2130904750, jdField_a_of_type_ComTencentWidgetXListView, false);
    jdField_c_of_type_AndroidViewView.findViewById(2131300492).setVisibility(8);
    jdField_a_of_type_AndroidWidgetEditText = ((EditText)jdField_c_of_type_AndroidViewView.findViewById(2131300511));
    jdField_a_of_type_AndroidWidgetEditText.setFocusableInTouchMode(false);
    jdField_a_of_type_AndroidWidgetEditText.setCursorVisible(false);
    jdField_a_of_type_AndroidWidgetEditText.setOnClickListener(this);
    jdField_a_of_type_ComTencentWidgetXListView.a(jdField_c_of_type_AndroidViewView);
    if (paramInt == 4)
    {
      d = b();
      jdField_a_of_type_ComTencentWidgetXListView.a(d);
    }
    a("P_CliOper", "QQwangting", "txl_show_bluebar", "show_bluebar");
    b(false);
    jdField_a_of_type_ComTencentWidgetXListView.setOnScrollListener(this);
    jdField_a_of_type_ComTencentMobileqqWidgetIndexView = ((IndexView)findViewById(2131298500));
    jdField_a_of_type_ComTencentMobileqqWidgetIndexView.setIndex(jdField_a_of_type_ArrayOfJavaLangString, true, false, false);
    jdField_a_of_type_ComTencentMobileqqWidgetIndexView.setOnIndexChangedListener(this);
    if ((paramInt == 0) || (paramInt == 2) || (paramInt == 4) || (paramInt == 5))
    {
      jdField_a_of_type_Lyk = new lyk(this, null);
      jdField_a_of_type_ComTencentWidgetXListView.setAdapter(jdField_a_of_type_Lyk);
      jdField_c_of_type_AndroidViewView.setPadding(0, 0, 40, 0);
      return;
    }
    jdField_a_of_type_Lyi = new lyi(this, null);
    jdField_a_of_type_ComTencentWidgetXListView.setAdapter(jdField_a_of_type_Lyi);
    jdField_a_of_type_ComTencentMobileqqWidgetIndexView.setVisibility(8);
  }
  
  private void a(View paramView)
  {
    paramView = (lym)paramView.getTag();
    Object localObject1 = jdField_a_of_type_ComTencentMobileqqDataPhoneContact;
    int i1 = jdField_a_of_type_Int;
    Object localObject2 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
    if (i1 == 2)
    {
      paramView = "0";
      ReportController.b((QQAppInterface)localObject2, "CliOper", "", "", "Mobile_contacts", "Clk_addlist_msg", 0, 0, paramView, "", "", "");
      if (i1 != 2) {
        break label209;
      }
      paramView = AIOUtils.a(new Intent(getContext(), SplashActivity.class), null);
      paramView.putExtra("uin", uin);
      localObject2 = (FriendsManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(50);
      if (localObject2 != null)
      {
        localObject1 = ((FriendsManager)localObject2).c(String.valueOf(uin));
        if (localObject1 != null)
        {
          paramView.putExtra("cSpecialFlag", cSpecialFlag);
          paramView.putExtra("uinname", ((Friends)localObject1).getFriendNickWithAlias());
          if (cSpecialFlag == 1) {
            paramView.putExtra("chat_subType", 1);
          }
        }
      }
      paramView.putExtra("entrance", 3);
      paramView.putExtra("uintype", 0);
      a(paramView);
    }
    label209:
    while (i1 != 3)
    {
      return;
      paramView = "1";
      break;
    }
    paramView = ((PhoneContactManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(10)).a();
    localObject2 = nationCode + mobileNo;
    paramView = AIOUtils.a(new Intent(getContext(), SplashActivity.class), null);
    paramView.putExtra("entrance", 3);
    paramView.putExtra("uin", nationCode + mobileCode);
    paramView.putExtra("phonenum", (String)localObject2);
    paramView.putExtra("uintype", 1006);
    paramView.putExtra("uinname", name);
    localObject2 = new ProfileActivity.AllInOne(nationCode + mobileCode, 31);
    jdField_a_of_type_JavaUtilArrayList = new ArrayList();
    h = nickName;
    k = name;
    jdField_a_of_type_JavaUtilArrayList.add(new ProfileActivity.CardContactInfo(name, mobileCode, nationCode));
    d = ability;
    f = 3;
    g = 59;
    paramView.putExtra("AIO_INFO", (Parcelable)localObject2);
    a(paramView);
  }
  
  private void a(View paramView, PhoneContact paramPhoneContact)
  {
    lym localLym = (lym)paramView.getTag();
    jdField_b_of_type_AndroidWidgetTextView.setText(name);
    jdField_a_of_type_JavaLangString = null;
    jdField_a_of_type_ComTencentMobileqqDataPhoneContact = paramPhoneContact;
    jdField_a_of_type_AndroidWidgetImageView.setVisibility(0);
    if (uin.equals("0")) {
      if (hasSendAddReq)
      {
        jdField_c_of_type_AndroidWidgetButton.setVisibility(8);
        jdField_c_of_type_AndroidWidgetTextView.setVisibility(0);
        jdField_c_of_type_AndroidWidgetTextView.setText("等待验证");
      }
    }
    for (;;)
    {
      paramView.setContentDescription(name);
      if (uin.equals("0")) {
        break;
      }
      jdField_a_of_type_Int = 2;
      a(localLym, uin, Integer.parseInt(faceUrl), 1);
      return;
      jdField_c_of_type_AndroidWidgetButton.setVisibility(0);
      jdField_c_of_type_AndroidWidgetButton.setContentDescription("添加按钮");
      jdField_c_of_type_AndroidWidgetButton.setTag(localLym);
      jdField_c_of_type_AndroidWidgetTextView.setVisibility(8);
      continue;
      jdField_c_of_type_AndroidWidgetButton.setVisibility(8);
      jdField_c_of_type_AndroidWidgetTextView.setVisibility(0);
      jdField_c_of_type_AndroidWidgetTextView.setText("已添加");
    }
    jdField_a_of_type_Int = 3;
    a(localLym, nationCode + mobileCode, 0, 11);
  }
  
  private void a(ListView paramListView, String paramString, Bitmap paramBitmap)
  {
    int i2;
    int i1;
    if (t == 0)
    {
      i2 = paramListView.getChildCount();
      i1 = 0;
    }
    for (;;)
    {
      if (i1 < i2)
      {
        lym localLym = (lym)paramListView.getChildAt(i1).getTag();
        if ((localLym != null) && (paramString.equals(jdField_a_of_type_JavaLangString))) {
          jdField_a_of_type_AndroidWidgetImageView.setImageBitmap(paramBitmap);
        }
      }
      else
      {
        return;
      }
      i1 += 1;
    }
  }
  
  private void a(String paramString1, String paramString2, String paramString3, String paramString4)
  {
    ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramString1, paramString2, "", paramString3, paramString4, 0, 0, "", "", "", "");
  }
  
  private void a(lym paramLym, String paramString, int paramInt1, int paramInt2)
  {
    Bitmap localBitmap2 = jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.a(paramInt2, paramString);
    Bitmap localBitmap1 = localBitmap2;
    if (localBitmap2 == null)
    {
      if (!jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.b()) {
        jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.a(paramString, paramInt2, false);
      }
      if (jdField_a_of_type_AndroidGraphicsBitmap == null) {
        jdField_a_of_type_AndroidGraphicsBitmap = ImageUtil.a();
      }
      localBitmap1 = jdField_a_of_type_AndroidGraphicsBitmap;
    }
    jdField_a_of_type_AndroidWidgetImageView.setImageBitmap(localBitmap1);
    jdField_a_of_type_JavaLangString = paramString;
  }
  
  private void a(boolean paramBoolean)
  {
    int i1 = 0;
    if (jdField_a_of_type_Boolean) {}
    label362:
    for (;;)
    {
      return;
      if (paramBoolean)
      {
        if (QLog.isColorLevel()) {
          QLog.i(i, 2, "initBusinessTipsBar() NeedToTipContactSync");
        }
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005689", "0X8005689", 0, 0, "", "", "", "");
        e = LayoutInflater.from(getContext()).inflate(2130904038, jdField_a_of_type_ComTencentWidgetXListView, false);
        e.findViewById(2131301043).setOnClickListener(jdField_a_of_type_AndroidViewView$OnClickListener);
        e.findViewById(2131301040).setOnClickListener(jdField_a_of_type_AndroidViewView$OnClickListener);
        if (jdField_a_of_type_ComTencentWidgetXListView != null)
        {
          jdField_a_of_type_Boolean = true;
          jdField_a_of_type_ComTencentWidgetXListView.a(e);
          if (d != null)
          {
            jdField_a_of_type_ComTencentWidgetXListView.a(d);
            jdField_a_of_type_ComTencentWidgetXListView.a(d);
          }
        }
      }
      else if (b())
      {
        if (QLog.isColorLevel()) {
          QLog.i(i, 2, "initBusinessTipsBar() needToTipBusiness");
        }
        e = LayoutInflater.from(getContext()).inflate(2130904037, jdField_a_of_type_ComTencentWidgetXListView, false);
        e.findViewById(2131301039).setOnClickListener(jdField_a_of_type_AndroidViewView$OnClickListener);
        e.findViewById(2131301037).setOnClickListener(jdField_a_of_type_AndroidViewView$OnClickListener);
        if ((jdField_a_of_type_ComTencentMobileqqAppQQAppInterface != null) && (jdField_a_of_type_ComTencentWidgetXListView != null))
        {
          Carrier localCarrier = ((MyBusinessManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(48)).a();
          if ((localCarrier != null) && (!TextUtils.isEmpty(carrierURL))) {}
          for (;;)
          {
            if (i1 != 0) {
              break label362;
            }
            jdField_a_of_type_Boolean = true;
            e.setVisibility(i1);
            jdField_a_of_type_ComTencentWidgetXListView.a(e);
            if (d == null) {
              break;
            }
            jdField_a_of_type_ComTencentWidgetXListView.a(d);
            jdField_a_of_type_ComTencentWidgetXListView.a(d);
            return;
            i1 = 8;
          }
        }
      }
    }
  }
  
  private View b()
  {
    View localView = LayoutInflater.from(getContext()).inflate(2130904865, jdField_a_of_type_ComTencentWidgetXListView, false);
    ((TextView)localView.findViewById(2131298504)).setContentDescription(getContext().getString(2131367650));
    localView.setOnClickListener(new lye(this));
    return localView;
  }
  
  private void b(View paramView)
  {
    Object localObject = (lym)paramView.getTag();
    QQAppInterface localQQAppInterface = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
    int i2;
    int i1;
    if (jdField_a_of_type_Int == 2)
    {
      paramView = "0";
      ReportController.b(localQQAppInterface, "CliOper", "", "", "Mobile_contacts", "Clk_addlist_call", 0, 0, paramView, "", "", "");
      paramView = jdField_a_of_type_ComTencentMobileqqDataPhoneContact;
      i2 = jdField_a_of_type_Int;
      i1 = 0;
      if (i2 != 2) {
        break label182;
      }
      i1 = 0;
    }
    for (;;)
    {
      localObject = nationCode + mobileCode;
      ChatActivityUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, getContext(), i1, uin, name, (String)localObject, true, null, true, true, null, "from_internal");
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "Two_call", "Two_call_launch", 0, 0, "9", "", "", "");
      return;
      paramView = "1";
      break;
      label182:
      if (i2 == 3) {
        i1 = 1006;
      }
    }
  }
  
  private void b(boolean paramBoolean)
  {
    SharedPreferences localSharedPreferences = getContext().getSharedPreferences("contact_bind_info_global", 0);
    SharedPreferences.Editor localEditor;
    if (localSharedPreferences != null)
    {
      localEditor = localSharedPreferences.edit();
      if (!paramBoolean) {
        break label49;
      }
    }
    label49:
    for (int i1 = 3;; i1 = localSharedPreferences.getInt("business_show_count", 0) + 1)
    {
      localEditor.putInt("business_show_count", i1);
      localEditor.commit();
      return;
    }
  }
  
  private boolean b()
  {
    SharedPreferences localSharedPreferences = getContext().getSharedPreferences("contact_bind_info_global", 0);
    return (localSharedPreferences == null) || (localSharedPreferences.getInt("business_show_count", 0) < 3);
  }
  
  private void c(View paramView)
  {
    ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X800474C", "0X800474C", 0, 0, "", "", "", "");
    paramView = getTagjdField_a_of_type_ComTencentMobileqqDataPhoneContact;
    a(AddFriendLogicActivity.a(getContext(), 2, nationCode + mobileCode, null, 3006, 3, name, null, null, "手机联系人", null));
  }
  
  private boolean c()
  {
    boolean bool = false;
    try
    {
      int i1 = QQPimUtil.a(getContext(), jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount());
      if (QLog.isColorLevel()) {
        QLog.i(i, 2, "needToTipContactSync() contactState = " + i1 + " account " + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount());
      }
      if ((1 == i1) || (2 == i1)) {
        bool = true;
      }
      return bool;
    }
    catch (Throwable localThrowable) {}
    return false;
  }
  
  private void d(View paramView)
  {
    paramView = (lym)paramView.getTag();
    if ((paramView == null) || (jdField_a_of_type_ComTencentMobileqqDataPhoneContact == null)) {}
    PhoneContact localPhoneContact;
    int i1;
    do
    {
      return;
      localPhoneContact = jdField_a_of_type_ComTencentMobileqqDataPhoneContact;
      i1 = jdField_a_of_type_Int;
      if (jdField_a_of_type_Int != 2) {
        break;
      }
      if (i1 == 2)
      {
        paramView = new Bundle();
        paramView.putString("uin", uin);
        paramView.putInt("uintype", 0);
        paramView.putString("uinname", name);
        jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getIntent().putExtras(paramView);
        jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.a(ForwardAbility.ForwardAbilityType.b.intValue(), paramView);
        return;
      }
    } while (i1 != 3);
    paramView = new Bundle();
    paramView.putString("uin", nationCode + mobileCode);
    paramView.putInt("uintype", 1006);
    paramView.putString("uinname", name);
    jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getIntent().putExtras(paramView);
    jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.a(ForwardAbility.ForwardAbilityType.i.intValue(), paramView);
    return;
    Object localObject;
    if (jdField_a_of_type_Int == 0)
    {
      localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
      if (i1 == 2)
      {
        paramView = "0";
        ReportController.b((QQAppInterface)localObject, "CliOper", "", "", "Mobile_contacts", "Clk_addlist_prof", 0, 0, paramView, "", "", "");
        label254:
        paramView = getContext();
        localObject = new Intent(paramView, QCallDetailActivity.class);
        ((Intent)localObject).putExtra("contactID", contactID);
        switch (i1)
        {
        default: 
          ((Intent)localObject).putExtra("uin", mobileNo);
          ((Intent)localObject).putExtra("uintype", 56938);
          ((Intent)localObject).putExtra("uinname", name);
        }
      }
    }
    for (;;)
    {
      ((Intent)localObject).putExtra("entrance", "Call");
      paramView.startActivity((Intent)localObject);
      return;
      paramView = "1";
      break;
      if (jdField_a_of_type_Int != 3) {
        break label254;
      }
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X800474B", "0X800474B", 0, 0, "", "", "", "");
      break label254;
      ((Intent)localObject).putExtra("uin", uin);
      ((Intent)localObject).putExtra("uintype", 0);
      ((Intent)localObject).putExtra("uinname", nickName);
      continue;
      ((Intent)localObject).putExtra("uin", nationCode + mobileCode);
      ((Intent)localObject).putExtra("uintype", 1006);
      ((Intent)localObject).putExtra("uinname", name);
    }
  }
  
  private void l()
  {
    if (QLog.isColorLevel()) {
      QLog.i(i, 2, "generateBusinessTipView()");
    }
    ThreadManager.a(new lyj(this, null), null, true);
  }
  
  private void m()
  {
    int i2 = 0;
    if (jdField_a_of_type_Int == 3) {
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X800474D", "0X800474D", 0, 0, "", "", "", "");
    }
    Contacts.jdField_a_of_type_Int += 1;
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication();
    int i1 = 561243;
    if ((jdField_a_of_type_Int == 0) || (jdField_a_of_type_Int == 4) || (jdField_a_of_type_Int == 5))
    {
      i2 = 768;
      i1 = 561246;
    }
    for (;;)
    {
      ContactSearchComponentActivity.a(jdField_a_of_type_ComTencentMobileqqAppBaseActivity, null, 3, i2, i1);
      return;
      if (jdField_a_of_type_Int == 2)
      {
        i1 = 561248;
        i2 = 256;
      }
      else if (jdField_a_of_type_Int == 3)
      {
        i1 = 561247;
        i2 = 256;
      }
    }
  }
  
  public View a()
  {
    View localView = LayoutInflater.from(getContext()).inflate(2130903426, null);
    lym localLym = new lym(null);
    jdField_a_of_type_AndroidWidgetImageView = ((ImageView)localView.findViewById(2131298501));
    jdField_a_of_type_AndroidWidgetTextView = ((TextView)localView.findViewById(2131298502));
    jdField_b_of_type_AndroidWidgetImageView = ((ImageView)localView.findViewById(2131298503));
    jdField_b_of_type_AndroidWidgetTextView = ((TextView)localView.findViewById(2131298504));
    jdField_a_of_type_AndroidWidgetButton = ((Button)localView.findViewById(2131298505));
    jdField_a_of_type_AndroidWidgetButton.setOnClickListener(this);
    jdField_b_of_type_AndroidWidgetButton = ((Button)localView.findViewById(2131298506));
    jdField_b_of_type_AndroidWidgetButton.setOnClickListener(this);
    jdField_c_of_type_AndroidWidgetButton = ((Button)localView.findViewById(2131298508));
    jdField_c_of_type_AndroidWidgetButton.setOnClickListener(this);
    jdField_c_of_type_AndroidWidgetTextView = ((TextView)localView.findViewById(2131298507));
    jdField_a_of_type_AndroidViewView = localView.findViewById(2131298509);
    if (jdField_a_of_type_Int == 3)
    {
      jdField_a_of_type_AndroidWidgetButton.setVisibility(8);
      jdField_b_of_type_AndroidWidgetButton.setVisibility(8);
      jdField_a_of_type_AndroidViewView.setVisibility(8);
    }
    for (;;)
    {
      localView.setTag(localLym);
      return localView;
      jdField_c_of_type_AndroidWidgetButton.setVisibility(8);
      jdField_c_of_type_AndroidWidgetTextView.setVisibility(8);
    }
  }
  
  protected void a()
  {
    super.a();
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(ContactListView.class, jdField_a_of_type_Lyn);
    TextView localTextView;
    if (jdField_a_of_type_Int == 2)
    {
      jdField_b_of_type_AndroidWidgetTextView.setText("选择通讯录联系人");
      if (jdField_a_of_type_Lyl == null)
      {
        jdField_a_of_type_Lyl = new lyl(this, null);
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.registObserver(jdField_a_of_type_Lyl);
      }
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(jdField_a_of_type_ComTencentMobileqqAppFriendListObserver);
      j();
      int i1 = jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp.d();
      jdField_a_of_type_AndroidWidgetTextView.setOnClickListener(this);
      localTextView = jdField_a_of_type_AndroidWidgetTextView;
      if (i1 == 0) {
        break label178;
      }
    }
    label178:
    for (boolean bool = true;; bool = false)
    {
      localTextView.setEnabled(bool);
      jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.b();
      return;
      if ((jdField_a_of_type_Int == 0) || (jdField_a_of_type_Int == 4) || (jdField_a_of_type_Int == 5))
      {
        jdField_b_of_type_AndroidWidgetTextView.setText("通讯录");
        break;
      }
      if (jdField_a_of_type_Int != 3) {
        break;
      }
      jdField_b_of_type_AndroidWidgetTextView.setText("手机联系人");
      break;
    }
  }
  
  public void a(int paramInt1, int paramInt2, Intent paramIntent)
  {
    super.a(paramInt1, paramInt2, paramIntent);
    if (paramInt1 == 1) {
      if (paramInt2 == 2)
      {
        localObject1 = new Intent(getContext(), BindNumberActivity.class);
        ((Intent)localObject1).putExtra("kNeedUnbind", true);
        a((Intent)localObject1);
        if (paramInt2 == -1) {
          switch (paramInt1)
          {
          }
        }
      }
    }
    do
    {
      do
      {
        return;
        if (paramInt2 == 0)
        {
          int i1 = jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp.d();
          if ((i1 != 1) && (i1 != 2)) {
            break;
          }
          a(new Intent(getContext(), PhoneLaunchActivity.class));
          break;
        }
        if (paramInt2 == 4002)
        {
          f();
          break;
        }
        a(new Intent(getContext(), PhoneLaunchActivity.class));
        break;
        if (paramInt1 != 1000) {
          break;
        }
        jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp.a(true, false);
        break;
      } while (paramIntent == null);
      localObject1 = paramIntent.getStringExtra("contactSearchResultUin");
      paramInt1 = paramIntent.getIntExtra("contactSearchResultUinType", 0);
      str1 = paramIntent.getStringExtra("contactSearchResultName");
      long l1 = paramIntent.getLongExtra("contactSearchResultPhoneContactOriginBinder", -1L);
      localObject2 = paramIntent.getStringExtra("contactSearchResultPhoneContactMobileCode");
      String str2 = paramIntent.getStringExtra("contactSearchResultPhoneContactNationCode");
      paramInt2 = paramIntent.getIntExtra("contactSearchResultPhoneContactAbility", -1);
      paramIntent = null;
      if (paramInt1 == 1006) {
        if (l1 == 3L)
        {
          paramInt1 = 32;
          paramIntent = new ProfileActivity.AllInOne((String)localObject1, paramInt1);
          jdField_a_of_type_JavaUtilArrayList = new ArrayList();
          k = str1;
          jdField_a_of_type_JavaUtilArrayList.add(new ProfileActivity.CardContactInfo(str1, (String)localObject2, str2));
          d = paramInt2;
          f = 3;
        }
      }
      for (;;)
      {
        ProfileActivity.b(jdField_a_of_type_ComTencentMobileqqAppBaseActivity, paramIntent);
        return;
        paramInt1 = 31;
        break;
        if (paramInt1 == 0) {
          paramIntent = new ProfileActivity.AllInOne((String)localObject1, 1);
        }
      }
      SearchUtils.a(paramIntent, jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption);
      return;
    } while (paramIntent == null);
    Object localObject1 = paramIntent.getStringExtra("contactSearchResultUin");
    paramInt1 = paramIntent.getIntExtra("contactSearchResultUinType", 0);
    String str1 = paramIntent.getStringExtra("contactSearchResultName");
    paramIntent = paramIntent.getStringExtra("contactSearchResultTroopUin");
    Object localObject2 = new Intent(jdField_a_of_type_ComTencentMobileqqAppBaseActivity, QCallDetailActivity.class);
    ((Intent)localObject2).putExtra("uin", (String)localObject1);
    ((Intent)localObject2).putExtra("troop_uin", paramIntent);
    ((Intent)localObject2).putExtra("uintype", paramInt1);
    ((Intent)localObject2).putExtra("uinname", str1);
    ((Intent)localObject2).putExtra("entrance", "Call");
    jdField_a_of_type_ComTencentMobileqqAppBaseActivity.startActivity((Intent)localObject2);
  }
  
  public void a(int paramInt1, int paramInt2, String paramString, Bitmap paramBitmap)
  {
    if ((paramBitmap == null) || (TextUtils.isEmpty(paramString))) {
      return;
    }
    a(jdField_a_of_type_ComTencentWidgetXListView, paramString, paramBitmap);
  }
  
  protected void a(Intent paramIntent, PhoneInnerFrame paramPhoneInnerFrame)
  {
    super.a(paramIntent, paramPhoneInnerFrame);
    if ((jdField_a_of_type_Int == 2) && (jdField_a_of_type_ComTencentMobileqqAppBaseActivity != null)) {
      jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption = ForwardOptionBuilder.a(jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getIntent(), jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqAppBaseActivity);
    }
    if (jdField_a_of_type_ComTencentMobileqqAppBaseActivity != null)
    {
      paramIntent = jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getIntent().getStringArrayExtra("key_reserved_mobile");
      if ((paramIntent != null) && (paramIntent.length > 0)) {
        jdField_c_of_type_JavaUtilList = Arrays.asList(paramIntent);
      }
    }
    jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder = new FaceDecoder(getContext(), jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
    jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.a(this);
    if (jdField_a_of_type_Lyn != null) {
      jdField_a_of_type_Lyn.sendEmptyMessageDelayed(6, 500L);
    }
  }
  
  public void a(View paramView, PhoneContact paramPhoneContact, boolean paramBoolean)
  {
    lym localLym = (lym)paramView.getTag();
    if (paramBoolean)
    {
      jdField_b_of_type_AndroidWidgetTextView.setText(String.format("%s(%s)", new Object[] { name, mobileNo }));
      jdField_a_of_type_JavaLangString = null;
      jdField_a_of_type_ComTencentMobileqqDataPhoneContact = paramPhoneContact;
      if (!TextUtils.isEmpty(uin)) {
        break label163;
      }
      jdField_a_of_type_AndroidWidgetImageView.setVisibility(0);
      jdField_a_of_type_AndroidWidgetTextView.setVisibility(0);
      jdField_a_of_type_AndroidWidgetButton.setVisibility(8);
      jdField_b_of_type_AndroidWidgetButton.setVisibility(8);
      jdField_a_of_type_Int = 1;
      jdField_a_of_type_AndroidWidgetImageView.setImageResource(2130838859);
      jdField_a_of_type_AndroidWidgetTextView.setText(ContactUtils.a(name));
      jdField_b_of_type_AndroidWidgetImageView.setVisibility(8);
    }
    label163:
    label465:
    do
    {
      do
      {
        return;
        jdField_b_of_type_AndroidWidgetTextView.setText(name);
        break;
        jdField_a_of_type_AndroidWidgetImageView.setVisibility(0);
        jdField_a_of_type_AndroidWidgetTextView.setVisibility(8);
        if ((jdField_a_of_type_Int == 0) || (jdField_a_of_type_Int == 4) || (jdField_a_of_type_Int == 5))
        {
          jdField_a_of_type_AndroidWidgetButton.setVisibility(8);
          jdField_b_of_type_AndroidWidgetButton.setVisibility(0);
        }
        jdField_a_of_type_AndroidWidgetButton.setTag(localLym);
        jdField_b_of_type_AndroidWidgetButton.setTag(localLym);
        jdField_a_of_type_AndroidWidgetButton.setContentDescription("向" + name + "发消息");
        jdField_b_of_type_AndroidWidgetButton.setContentDescription("向" + name + "发起语音通话");
        if (!uin.equals("0"))
        {
          jdField_a_of_type_Int = 2;
          a(localLym, uin, 0, 1);
          jdField_b_of_type_AndroidWidgetImageView.setVisibility(8);
          return;
        }
        jdField_a_of_type_Int = 3;
        a(localLym, nationCode + mobileCode, 0, 11);
        if ((jdField_a_of_type_Int != 4) && (jdField_a_of_type_Int != 5)) {
          break label509;
        }
        if (!isHiden) {
          break label465;
        }
        jdField_b_of_type_AndroidWidgetImageView.setVisibility(0);
      } while (!AppSetting.i);
      paramView.setContentDescription(name + "，已隐藏");
      return;
      jdField_b_of_type_AndroidWidgetImageView.setVisibility(8);
    } while (!AppSetting.i);
    paramView.setContentDescription(name + "，未隐藏");
    return;
    label509:
    jdField_b_of_type_AndroidWidgetImageView.setVisibility(8);
  }
  
  public void a(AbsListView paramAbsListView, int paramInt)
  {
    t = paramInt;
    if (paramInt != 0)
    {
      jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.a();
      jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.c();
      return;
    }
    if (jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.b()) {
      jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.b();
    }
    int i2 = jdField_a_of_type_ComTencentWidgetXListView.getChildCount();
    paramInt = 0;
    label52:
    Bitmap localBitmap;
    if (paramInt < i2)
    {
      paramAbsListView = (lym)jdField_a_of_type_ComTencentWidgetXListView.getChildAt(paramInt).getTag();
      if ((paramAbsListView != null) && (!TextUtils.isEmpty(jdField_a_of_type_JavaLangString)))
      {
        int i1 = 1;
        if (jdField_a_of_type_Int == 3) {
          i1 = 11;
        }
        localBitmap = jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.a(i1, jdField_a_of_type_JavaLangString);
        if (localBitmap != null) {
          break label140;
        }
        jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.a(jdField_a_of_type_JavaLangString, i1, false);
      }
    }
    for (;;)
    {
      paramInt += 1;
      break label52;
      break;
      label140:
      jdField_a_of_type_AndroidWidgetImageView.setImageBitmap(localBitmap);
    }
  }
  
  public void a(AbsListView paramAbsListView, int paramInt1, int paramInt2, int paramInt3) {}
  
  protected void b()
  {
    super.b();
    ((InputMethodManager)getContext().getSystemService("input_method")).hideSoftInputFromWindow(getWindowToken(), 0);
    if (jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp.d() != 6)
    {
      if (!NetworkUtil.e(getContext())) {
        break label82;
      }
      if (jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp.d()) {
        a(2131368360, 0L, false);
      }
    }
    else
    {
      return;
    }
    jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp.a(true, true);
    h();
    return;
    label82:
    a(2131368515, 3000L);
  }
  
  public void b(String paramString)
  {
    if ("$".equals(paramString))
    {
      jdField_a_of_type_ComTencentWidgetXListView.setSelection(0);
      return;
    }
    XListView localXListView = jdField_a_of_type_ComTencentWidgetXListView;
    int i1 = jdField_a_of_type_ComTencentWidgetXListView.m();
    localXListView.setSelection(((Integer)jdField_a_of_type_JavaUtilHashMap.get(paramString)).intValue() + i1);
  }
  
  protected void d()
  {
    jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.c();
    jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.d();
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(ContactListView.class);
    i();
    g();
    if (jdField_a_of_type_ComTencentWidgetActionSheet != null)
    {
      jdField_a_of_type_ComTencentWidgetActionSheet.cancel();
      jdField_a_of_type_ComTencentWidgetActionSheet = null;
    }
    if (jdField_a_of_type_Lyl != null)
    {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.unRegistObserver(jdField_a_of_type_Lyl);
      jdField_a_of_type_Lyl = null;
    }
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.b(jdField_a_of_type_ComTencentMobileqqAppFriendListObserver);
    super.d();
  }
  
  protected void e()
  {
    if (jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption != null) {
      jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.q();
    }
    super.e();
  }
  
  public void j()
  {
    if ((jdField_a_of_type_Int == 0) || (jdField_a_of_type_Int == 2) || (jdField_a_of_type_Int == 4) || (jdField_a_of_type_Int == 5))
    {
      k();
      jdField_a_of_type_Lyk.notifyDataSetChanged();
    }
    int i1;
    do
    {
      do
      {
        return;
      } while (jdField_a_of_type_Int != 3);
      i1 = jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp.a(jdField_c_of_type_JavaUtilList);
    } while (!QLog.isColorLevel());
    QLog.d("ContactListView", 2, "load contact friend result: " + i1);
  }
  
  void k()
  {
    if ((jdField_a_of_type_Int == 4) || (jdField_a_of_type_Int == 5))
    {
      localObject1 = new ArrayList();
      ((List)localObject1).add(jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp.f());
      ((List)localObject1).add(new ArrayList());
    }
    for (jdField_a_of_type_JavaUtilList = ((List)localObject1); jdField_a_of_type_JavaUtilList == null; jdField_a_of_type_JavaUtilList = jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp.c())
    {
      jdField_a_of_type_Lyn.sendEmptyMessageDelayed(2, 1000L);
      return;
    }
    jdField_a_of_type_JavaUtilHashMap = new LinkedHashMap();
    Object localObject1 = jdField_a_of_type_ArrayOfJavaLangString;
    int i2 = localObject1.length;
    int i1 = 0;
    while (i1 < i2)
    {
      localObject2 = localObject1[i1];
      jdField_a_of_type_JavaUtilHashMap.put(localObject2, Integer.valueOf(0));
      i1 += 1;
    }
    ArrayList localArrayList = new ArrayList();
    Object localObject2 = "*";
    Iterator localIterator = ((List)jdField_a_of_type_JavaUtilList.get(0)).iterator();
    while (localIterator.hasNext())
    {
      PhoneContact localPhoneContact = (PhoneContact)localIterator.next();
      Object localObject3 = pinyinFirst;
      localObject1 = localObject3;
      if (jdField_a_of_type_JavaUtilHashMap.get(localObject3) == null)
      {
        localObject1 = "#";
        pinyinFirst = "#";
      }
      localObject3 = localObject2;
      if (!((String)localObject2).equals(localObject1))
      {
        localArrayList.add(null);
        localObject3 = localObject1;
      }
      localArrayList.add(localPhoneContact);
      jdField_a_of_type_JavaUtilHashMap.put(localObject1, Integer.valueOf(((Integer)jdField_a_of_type_JavaUtilHashMap.get(localObject1)).intValue() + 1));
      localObject2 = localObject3;
    }
    localObject1 = jdField_a_of_type_JavaUtilHashMap.keySet().iterator();
    i1 = 0;
    if (((Iterator)localObject1).hasNext())
    {
      localObject2 = (String)((Iterator)localObject1).next();
      i2 = ((Integer)jdField_a_of_type_JavaUtilHashMap.get(localObject2)).intValue();
      if (i2 == 0) {
        break label502;
      }
    }
    label502:
    for (i2 = i2 + i1 + 1;; i2 = i1)
    {
      jdField_a_of_type_JavaUtilHashMap.put(localObject2, Integer.valueOf(i1));
      i1 = i2;
      break;
      if ((jdField_a_of_type_Int == 0) || (jdField_a_of_type_Int == 4))
      {
        localObject1 = (List)jdField_a_of_type_JavaUtilList.get(1);
        if (((List)localObject1).size() > 0)
        {
          jdField_a_of_type_JavaUtilHashMap.put("未启用通讯录的联系人", Integer.valueOf(localArrayList.size()));
          localArrayList.add(null);
          localObject1 = ((List)localObject1).iterator();
          while (((Iterator)localObject1).hasNext())
          {
            localObject2 = (PhoneContact)((Iterator)localObject1).next();
            pinyinFirst = "未启用通讯录的联系人";
            localArrayList.add(localObject2);
          }
        }
      }
      jdField_a_of_type_JavaUtilArrayList = localArrayList;
      m = jdField_a_of_type_JavaUtilArrayList.size();
      return;
    }
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    if (paramInt == 1)
    {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(new lyh(this));
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005B18", "0X8005B18", 0, 0, "", "", "", "");
      QQToast.a(BaseApplicationImpl.a, "特征码匹配中。", 0).a();
      h();
    }
    while (paramInt != 0) {
      return;
    }
    f();
  }
  
  public void onClick(View paramView)
  {
    ((InputMethodManager)getContext().getSystemService("input_method")).hideSoftInputFromWindow(getWindowToken(), 0);
    switch (paramView.getId())
    {
    default: 
      d(paramView);
      return;
    case 2131300511: 
      m();
      return;
    case 2131297081: 
      if (jdField_a_of_type_Int == 2)
      {
        f();
        return;
      }
      paramView = jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getIntent();
      Intent localIntent = new Intent(getContext(), SettingActivity2.class);
      if (paramView.hasExtra("kSrouce")) {
        localIntent.putExtra("kSrouce", paramView.getIntExtra("kSrouce", 6));
      }
      b(localIntent, 1);
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "Moblie_contacts", "Moblie_contacts_setting", 0, 0, "", "", "", "");
      return;
    case 2131298505: 
      a(paramView);
      return;
    case 2131298506: 
      b(paramView);
      return;
    }
    c(paramView);
  }
}
