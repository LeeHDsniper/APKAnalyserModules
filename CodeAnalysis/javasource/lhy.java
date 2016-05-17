import android.support.v4.app.FragmentActivity;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.activity.ChatActivityUtils;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.MultiForwardChatPie;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.MultiMsgProxy;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.app.proxy.ProxyManager;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.multimsg.MultiMsgManager;
import com.tencent.mobileqq.pic.DownCallBack;
import com.tencent.mobileqq.pic.DownCallBack.DownResult;
import com.tencent.qphone.base.util.QLog;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

public class lhy
  implements DownCallBack
{
  WeakReference a;
  
  public lhy(MultiForwardChatPie paramMultiForwardChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = new WeakReference(paramMultiForwardChatPie);
  }
  
  public void a(int paramInt, boolean paramBoolean) {}
  
  public void a(DownCallBack.DownResult paramDownResult)
  {
    if (a == null) {}
    MultiForwardChatPie localMultiForwardChatPie;
    do
    {
      do
      {
        do
        {
          return;
          localMultiForwardChatPie = (MultiForwardChatPie)a.get();
          if ((jdField_a_of_type_Int != 0) || (jdField_a_of_type_ArrayOfByte == null)) {
            break;
          }
          if (QLog.isColorLevel()) {
            QLog.d("MultiMsg", 2, "MultiForwardActivity.onDownload success");
          }
        } while (localMultiForwardChatPie == null);
        localObject = new HashMap();
        MessageRecord localMessageRecord = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, g);
        paramDownResult = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().a(jdField_a_of_type_ArrayOfByte, (HashMap)localObject, localMessageRecord);
      } while ((paramDownResult == null) || (paramDownResult.size() <= 0));
      MultiMsgManager.a().a((HashMap)localObject, g, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
      Object localObject = new ArrayList();
      paramDownResult = paramDownResult.iterator();
      while (paramDownResult.hasNext()) {
        ((List)localObject).add((ChatMessage)paramDownResult.next());
      }
      b = ((List)localObject);
      paramDownResult = ChatActivityUtils.a(b, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
      paramDownResult = ChatActivityUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, BaseApplicationImpl.getContext(), jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, paramDownResult);
      if (QLog.isColorLevel()) {
        QLog.d("MultiMsg", 2, "MultiForwardActivity.onDownload, requestReceiveMultiMsg uses " + (System.currentTimeMillis() - MultiForwardChatPie.a(localMultiForwardChatPie)));
      }
      MultiMsgManager.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, b, true);
      jdField_a_of_type_AndroidSupportV4AppFragmentActivity.runOnUiThread(new lhz(this, localMultiForwardChatPie, paramDownResult));
      return;
      if (QLog.isColorLevel()) {
        QLog.d("MultiMsg", 2, "MultiForwardActivity.onDownload failed");
      }
    } while (localMultiForwardChatPie == null);
    MultiMsgManager.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, null, false);
    jdField_a_of_type_AndroidSupportV4AppFragmentActivity.runOnUiThread(new lia(this, localMultiForwardChatPie));
  }
}
