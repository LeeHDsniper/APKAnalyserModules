package com.adobe.creativesdk.aviary;

import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import com.aviary.android.feather.sdk.R.id;

public class ToolBarActivity
  extends AppCompatActivity
{
  private Toolbar mToolbar;
  
  public ToolBarActivity() {}
  
  public Toolbar getToolbar()
  {
    return mToolbar;
  }
  
  public void onContentChanged()
  {
    super.onContentChanged();
    mToolbar = ((Toolbar)findViewById(R.id.toolbar));
    setSupportActionBar(mToolbar);
  }
}
