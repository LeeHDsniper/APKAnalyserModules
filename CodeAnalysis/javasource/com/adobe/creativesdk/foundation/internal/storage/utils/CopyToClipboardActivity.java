package com.adobe.creativesdk.foundation.internal.storage.utils;

import android.app.Activity;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Intent;
import android.os.Bundle;

public class CopyToClipboardActivity
  extends Activity
{
  public CopyToClipboardActivity() {}
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    paramBundle = getIntent().getCharSequenceExtra("android.intent.extra.TEXT");
    ((ClipboardManager)getSystemService("clipboard")).setPrimaryClip(ClipData.newPlainText(null, paramBundle));
    finish();
  }
}
