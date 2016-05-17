import android.content.Intent;
import android.view.View;
import com.tencent.mobileqq.activity.selectmember.ResultRecord;
import com.tencent.mobileqq.activity.selectmember.SelectMemberActivity;
import com.tencent.mobileqq.app.DiscussionObserver;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.widget.QQProgressDialog;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;
import java.util.Iterator;

public class mmn
  extends DiscussionObserver
{
  public mmn(SelectMemberActivity paramSelectMemberActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(boolean paramBoolean, long paramLong, String paramString)
  {
    if (!paramBoolean) {
      SelectMemberActivity.h = false;
    }
    ArrayList localArrayList;
    if (a.jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog != null)
    {
      a.jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.dismiss();
      if (!paramBoolean) {
        break label499;
      }
      if (QLog.isColorLevel()) {
        QLog.d("SelectMemberActivity", 2, "create discussion success: roomId: " + paramLong + ", mSubType: " + a.J + ", mEntrance: " + a.L);
      }
      localArrayList = new ArrayList();
      Iterator localIterator = a.j.iterator();
      while (localIterator.hasNext())
      {
        ResultRecord localResultRecord = (ResultRecord)localIterator.next();
        if (jdField_a_of_type_Int == 5)
        {
          if (jdField_a_of_type_JavaLangString.startsWith("pstn")) {
            jdField_a_of_type_JavaLangString = jdField_a_of_type_JavaLangString.substring("pstn".length());
          }
          localArrayList.add(jdField_a_of_type_JavaLangString);
        }
        else if ((jdField_a_of_type_Int == 4) && (jdField_a_of_type_JavaLangString.startsWith("+")))
        {
          localArrayList.add(jdField_a_of_type_JavaLangString);
        }
      }
      a.jdField_a_of_type_AndroidContentIntent.putExtra("roomId", String.valueOf(paramLong));
      a.jdField_a_of_type_AndroidContentIntent.putExtra("discussName", paramString);
      a.jdField_a_of_type_AndroidContentIntent.putExtra("qqPhoneUserList", localArrayList);
      a.jdField_a_of_type_AndroidContentIntent.putExtra("audioType", 2);
      a.jdField_a_of_type_AndroidContentIntent.putExtra("callType", 2);
      a.jdField_a_of_type_AndroidContentIntent.putExtra("reportType", SelectMemberActivity.a(a));
      if (a.L != 18) {
        break label469;
      }
      a.jdField_a_of_type_AndroidContentIntent.putExtra("from", 3);
    }
    for (;;)
    {
      if (a.L == 12) {
        a.jdField_a_of_type_AndroidContentIntent.putExtra("select_memeber_discussion_memeber_count", a.j.size() + 1);
      }
      if (13 == a.L) {
        a.a(String.valueOf(paramLong), paramString);
      }
      a.setResult(-1, a.jdField_a_of_type_AndroidContentIntent);
      if ((a.jdField_a_of_type_AndroidContentIntent != null) && (a.jdField_a_of_type_AndroidContentIntent.getBooleanExtra("sendToVideo", false))) {
        a.b(paramBoolean, paramLong, localArrayList);
      }
      a.finish();
      return;
      label469:
      if (a.L == 10) {
        a.jdField_a_of_type_AndroidContentIntent.putExtra("from", 6);
      }
    }
    label499:
    if (QLog.isColorLevel()) {
      QLog.d("SelectMemberActivity", 2, "create discussion fail");
    }
    QQToast.a(a, a.getString(2131367969), 2000).b(a.b.getHeight());
  }
  
  protected void a(boolean paramBoolean, long paramLong, ArrayList paramArrayList)
  {
    if (a.jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog != null)
    {
      a.jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.dismiss();
      if (!paramBoolean) {
        break label328;
      }
      if (QLog.isColorLevel()) {
        QLog.d("SelectMemberActivity", 2, "add discussion member success: roomId: " + paramLong);
      }
      ArrayList localArrayList = new ArrayList();
      Iterator localIterator = a.j.iterator();
      while (localIterator.hasNext())
      {
        ResultRecord localResultRecord = (ResultRecord)localIterator.next();
        if (jdField_a_of_type_Int == 5)
        {
          if (jdField_a_of_type_JavaLangString.startsWith("pstn")) {
            jdField_a_of_type_JavaLangString = jdField_a_of_type_JavaLangString.substring("pstn".length());
          }
          localArrayList.add(jdField_a_of_type_JavaLangString);
        }
      }
      a.jdField_a_of_type_AndroidContentIntent.putExtra("roomId", String.valueOf(paramLong));
      a.jdField_a_of_type_AndroidContentIntent.putExtra("qqPhoneUserList", localArrayList);
      a.jdField_a_of_type_AndroidContentIntent.putExtra("audioType", 2);
      a.jdField_a_of_type_AndroidContentIntent.putExtra("callType", 2);
      if (a.L != 18) {
        break label298;
      }
      a.jdField_a_of_type_AndroidContentIntent.putExtra("from", 3);
    }
    for (;;)
    {
      a.setResult(-1, a.jdField_a_of_type_AndroidContentIntent);
      if ((a.jdField_a_of_type_AndroidContentIntent != null) && (a.jdField_a_of_type_AndroidContentIntent.getBooleanExtra("sendToVideo", false))) {
        a.a(paramBoolean, paramLong, paramArrayList);
      }
      a.finish();
      return;
      label298:
      if (a.L == 10) {
        a.jdField_a_of_type_AndroidContentIntent.putExtra("from", 6);
      }
    }
    label328:
    if (QLog.isColorLevel()) {
      QLog.d("SelectMemberActivity", 2, "add discussion member fail");
    }
    QQToast.a(a, a.getString(2131367975), 2000).b(a.b.getHeight());
  }
  
  protected void a(Object[] paramArrayOfObject)
  {
    if (a.jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog != null) {
      a.jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.dismiss();
    }
    if (paramArrayOfObject == null) {}
    String str;
    do
    {
      return;
      str = (String)paramArrayOfObject[0];
    } while (!a.Z.equals(str));
    int i = ((Integer)paramArrayOfObject[1]).intValue();
    if (QLog.isColorLevel()) {
      QLog.d("SelectMemberActivity", 2, "add discussion member failed, error code: " + i);
    }
    QQToast.a(a, a.getString(2131367975), 0).b(a.getTitleBarHeight());
  }
}
