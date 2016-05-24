package com.adobe.creativesdk.aviary.internal.receipt;

public abstract interface IReceiptManager
{
  public abstract void close();
  
  public abstract void open();
  
  public abstract void sendContent(String paramString);
  
  public abstract void sendTicket(Receipt paramReceipt);
  
  public abstract void upload();
}
