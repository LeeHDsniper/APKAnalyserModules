package com.tencent.mobileqq.activity.contact;

import android.content.Intent;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.Handler;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.AddFriendLogicActivity;
import com.tencent.mobileqq.activity.BaseForwardSelectionActivity;
import com.tencent.mobileqq.activity.ProfileActivity;
import com.tencent.mobileqq.activity.ProfileActivity.AllInOne;
import com.tencent.mobileqq.activity.SplashActivity;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.app.CircleManager;
import com.tencent.mobileqq.app.FriendsManager;
import com.tencent.mobileqq.app.IphoneTitleBarActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.CircleBuddy;
import com.tencent.mobileqq.data.Friends;
import com.tencent.mobileqq.forward.ForwardAbility.ForwardAbilityType;
import com.tencent.mobileqq.forward.ForwardBaseOption;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.richstatus.IIconListener;
import com.tencent.mobileqq.richstatus.RichStatus;
import com.tencent.mobileqq.richstatus.StatusManager;
import com.tencent.mobileqq.service.circle.IFriendObserver;
import com.tencent.mobileqq.service.circle.IGroupObserver;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.util.FaceDecoder;
import com.tencent.mobileqq.util.FaceDecoder.DecodeTaskCompletionListener;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.mobileqq.utils.DisplayUtils;
import com.tencent.mobileqq.utils.ImageUtil;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.widget.AbsListView;
import com.tencent.widget.AbsListView.OnScrollListener;
import com.tencent.widget.XListView;
import java.util.ArrayList;
import java.util.List;
import lou;
import lov;
import low;
import lox;
import loz;
import lpa;

public class CircleMemberListActivity
  extends BaseForwardSelectionActivity
  implements View.OnClickListener, FaceDecoder.DecodeTaskCompletionListener, AbsListView.OnScrollListener
{
  static final long jdField_a_of_type_Long = 1000L;
  static final boolean jdField_b_of_type_Boolean = AppSetting.i;
  static final int jdField_c_of_type_Int = 1000;
  public static final String e = "k_group_name";
  public static final String f = "k_group_id";
  public volatile int a;
  private Bitmap jdField_a_of_type_AndroidGraphicsBitmap;
  private Drawable jdField_a_of_type_AndroidGraphicsDrawableDrawable;
  private Handler jdField_a_of_type_AndroidOsHandler = new lox(this);
  View jdField_a_of_type_AndroidViewView;
  private ImageView jdField_a_of_type_AndroidWidgetImageView;
  RelativeLayout jdField_a_of_type_AndroidWidgetRelativeLayout;
  private TextView jdField_a_of_type_AndroidWidgetTextView;
  public CircleManager a;
  FriendsManager jdField_a_of_type_ComTencentMobileqqAppFriendsManager;
  private IIconListener jdField_a_of_type_ComTencentMobileqqRichstatusIIconListener = new low(this);
  StatusManager jdField_a_of_type_ComTencentMobileqqRichstatusStatusManager;
  private IFriendObserver jdField_a_of_type_ComTencentMobileqqServiceCircleIFriendObserver = new lov(this);
  IGroupObserver jdField_a_of_type_ComTencentMobileqqServiceCircleIGroupObserver = new lou(this);
  private FaceDecoder jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder;
  private XListView jdField_a_of_type_ComTencentWidgetXListView;
  public ArrayList a;
  public loz a;
  private Drawable[] jdField_a_of_type_ArrayOfAndroidGraphicsDrawableDrawable;
  public int b;
  private TextView jdField_b_of_type_AndroidWidgetTextView;
  private TextView jdField_c_of_type_AndroidWidgetTextView;
  private int jdField_d_of_type_Int;
  private TextView jdField_d_of_type_AndroidWidgetTextView;
  private int e;
  String g;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public CircleMemberListActivity()
  {
    jdField_a_of_type_Int = 0;
  }
  
  private void a(int paramInt) {}
  
  private boolean a()
  {
    if (jdField_a_of_type_AndroidGraphicsDrawableDrawable == null)
    {
      jdField_a_of_type_AndroidGraphicsDrawableDrawable = getResources().getDrawable(2130838193);
      jdField_a_of_type_ArrayOfAndroidGraphicsDrawableDrawable = jdField_a_of_type_AndroidWidgetTextView.getCompoundDrawables();
      e = jdField_a_of_type_AndroidWidgetTextView.getCompoundDrawablePadding();
      jdField_a_of_type_AndroidWidgetTextView.setCompoundDrawablePadding(10);
      jdField_a_of_type_AndroidWidgetTextView.setCompoundDrawablesWithIntrinsicBounds(jdField_a_of_type_AndroidGraphicsDrawableDrawable, jdField_a_of_type_ArrayOfAndroidGraphicsDrawableDrawable[1], jdField_a_of_type_ArrayOfAndroidGraphicsDrawableDrawable[2], jdField_a_of_type_ArrayOfAndroidGraphicsDrawableDrawable[3]);
      ((Animatable)jdField_a_of_type_AndroidGraphicsDrawableDrawable).start();
      return true;
    }
    return false;
  }
  
  private void b()
  {
    jdField_a_of_type_JavaUtilArrayList = new ArrayList();
    int i = jdField_a_of_type_ComTencentMobileqqAppCircleManager.a(jdField_b_of_type_Int, jdField_a_of_type_JavaUtilArrayList, true);
    if ((i != 0) && (jdField_a_of_type_ComTencentMobileqqAppCircleManager.c(i) == 0)) {
      a();
    }
    jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder = new FaceDecoder(this, app);
    jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.a(this);
    jdField_a_of_type_Loz = new loz(this, null);
    jdField_a_of_type_ComTencentWidgetXListView.setAdapter(jdField_a_of_type_Loz);
  }
  
  private boolean b()
  {
    if (jdField_a_of_type_AndroidGraphicsDrawableDrawable != null)
    {
      ((Animatable)jdField_a_of_type_AndroidGraphicsDrawableDrawable).stop();
      jdField_a_of_type_AndroidGraphicsDrawableDrawable = null;
      jdField_a_of_type_AndroidWidgetTextView.setCompoundDrawablePadding(e);
      jdField_a_of_type_AndroidWidgetTextView.setCompoundDrawablesWithIntrinsicBounds(jdField_a_of_type_ArrayOfAndroidGraphicsDrawableDrawable[0], jdField_a_of_type_ArrayOfAndroidGraphicsDrawableDrawable[1], jdField_a_of_type_ArrayOfAndroidGraphicsDrawableDrawable[2], jdField_a_of_type_ArrayOfAndroidGraphicsDrawableDrawable[3]);
      return true;
    }
    return false;
  }
  
  private void c()
  {
    jdField_a_of_type_AndroidViewView = findViewById(2131296923);
    jdField_a_of_type_AndroidWidgetRelativeLayout = ((RelativeLayout)findViewById(2131297591));
    jdField_a_of_type_AndroidWidgetRelativeLayout.setVisibility(0);
    jdField_a_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131297034));
    jdField_a_of_type_AndroidWidgetTextView.setText(g);
    c = ((TextView)findViewById(2131297035));
    c.setVisibility(0);
    c.setOnClickListener(this);
    if (jdField_a_of_type_Boolean)
    {
      c.setText(2131367694);
      jdField_b_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131297323));
      jdField_b_of_type_AndroidWidgetTextView.setVisibility(8);
      jdField_d_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131297081));
      if (!jdField_a_of_type_Boolean) {
        break label416;
      }
      jdField_d_of_type_AndroidWidgetTextView.setText(2131366996);
      jdField_d_of_type_AndroidWidgetTextView.setVisibility(0);
      jdField_d_of_type_AndroidWidgetTextView.setOnClickListener(this);
    }
    for (;;)
    {
      jdField_a_of_type_AndroidWidgetImageView = ((ImageView)findViewById(2131297324));
      jdField_a_of_type_AndroidWidgetImageView.setVisibility(8);
      IphoneTitleBarActivity.setLayerType(c);
      IphoneTitleBarActivity.setLayerType(jdField_a_of_type_AndroidWidgetImageView);
      IphoneTitleBarActivity.setLayerType(jdField_b_of_type_AndroidWidgetTextView);
      findViewById(2131296923).setBackgroundResource(2130838185);
      jdField_a_of_type_ComTencentWidgetXListView = ((XListView)findViewById(2131301025));
      jdField_a_of_type_ComTencentWidgetXListView.setContentBackground(2130837739);
      jdField_a_of_type_ComTencentWidgetXListView.setOnScrollListener(this);
      View localView = getLayoutInflater().inflate(2130904750, jdField_a_of_type_ComTencentWidgetXListView, false);
      localView.findViewById(2131300492).setVisibility(8);
      Object localObject = (EditText)localView.findViewById(2131300511);
      ((EditText)localObject).setFocusableInTouchMode(false);
      ((EditText)localObject).setOnClickListener(this);
      ((EditText)localObject).setCursorVisible(false);
      localObject = (TextView)localView.findViewById(2131300512);
      ((TextView)localObject).setText(2131367314);
      jdField_a_of_type_ComTencentWidgetXListView.a(localView);
      if (jdField_b_of_type_Boolean)
      {
        c.setContentDescription("返回" + c.getText());
        jdField_a_of_type_AndroidWidgetTextView.setContentDescription(jdField_a_of_type_AndroidWidgetTextView.getText());
        localView.setContentDescription(((TextView)localObject).getText());
        jdField_d_of_type_AndroidWidgetTextView.setContentDescription("取消本次转发");
      }
      return;
      c.setText("人脉圈");
      break;
      label416:
      jdField_d_of_type_AndroidWidgetTextView.setVisibility(8);
    }
  }
  
  private void d()
  {
    Object localObject = (ViewGroup)findViewById(2131297322);
    if (localObject != null) {
      IphoneTitleBarActivity.setLayerType((View)localObject);
    }
    localObject = findViewById(2131297591);
    if (localObject != null) {
      IphoneTitleBarActivity.setLayerType((View)localObject);
    }
    localObject = (TextView)findViewById(2131297035);
    if (localObject != null) {
      IphoneTitleBarActivity.setLayerType((View)localObject);
    }
  }
  
  public View a()
  {
    View localView = getLayoutInflater().inflate(2130904032, null);
    lpa localLpa = new lpa(null);
    jdField_a_of_type_AndroidWidgetImageView = ((ImageView)localView.findViewById(2131296683));
    jdField_a_of_type_AndroidWidgetTextView = ((TextView)localView.findViewById(2131297636));
    jdField_b_of_type_AndroidWidgetTextView = ((TextView)localView.findViewById(2131297640));
    jdField_a_of_type_AndroidWidgetButton = ((Button)localView.findViewById(2131298505));
    jdField_b_of_type_AndroidWidgetButton = ((Button)localView.findViewById(2131298506));
    jdField_a_of_type_AndroidWidgetButton.setOnClickListener(this);
    jdField_b_of_type_AndroidWidgetButton.setOnClickListener(this);
    localView.setTag(localLpa);
    localView.setOnClickListener(this);
    jdField_a_of_type_AndroidWidgetButton.setOnClickListener(this);
    jdField_b_of_type_AndroidWidgetButton.setOnClickListener(this);
    return localView;
  }
  
  void a()
  {
    if (jdField_a_of_type_AndroidOsHandler.hasMessages(1000)) {
      jdField_a_of_type_AndroidOsHandler.removeMessages(1000);
    }
    jdField_a_of_type_AndroidOsHandler.sendEmptyMessageDelayed(1000, 1000L);
  }
  
  public void a(int paramInt1, int paramInt2)
  {
    ArrayList localArrayList1 = jdField_a_of_type_JavaUtilArrayList;
    if ((localArrayList1 == null) || (paramInt1 < 0) || (paramInt1 > localArrayList1.size()) || (paramInt2 < 0) || (paramInt2 > localArrayList1.size())) {}
    ArrayList localArrayList2;
    int i;
    label114:
    label231:
    do
    {
      int j;
      do
      {
        return;
        localArrayList2 = new ArrayList(50);
        i = paramInt1;
        for (;;)
        {
          if (i > paramInt2) {
            break label114;
          }
          if (jdField_a_of_type_Int != 0) {
            break;
          }
          localCircleBuddy = (CircleBuddy)localArrayList1.get(i);
          if (jdField_a_of_type_ComTencentMobileqqAppCircleManager.a(uin) == 2) {
            localArrayList2.add(uin);
          }
          i += 1;
        }
        j = localArrayList2.size();
      } while (j == 0);
      i = j;
      if (paramInt2 + 1 < localArrayList1.size())
      {
        i = paramInt2 + 1;
        for (paramInt2 = j;; paramInt2 = j)
        {
          if ((i >= localArrayList1.size()) || (paramInt2 >= 50)) {
            break label231;
          }
          if (jdField_a_of_type_Int != 0) {
            break;
          }
          localCircleBuddy = (CircleBuddy)localArrayList1.get(i);
          j = paramInt2;
          if (jdField_a_of_type_ComTencentMobileqqAppCircleManager.a(uin) == 2)
          {
            localArrayList2.add(uin);
            j = paramInt2 + 1;
          }
          i += 1;
        }
        i = paramInt2;
      }
      if ((i >= 50) || (paramInt1 <= 0)) {
        break;
      }
      paramInt2 = paramInt1 - 1;
      if ((paramInt2 < 0) || (i >= 50)) {
        break;
      }
    } while (jdField_a_of_type_Int != 0);
    CircleBuddy localCircleBuddy = (CircleBuddy)localArrayList1.get(paramInt2);
    if (jdField_a_of_type_ComTencentMobileqqAppCircleManager.a(uin) == 2) {
      localArrayList2.add(uin);
    }
    for (paramInt1 = i + 1;; paramInt1 = i)
    {
      paramInt2 -= 1;
      i = paramInt1;
      break;
      jdField_a_of_type_ComTencentMobileqqAppCircleManager.a(localArrayList2);
      return;
    }
  }
  
  public void a(int paramInt1, int paramInt2, String paramString, Bitmap paramBitmap)
  {
    if ((paramBitmap != null) && (jdField_a_of_type_Int != 2))
    {
      paramInt2 = jdField_a_of_type_ComTencentWidgetXListView.getChildCount();
      paramInt1 = 0;
      while (paramInt1 < paramInt2)
      {
        Object localObject = jdField_a_of_type_ComTencentWidgetXListView.getChildAt(paramInt1).getTag();
        if ((localObject != null) && ((localObject instanceof lpa)))
        {
          localObject = (lpa)localObject;
          if (jdField_a_of_type_ComTencentMobileqqDataCircleBuddy.uin.equals(paramString)) {
            jdField_a_of_type_AndroidWidgetImageView.setImageBitmap(paramBitmap);
          }
        }
        paramInt1 += 1;
      }
    }
  }
  
  public void a(View paramView, CircleBuddy paramCircleBuddy)
  {
    lpa localLpa = (lpa)paramView.getTag();
    Bitmap localBitmap2 = jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.a(1, uin);
    Bitmap localBitmap1 = localBitmap2;
    if (localBitmap2 == null)
    {
      if (jdField_a_of_type_Int != 2) {
        jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.a(uin, 1, false, (byte)1);
      }
      if (jdField_a_of_type_AndroidGraphicsBitmap == null) {
        jdField_a_of_type_AndroidGraphicsBitmap = ImageUtil.a();
      }
      localBitmap1 = jdField_a_of_type_AndroidGraphicsBitmap;
    }
    jdField_a_of_type_AndroidWidgetImageView.setImageBitmap(localBitmap1);
    jdField_a_of_type_AndroidWidgetTextView.setText(jdField_a_of_type_ComTencentMobileqqAppCircleManager.a(paramCircleBuddy));
    a(localLpa, paramCircleBuddy);
    jdField_a_of_type_ComTencentMobileqqDataCircleBuddy = paramCircleBuddy;
    if (jdField_b_of_type_Boolean)
    {
      paramCircleBuddy = jdField_a_of_type_AndroidWidgetTextView.getText().toString();
      paramView.setContentDescription(paramCircleBuddy);
      jdField_a_of_type_AndroidWidgetButton.setContentDescription("向" + paramCircleBuddy + "发消息按钮");
      jdField_b_of_type_AndroidWidgetButton.setContentDescription("添加" + paramCircleBuddy + "为好友");
    }
  }
  
  void a(CircleBuddy paramCircleBuddy)
  {
    boolean bool = jdField_a_of_type_ComTencentMobileqqAppFriendsManager.b(uin);
    Intent localIntent = AIOUtils.a(new Intent(getActivity(), SplashActivity.class), null);
    localIntent.putExtra("uin", uin);
    if (bool)
    {
      paramCircleBuddy = jdField_a_of_type_ComTencentMobileqqAppFriendsManager.c(uin);
      if (paramCircleBuddy != null)
      {
        localIntent.putExtra("cSpecialFlag", cSpecialFlag);
        localIntent.putExtra("uinname", ContactUtils.a(paramCircleBuddy));
      }
      if (!bool) {
        break label170;
      }
    }
    label170:
    for (int i = 0;; i = 1021)
    {
      localIntent.putExtra("uintype", i);
      startActivity(localIntent);
      ReportController.b(app, "CliOper", "", "", "Network_circle", "Circle_list_send", 0, 0, "", "", "", "");
      return;
      localIntent.putExtra("uinname", jdField_a_of_type_ComTencentMobileqqAppCircleManager.a(paramCircleBuddy));
      break;
    }
  }
  
  public void a(AbsListView paramAbsListView, int paramInt)
  {
    jdField_a_of_type_Int = paramInt;
    if (jdField_a_of_type_Int != 0)
    {
      jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.a();
      jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.c();
      return;
    }
    if (jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.b()) {
      jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.b();
    }
    int i = jdField_a_of_type_ComTencentWidgetXListView.getChildCount();
    paramInt = 0;
    if (paramInt < i)
    {
      paramAbsListView = (lpa)jdField_a_of_type_ComTencentWidgetXListView.getChildAt(paramInt).getTag();
      Bitmap localBitmap;
      if (paramAbsListView != null)
      {
        localBitmap = jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.a(1, jdField_a_of_type_ComTencentMobileqqDataCircleBuddy.uin);
        if (localBitmap != null) {
          break label168;
        }
        jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.a(jdField_a_of_type_ComTencentMobileqqDataCircleBuddy.uin, 1, false, (byte)1);
      }
      for (;;)
      {
        if (jdField_b_of_type_AndroidWidgetTextView.getText().length() == 0) {
          jdField_b_of_type_AndroidWidgetTextView.setText(jdField_a_of_type_ComTencentMobileqqAppCircleManager.a(jdField_a_of_type_ComTencentMobileqqDataCircleBuddy.uin, 0).a(""));
        }
        paramInt += 1;
        break;
        label168:
        jdField_a_of_type_AndroidWidgetImageView.setImageBitmap(localBitmap);
      }
    }
    a();
  }
  
  public void a(AbsListView paramAbsListView, int paramInt1, int paramInt2, int paramInt3) {}
  
  public void a(lpa paramLpa, CircleBuddy paramCircleBuddy)
  {
    paramCircleBuddy = jdField_a_of_type_ComTencentMobileqqAppCircleManager.a(uin, jdField_a_of_type_Int);
    if (!TextUtils.isEmpty(c))
    {
      Object localObject = jdField_a_of_type_ComTencentMobileqqRichstatusStatusManager.a(jdField_d_of_type_Int, 200);
      localObject = new BitmapDrawable(getResources(), (Bitmap)localObject);
      int i = jdField_d_of_type_Int;
      ((Drawable)localObject).setBounds(0, 0, Math.round(((Drawable)localObject).getIntrinsicWidth() * 1.0F / ((Drawable)localObject).getIntrinsicHeight() * i), i);
      jdField_b_of_type_AndroidWidgetTextView.setCompoundDrawables((Drawable)localObject, null, null, null);
    }
    for (jdField_a_of_type_Int = jdField_d_of_type_Int;; jdField_a_of_type_Int = 0)
    {
      paramCircleBuddy = paramCircleBuddy.a(null);
      jdField_b_of_type_AndroidWidgetTextView.setText(paramCircleBuddy);
      if (jdField_a_of_type_Int == 0) {
        a();
      }
      return;
      jdField_b_of_type_AndroidWidgetTextView.setCompoundDrawables(null, null, null, null);
    }
  }
  
  void b(CircleBuddy paramCircleBuddy)
  {
    if (jdField_a_of_type_ComTencentMobileqqAppFriendsManager.b(uin))
    {
      QQToast.a(this, 2131368336, 0).b(getTitleBarHeight());
      return;
    }
    startActivity(AddFriendLogicActivity.a(this, 1, uin, null, 3003, 2, jdField_a_of_type_ComTencentMobileqqAppCircleManager.a(paramCircleBuddy), null, null, null, null));
    ReportController.b(app, "CliOper", "", "", "Network_circle", "Circle_list_add", 0, 0, "", "", "", "");
  }
  
  void c(CircleBuddy paramCircleBuddy)
  {
    boolean bool = jdField_a_of_type_ComTencentMobileqqAppFriendsManager.b(uin);
    Object localObject;
    Bundle localBundle;
    int i;
    if (bool)
    {
      localObject = jdField_a_of_type_ComTencentMobileqqAppFriendsManager.c(uin);
      if (localObject != null)
      {
        localObject = ContactUtils.a((Friends)localObject);
        localBundle = new Bundle();
        localBundle.putString("uin", uin);
        if (!bool) {
          break label139;
        }
        i = 0;
        label68:
        localBundle.putInt("uintype", i);
        localBundle.putString("uinname", (String)localObject);
        localObject = jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption;
        if (!bool) {
          break label146;
        }
      }
    }
    label139:
    label146:
    for (paramCircleBuddy = ForwardAbility.ForwardAbilityType.b;; paramCircleBuddy = ForwardAbility.ForwardAbilityType.h)
    {
      ((ForwardBaseOption)localObject).a(paramCircleBuddy.intValue(), localBundle);
      return;
      localObject = jdField_a_of_type_ComTencentMobileqqAppCircleManager.a(paramCircleBuddy);
      break;
      localObject = jdField_a_of_type_ComTencentMobileqqAppCircleManager.a(paramCircleBuddy);
      break;
      i = 1021;
      break label68;
    }
  }
  
  void d(CircleBuddy paramCircleBuddy)
  {
    boolean bool = jdField_a_of_type_ComTencentMobileqqAppFriendsManager.b(uin);
    Object localObject = uin;
    if (bool) {}
    for (int i = 1;; i = 71)
    {
      localObject = new ProfileActivity.AllInOne((String)localObject, i);
      n = remark;
      h = nickName;
      g = 84;
      ProfileActivity.b(getActivity(), (ProfileActivity.AllInOne)localObject);
      return;
    }
  }
  
  protected void doOnActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    super.doOnActivityResult(paramInt1, paramInt2, paramIntent);
  }
  
  protected boolean doOnCreate(Bundle paramBundle)
  {
    super.doOnCreate(paramBundle);
    setContentView(2130904031);
    getWindow().setBackgroundDrawable(null);
    jdField_b_of_type_Int = getIntent().getIntExtra("k_group_id", 0);
    g = getIntent().getStringExtra("k_group_name");
    jdField_a_of_type_ComTencentMobileqqAppCircleManager = ((CircleManager)app.getManager(34));
    jdField_a_of_type_ComTencentMobileqqAppCircleManager.a(jdField_a_of_type_ComTencentMobileqqServiceCircleIGroupObserver);
    jdField_a_of_type_ComTencentMobileqqAppCircleManager.a(jdField_a_of_type_ComTencentMobileqqServiceCircleIFriendObserver);
    jdField_a_of_type_ComTencentMobileqqAppFriendsManager = ((FriendsManager)app.getManager(50));
    jdField_a_of_type_ComTencentMobileqqRichstatusStatusManager = ((StatusManager)app.getManager(14));
    jdField_a_of_type_ComTencentMobileqqRichstatusStatusManager.a(jdField_a_of_type_ComTencentMobileqqRichstatusIIconListener);
    jdField_d_of_type_Int = ((int)DisplayUtils.a(this, 12.0F));
    c();
    b();
    d();
    return true;
  }
  
  protected void doOnDestroy()
  {
    if (jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder != null)
    {
      jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.d();
      jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder = null;
    }
    jdField_a_of_type_ComTencentMobileqqAppCircleManager.b(jdField_a_of_type_ComTencentMobileqqServiceCircleIGroupObserver);
    jdField_a_of_type_ComTencentMobileqqAppCircleManager.b(jdField_a_of_type_ComTencentMobileqqServiceCircleIFriendObserver);
    jdField_a_of_type_ComTencentMobileqqRichstatusStatusManager.b(jdField_a_of_type_ComTencentMobileqqRichstatusIIconListener);
    super.doOnDestroy();
  }
  
  public void onClick(View paramView)
  {
    switch (paramView.getId())
    {
    default: 
      paramView = (lpa)paramView.getTag();
      if (jdField_a_of_type_Boolean)
      {
        setResult(1);
        ReportController.b(app, "CliOper", "", "", "Network_circle", "Forward_frd_send", 0, 0, "", "", "", "");
        c(jdField_a_of_type_ComTencentMobileqqDataCircleBuddy);
        return;
      }
      break;
    case 2131298505: 
      a(getParentgetTagjdField_a_of_type_ComTencentMobileqqDataCircleBuddy);
      return;
    case 2131298506: 
      b(getParentgetTagjdField_a_of_type_ComTencentMobileqqDataCircleBuddy);
      return;
    case 2131300511: 
      if (jdField_a_of_type_Boolean)
      {
        a(14);
        return;
      }
      a(13);
      return;
    case 2131297035: 
      finish();
      return;
    case 2131297081: 
      if (jdField_a_of_type_Boolean)
      {
        jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.a(false);
        com.tencent.mobileqq.app.PhoneContactManagerImp.f = false;
      }
      setResult(1);
      finish();
      return;
    }
    ReportController.b(app, "CliOper", "", "", "P_prof", "Prof_in_client", 84, 0, "", "", "", "");
    d(jdField_a_of_type_ComTencentMobileqqDataCircleBuddy);
  }
  
  protected void requestWindowFeature(Intent paramIntent)
  {
    requestWindowFeature(1);
  }
}
