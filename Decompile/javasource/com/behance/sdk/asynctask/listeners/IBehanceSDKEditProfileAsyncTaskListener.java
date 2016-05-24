package com.behance.sdk.asynctask.listeners;

import com.behance.sdk.asynctasks.result.BehanceSDKEditProfileTaskResult;

public abstract interface IBehanceSDKEditProfileAsyncTaskListener
{
  public abstract void onEditProfileTaskFailure(BehanceSDKEditProfileTaskResult paramBehanceSDKEditProfileTaskResult);
  
  public abstract void onEditProfileTaskSuccess(BehanceSDKEditProfileTaskResult paramBehanceSDKEditProfileTaskResult);
}
