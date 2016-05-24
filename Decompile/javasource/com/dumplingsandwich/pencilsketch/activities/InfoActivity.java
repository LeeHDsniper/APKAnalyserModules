package com.dumplingsandwich.pencilsketch.activities;

import android.app.AlertDialog.Builder;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.Toast;
import com.adobe.creativesdk.foundation.auth.AdobeAuthException;
import com.adobe.creativesdk.foundation.internal.auth.AdobeAuthManager;
import com.adobe.creativesdk.foundation.internal.auth.IAdobeAuthLogoutObserver;

public class InfoActivity
  extends AppCompatActivity
{
  private AdobeAuthManager mAdobeAuthManager;
  private IAdobeAuthLogoutObserver mLogoutClient;
  
  public InfoActivity() {}
  
  private void adobeSignOut()
  {
    mAdobeAuthManager.registerLogoutClient(mLogoutClient);
    mAdobeAuthManager.logout();
    invalidateOptionsMenu();
  }
  
  private void initializeAdobeAccountManager()
  {
    mLogoutClient = new IAdobeAuthLogoutObserver()
    {
      public void onError(AdobeAuthException paramAnonymousAdobeAuthException) {}
      
      public void onSuccess()
      {
        Toast.makeText(InfoActivity.this, "User logged out.", 0).show();
        invalidateOptionsMenu();
      }
    };
    mAdobeAuthManager = AdobeAuthManager.sharedAuthManager();
    mAdobeAuthManager.registerLogoutClient(mLogoutClient);
  }
  
  public void onClick(View paramView)
  {
    switch (paramView.getId())
    {
    default: 
      return;
    case 2131689663: 
      paramView = new Intent("android.intent.action.VIEW");
      paramView.setData(Uri.parse("market://details?id=com.dumplingsandwich.pencilsketch"));
      startActivity(paramView);
      return;
    case 2131689664: 
      paramView = new Intent("android.intent.action.VIEW");
      paramView.setData(Uri.parse("market://details?id=com.dumplingsandwich.pencilsketchpro"));
      startActivity(paramView);
      return;
    case 2131689665: 
      startActivity(new Intent(this, AppRecommendationActivity.class));
      return;
    case 2131689667: 
      startActivity(new Intent("android.intent.action.VIEW", Uri.parse("https://www.facebook.com/pencilsketchds/")));
      return;
    }
    startActivity(new Intent(this, DumplingSandwichAppsActivity.class));
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setContentView(2130903075);
    initializeAdobeAccountManager();
  }
  
  public boolean onCreateOptionsMenu(Menu paramMenu)
  {
    getMenuInflater().inflate(2131755019, paramMenu);
    return super.onCreateOptionsMenu(paramMenu);
  }
  
  protected void onDestroy()
  {
    super.onDestroy();
    mAdobeAuthManager.unregisterLogoutClient(mLogoutClient);
  }
  
  public boolean onOptionsItemSelected(MenuItem paramMenuItem)
  {
    switch (paramMenuItem.getItemId())
    {
    default: 
      return super.onOptionsItemSelected(paramMenuItem);
    }
    paramMenuItem = new AlertDialog.Builder(this).setTitle("Adobe Creative Cloud").setIcon(2130837568).setNegativeButton("Cancel", new DialogInterface.OnClickListener()
    {
      public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt) {}
    });
    if (mAdobeAuthManager.isAuthenticated()) {
      paramMenuItem.setMessage("You are logged in on Adobe Creative Cloud. Now you can unlock supplies for free in photo editor.").setPositiveButton("Sign Out", new DialogInterface.OnClickListener()
      {
        public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
        {
          InfoActivity.this.adobeSignOut();
        }
      }).show();
    }
    return true;
  }
  
  public boolean onPrepareOptionsMenu(Menu paramMenu)
  {
    if (mAdobeAuthManager.isAuthenticated()) {
      paramMenu.findItem(2131690267).setVisible(true);
    }
    for (;;)
    {
      return super.onPrepareOptionsMenu(paramMenu);
      paramMenu.findItem(2131690267).setVisible(false);
    }
  }
}
