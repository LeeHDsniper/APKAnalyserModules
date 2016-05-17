package com.tencent.mobileqq.data;

import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.io.Serializable;
import java.util.ArrayList;

public class PAMessage
  implements Serializable
{
  private static final long serialVersionUID = 243242567575L;
  public String grayTips;
  public ArrayList items;
  public long mMsgId;
  public String moreText;
  public String msg;
  public long sendTime;
  public int type;
  
  public PAMessage()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
}
