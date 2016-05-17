import android.content.Context;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.contact.addcontact.PublicView;
import com.tencent.mobileqq.adapter.FacePreloadBaseAdapter;
import com.tencent.mobileqq.adapter.FacePreloadBaseAdapter.FaceInfo;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.PublicRecommendAccountInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.DisplayUtils;
import com.tencent.widget.XListView;
import java.util.ArrayList;

public class lql
  extends FacePreloadBaseAdapter
{
  public lql(PublicView paramPublicView, Context paramContext, QQAppInterface paramQQAppInterface, XListView paramXListView)
  {
    super(paramContext, paramQQAppInterface, paramXListView, 1, true);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    paramXListView.setAdapter(this);
  }
  
  public PublicRecommendAccountInfo a(int paramInt)
  {
    if ((PublicView.a(a) != null) && (paramInt >= 0) && (paramInt < PublicView.a(a).size())) {
      return (PublicRecommendAccountInfo)PublicView.a(a).get(paramInt);
    }
    return null;
  }
  
  protected Object a(int paramInt)
  {
    FacePreloadBaseAdapter.FaceInfo localFaceInfo = new FacePreloadBaseAdapter.FaceInfo(this);
    PublicRecommendAccountInfo localPublicRecommendAccountInfo = a(paramInt);
    if (localPublicRecommendAccountInfo == null) {
      return localFaceInfo;
    }
    if (mSource == 1)
    {
      a = mEqqNameAccount;
      return localFaceInfo;
    }
    a = String.valueOf(mPublicuin);
    return localFaceInfo;
  }
  
  public int getCount()
  {
    if ((PublicView.a(a) != null) && (PublicView.a(a).size() > 0)) {
      return PublicView.a(a).size();
    }
    return 0;
  }
  
  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    if (paramView == null)
    {
      paramView = LayoutInflater.from(a.a).inflate(2130903716, paramViewGroup, false);
      paramViewGroup = new lqn();
      jdField_d_of_type_AndroidWidgetImageView = ((ImageView)paramView.findViewById(2131296835));
      jdField_a_of_type_AndroidWidgetTextView = ((TextView)paramView.findViewById(2131296838));
      c = ((TextView)paramView.findViewById(2131299726));
      jdField_b_of_type_AndroidWidgetTextView = ((TextView)paramView.findViewById(2131299727));
      jdField_d_of_type_AndroidWidgetTextView = ((TextView)paramView.findViewById(2131296842));
      paramView.setTag(paramViewGroup);
      paramView.setOnClickListener(a);
    }
    Object localObject;
    for (;;)
    {
      localObject = a(paramInt);
      if (localObject != null) {
        break;
      }
      return paramView;
      paramViewGroup = (lqn)paramView.getTag();
    }
    if (mSource == 1)
    {
      jdField_b_of_type_JavaLangString = mEqqNameAccount;
      label151:
      jdField_a_of_type_ComTencentMobileqqDataPublicRecommendAccountInfo = ((PublicRecommendAccountInfo)localObject);
      jdField_a_of_type_AndroidWidgetTextView.setVisibility(0);
      c.setVisibility(0);
      c.setCompoundDrawablesWithIntrinsicBounds(0, 0, 0, 0);
      c.setCompoundDrawablePadding(0);
      jdField_b_of_type_AndroidWidgetTextView.setVisibility(0);
      jdField_d_of_type_AndroidWidgetImageView.setImageBitmap(a(1, jdField_b_of_type_JavaLangString));
      if (!mIsVerified.equalsIgnoreCase("1")) {
        break label417;
      }
      Drawable localDrawable = a.getResources().getDrawable(2130838643);
      paramInt = (int)DisplayUtils.a(a.a, 15.0F);
      localDrawable.setBounds(0, 0, paramInt, paramInt);
      jdField_a_of_type_AndroidWidgetTextView.setCompoundDrawables(null, null, localDrawable, null);
      jdField_a_of_type_AndroidWidgetTextView.setCompoundDrawablePadding((int)DisplayUtils.a(a.a, 6.0F));
      label298:
      if (mSource != 1) {
        break label431;
      }
      jdField_a_of_type_AndroidWidgetTextView.setText(mEqqCs);
      jdField_b_of_type_AndroidWidgetTextView.setText(mEqqSi);
    }
    for (;;)
    {
      c.setVisibility(8);
      if (!AppSetting.i) {
        break;
      }
      localObject = new StringBuilder();
      ((StringBuilder)localObject).append(jdField_a_of_type_AndroidWidgetTextView.getText().toString());
      ((StringBuilder)localObject).append(jdField_b_of_type_AndroidWidgetTextView.getText().toString());
      paramView.setContentDescription(((StringBuilder)localObject).toString());
      return paramView;
      jdField_b_of_type_JavaLangString = String.valueOf(mPublicuin);
      break label151;
      label417:
      jdField_a_of_type_AndroidWidgetTextView.setCompoundDrawables(null, null, null, null);
      break label298;
      label431:
      jdField_a_of_type_AndroidWidgetTextView.setText(mPublicname);
      jdField_b_of_type_AndroidWidgetTextView.setText(mPublicdesc);
    }
  }
}
