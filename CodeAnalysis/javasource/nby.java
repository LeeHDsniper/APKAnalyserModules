import SecurityAccountServer.RespondQueryQQBindingStat;
import android.os.AsyncTask;
import android.text.TextUtils;
import com.tencent.mobileqq.app.FriendsManager;
import com.tencent.mobileqq.app.PhoneContactManagerImp;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.Friends;
import com.tencent.mobileqq.data.PhoneContact;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

public class nby
  extends AsyncTask
{
  private static final String jdField_a_of_type_JavaLangString = "PhoneContact.Manager.ContactFriendTask";
  private List jdField_a_of_type_JavaUtilList;
  
  private nby(PhoneContactManagerImp paramPhoneContactManagerImp)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected List a(RespondQueryQQBindingStat... paramVarArgs)
  {
    if (QLog.isColorLevel()) {
      QLog.d("PhoneContact.Manager.ContactFriendTask", 2, "doInBackground");
    }
    Object localObject = paramVarArgs[0];
    paramVarArgs = new ArrayList();
    paramVarArgs.addAll(PhoneContactManagerImp.a(jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp).values());
    Collections.sort(paramVarArgs, new nbz(this));
    ArrayList localArrayList = new ArrayList();
    FriendsManager localFriendsManager = (FriendsManager)PhoneContactManagerImp.a(jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp).getManager(50);
    Iterator localIterator;
    if (paramVarArgs.size() > 0)
    {
      localObject = mobileNo;
      localIterator = paramVarArgs.iterator();
    }
    PhoneContact localPhoneContact;
    do
    {
      do
      {
        if (localIterator.hasNext())
        {
          paramVarArgs = (PhoneContact)localIterator.next();
          if (!isCancelled()) {}
        }
        else
        {
          Collections.sort(localArrayList, new nca(this));
          return localArrayList;
        }
      } while ((localObject != null) && (((String)localObject).endsWith(mobileNo.trim())));
      localPhoneContact = (PhoneContact)paramVarArgs.clone();
    } while (TextUtils.isEmpty(uin));
    if (uin.equals("0"))
    {
      paramVarArgs = null;
      label201:
      if ((paramVarArgs == null) || (groupid < 0)) {
        break label272;
      }
      nickName = paramVarArgs.getFriendNick();
      remark = remark;
      faceUrl = Short.toString(faceid);
      sortWeight = 262144;
    }
    for (;;)
    {
      localArrayList.add(localPhoneContact);
      break;
      paramVarArgs = localFriendsManager.c(uin);
      break label201;
      label272:
      uin = "0";
      if (localFriendsManager.d(nationCode + mobileCode))
      {
        sortWeight = 131072;
        hasSendAddReq = true;
      }
      else if ((jdField_a_of_type_JavaUtilList != null) && (jdField_a_of_type_JavaUtilList.contains(mobileNo)))
      {
        sortWeight = jdField_a_of_type_JavaUtilList.indexOf(mobileNo);
      }
      else
      {
        sortWeight = 65536;
      }
    }
  }
  
  public void a(List paramList)
  {
    jdField_a_of_type_JavaUtilList = paramList;
  }
  
  protected void b(List paramList)
  {
    if (!isCancelled()) {
      jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp.a(paramList);
    }
  }
  
  protected void onCancelled()
  {
    if (QLog.isColorLevel()) {
      QLog.d("PhoneContact.Manager.ContactFriendTask", 2, "on cancelled");
    }
    PhoneContactManagerImp.a(jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp, null);
  }
}
