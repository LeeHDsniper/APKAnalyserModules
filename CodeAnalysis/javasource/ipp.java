import android.app.Dialog;
import android.content.res.Resources;
import android.os.Handler;
import android.os.Message;
import android.text.TextUtils;
import android.widget.TextView;
import com.tencent.mobileqq.activity.ContactSyncJumpActivity;
import com.tencent.mobileqq.app.FriendListObserver;
import com.tencent.mobileqq.contactsync.ContactSyncManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import friendlist.GetOnlineInfoResp;

public class ipp
  extends FriendListObserver
{
  public ipp(ContactSyncJumpActivity paramContactSyncJumpActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(boolean paramBoolean, long paramLong, String paramString, GetOnlineInfoResp paramGetOnlineInfoResp)
  {
    int j = 55536;
    if ((!paramString.equals(ContactSyncJumpActivity.a(a))) && (!paramString.equals(ContactSyncJumpActivity.b(a) + ContactSyncJumpActivity.c(a)))) {}
    label103:
    int i;
    label132:
    label161:
    label189:
    label216:
    label358:
    label364:
    label372:
    label380:
    label387:
    label394:
    label401:
    do
    {
      return;
      boolean bool;
      if (QLog.isColorLevel())
      {
        paramString = new StringBuilder();
        paramString.append("onGetOnlineInfo | isSuccess = ").append(paramBoolean);
        localObject = paramString.append(" | resp = ");
        if (paramGetOnlineInfoResp == null) {
          break label358;
        }
        bool = true;
        ((StringBuilder)localObject).append(bool);
        localObject = paramString.append(" | resp.result = ");
        if (paramGetOnlineInfoResp == null) {
          break label364;
        }
        i = result;
        ((StringBuilder)localObject).append(i);
        localObject = paramString.append(" | resp.errorCode = ");
        if (paramGetOnlineInfoResp == null) {
          break label372;
        }
        i = errorCode;
        ((StringBuilder)localObject).append(i);
        localObject = paramString.append(" | resp.iTermType = ");
        if (paramGetOnlineInfoResp == null) {
          break label380;
        }
        paramLong = iTermType;
        ((StringBuilder)localObject).append(paramLong);
        localObject = paramString.append(" | resp.status = ");
        if (paramGetOnlineInfoResp == null) {
          break label387;
        }
        paramLong = dwStatus;
        ((StringBuilder)localObject).append(paramLong);
        localObject = paramString.append(" | resp.ability = ");
        if (paramGetOnlineInfoResp == null) {
          break label394;
        }
      }
      for (paramLong = uAbiFlag;; paramLong = -10000L)
      {
        ((StringBuilder)localObject).append(paramLong);
        localObject = paramString.append(" | resp.network = ");
        i = j;
        if (paramGetOnlineInfoResp != null) {
          i = eNetworkType;
        }
        ((StringBuilder)localObject).append(i);
        QLog.d("ContactSync.JumpActivity", 2, paramString.toString());
        if ((paramBoolean) && (paramGetOnlineInfoResp != null)) {
          break label401;
        }
        if ((a.jdField_a_of_type_AndroidAppDialog == null) || (a.jdField_a_of_type_Int != 2)) {
          break;
        }
        paramString = (TextView)a.jdField_a_of_type_AndroidAppDialog.findViewById(2131301066);
        paramString.setText(2131370836);
        paramString.setCompoundDrawablesWithIntrinsicBounds(null, null, null, null);
        return;
        bool = false;
        break label103;
        i = 55536;
        break label132;
        i = 55536;
        break label161;
        paramLong = -10000L;
        break label189;
        paramLong = -10000L;
        break label216;
      }
      if (result == 1)
      {
        if ((errorCode == 60001) || (errorCode == 60001))
        {
          paramString = String.format(a.getResources().getString(2131370831), new Object[] { ContactSyncJumpActivity.d(a) });
          ContactSyncJumpActivity.a(a).a(ContactSyncJumpActivity.e(a));
          ContactSyncJumpActivity.a(a, 1, paramString);
          return;
        }
        a.finish();
        return;
      }
    } while ((a.jdField_a_of_type_AndroidAppDialog == null) && (a.jdField_a_of_type_Int != 2));
    paramString = "";
    String str1 = ContactSyncJumpActivity.a(a).a(paramGetOnlineInfoResp);
    String str2 = ContactSyncJumpActivity.a(a).b(paramGetOnlineInfoResp);
    if (!TextUtils.isEmpty(str1)) {
      paramString = str1;
    }
    Object localObject = paramString;
    if (!TextUtils.isEmpty(str1))
    {
      localObject = paramString;
      if (!TextUtils.isEmpty(str2))
      {
        paramString = paramString + "\n";
        localObject = paramString + str2;
      }
    }
    if (!TextUtils.isEmpty((CharSequence)localObject))
    {
      i = 1;
      label642:
      if (i != 0) {
        break label760;
      }
    }
    label760:
    for (paramString = a.getResources().getString(2131370836);; paramString = (String)localObject)
    {
      localObject = (TextView)a.jdField_a_of_type_AndroidAppDialog.findViewById(2131301066);
      ((TextView)localObject).setText(paramString);
      ((TextView)localObject).setCompoundDrawablesWithIntrinsicBounds(null, null, null, null);
      if ((i == 0) || ((eNetworkType != 4) && (eNetworkType != 1))) {
        break;
      }
      paramString = new Message();
      what = 1000;
      arg1 = 4;
      ContactSyncJumpActivity.a(a).sendMessage(paramString);
      return;
      i = 0;
      break label642;
    }
  }
}
