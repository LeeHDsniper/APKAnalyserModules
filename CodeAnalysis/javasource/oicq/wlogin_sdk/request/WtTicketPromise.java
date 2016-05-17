package oicq.wlogin_sdk.request;

import oicq.wlogin_sdk.tools.ErrMsg;

public abstract interface WtTicketPromise
{
  public abstract void Done(Ticket paramTicket);
  
  public abstract void Failed(ErrMsg paramErrMsg);
  
  public abstract void Timeout(ErrMsg paramErrMsg);
}
