import QQService.EVIPSPEC;
import android.content.res.Resources;
import android.graphics.drawable.BitmapDrawable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.specialcare.SpecailCareListActivity;
import com.tencent.mobileqq.activity.specialcare.SpecailCareListActivity.ViewHolder;
import com.tencent.mobileqq.app.FriendListHandler;
import com.tencent.mobileqq.app.FriendsManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.Friends;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.util.FaceDecoder;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.mobileqq.utils.ImageUtil;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.XListView;
import java.util.ArrayList;

public class mrf
  extends BaseAdapter
{
  LayoutInflater jdField_a_of_type_AndroidViewLayoutInflater;
  View jdField_a_of_type_AndroidViewView;
  
  public mrf(SpecailCareListActivity paramSpecailCareListActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_AndroidViewLayoutInflater = ((LayoutInflater)paramSpecailCareListActivity.getSystemService("layout_inflater"));
  }
  
  public View a()
  {
    return jdField_a_of_type_AndroidViewView;
  }
  
  public void a(View paramView)
  {
    jdField_a_of_type_AndroidViewView = paramView;
  }
  
  public int getCount()
  {
    int i = jdField_a_of_type_ComTencentMobileqqActivitySpecialcareSpecailCareListActivity.b.size();
    if (i > 0) {
      return i;
    }
    return 1;
  }
  
  public Object getItem(int paramInt)
  {
    if (paramInt < jdField_a_of_type_ComTencentMobileqqActivitySpecialcareSpecailCareListActivity.b.size()) {
      return jdField_a_of_type_ComTencentMobileqqActivitySpecialcareSpecailCareListActivity.b.get(paramInt);
    }
    return null;
  }
  
  public long getItemId(int paramInt)
  {
    return 0L;
  }
  
  public int getItemViewType(int paramInt)
  {
    if (jdField_a_of_type_ComTencentMobileqqActivitySpecialcareSpecailCareListActivity.b.size() == 0) {
      return 1;
    }
    return 0;
  }
  
  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    Object localObject1;
    Object localObject2;
    if (getItemViewType(paramInt) == 1)
    {
      localObject1 = paramView;
      if (paramView == null)
      {
        localObject1 = jdField_a_of_type_AndroidViewLayoutInflater.inflate(2130904288, paramViewGroup, false);
        paramView = ((View)localObject1).getLayoutParams();
        if (paramView == null) {
          break label181;
        }
        height = jdField_a_of_type_ComTencentMobileqqActivitySpecialcareSpecailCareListActivity.jdField_a_of_type_ComTencentWidgetXListView.getHeight();
        width = jdField_a_of_type_ComTencentMobileqqActivitySpecialcareSpecailCareListActivity.jdField_a_of_type_ComTencentWidgetXListView.getWidth();
      }
      for (;;)
      {
        ((View)localObject1).setLayoutParams(paramView);
        paramInt = ((FriendsManager)jdField_a_of_type_ComTencentMobileqqActivitySpecialcareSpecailCareListActivity.app.getManager(50)).c();
        paramView = (Button)((View)localObject1).findViewById(2131302140);
        if (QLog.isColorLevel()) {
          QLog.d("SpecialCare", 2, "getView  friends count = " + paramInt);
        }
        paramViewGroup = (TextView)((View)localObject1).findViewById(2131298051);
        localObject2 = (TextView)((View)localObject1).findViewById(2131298058);
        if (paramInt > 0) {
          break;
        }
        ((TextView)localObject2).setVisibility(8);
        paramView.setVisibility(8);
        localObject2 = localObject1;
        return localObject2;
        label181:
        paramView = new ViewGroup.LayoutParams(jdField_a_of_type_ComTencentMobileqqActivitySpecialcareSpecailCareListActivity.jdField_a_of_type_ComTencentWidgetXListView.getWidth(), jdField_a_of_type_ComTencentMobileqqActivitySpecialcareSpecailCareListActivity.jdField_a_of_type_ComTencentWidgetXListView.getHeight());
      }
      ((TextView)localObject2).setVisibility(0);
      paramView.setVisibility(0);
      paramViewGroup.setText(2131370681);
      paramView.setOnClickListener(jdField_a_of_type_ComTencentMobileqqActivitySpecialcareSpecailCareListActivity);
      return localObject1;
    }
    if (paramView != null)
    {
      localObject1 = (SpecailCareListActivity.ViewHolder)paramView.getTag();
      label253:
      if (localObject1 != null) {
        break label1545;
      }
      paramViewGroup = jdField_a_of_type_AndroidViewLayoutInflater.inflate(2130904292, paramViewGroup, false);
      localObject1 = new SpecailCareListActivity.ViewHolder();
      paramViewGroup.setTag(localObject1);
      jdField_a_of_type_AndroidWidgetImageView = ((ImageView)paramViewGroup.findViewById(2131296683));
      jdField_a_of_type_AndroidWidgetTextView = ((TextView)paramViewGroup.findViewById(2131297636));
      jdField_c_of_type_AndroidWidgetTextView = ((TextView)paramViewGroup.findViewById(2131297637));
      jdField_b_of_type_AndroidWidgetTextView = ((TextView)paramViewGroup.findViewById(2131297640));
      jdField_b_of_type_AndroidWidgetImageView = ((ImageView)paramViewGroup.findViewById(2131297635));
      jdField_c_of_type_AndroidWidgetImageView = ((ImageView)paramViewGroup.findViewById(2131302148));
      d = ((ImageView)paramViewGroup.findViewById(2131297578));
      e = ((ImageView)paramViewGroup.findViewById(2131297638));
      f = ((ImageView)paramViewGroup.findViewById(2131297639));
      jdField_a_of_type_AndroidViewView = paramViewGroup.findViewById(2131302149);
      paramViewGroup.setOnClickListener(jdField_a_of_type_ComTencentMobileqqActivitySpecialcareSpecailCareListActivity);
    }
    for (;;)
    {
      Friends localFriends = (Friends)jdField_a_of_type_ComTencentMobileqqActivitySpecialcareSpecailCareListActivity.b.get(paramInt);
      jdField_a_of_type_ComTencentMobileqqDataFriends = localFriends;
      jdField_a_of_type_JavaLangString = uin;
      jdField_c_of_type_AndroidWidgetImageView.setTag(uin);
      jdField_c_of_type_AndroidWidgetImageView.setOnClickListener(jdField_a_of_type_ComTencentMobileqqActivitySpecialcareSpecailCareListActivity);
      if (AppSetting.i) {
        jdField_c_of_type_AndroidWidgetImageView.setContentDescription("删除");
      }
      paramView = jdField_a_of_type_ComTencentMobileqqActivitySpecialcareSpecailCareListActivity.jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.a(1, uin, 0);
      if (paramView == null)
      {
        if (!jdField_a_of_type_ComTencentMobileqqActivitySpecialcareSpecailCareListActivity.jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.b()) {
          jdField_a_of_type_ComTencentMobileqqActivitySpecialcareSpecailCareListActivity.jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.a(uin, 1, true);
        }
        jdField_a_of_type_AndroidWidgetImageView.setBackgroundDrawable((BitmapDrawable)ImageUtil.a());
        label571:
        paramInt = ContactUtils.a(detalStatusFlag, iTermType);
        paramView = (FriendListHandler)jdField_a_of_type_ComTencentMobileqqActivitySpecialcareSpecailCareListActivity.app.a(1);
        switch (paramInt)
        {
        case 5: 
        case 6: 
        default: 
          paramView = paramView.a(localFriends.getLastLoginType());
          if (paramView == null) {
            paramView = jdField_a_of_type_ComTencentMobileqqActivitySpecialcareSpecailCareListActivity.getString(2131369891);
          }
          break;
        }
      }
      for (;;)
      {
        label673:
        label685:
        int i;
        int j;
        if ((paramInt == 0) || (paramInt == 6))
        {
          paramInt = 1;
          jdField_c_of_type_AndroidWidgetTextView.setText("[" + paramView + "]");
          jdField_a_of_type_ComTencentMobileqqActivitySpecialcareSpecailCareListActivity.a(localFriends, (SpecailCareListActivity.ViewHolder)localObject1);
          jdField_b_of_type_AndroidWidgetImageView.setVisibility(0);
          if (paramInt != 0) {
            break label1319;
          }
          i = netTypeIconId;
          j = 1;
          label754:
          if (j != 0)
          {
            k = ContactUtils.a(i);
            jdField_b_of_type_AndroidWidgetImageView.setBackgroundResource(k);
          }
          if ((paramInt != 0) || ((!localFriends.isServiceEnabled(EVIPSPEC.E_SP_SUPERQQ)) && (!localFriends.isServiceEnabled(EVIPSPEC.E_SP_SUPERVIP)) && (!localFriends.isServiceEnabled(EVIPSPEC.E_SP_QQVIP)))) {
            break label1328;
          }
          jdField_a_of_type_AndroidWidgetTextView.setTextColor(jdField_a_of_type_ComTencentMobileqqActivitySpecialcareSpecailCareListActivity.getResources().getColorStateList(2131428238));
          label834:
          if (!localFriends.isServiceEnabled(EVIPSPEC.E_SP_SUPERVIP)) {
            break label1352;
          }
          jdField_a_of_type_AndroidWidgetTextView.setCompoundDrawablePadding(jdField_a_of_type_ComTencentMobileqqActivitySpecialcareSpecailCareListActivity.g);
          jdField_a_of_type_AndroidWidgetTextView.setCompoundDrawablesWithIntrinsicBounds(0, 0, 2130842814, 0);
        }
        RelativeLayout.LayoutParams localLayoutParams1;
        RelativeLayout.LayoutParams localLayoutParams2;
        for (;;)
        {
          String str = ContactUtils.a(localFriends);
          jdField_a_of_type_AndroidWidgetTextView.setText(str);
          localObject2 = new RelativeLayout.LayoutParams((int)(50.0F * SpecailCareListActivity.l(jdField_a_of_type_ComTencentMobileqqActivitySpecialcareSpecailCareListActivity)), (int)(50.0F * SpecailCareListActivity.m(jdField_a_of_type_ComTencentMobileqqActivitySpecialcareSpecailCareListActivity)));
          ((RelativeLayout.LayoutParams)localObject2).addRule(15);
          localLayoutParams1 = new RelativeLayout.LayoutParams(-2, -2);
          localLayoutParams1.addRule(1, 2131296683);
          localLayoutParams1.addRule(10);
          localLayoutParams2 = new RelativeLayout.LayoutParams(-2, -2);
          localLayoutParams2.addRule(1, 2131296683);
          if (!jdField_a_of_type_ComTencentMobileqqActivitySpecialcareSpecailCareListActivity.c) {
            break label1410;
          }
          jdField_c_of_type_AndroidWidgetImageView.setVisibility(0);
          jdField_b_of_type_AndroidWidgetImageView.setVisibility(8);
          jdField_a_of_type_AndroidViewView.setVisibility(4);
          d.setVisibility(0);
          ((RelativeLayout.LayoutParams)localObject2).setMargins((int)(46.0F * SpecailCareListActivity.n(jdField_a_of_type_ComTencentMobileqqActivitySpecialcareSpecailCareListActivity)), 0, (int)(10.0F * SpecailCareListActivity.o(jdField_a_of_type_ComTencentMobileqqActivitySpecialcareSpecailCareListActivity)), 0);
          localLayoutParams1.setMargins(0, (int)(22.0F * SpecailCareListActivity.p(jdField_a_of_type_ComTencentMobileqqActivitySpecialcareSpecailCareListActivity)), 0, 0);
          localLayoutParams2.setMargins(0, (int)(24.0F * SpecailCareListActivity.q(jdField_a_of_type_ComTencentMobileqqActivitySpecialcareSpecailCareListActivity)), 0, 0);
          jdField_a_of_type_AndroidWidgetImageView.setLayoutParams((ViewGroup.LayoutParams)localObject2);
          jdField_a_of_type_AndroidWidgetTextView.setLayoutParams(localLayoutParams1);
          localObject2 = paramViewGroup;
          if (!AppSetting.i) {
            break;
          }
          localObject2 = new StringBuilder(24);
          ((StringBuilder)localObject2).append(str).append(".").append(paramView).append(".");
          if ((localFriends.isServiceEnabled(EVIPSPEC.E_SP_SUPERVIP)) || (localFriends.isServiceEnabled(EVIPSPEC.E_SP_QQVIP))) {
            ((StringBuilder)localObject2).append("QQ会员").append(".");
          }
          ((StringBuilder)localObject2).append(jdField_b_of_type_AndroidWidgetTextView.getText()).append(".");
          if ((paramInt == 0) && (j != 0)) {
            ((StringBuilder)localObject2).append(ContactUtils.a(i));
          }
          paramViewGroup.setContentDescription((CharSequence)localObject2);
          return paramViewGroup;
          localObject1 = null;
          break label253;
          jdField_a_of_type_AndroidWidgetImageView.setBackgroundDrawable(new BitmapDrawable(paramView));
          break label571;
          paramView = jdField_a_of_type_ComTencentMobileqqActivitySpecialcareSpecailCareListActivity.getString(2131369886);
          break label673;
          paramView = jdField_a_of_type_ComTencentMobileqqActivitySpecialcareSpecailCareListActivity.getString(2131369887);
          break label673;
          paramView = jdField_a_of_type_ComTencentMobileqqActivitySpecialcareSpecailCareListActivity.getString(2131369889);
          break label673;
          paramInt = 0;
          break label685;
          label1319:
          j = 0;
          i = 0;
          break label754;
          label1328:
          jdField_a_of_type_AndroidWidgetTextView.setTextColor(jdField_a_of_type_ComTencentMobileqqActivitySpecialcareSpecailCareListActivity.getResources().getColorStateList(2131428173));
          break label834;
          label1352:
          if (localFriends.isServiceEnabled(EVIPSPEC.E_SP_QQVIP))
          {
            jdField_a_of_type_AndroidWidgetTextView.setCompoundDrawablePadding(jdField_a_of_type_ComTencentMobileqqActivitySpecialcareSpecailCareListActivity.g);
            jdField_a_of_type_AndroidWidgetTextView.setCompoundDrawablesWithIntrinsicBounds(0, 0, 2130842944, 0);
          }
          else
          {
            jdField_a_of_type_AndroidWidgetTextView.setCompoundDrawablesWithIntrinsicBounds(0, 0, 0, 0);
          }
        }
        label1410:
        jdField_c_of_type_AndroidWidgetImageView.setVisibility(8);
        ImageView localImageView = jdField_b_of_type_AndroidWidgetImageView;
        if (j != 0) {}
        for (int k = 0;; k = 8)
        {
          localImageView.setVisibility(k);
          jdField_a_of_type_AndroidViewView.setVisibility(0);
          d.setVisibility(8);
          ((RelativeLayout.LayoutParams)localObject2).setMargins((int)(12.0F * SpecailCareListActivity.r(jdField_a_of_type_ComTencentMobileqqActivitySpecialcareSpecailCareListActivity)), 0, (int)(10.0F * SpecailCareListActivity.s(jdField_a_of_type_ComTencentMobileqqActivitySpecialcareSpecailCareListActivity)), 0);
          localLayoutParams1.setMargins(0, (int)(10.0F * SpecailCareListActivity.t(jdField_a_of_type_ComTencentMobileqqActivitySpecialcareSpecailCareListActivity)), 0, 0);
          localLayoutParams2.setMargins(0, (int)(36.0F * SpecailCareListActivity.u(jdField_a_of_type_ComTencentMobileqqActivitySpecialcareSpecailCareListActivity)), 0, 0);
          break;
        }
      }
      label1545:
      paramViewGroup = paramView;
    }
  }
  
  public int getViewTypeCount()
  {
    return 2;
  }
}
