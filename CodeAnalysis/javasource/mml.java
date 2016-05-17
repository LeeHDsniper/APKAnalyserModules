import QQService.AddDiscussMemberInfo;
import android.content.Intent;
import android.text.TextUtils;
import com.tencent.mobileqq.activity.selectmember.ResultRecord;
import com.tencent.mobileqq.activity.selectmember.SelectMemberActivity;
import com.tencent.mobileqq.app.DiscussionHandler;
import com.tencent.mobileqq.app.DiscussionManager;
import com.tencent.mobileqq.app.FriendsManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.DiscussionMemberInfo;
import com.tencent.mobileqq.data.Friends;
import com.tencent.mobileqq.data.TroopMemberInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.mobileqq.utils.DBUtils;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;

public class mml
  extends Thread
{
  public mml(SelectMemberActivity paramSelectMemberActivity, FriendsManager paramFriendsManager)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    ArrayList localArrayList = new ArrayList();
    Object localObject1 = ContactUtils.i(jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.app, jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.app.a());
    int i = jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.j.size() - 1;
    ResultRecord localResultRecord;
    Object localObject2;
    String str;
    if (i >= 0)
    {
      localResultRecord = (ResultRecord)jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.j.get(i);
      localObject2 = new AddDiscussMemberInfo();
      if (jdField_a_of_type_Int == 4)
      {
        RefStr = jdField_a_of_type_JavaLangString;
        Type = jdField_a_of_type_Int;
        localArrayList.add(localObject2);
        str = (String)localObject1 + "、";
        localObject2 = null;
        if (jdField_a_of_type_Int != 0) {
          break label307;
        }
        localObject2 = jdField_a_of_type_ComTencentMobileqqAppFriendsManager.c(jdField_a_of_type_JavaLangString);
        if (localObject2 == null) {
          break label865;
        }
        localObject1 = name;
        if (!TextUtils.isEmpty(remark)) {
          break label297;
        }
        localObject2 = name;
      }
    }
    for (;;)
    {
      label184:
      if (TextUtils.isEmpty((CharSequence)localObject1)) {
        localObject1 = str + jdField_a_of_type_JavaLangString;
      }
      for (;;)
      {
        i -= 1;
        break;
        try
        {
          Uin = Long.valueOf(jdField_a_of_type_JavaLangString).longValue();
          RefUin = Long.valueOf(c).longValue();
        }
        catch (NumberFormatException localNumberFormatException)
        {
          if (QLog.isColorLevel()) {
            QLog.d("SelectMemberActivity", 2, "NumberFormatException!!! uin=" + jdField_a_of_type_JavaLangString);
          }
        }
        continue;
        label297:
        localObject3 = remark;
        break label184;
        label307:
        Object localObject5;
        if (jdField_a_of_type_Int == 1)
        {
          localObject5 = DBUtils.a().a(jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.app, c, jdField_a_of_type_JavaLangString);
          localObject1 = localObject3;
          if (localObject5 == null) {
            break label184;
          }
          localObject1 = localObject3;
          if (TextUtils.isEmpty(friendnick)) {
            break label184;
          }
          localObject1 = friendnick;
          if (TextUtils.isEmpty(autoremark))
          {
            localObject3 = friendnick;
            break label184;
          }
          localObject3 = autoremark;
          break label184;
        }
        if (jdField_a_of_type_Int == 2)
        {
          localObject5 = ((DiscussionManager)jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.app.getManager(52)).a(c, jdField_a_of_type_JavaLangString);
          localObject1 = localObject3;
          if (localObject5 == null) {
            break label184;
          }
          localObject1 = localObject3;
          if (inteRemark == null) {
            break label184;
          }
          localObject1 = localObject3;
          if (inteRemark.length() <= 0) {
            break label184;
          }
          localObject1 = inteRemark;
          localObject3 = inteRemark;
          break label184;
        }
        if (jdField_a_of_type_Int == 3)
        {
          localObject1 = b;
          localObject3 = b;
          break label184;
        }
        localObject1 = localObject3;
        if (jdField_a_of_type_Int != 4) {
          break label184;
        }
        localObject1 = b;
        localObject3 = b;
        break label184;
        localObject1 = str + (String)localObject1;
      }
      Object localObject3 = localObject1;
      for (;;)
      {
        try
        {
          if (((String)localObject1).getBytes("utf-8").length > 48)
          {
            int j = ((String)localObject1).length();
            i = 1;
            localObject3 = localObject1;
            if (i <= j)
            {
              if (((String)localObject1).substring(0, i).getBytes("utf-8").length <= 48) {
                continue;
              }
              localObject3 = ((String)localObject1).substring(0, i - 1);
            }
          }
        }
        catch (Exception localException)
        {
          localException.printStackTrace();
          Object localObject4 = localObject1;
          continue;
          if (13 != jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.L) {
            continue;
          }
          SelectMemberActivity.h = false;
          continue;
          SelectMemberActivity.h = false;
          continue;
          if (!QLog.isColorLevel()) {
            continue;
          }
          QLog.d("SelectMemberActivity", 2, "add discussion member: groupCode: " + jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.Z + " member count: " + localArrayList.size());
          ((DiscussionHandler)localObject1).a(Long.valueOf(jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.Z).longValue(), localArrayList);
          return;
        }
        if (jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.a.getBooleanExtra("sendToVideo", false)) {
          jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.k = localArrayList;
        }
        localObject1 = (DiscussionHandler)jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.app.a(6);
        if (jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.Z != null) {
          continue;
        }
        if (QLog.isColorLevel()) {
          QLog.d("SelectMemberActivity", 2, "create discussion: " + (String)localObject3 + " member count: " + localArrayList.size());
        }
        if (10 != jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.L) {
          continue;
        }
        SelectMemberActivity.h = true;
        ((DiscussionHandler)localObject1).a((String)localObject3, localArrayList, jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.K);
        return;
        i += 1;
      }
      label865:
      localObject1 = null;
    }
  }
}
