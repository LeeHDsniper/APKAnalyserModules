import android.content.Context;
import android.content.res.Resources;
import android.graphics.Color;
import android.text.TextPaint;
import android.text.style.ClickableSpan;
import android.view.View;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.item.GrayTipsItemBuilder;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.FriendListHandler;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.widget.QQToast;
import java.util.ArrayList;

public class kxg
  extends ClickableSpan
{
  public kxg(GrayTipsItemBuilder paramGrayTipsItemBuilder)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    if (NetworkUtil.e(a.jdField_a_of_type_AndroidContentContext))
    {
      paramView = (FriendListHandler)a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(1);
      ArrayList localArrayList = new ArrayList();
      localArrayList.add(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a);
      paramView.a((short)1, localArrayList, false);
      return;
    }
    QQToast.a(a.jdField_a_of_type_AndroidContentContext, a.jdField_a_of_type_AndroidContentContext.getResources().getString(2131366990), 1).b(((BaseActivity)a.jdField_a_of_type_AndroidContentContext).getTitleBarHeight());
  }
  
  public void updateDrawState(TextPaint paramTextPaint)
  {
    paramTextPaint.setColor(Color.rgb(26, 144, 240));
  }
}
