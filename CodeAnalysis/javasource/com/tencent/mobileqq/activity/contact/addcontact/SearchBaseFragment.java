package com.tencent.mobileqq.activity.contact.addcontact;

import SummaryCard.SearchInfo;
import android.app.Activity;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.os.Bundle;
import android.os.Handler;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.text.SpannableString;
import android.text.TextUtils;
import android.text.style.ForegroundColorSpan;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.Window;
import android.view.inputmethod.InputMethodManager;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.activity.AddFriendActivity;
import com.tencent.mobileqq.activity.ChatSettingForTroop;
import com.tencent.mobileqq.activity.TroopInfoActivity;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.FontSettingManager;
import com.tencent.mobileqq.app.FriendListObserver;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pb.PBStringField;
import com.tencent.mobileqq.pb.PBUInt32Field;
import com.tencent.mobileqq.pb.PBUInt64Field;
import com.tencent.mobileqq.richstatus.IIconListener;
import com.tencent.mobileqq.richstatus.RichStatus;
import com.tencent.mobileqq.richstatus.StatusManager;
import com.tencent.mobileqq.util.FaceDecoder;
import com.tencent.mobileqq.util.FaceDecoder.DecodeTaskCompletionListener;
import com.tencent.mobileqq.utils.DisplayUtils;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.pb.addcontacts.AccountSearchPb.record;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.AbsListView;
import com.tencent.widget.AbsListView.OnScrollListener;
import com.tencent.widget.XListView;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import lqt;
import lqu;
import lqv;
import lqw;

public class SearchBaseFragment
  extends Fragment
  implements View.OnClickListener, FaceDecoder.DecodeTaskCompletionListener, AbsListView.OnScrollListener
{
  public static final String a = "from_key";
  public static final String b = "last_key_words";
  public static final String c = "start_search_key";
  private static final String e;
  public static final int g = -16734752;
  public static final int h = 0;
  public static final int i = 1;
  public static final int j = 2;
  public static final int k = 3;
  public Handler a;
  protected BaseAdapter a;
  LinearLayout jdField_a_of_type_AndroidWidgetLinearLayout;
  protected ContactSearchFacade.ISearchListener a;
  protected ContactSearchFacade a;
  CustomerLoadingDialog jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactCustomerLoadingDialog;
  protected BaseActivity a;
  private FriendListObserver jdField_a_of_type_ComTencentMobileqqAppFriendListObserver = new lqw(this);
  public QQAppInterface a;
  protected IIconListener a;
  protected StatusManager a;
  FaceDecoder jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder;
  private AccountSearchPb.record jdField_a_of_type_ComTencentPbAddcontactsAccountSearchPb$record;
  public XListView a;
  public Map a;
  private Handler b;
  public boolean b;
  public final int c = 64;
  protected boolean c;
  protected int d;
  public String d;
  public int e;
  protected int f;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_e_of_type_JavaLangString = SearchBaseFragment.class.getName();
  }
  
  public SearchBaseFragment()
  {
    jdField_d_of_type_Int = 0;
    jdField_e_of_type_Int = 0;
    jdField_a_of_type_JavaUtilMap = new ConcurrentHashMap();
    jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactSearchFacade$ISearchListener = new lqt(this);
    jdField_a_of_type_AndroidOsHandler = new lqu(this);
    jdField_a_of_type_ComTencentMobileqqRichstatusIIconListener = new lqv(this);
  }
  
  private static int a(String paramString1, String paramString2)
  {
    int m = paramString2.indexOf(paramString1);
    if (m >= 0) {
      return m;
    }
    return paramString2.toLowerCase().indexOf(paramString1.toLowerCase());
  }
  
  public static SpannableString a(String paramString, List paramList)
  {
    if (paramString == null) {
      return null;
    }
    if (paramList == null) {
      return new SpannableString(paramString);
    }
    int m = paramString.length();
    Object localObject = paramList.iterator();
    int n;
    if (((Iterator)localObject).hasNext())
    {
      n = a((String)((Iterator)localObject).next(), paramString);
      if ((n < 0) || (n >= m)) {
        break label223;
      }
      m = n;
    }
    label223:
    for (;;)
    {
      break;
      localObject = paramString;
      if (m > 8)
      {
        localObject = paramString;
        if (m != paramString.length()) {
          localObject = "…" + paramString.substring(m - 8);
        }
      }
      SpannableString localSpannableString = new SpannableString((CharSequence)localObject);
      paramList = paramList.iterator();
      if (paramList.hasNext())
      {
        String str = (String)paramList.next();
        m = 0;
        for (paramString = (String)localObject;; paramString = paramString.substring(n))
        {
          int i1 = a(str, paramString);
          if (i1 < 0) {
            break;
          }
          n = str.length() + i1;
          localSpannableString.setSpan(new ForegroundColorSpan(-16734752), i1 + m, m + n, 33);
          m += n;
        }
      }
      return localSpannableString;
    }
  }
  
  private static String a(Iterable paramIterable, String paramString)
  {
    paramIterable = paramIterable.iterator();
    int n = 0;
    int i2 = -1;
    int i1 = -1;
    int m;
    int i3;
    if (paramIterable.hasNext())
    {
      String str = (String)paramIterable.next();
      m = a(str, paramString);
      i3 = i2;
      i2 = i1;
      if (i1 == -1)
      {
        i3 = m;
        i2 = m;
      }
      if ((m >= i2) || (m == -1)) {
        break label153;
      }
      i2 = str.length();
      i1 = m;
      n = m;
      m = i2;
    }
    for (;;)
    {
      i2 = n;
      n = m;
      break;
      if (i1 <= 10)
      {
        paramIterable = paramString;
        if (i1 > 6)
        {
          paramIterable = paramString;
          if (i1 + n <= 10) {}
        }
      }
      else
      {
        paramIterable = "…" + paramString.substring(i2 - 6);
      }
      return paramIterable;
      label153:
      m = n;
      n = i3;
      i1 = i2;
    }
  }
  
  protected int a()
  {
    return BaseApplicationImpl.getContext().getResources().getDimensionPixelSize(2131492908);
  }
  
  public int a(TextView paramTextView, BaseActivity paramBaseActivity)
  {
    paramTextView.measure(View.MeasureSpec.makeMeasureSpec(0, 0), View.MeasureSpec.makeMeasureSpec(0, 0));
    int m = paramTextView.getMeasuredHeight();
    float f1 = paramTextView.getMeasuredWidth();
    int n = AIOUtils.a(18.0F, paramBaseActivity.getResources());
    float f2 = AIOUtils.a(260.0F, paramBaseActivity.getResources());
    float f3 = FontSettingManager.a() / 16.0F;
    return m / n + (int)(f1 * f3 / f2);
  }
  
  public SpannableString a(int paramInt, String paramString)
  {
    SpannableString localSpannableString2 = (SpannableString)jdField_a_of_type_JavaUtilMap.get(paramInt + ":" + paramString);
    SpannableString localSpannableString1 = localSpannableString2;
    if (localSpannableString2 == null) {
      localSpannableString1 = new SpannableString(paramString);
    }
    return localSpannableString1;
  }
  
  public SpannableString a(int paramInt, String paramString, SpannableString paramSpannableString)
  {
    return (SpannableString)jdField_a_of_type_JavaUtilMap.put(paramInt + ":" + paramString, paramSpannableString);
  }
  
  public BaseActivity a()
  {
    return jdField_a_of_type_ComTencentMobileqqAppBaseActivity;
  }
  
  protected String a(SearchBaseFragment.ItemViewHolder paramItemViewHolder, AccountSearchPb.record paramRecord)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    Object localObject;
    int n;
    int m;
    switch (sex.get())
    {
    default: 
      localObject = "";
      n = 0;
      m = 0;
      localStringBuilder.append((String)localObject);
      if ((n == 0) && (age.get() == 0))
      {
        c.setText("");
        c.setCompoundDrawables(null, null, null, null);
        c.setVisibility(4);
      }
      break;
    }
    for (;;)
    {
      localObject = new StringBuilder();
      if (!TextUtils.isEmpty(province_name.get())) {
        ((StringBuilder)localObject).append(province_name.get()).append(" ");
      }
      if (!TextUtils.isEmpty(city_name.get())) {
        ((StringBuilder)localObject).append(city_name.get());
      }
      if ((((StringBuilder)localObject).length() == 0) && (!TextUtils.isEmpty(country_name.get()))) {
        ((StringBuilder)localObject).append(country_name.get());
      }
      d.setText(((StringBuilder)localObject).toString());
      localStringBuilder.append(((StringBuilder)localObject).toString());
      a(paramItemViewHolder, richStatus);
      return localStringBuilder.toString();
      n = 2130838491;
      m = 2130840723;
      localObject = "男";
      break;
      n = 2130838486;
      m = 2130840712;
      localObject = "女";
      break;
      c.setVisibility(0);
      c.setCompoundDrawablesWithIntrinsicBounds(n, 0, 0, 0);
      c.setBackgroundResource(m);
      c.setText(String.valueOf(age.get()));
      c.setTextColor(BaseApplicationImpl.getContext().getResources().getColor(2131427406));
      localStringBuilder.append(c.getText());
    }
  }
  
  public void a() {}
  
  public void a(int paramInt1, int paramInt2, String paramString, Bitmap paramBitmap)
  {
    if (QLog.isColorLevel()) {
      QLog.d(jdField_e_of_type_JavaLangString, 2, "onDecodeTaskCompleted type = " + paramInt2 + ", uin = " + paramString);
    }
    int m;
    if ((paramBitmap != null) && (jdField_e_of_type_Int == 0))
    {
      m = jdField_a_of_type_ComTencentWidgetXListView.getChildCount();
      paramInt1 = 0;
    }
    for (;;)
    {
      Object localObject;
      if (paramInt1 < m)
      {
        localObject = jdField_a_of_type_ComTencentWidgetXListView.getChildAt(paramInt1).getTag();
        if ((localObject == null) || (!(localObject instanceof SearchBaseFragment.ItemViewHolder))) {
          break label155;
        }
        localObject = (SearchBaseFragment.ItemViewHolder)localObject;
        if (!jdField_a_of_type_JavaLangString.equals(paramString)) {
          break label155;
        }
        if (paramInt2 == 4)
        {
          if (80000001 != b) {
            break label155;
          }
          jdField_a_of_type_AndroidWidgetImageView.setImageBitmap(paramBitmap);
        }
      }
      else
      {
        return;
      }
      jdField_a_of_type_AndroidWidgetImageView.setImageBitmap(paramBitmap);
      return;
      label155:
      paramInt1 += 1;
    }
  }
  
  protected void a(int paramInt, AccountSearchPb.record paramRecord)
  {
    if (a() == null) {
      return;
    }
    switch (paramInt)
    {
    default: 
      return;
    case 80000000: 
      a(paramRecord);
      return;
    case 80000001: 
      paramRecord = TroopInfoActivity.a(String.valueOf(code.get()), 2);
      paramRecord.putInt("exposureSource", 3);
      paramRecord.putInt("t_s_f", 1000);
      ChatSettingForTroop.a(a(), paramRecord, 2);
      return;
    }
    paramInt = account_flag.get();
    PublicView.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a(), class_index.get(), String.valueOf(uin.get()), String.valueOf(uin.get()), paramInt, name.get(), 4);
  }
  
  public void a(int paramInt1, Object paramObject, int paramInt2, String paramString)
  {
    if (jdField_a_of_type_AndroidOsHandler != null) {
      jdField_a_of_type_AndroidOsHandler.sendMessage(jdField_a_of_type_AndroidOsHandler.obtainMessage(1, paramString));
    }
  }
  
  @Deprecated
  public void a(Handler paramHandler)
  {
    b = paramHandler;
  }
  
  protected void a(View paramView)
  {
    if (paramView != null)
    {
      if (paramView.getParent() != null) {
        ((ViewGroup)paramView.getParent()).removeView(paramView);
      }
      jdField_a_of_type_AndroidWidgetLinearLayout.removeAllViews();
      jdField_a_of_type_AndroidWidgetLinearLayout.addView(paramView);
    }
  }
  
  public void a(SearchBaseFragment.ItemViewHolder paramItemViewHolder, RichStatus paramRichStatus)
  {
    jdField_a_of_type_ComTencentMobileqqRichstatusRichStatus = paramRichStatus;
    if ((paramRichStatus != null) && (!paramRichStatus.a()))
    {
      if (!TextUtils.isEmpty(c))
      {
        jdField_a_of_type_Int = jdField_d_of_type_Int;
        return;
      }
      jdField_a_of_type_Int = 0;
      return;
    }
    jdField_a_of_type_Int = 0;
  }
  
  protected void a(AccountSearchPb.record paramRecord)
  {
    jdField_a_of_type_ComTencentPbAddcontactsAccountSearchPb$record = paramRecord;
    SearchInfo localSearchInfo = new SearchInfo();
    lUIN = uin.get();
    strNick = name.get();
    strMobile = mobile.get();
    bIsFriend = ((byte)(int)(relation.get() & 1L));
    bInContact = ((byte)(int)(relation.get() & 0x2));
    AddFriendActivity.a(a(), localSearchInfo, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), null, true);
  }
  
  public void a(AbsListView paramAbsListView, int paramInt)
  {
    jdField_e_of_type_Int = paramInt;
    if (jdField_e_of_type_Int != 0)
    {
      jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.a();
      jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.c();
    }
    for (;;)
    {
      if (a() != null)
      {
        paramAbsListView = (InputMethodManager)a().getSystemService("input_method");
        if (paramAbsListView.isActive()) {
          paramAbsListView.hideSoftInputFromWindow(a().getWindow().getDecorView().getWindowToken(), 0);
        }
      }
      return;
      if (jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.b())
      {
        jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.b();
        if (jdField_a_of_type_AndroidWidgetBaseAdapter != null) {
          jdField_a_of_type_AndroidWidgetBaseAdapter.notifyDataSetChanged();
        }
      }
    }
  }
  
  public void a(AbsListView paramAbsListView, int paramInt1, int paramInt2, int paramInt3) {}
  
  public void a(String paramString)
  {
    String str = paramString;
    if (TextUtils.isEmpty(paramString)) {
      str = "搜索失败，请稍后再试";
    }
    QQToast.a(BaseApplicationImpl.getContext(), str, 0).b(a());
  }
  
  public void a(String paramString, boolean paramBoolean) {}
  
  public void a(ArrayList paramArrayList)
  {
    for (;;)
    {
      try
      {
        Iterator localIterator1 = paramArrayList.iterator();
        SearchResult localSearchResult;
        List localList;
        Object localObject;
        if (localIterator1.hasNext())
        {
          localSearchResult = (SearchResult)localIterator1.next();
          localList = jdField_a_of_type_JavaUtilList;
          Iterator localIterator2 = b.iterator();
          if (!localIterator2.hasNext()) {
            continue;
          }
          paramArrayList = (AccountSearchPb.record)localIterator2.next();
          localObject = name.get();
          SpannableString localSpannableString = a((String)localObject, localList);
          a(jdField_a_of_type_Int, (String)localObject, localSpannableString);
        }
        switch (jdField_a_of_type_Int)
        {
        case 80000001: 
          if (TextUtils.isEmpty(paramArrayList)) {
            continue;
          }
          localObject = a(paramArrayList, localList);
          a(jdField_a_of_type_Int, paramArrayList, (SpannableString)localObject);
          continue;
          return;
        }
      }
      catch (Exception paramArrayList)
      {
        if (QLog.isColorLevel()) {
          QLog.d(jdField_e_of_type_JavaLangString, 2, "", paramArrayList);
        }
      }
      paramArrayList = String.valueOf(code.get());
      continue;
      paramArrayList = String.valueOf(uin.get());
      continue;
      paramArrayList = String.valueOf(brief.get());
      continue;
      paramArrayList = null;
    }
  }
  
  public boolean a(ArrayList paramArrayList)
  {
    return true;
  }
  
  protected int b()
  {
    if ((jdField_d_of_type_Int == 0) || (jdField_d_of_type_Int == 3) || (jdField_d_of_type_Int == 4)) {
      return 80000000;
    }
    if (jdField_d_of_type_Int == 2) {
      return 80000002;
    }
    if (jdField_d_of_type_Int == 5) {
      return 80000003;
    }
    return 80000001;
  }
  
  protected String b(SearchBaseFragment.ItemViewHolder paramItemViewHolder, AccountSearchPb.record paramRecord)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    c.setCompoundDrawablesWithIntrinsicBounds(0, 0, 0, 0);
    c.setCompoundDrawablePadding(0);
    c.setBackgroundResource(0);
    if ((flag.has()) && (flag.get() == 1L))
    {
      jdField_a_of_type_AndroidWidgetTextView.setCompoundDrawablesWithIntrinsicBounds(0, 0, 2130838643, 0);
      jdField_a_of_type_AndroidWidgetTextView.setCompoundDrawablePadding((int)DisplayUtils.a(BaseApplicationImpl.getContext(), 6.0F));
      if ((!class_index.has()) || (class_index.get() != 1)) {
        break label231;
      }
      if (class_name.has())
      {
        c.setText(class_name.get());
        localStringBuilder.append(class_name.get());
      }
      if (brief.has())
      {
        d.setText(a(80000002, brief.get()));
        localStringBuilder.append(brief.get());
      }
    }
    for (;;)
    {
      int m = BaseApplicationImpl.getContext().getResources().getColor(2131428212);
      c.setTextColor(m);
      return localStringBuilder.toString();
      jdField_a_of_type_AndroidWidgetTextView.setCompoundDrawablesWithIntrinsicBounds(0, 0, 0, 0);
      break;
      label231:
      if (class_index.has())
      {
        c.setVisibility(8);
        if (brief.has())
        {
          d.setText(a(80000002, brief.get()));
          localStringBuilder.append(d.getText());
        }
      }
    }
  }
  
  public void c()
  {
    if (jdField_a_of_type_AndroidOsHandler != null) {
      jdField_a_of_type_AndroidOsHandler.sendEmptyMessage(2);
    }
  }
  
  public void d()
  {
    if (QLog.isColorLevel()) {
      QLog.d(jdField_e_of_type_JavaLangString, 2, "clearHighLightString");
    }
    jdField_a_of_type_JavaUtilMap.clear();
  }
  
  protected void e()
  {
    jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactSearchFacade = new ContactSearchFacade(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
    jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactSearchFacade.a(jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactSearchFacade$ISearchListener);
    jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder = new FaceDecoder(BaseApplicationImpl.getContext(), jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
    jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.a(this);
    f = ((int)DisplayUtils.a(BaseApplicationImpl.getContext(), 12.0F));
    jdField_a_of_type_ComTencentMobileqqRichstatusStatusManager = ((StatusManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(14));
    if (jdField_a_of_type_ComTencentMobileqqRichstatusStatusManager != null) {
      jdField_a_of_type_ComTencentMobileqqRichstatusStatusManager.a(jdField_a_of_type_ComTencentMobileqqRichstatusIIconListener);
    }
  }
  
  public void f()
  {
    if (a() != null) {
      a(ViewFactory.a().a(80000005, a(), true));
    }
  }
  
  public void g()
  {
    jdField_a_of_type_AndroidWidgetLinearLayout.removeAllViews();
  }
  
  public View getView()
  {
    return jdField_a_of_type_AndroidWidgetLinearLayout;
  }
  
  protected void h()
  {
    if (a() != null)
    {
      if (jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactCustomerLoadingDialog == null) {
        jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactCustomerLoadingDialog = new CustomerLoadingDialog(a());
      }
      if (!a().isFinishing()) {
        jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactCustomerLoadingDialog.show();
      }
    }
  }
  
  public void i()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactCustomerLoadingDialog != null) {
      jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactCustomerLoadingDialog.dismiss();
    }
  }
  
  @Deprecated
  public void j()
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = ((QQAppInterface)a().getAppRuntime());
    Bundle localBundle = getArguments();
    if (localBundle != null)
    {
      jdField_d_of_type_Int = localBundle.getInt("from_key", 0);
      jdField_d_of_type_JavaLangString = localBundle.getString("last_key_words");
    }
    e();
    if ((localBundle != null) && (!TextUtils.isEmpty(localBundle.getString("start_search_key")))) {
      a(localBundle.getString("start_search_key"), false);
    }
  }
  
  @Deprecated
  public void k()
  {
    jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactCustomerLoadingDialog = null;
    jdField_a_of_type_AndroidOsHandler = null;
    ViewFactory.a().a();
    jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactSearchFacade.d();
    jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactSearchFacade = null;
    if (jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder != null) {
      jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.d();
    }
    if (jdField_a_of_type_ComTencentMobileqqRichstatusStatusManager != null) {
      jdField_a_of_type_ComTencentMobileqqRichstatusStatusManager.b(jdField_a_of_type_ComTencentMobileqqRichstatusIIconListener);
    }
  }
  
  public void onAttach(Activity paramActivity)
  {
    super.onAttach(paramActivity);
    jdField_a_of_type_ComTencentMobileqqAppBaseActivity = ((FragmentActivity)paramActivity);
  }
  
  public void onClick(View paramView) {}
  
  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    j();
    a().addObserver(jdField_a_of_type_ComTencentMobileqqAppFriendListObserver);
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    jdField_a_of_type_AndroidWidgetLinearLayout = new LinearLayout(a());
    jdField_a_of_type_AndroidWidgetLinearLayout.setLayoutParams(new ViewGroup.LayoutParams(-1, -1));
    jdField_a_of_type_AndroidWidgetLinearLayout.setOrientation(1);
    jdField_a_of_type_AndroidWidgetLinearLayout.setClickable(true);
    jdField_a_of_type_ComTencentWidgetXListView = new XListView(a());
    jdField_a_of_type_ComTencentWidgetXListView.setCacheColorHint(0);
    jdField_a_of_type_ComTencentWidgetXListView.setDivider(null);
    jdField_a_of_type_ComTencentWidgetXListView.setSelector(2130843009);
    jdField_a_of_type_ComTencentWidgetXListView.setOnScrollListener(this);
    jdField_a_of_type_ComTencentWidgetXListView.setLayoutParams(new ViewGroup.LayoutParams(-1, -1));
    return jdField_a_of_type_AndroidWidgetLinearLayout;
  }
  
  public void onDestroy()
  {
    super.onDestroy();
    k();
    a().removeObserver(jdField_a_of_type_ComTencentMobileqqAppFriendListObserver);
  }
  
  public void onDetach()
  {
    super.onDetach();
    jdField_a_of_type_ComTencentMobileqqAppBaseActivity = null;
  }
  
  public void onResume()
  {
    super.onResume();
    if (jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.b()) {
      jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.b();
    }
  }
}
