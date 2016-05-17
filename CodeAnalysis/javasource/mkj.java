import android.app.Activity;
import android.content.Intent;
import android.graphics.drawable.Animatable;
import android.os.Handler;
import android.view.View;
import android.widget.GridView;
import com.tencent.mobileqq.activity.SplashActivity;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.selectmember.CreateFaceToFaceDiscussionActivity;
import com.tencent.mobileqq.app.NearFieldDiscussObserver;
import com.tencent.mobileqq.data.DiscussionInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pb.PBInt32Field;
import com.tencent.mobileqq.pb.PBStringField;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.mobileqq.widget.QQProgressDialog;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;
import java.util.List;
import tencent.im.nearfield_discuss.nearfield_discuss.BusiRespHead;

public class mkj
  extends NearFieldDiscussObserver
{
  public mkj(CreateFaceToFaceDiscussionActivity paramCreateFaceToFaceDiscussionActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(boolean paramBoolean, Object paramObject)
  {
    paramObject = (Object[])paramObject;
    int i = ((Integer)paramObject[0]).intValue();
    if (a.jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog != null)
    {
      a.jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.dismiss();
      a.jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog = null;
    }
    if (paramBoolean)
    {
      paramObject = (String)paramObject[1];
      if (i == a.jdField_b_of_type_Int)
      {
        if (!DiscussionInfo.isValidDisUin(paramObject)) {
          break label176;
        }
        a.finish();
        str = ContactUtils.a(a.app, a.getActivity().getApplicationContext(), paramObject);
        localIntent = AIOUtils.a(new Intent(a.getActivity(), SplashActivity.class), null);
        localIntent.putExtra("uin", paramObject);
        localIntent.putExtra("uintype", 3000);
        localIntent.putExtra("uinname", str);
        localIntent.putExtra("isBack2Root", true);
        a.startActivity(localIntent);
      }
    }
    label176:
    while (i != a.jdField_b_of_type_Int)
    {
      String str;
      Intent localIntent;
      return;
      CreateFaceToFaceDiscussionActivity.a(a, 1, a.getString(2131370967));
      return;
    }
    CreateFaceToFaceDiscussionActivity.b(a, 1, a.getString(2131370967));
  }
  
  protected void a(boolean paramBoolean, List paramList, int paramInt1, int paramInt2, nearfield_discuss.BusiRespHead paramBusiRespHead)
  {
    if (QLog.isColorLevel()) {
      QLog.i("CreateFaceToFaceDiscussionActivity", 2, "NearFieldDiscussObserver isSuccess = " + paramBoolean + " ; interval = " + paramInt1);
    }
    if (paramBoolean)
    {
      if (paramInt1 > 0) {
        a.jdField_a_of_type_Long = (paramInt1 * 1000);
      }
      if ((paramBusiRespHead != null) && (int32_reply_code.get() != 0))
      {
        if (!a.jdField_b_of_type_Boolean)
        {
          paramList = str_result.get();
          QQToast.a(a.jdField_a_of_type_AndroidContentContext, paramList, 0).a();
          ((Animatable)a.jdField_a_of_type_AndroidGraphicsDrawableDrawable).stop();
          a.jdField_a_of_type_AndroidViewView.setVisibility(4);
          if (a.jdField_a_of_type_AndroidOsHandler.hasMessages(1)) {
            a.jdField_a_of_type_AndroidOsHandler.removeMessages(1);
          }
          a.jdField_a_of_type_AndroidOsHandler.sendEmptyMessageDelayed(1, 600L);
        }
        if (QLog.isColorLevel()) {
          QLog.i("CreateFaceToFaceDiscussionActivity", 2, "head.int32_reply_code = " + int32_reply_code.get());
        }
        return;
      }
      if (a.jdField_a_of_type_JavaUtilList == null)
      {
        a.jdField_a_of_type_JavaUtilList = new ArrayList();
        a.jdField_a_of_type_JavaUtilList.add(a.jdField_a_of_type_TencentImNearfield_discussNearfield_discuss$UserProfile);
        if (paramList != null) {
          a.jdField_a_of_type_JavaUtilList.addAll(paramList);
        }
        if ((paramList == null) && (QLog.isColorLevel())) {
          QLog.i("CreateFaceToFaceDiscussionActivity", 2, "usrList == null");
        }
        if (a.jdField_a_of_type_Mkm != null)
        {
          a.jdField_a_of_type_Mkm.notifyDataSetChanged();
          a.jdField_a_of_type_AndroidWidgetGridView.setVisibility(0);
        }
        if (a.c)
        {
          a.c = false;
          CreateFaceToFaceDiscussionActivity.a(a);
          paramList = a.jdField_a_of_type_AndroidOsHandler.obtainMessage(0);
          a.jdField_a_of_type_AndroidOsHandler.sendMessageDelayed(paramList, a.jdField_a_of_type_Long);
        }
      }
    }
    for (;;)
    {
      ((Animatable)a.jdField_a_of_type_AndroidGraphicsDrawableDrawable).stop();
      a.jdField_a_of_type_AndroidViewView.setBackgroundDrawable(null);
      a.jdField_a_of_type_AndroidViewView.setVisibility(8);
      return;
      a.jdField_a_of_type_JavaUtilList.clear();
      break;
      if (!a.jdField_b_of_type_Boolean)
      {
        QQToast.a(a.jdField_a_of_type_AndroidContentContext, "请稍后再试", 1).a();
        if (a.jdField_a_of_type_AndroidOsHandler.hasMessages(1)) {
          a.jdField_a_of_type_AndroidOsHandler.removeMessages(1);
        }
        a.jdField_a_of_type_AndroidOsHandler.sendEmptyMessageDelayed(1, 600L);
      }
    }
  }
  
  protected void b(boolean paramBoolean, Object paramObject)
  {
    if (QLog.isColorLevel()) {
      QLog.i("CreateFaceToFaceDiscussionActivity", 2, "on push | isSuccess = " + paramBoolean);
    }
    if ((paramBoolean) && (((Integer)((Object[])(Object[])paramObject)[0]).intValue() == a.jdField_b_of_type_Int) && (a.isResume()))
    {
      if (a.jdField_a_of_type_AndroidOsHandler.hasMessages(0)) {
        a.jdField_a_of_type_AndroidOsHandler.removeMessages(0);
      }
      a.jdField_a_of_type_AndroidOsHandler.sendEmptyMessage(0);
    }
  }
}
