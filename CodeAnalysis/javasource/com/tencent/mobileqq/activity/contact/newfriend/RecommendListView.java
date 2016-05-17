package com.tencent.mobileqq.activity.contact.newfriend;

import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.text.TextUtils;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup.LayoutParams;
import android.widget.Button;
import android.widget.ImageView;
import com.tencent.mobileqq.activity.AddFriendLogicActivity;
import com.tencent.mobileqq.app.FriendListObserver;
import com.tencent.mobileqq.app.FriendsManager;
import com.tencent.mobileqq.app.PhoneContactManagerImp;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.RecommendContactMsg;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.model.PhoneContactManager;
import com.tencent.mobileqq.phonecontact.ContactBindObserver;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.util.FaceDecoder;
import com.tencent.mobileqq.util.FaceDecoder.DecodeTaskCompletionListener;
import com.tencent.mobileqq.utils.ImageUtil;
import com.tencent.mobileqq.widget.ShaderAnimLayout;
import com.tencent.mobileqq.widget.SlideDetectListView;
import com.tencent.mobileqq.widget.SlideDetectListView.OnScrollToTopListener;
import com.tencent.mobileqq.widget.SlideDetectListView.OnSlideListener;
import com.tencent.widget.AbsListView;
import com.tencent.widget.ListView;
import java.util.List;
import lry;
import lrz;
import lsb;
import lsc;
import lsd;
import lsf;
import lsg;
import lsh;
import lsi;
import lsj;
import lsk;
import mqq.os.MqqHandler;

public class RecommendListView
  extends BaseNewFriendView
  implements View.OnClickListener, FaceDecoder.DecodeTaskCompletionListener, SlideDetectListView.OnScrollToTopListener, SlideDetectListView.OnSlideListener
{
  public static final int c = 0;
  public static final String c = "key_work_mode";
  public static final int d = 1;
  private static final int e = 1;
  private static final int f = 2;
  public int a;
  public long a;
  private Bitmap jdField_a_of_type_AndroidGraphicsBitmap;
  private View.OnClickListener jdField_a_of_type_AndroidViewView$OnClickListener;
  private FriendListObserver jdField_a_of_type_ComTencentMobileqqAppFriendListObserver;
  private ContactBindObserver jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver;
  private FaceDecoder jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder;
  public SlideDetectListView a;
  private Object jdField_a_of_type_JavaLangObject;
  public String a;
  public List a;
  private lsi jdField_a_of_type_Lsi;
  public lsj a;
  MqqHandler jdField_a_of_type_MqqOsMqqHandler;
  public int b;
  public long b;
  public String b;
  private boolean b;
  private long c;
  public View d;
  private int g;
  private int h;
  
  public RecommendListView(Context paramContext)
  {
    super(paramContext);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_b_of_type_Boolean = false;
    jdField_a_of_type_Long = 0L;
    jdField_b_of_type_Long = 0L;
    jdField_a_of_type_Int = 0;
    jdField_b_of_type_Int = -1;
    g = 0;
    h = 0;
    jdField_a_of_type_MqqOsMqqHandler = new lry(this);
    jdField_a_of_type_JavaLangObject = new Object();
    jdField_a_of_type_AndroidViewView$OnClickListener = new lsb(this);
  }
  
  private void a(ListView paramListView, String paramString, Bitmap paramBitmap)
  {
    int j;
    int i;
    if (h == 0)
    {
      j = paramListView.getChildCount();
      i = 0;
    }
    for (;;)
    {
      if (i < j)
      {
        lsk localLsk = (lsk)paramListView.getChildAt(i).getTag();
        if ((localLsk != null) && (paramString.equals(jdField_a_of_type_JavaLangString))) {
          jdField_a_of_type_AndroidWidgetImageView.setImageBitmap(paramBitmap);
        }
      }
      else
      {
        return;
      }
      i += 1;
    }
  }
  
  private void a(lsk paramLsk, String paramString, int paramInt1, int paramInt2)
  {
    Bitmap localBitmap2 = jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.a(paramInt2, paramString);
    Bitmap localBitmap1 = localBitmap2;
    if (localBitmap2 == null)
    {
      jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.a(paramString, paramInt2, false);
      if (jdField_a_of_type_AndroidGraphicsBitmap == null) {
        jdField_a_of_type_AndroidGraphicsBitmap = ImageUtil.a();
      }
      localBitmap1 = jdField_a_of_type_AndroidGraphicsBitmap;
    }
    jdField_a_of_type_AndroidWidgetImageView.setImageBitmap(localBitmap1);
    jdField_a_of_type_JavaLangString = paramString;
  }
  
  private boolean c()
  {
    if (jdField_b_of_type_Boolean) {
      return false;
    }
    jdField_a_of_type_ComTencentMobileqqWidgetSlideDetectListView = ((SlideDetectListView)findViewById(2131301984));
    d = findViewById(2131301985);
    if (g == 0) {
      jdField_a_of_type_ComTencentMobileqqWidgetSlideDetectListView.setOnSlideListener(this);
    }
    jdField_a_of_type_ComTencentMobileqqWidgetSlideDetectListView.setTranscriptMode(0);
    jdField_a_of_type_ComTencentMobileqqWidgetSlideDetectListView.setOnScrollToTopListener(this);
    jdField_a_of_type_Lsj = new lsj(this, null);
    jdField_b_of_type_Boolean = true;
    PhoneContactManager localPhoneContactManager = (PhoneContactManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(10);
    if ((jdField_a_of_type_JavaUtilList != null) && (jdField_a_of_type_JavaUtilList.size() > 0))
    {
      if (jdField_a_of_type_ComTencentMobileqqWidgetSlideDetectListView.a() != jdField_a_of_type_Lsj) {
        jdField_a_of_type_ComTencentMobileqqWidgetSlideDetectListView.setAdapter(jdField_a_of_type_Lsj);
      }
      jdField_a_of_type_Lsj.notifyDataSetChanged();
    }
    for (;;)
    {
      return true;
      jdField_a_of_type_ComTencentMobileqqWidgetSlideDetectListView.setAdapter(null);
      jdField_a_of_type_ComTencentMobileqqWidgetSlideDetectListView.setEmptyView(d);
    }
  }
  
  private void d(boolean paramBoolean)
  {
    a(1, paramBoolean);
  }
  
  private void j()
  {
    a(2130904259);
    c();
  }
  
  private void k()
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(new lrz(this));
  }
  
  private void l()
  {
    PhoneContactManagerImp localPhoneContactManagerImp = (PhoneContactManagerImp)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(10);
    if (jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver == null)
    {
      jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver = new lsd(this, localPhoneContactManagerImp);
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.registObserver(jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver);
    }
  }
  
  private void m()
  {
    j();
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(RecommendListView.class, jdField_a_of_type_MqqOsMqqHandler);
    jdField_a_of_type_ComTencentMobileqqAppFriendListObserver = new lsf(this);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(jdField_a_of_type_ComTencentMobileqqAppFriendListObserver);
    l();
    jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder = new FaceDecoder(getContext(), jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
    jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.a(this);
  }
  
  public void a() {}
  
  public void a(int paramInt1, int paramInt2, Intent paramIntent)
  {
    if ((paramInt1 == 1) || (paramInt1 == 2)) {
      k();
    }
  }
  
  public void a(int paramInt1, int paramInt2, String paramString, Bitmap paramBitmap)
  {
    if ((paramBitmap == null) || (TextUtils.isEmpty(paramString))) {
      return;
    }
    a(jdField_a_of_type_ComTencentMobileqqWidgetSlideDetectListView, paramString, paramBitmap);
  }
  
  protected void a(Intent paramIntent, BaseNewFriendView.INewFriendContext paramINewFriendContext)
  {
    int i = 0;
    if (paramIntent != null) {
      i = paramIntent.getIntExtra("key_work_mode", 0);
    }
    g = i;
    super.a(paramIntent, paramINewFriendContext);
    m();
  }
  
  public void a(SlideDetectListView paramSlideDetectListView, View paramView, int paramInt)
  {
    if ((paramInt < 0) || (paramInt >= jdField_a_of_type_Lsj.getCount())) {}
    do
    {
      return;
      jdField_a_of_type_Lsj.jdField_a_of_type_Int = paramInt;
      View localView = paramView.findViewById(2131296705);
      if (localView != null)
      {
        Button localButton = (Button)localView.findViewById(2131296706);
        localButton.setTag(Integer.valueOf(paramInt));
        localButton.setOnClickListener(jdField_a_of_type_AndroidViewView$OnClickListener);
        ((ShaderAnimLayout)localView).a();
        paramSlideDetectListView.setDeleteAreaWidth(getLayoutParamswidth);
      }
      paramSlideDetectListView = paramView.findViewById(2131302147);
      if (paramSlideDetectListView != null) {
        paramSlideDetectListView.setVisibility(4);
      }
      paramSlideDetectListView = paramView.findViewById(2131296837);
    } while (paramSlideDetectListView == null);
    paramSlideDetectListView.setVisibility(4);
  }
  
  public void a(AbsListView paramAbsListView, int paramInt)
  {
    h = paramInt;
    if (paramInt != 0)
    {
      jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.a();
      jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.c();
    }
    for (;;)
    {
      return;
      if (jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.b()) {
        jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.b();
      }
      int i = jdField_a_of_type_ComTencentMobileqqWidgetSlideDetectListView.getChildCount();
      paramInt = 0;
      while (paramInt < i)
      {
        lsk localLsk = (lsk)jdField_a_of_type_ComTencentMobileqqWidgetSlideDetectListView.getChildAt(paramInt).getTag();
        if ((localLsk != null) && (!TextUtils.isEmpty(jdField_a_of_type_JavaLangString)))
        {
          Bitmap localBitmap = jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.a(11, jdField_a_of_type_JavaLangString);
          paramAbsListView = localBitmap;
          if (localBitmap == null)
          {
            jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.a(jdField_a_of_type_JavaLangString, 11, false);
            if (jdField_a_of_type_AndroidGraphicsBitmap == null) {
              jdField_a_of_type_AndroidGraphicsBitmap = ImageUtil.a();
            }
            paramAbsListView = jdField_a_of_type_AndroidGraphicsBitmap;
          }
          jdField_a_of_type_AndroidWidgetImageView.setImageBitmap(paramAbsListView);
        }
        paramInt += 1;
      }
    }
  }
  
  public void a(AbsListView paramAbsListView, int paramInt1, int paramInt2, int paramInt3) {}
  
  public void b(SlideDetectListView paramSlideDetectListView, View paramView, int paramInt)
  {
    paramSlideDetectListView = jdField_a_of_type_Lsj.getItem(paramInt);
    if (paramSlideDetectListView == null) {}
    View localView;
    do
    {
      do
      {
        Object localObject;
        do
        {
          return;
          paramSlideDetectListView = (RecommendContactMsg)paramSlideDetectListView;
          jdField_a_of_type_Lsj.jdField_a_of_type_Int = -1;
          localObject = paramView.findViewById(2131296705);
          if (localObject != null)
          {
            ((ShaderAnimLayout)localObject).d();
            localObject = (Button)((View)localObject).findViewById(2131296706);
            ((Button)localObject).setTag(null);
            ((Button)localObject).setOnClickListener(null);
          }
          localObject = (FriendsManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(50);
        } while (localObject == null);
        localView = paramView.findViewById(2131302147);
        paramView = paramView.findViewById(2131296837);
        if ((!((FriendsManager)localObject).b(uin)) && (!((FriendsManager)localObject).d(uin)) && (!((FriendsManager)localObject).d(nationCode + mobileCode))) {
          break;
        }
      } while (paramView == null);
      paramView.postDelayed(new lsg(this, paramView), 300L);
      return;
    } while (localView == null);
    localView.postDelayed(new lsh(this, localView), 300L);
  }
  
  boolean b()
  {
    long l = System.currentTimeMillis();
    if (l - c > 500L)
    {
      c = l;
      return true;
    }
    return false;
  }
  
  protected void d()
  {
    super.d();
    if (g == 0)
    {
      a(true);
      d(false);
      return;
    }
    a(2131367318, new lsc(this));
  }
  
  protected void e()
  {
    super.e();
    if ((jdField_b_of_type_Boolean) && (jdField_a_of_type_Lsj != null)) {
      jdField_a_of_type_Lsj.notifyDataSetChanged();
    }
  }
  
  protected void f()
  {
    super.f();
    PhoneContactManagerImp localPhoneContactManagerImp = (PhoneContactManagerImp)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(10);
  }
  
  protected void g()
  {
    super.g();
    jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.c();
    jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.a();
    if (jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver != null)
    {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.unRegistObserver(jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver);
      jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver = null;
    }
  }
  
  protected void h()
  {
    super.h();
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.b(jdField_a_of_type_ComTencentMobileqqAppFriendListObserver);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(RecommendListView.class);
    jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.a(null);
    if (jdField_a_of_type_Lsj != null) {
      jdField_a_of_type_Lsj.a();
    }
    if (g == 0) {
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "Frd_offer", "Clk_Frd_offer", 22, 0, jdField_a_of_type_Long + "", jdField_b_of_type_Long + "", jdField_a_of_type_JavaLangString + "&" + jdField_b_of_type_JavaLangString, jdField_a_of_type_Int + "");
    }
  }
  
  public void onClick(View paramView)
  {
    if (!b()) {}
    while (paramView.getId() != 2131302147) {
      return;
    }
    paramView = (RecommendContactMsg)paramView.getTag();
    if ((source != null) && (source.length() > 0)) {
      paramView = AddFriendLogicActivity.a(jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendBaseNewFriendView$INewFriendContext.getActivity(), 1, uin, null, 3003, 1, nickName, null, null, getContext().getString(2131369135), null);
    }
    for (;;)
    {
      b(paramView, 1);
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "frd_recommend", "Frd_add", 0, 0, "", "", "", "");
      return;
      String str = nationCode + mobileCode;
      if (originBinder == 3L) {
        paramView = AddFriendLogicActivity.a(jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendBaseNewFriendView$INewFriendContext.getActivity(), 2, str, null, 3009, 1, contactName, null, null, getContext().getString(2131369135), null);
      } else {
        paramView = AddFriendLogicActivity.a(jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendBaseNewFriendView$INewFriendContext.getActivity(), 2, str, null, 3006, 1, contactName, null, null, getContext().getString(2131369135), null);
      }
    }
  }
}
