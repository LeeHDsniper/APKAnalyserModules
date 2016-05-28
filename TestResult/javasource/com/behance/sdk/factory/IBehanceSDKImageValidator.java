package com.behance.sdk.factory;

import android.content.Context;

public abstract interface IBehanceSDKImageValidator
{
  public abstract boolean validate(Context paramContext, BehanceSDKImageProperties paramBehanceSDKImageProperties);
}
