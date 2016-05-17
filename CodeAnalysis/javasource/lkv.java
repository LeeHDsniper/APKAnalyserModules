import android.os.Bundle;
import android.text.TextUtils;
import com.tencent.mobileqq.activity.aio.ChatAdapter1;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.TroopChatPie;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.bubble.ChatXListView;
import com.tencent.mobileqq.data.MessageForTroopTopic;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.troop.data.TroopTopicDetailInfo;
import com.tencent.mobileqq.troop.utils.TroopTopicMgr;
import com.tencent.mobileqq.troop.utils.TroopTopicObserver;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import java.util.Iterator;
import java.util.List;
import mqq.os.MqqHandler;
import org.json.JSONException;
import org.json.JSONObject;

public class lkv
  extends TroopTopicObserver
{
  public lkv(TroopChatPie paramTroopChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onReceive(int paramInt, boolean paramBoolean, Bundle paramBundle)
  {
    if (paramBundle == null) {
      QLog.d(".troop.troop_topic", 2, "TroopTopicObserver onReceive bundle is null. type:" + paramInt + " isSuccess:" + paramBoolean);
    }
    Object localObject2;
    int j;
    int k;
    int i;
    TroopTopicDetailInfo localTroopTopicDetailInfo;
    Object localObject1;
    do
    {
      return;
      localObject2 = a.jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1.a();
      j = a.jdField_a_of_type_ComTencentMobileqqBubbleChatXListView.s();
      k = a.jdField_a_of_type_ComTencentMobileqqBubbleChatXListView.t();
      i = paramBundle.getInt("ret");
      switch (paramInt)
      {
      default: 
        return;
      case 1: 
        localTroopTopicDetailInfo = (TroopTopicDetailInfo)paramBundle.getParcelable("detailInfo");
        localObject1 = paramBundle.getString("data");
      }
    } while ((i != 0) || (localTroopTopicDetailInfo == null) || (TextUtils.isEmpty((CharSequence)localObject1)));
    paramBundle = ((List)localObject2).iterator();
    paramInt = -1;
    while (paramBundle.hasNext())
    {
      localObject2 = (MessageRecord)paramBundle.next();
      i = paramInt + 1;
      paramInt = i;
      if ((localObject2 instanceof MessageForTroopTopic))
      {
        paramInt = i;
        if (frienduin.equals(troopUin))
        {
          paramInt = i;
          if (shmsgseq == msgSeq)
          {
            paramBundle = (MessageForTroopTopic)localObject2;
            paramInt = i;
          }
        }
      }
    }
    while (paramBundle != null)
    {
      for (;;)
      {
        try
        {
          localObject1 = new JSONObject((String)localObject1);
          pVersion = ((JSONObject)localObject1).optLong("version");
          likeNum = ((JSONObject)localObject1).optLong("likes");
          commentNum = ((JSONObject)localObject1).optLong("commentnum");
          if (((JSONObject)localObject1).optInt("is_zan") != 1) {
            continue;
          }
          paramBoolean = true;
          isLike = paramBoolean;
          paramBundle.syncFieldsToStruct();
        }
        catch (JSONException paramBundle)
        {
          QLog.d(".troop.troop_topic", 2, "TroopTopicObserver onReceive MSG_EXT_INFO_UPDATE parse data to jsonObject error");
          continue;
        }
        if ((paramInt < j) || (paramInt > k)) {
          break;
        }
        a.a(131076);
        return;
        paramBoolean = false;
      }
      localObject1 = (TroopTopicDetailInfo)paramBundle.getParcelable("detailInfo");
      if ((i != 0) || (localObject1 == null))
      {
        if (QLog.isColorLevel()) {
          QLog.d(".troop.troop_topic", 2, "TroopTopicObserver onReceive MSG_TOPIC_DETAIL_UPDATE. retCode:" + i);
        }
        a.a(131076);
        QQToast.a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getBaseContext(), "展开话题失败", 0).b(a.a());
        return;
      }
      paramBundle = ((List)localObject2).iterator();
      paramInt = -1;
      while (paramBundle.hasNext())
      {
        localObject2 = (MessageRecord)paramBundle.next();
        i = paramInt + 1;
        paramInt = i;
        if ((localObject2 instanceof MessageForTroopTopic))
        {
          paramInt = i;
          if (frienduin.equals(troopUin))
          {
            paramInt = i;
            if (shmsgseq == msgSeq)
            {
              paramBundle = (MessageForTroopTopic)localObject2;
              paramInt = i;
            }
          }
        }
      }
      while (paramBundle != null)
      {
        isExpand = true;
        isLoading = false;
        detailTopicContent = detailStructMsg;
        ((TroopTopicMgr)a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(97)).a(paramBundle);
        if ((paramInt < j) || (paramInt > k)) {
          break;
        }
        if (QLog.isColorLevel()) {
          QLog.d(".troop.troop_topic", 2, "TroopTopicObserver onReceive MSG_TOPIC_DETAIL_UPDATE. refresh");
        }
        a.jdField_a_of_type_ComTencentMobileqqBubbleChatXListView.setStackFromBottomWithoutRequestLayoutIfNecessary(false);
        a.a(131076);
        TroopChatPie.b(a).postDelayed(new lkw(this), 100L);
        return;
        localObject1 = paramBundle.getString("troopUin");
        long l = paramBundle.getLong("msgSeq");
        if ((i != 0) || (TextUtils.isEmpty((CharSequence)localObject1)) || (l < 0L)) {
          break;
        }
        paramBundle = a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().c((String)localObject1, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, l);
        if (!(paramBundle instanceof MessageForTroopTopic)) {
          break;
        }
        paramInt = ((List)localObject2).indexOf(paramBundle);
        if ((paramInt < j) || (paramInt > k)) {
          break;
        }
        a.a(131072);
        return;
        paramBundle = null;
      }
      paramBundle = null;
    }
  }
}
