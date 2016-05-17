import android.content.Context;
import android.text.TextUtils;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.item.StructingMsgItemBuilder;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageForStructing;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.structmsg.AbsShareMsg;
import com.tencent.mobileqq.structmsg.AbsStructMsgElement;
import com.tencent.mobileqq.structmsg.AbsStructMsgItem;
import com.tencent.mobileqq.structmsg.StructMsgForGeneralShare;
import com.tencent.mobileqq.structmsg.view.StructMsgItemCover;
import com.tencent.mobileqq.structmsg.view.StructMsgItemLayout4;
import com.tencent.mobileqq.structmsg.view.StructMsgItemLayout5;
import com.tencent.mobileqq.structmsg.view.StructMsgItemPAAudio;
import com.tencent.mobileqq.structmsg.view.StructMsgItemPAVideo;
import com.tencent.mobileqq.structmsg.view.StructMsgItemSummary;
import com.tencent.mobileqq.structmsg.view.StructMsgItemTitle;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;

public class lav
  implements Runnable
{
  public lav(StructingMsgItemBuilder paramStructingMsgItemBuilder, ChatMessage paramChatMessage, Context paramContext)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if (QLog.isDevelopLevel()) {
      QLog.d("StructingMsgItemBuildertime", 4, "zhuanfa start:" + System.currentTimeMillis());
    }
    MessageForStructing localMessageForStructing;
    AbsShareMsg localAbsShareMsg;
    Object localObject13;
    Object localObject12;
    Object localObject11;
    Object localObject3;
    Object localObject10;
    Object localObject2;
    String str2;
    String str1;
    Object localObject4;
    Object localObject9;
    Object localObject7;
    Object localObject6;
    Object localObject5;
    Object localObject8;
    long l;
    String str3;
    Object localObject1;
    int i;
    if ((jdField_a_of_type_ComTencentMobileqqDataChatMessage != null) && ((jdField_a_of_type_ComTencentMobileqqDataChatMessage instanceof MessageForStructing)))
    {
      localMessageForStructing = (MessageForStructing)jdField_a_of_type_ComTencentMobileqqDataChatMessage;
      if ((structingMsg instanceof AbsShareMsg))
      {
        localAbsShareMsg = (AbsShareMsg)structingMsg;
        localObject13 = null;
        localObject12 = null;
        localObject11 = null;
        localObject3 = null;
        localObject10 = null;
        localObject2 = null;
        str2 = jdField_a_of_type_ComTencentMobileqqActivityAioItemStructingMsgItemBuilder.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d;
        str1 = mSourceIcon;
        localObject4 = mMsgUrl;
        localObject9 = mMsgAction;
        localObject7 = mMsgActionData;
        localObject6 = mMsg_A_ActionData;
        localObject5 = mMsg_I_ActionData;
        localObject8 = mMsgBrief;
        l = msgId;
        str3 = uin;
        if (!(localAbsShareMsg instanceof StructMsgForGeneralShare)) {
          break label1620;
        }
        localObject1 = (StructMsgForGeneralShare)localAbsShareMsg;
        StructingMsgItemBuilder.h = StructMsgForGeneralShare.clickedItemIndex;
        if (StructingMsgItemBuilder.h == 0) {
          break label1620;
        }
        i = 0;
        if (i >= localAbsShareMsg.getItemCount()) {
          break label1620;
        }
        localObject1 = localAbsShareMsg.getItemByIndex(i);
        if ((TextUtils.isEmpty(m)) || (Integer.valueOf(m).intValue() != StructingMsgItemBuilder.h) || ((!(localObject1 instanceof StructMsgItemLayout4)) && (!(localObject1 instanceof StructMsgItemLayout5)))) {}
      }
    }
    for (;;)
    {
      if (localObject1 != null)
      {
        if (!(localObject1 instanceof AbsStructMsgItem)) {
          break label1576;
        }
        localObject1 = (AbsStructMsgItem)localObject1;
        localObject9 = a;
        localObject6 = c;
        localObject8 = b;
        localObject11 = d;
        localObject10 = e;
        localObject7 = f;
        localObject5 = g;
        i = 0;
        localObject1 = localObject12;
        label337:
        if (i < ((ArrayList)localObject9).size())
        {
          localObject4 = (AbsStructMsgElement)((ArrayList)localObject9).get(i);
          if ((localObject4 instanceof StructMsgItemTitle))
          {
            localObject4 = ((StructMsgItemTitle)localObject4).b();
            localObject1 = localObject3;
            localObject3 = localObject4;
            localObject4 = localObject2;
            localObject2 = localObject1;
            localObject1 = localObject4;
          }
          for (;;)
          {
            i += 1;
            localObject4 = localObject3;
            localObject3 = localObject2;
            localObject2 = localObject1;
            localObject1 = localObject4;
            break label337;
            i += 1;
            break;
            if ((localObject4 instanceof StructMsgItemSummary))
            {
              localObject4 = ((StructMsgItemSummary)localObject4).b();
              localObject3 = localObject1;
              localObject1 = localObject2;
              localObject2 = localObject4;
            }
            else
            {
              if (!(localObject4 instanceof StructMsgItemCover)) {
                break label1557;
              }
              localObject4 = o;
              localObject2 = localObject3;
              localObject3 = localObject1;
              localObject1 = localObject4;
            }
          }
        }
        localObject4 = localObject7;
        localObject7 = localObject2;
        localObject9 = localObject1;
        localObject2 = localObject11;
        localObject1 = localObject8;
        localObject8 = localObject3;
        localObject3 = localObject10;
      }
      for (;;)
      {
        localObject10 = senderuin;
        localObject11 = Long.toString(msgId);
        ReportController.b(jdField_a_of_type_ComTencentMobileqqActivityAioItemStructingMsgItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Pb_account_lifeservice", "", "0X8005455", "0X8005455", 0, 0, (String)localObject10, (String)localObject1, (String)localObject11, "");
        if ((str1 == null) || ("".equals(str1)))
        {
          localObject10 = "http://url.cn/JS8oE7";
          label585:
          jdField_a_of_type_ComTencentMobileqqActivityAioItemStructingMsgItemBuilder.a(jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioItemStructingMsgItemBuilder.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, (String)localObject9, (String)localObject8, (String)localObject7, str2, (String)localObject1, (String)localObject10, (String)localObject6, (String)localObject2, localObject3, (String)localObject4, (String)localObject5, l, str3);
          ReportController.b(jdField_a_of_type_ComTencentMobileqqActivityAioItemStructingMsgItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Pb_account_lifeservice", "", "0X8005455", "0X8005455", 0, 0, str3, "" + l, "" + StructingMsgItemBuilder.h, "android");
          return;
          i = 0;
          localObject1 = localObject13;
          localObject2 = localObject11;
          localObject3 = localObject10;
          label713:
          if (i >= localAbsShareMsg.getItemCount()) {
            break label1440;
          }
          localObject10 = localAbsShareMsg.getItemByIndex(i);
          if ((localObject10 instanceof AbsStructMsgItem))
          {
            localObject12 = (AbsStructMsgItem)localObject10;
            localObject11 = a;
            if ((c == null) || ("".equals(c)) || ((localObject9 != null) && (!"".equals(localObject9)))) {
              break label1437;
            }
            localObject9 = c;
            label795:
            localObject10 = localObject4;
            if (b != null)
            {
              localObject10 = localObject4;
              if (!"".equals(b)) {
                if (localObject4 != null)
                {
                  localObject10 = localObject4;
                  if (!"".equals(localObject4)) {}
                }
                else
                {
                  localObject10 = b;
                }
              }
            }
            if ((d == null) || ("".equals(d)) || ((localObject7 != null) && (!"".equals(localObject7)))) {
              break label1430;
            }
            localObject4 = d;
            label893:
            if ((e == null) || (!"".equals(e)) || ((localObject6 != null) && (!"".equals(localObject6)))) {
              break label1427;
            }
            localObject6 = e;
            label936:
            if ((f == null) || (!"".equals(f)) || ((localObject5 != null) && (!"".equals(localObject5)))) {
              break label1424;
            }
            localObject5 = f;
            label979:
            if ((g == null) || (!"".equals(g)) || ((localObject8 != null) && (!"".equals(localObject8)))) {
              break label1417;
            }
            localObject7 = g;
            label1022:
            int j = 0;
            if (j >= ((ArrayList)localObject11).size()) {
              break label1510;
            }
            localObject8 = (AbsStructMsgElement)((ArrayList)localObject11).get(j);
            if (("title".equals(a)) && (localObject1 == null))
            {
              if (!(localObject8 instanceof StructMsgItemTitle)) {
                break label1495;
              }
              localObject8 = ((StructMsgItemTitle)localObject8).b();
              localObject1 = localObject3;
              localObject3 = localObject8;
            }
            for (;;)
            {
              label1088:
              j += 1;
              localObject8 = localObject3;
              localObject3 = localObject1;
              localObject1 = localObject8;
              break;
              if (("summary".equals(a)) && (localObject2 == null))
              {
                if (!(localObject8 instanceof StructMsgItemSummary)) {
                  break label1495;
                }
                localObject2 = ((StructMsgItemSummary)localObject8).b();
                localObject8 = localObject1;
                localObject1 = localObject3;
                localObject3 = localObject8;
              }
              else if (("picture".equals(a)) && (localObject3 == null))
              {
                if (!(localObject8 instanceof StructMsgItemCover)) {
                  break label1495;
                }
                localObject8 = o;
                localObject3 = localObject1;
                localObject1 = localObject8;
              }
              else if (("pavideo".equals(a)) && (localObject3 == null))
              {
                if (!(localObject8 instanceof StructMsgItemPAVideo)) {
                  break label1495;
                }
                localObject8 = p;
                localObject3 = localObject1;
                localObject1 = localObject8;
              }
              else
              {
                if ((!"paaudio".equals(a)) || (localObject3 != null) || (!(localObject8 instanceof StructMsgItemPAAudio))) {
                  break label1495;
                }
                localObject8 = o;
                localObject3 = localObject1;
                localObject1 = localObject8;
              }
            }
          }
          localObject10 = localObject8;
          localObject8 = localObject9;
          localObject9 = localObject1;
          localObject1 = localObject7;
          localObject7 = localObject3;
          localObject11 = localObject5;
          localObject3 = localObject9;
          localObject5 = localObject2;
          localObject9 = localObject4;
          localObject2 = localObject8;
          localObject4 = localObject1;
          localObject8 = localObject11;
          localObject1 = localObject10;
        }
        for (;;)
        {
          i += 1;
          localObject10 = localObject9;
          localObject9 = localObject8;
          localObject8 = localObject3;
          localObject11 = localObject2;
          localObject12 = localObject1;
          localObject3 = localObject7;
          localObject2 = localObject5;
          localObject1 = localObject8;
          localObject8 = localObject12;
          localObject5 = localObject9;
          localObject7 = localObject4;
          localObject9 = localObject11;
          localObject4 = localObject10;
          break label713;
          localObject10 = str1;
          break label585;
          label1417:
          localObject7 = localObject8;
          break label1022;
          label1424:
          break label979;
          label1427:
          break label936;
          label1430:
          localObject4 = localObject7;
          break label893;
          label1437:
          break label795;
          label1440:
          localObject12 = localObject6;
          localObject6 = localObject9;
          localObject9 = localObject3;
          localObject10 = localObject2;
          localObject11 = localObject1;
          localObject2 = localObject7;
          localObject1 = localObject4;
          localObject3 = localObject12;
          localObject4 = localObject5;
          localObject5 = localObject8;
          localObject7 = localObject9;
          localObject8 = localObject10;
          localObject9 = localObject11;
          break;
          label1495:
          localObject8 = localObject1;
          localObject1 = localObject3;
          localObject3 = localObject8;
          break label1088;
          label1510:
          localObject8 = localObject7;
          localObject7 = localObject10;
          localObject10 = localObject1;
          localObject11 = localObject2;
          localObject1 = localObject8;
          localObject8 = localObject5;
          localObject2 = localObject9;
          localObject9 = localObject7;
          localObject7 = localObject3;
          localObject5 = localObject11;
          localObject3 = localObject10;
        }
        label1557:
        localObject4 = localObject1;
        localObject1 = localObject2;
        localObject2 = localObject3;
        localObject3 = localObject4;
        break;
        label1576:
        localObject3 = localObject6;
        localObject6 = localObject9;
        localObject11 = null;
        localObject10 = null;
        localObject9 = null;
        localObject2 = localObject7;
        localObject1 = localObject4;
        localObject4 = localObject5;
        localObject5 = localObject8;
        localObject7 = localObject11;
        localObject8 = localObject10;
      }
      label1620:
      localObject1 = null;
    }
  }
}
