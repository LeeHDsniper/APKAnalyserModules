package com.dumplingsandwich.pencilsketch.activities;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

public class AppRecommendationActivity
  extends AppCompatActivity
{
  private String[] descriptions = { "Perfect Selfies at Your Fingertips.", "The Smart Cosmetic Kit in Your Purse.", "Top all-in-one photo editor with tons of classic & magazine collage styles.", "Easy Voice Recorder is a fun, simple and easy to use audio & voice recorder.", "Useful tools collection to cleanup, speedup and optimize your Android.", "AMC Security is a top-rated all-in-one security protector, cleaner and booster app which is developed by IObit." };
  private int[] icons = { 2130837997, 2130837996, 2130837995, 2130837994, 2130837992, 2130837993 };
  private int[] layoutIds = { 2131689639, 2131689640, 2131689641, 2131689642, 2131689643, 2131689644 };
  private String[] titles = { "YouCam Perfect", "YouCam Makeup", "Fotor Photo Editor", "Easy Voice Recorder", "All-In-One Toolbox", "AMC Security" };
  
  public AppRecommendationActivity() {}
  
  private void display_featured_apps()
  {
    int i = 0;
    while (i < layoutIds.length)
    {
      final LinearLayout localLinearLayout = (LinearLayout)findViewById(layoutIds[i]);
      ((ImageView)localLinearLayout.findViewById(2131690219)).setImageResource(icons[i]);
      ((TextView)localLinearLayout.findViewById(2131690220)).setText(titles[i]);
      ((TextView)localLinearLayout.findViewById(2131690221)).setText(descriptions[i]);
      Button localButton = (Button)localLinearLayout.findViewById(2131690223);
      localButton.setText("Install");
      localButton.setOnClickListener(new View.OnClickListener()
      {
        public void onClick(View paramAnonymousView)
        {
          AppRecommendationActivity.this.onClick(localLinearLayout);
        }
      });
      i += 1;
    }
  }
  
  public void onClick(View paramView)
  {
    Intent localIntent = new Intent("android.intent.action.VIEW");
    switch (paramView.getId())
    {
    }
    for (;;)
    {
      startActivity(localIntent);
      return;
      localIntent.setData(Uri.parse("http://bit.ly/1FUJSD4"));
      continue;
      localIntent.setData(Uri.parse("http://bit.ly/17PDSQR"));
      continue;
      localIntent.setData(Uri.parse("http://ad.apps.fm/WUGLCzKbyUp7lWtFuqZ7h15KLoEjTszcQMJsV6-2VnHFDLXitVHB6BlL95nuoNYfRieKoFRBIO1JPVarcVv3FaHlsfpghNYRY7y09lyb7KsNHr2OTuRALBsWfXOZO-ZQjyh3zEiS8M3iaRjj-jopow"));
      continue;
      localIntent.setData(Uri.parse("market://details?id=com.coffeebeanventures.easyvoicerecorder&referrer=utm_source%3Dpencilsketch%26utm_campaign%3Dinstallexchange"));
      continue;
      localIntent.setData(Uri.parse("https://play.google.com/store/apps/details?id=imoblife.toolbox.full&referrer=utm_source%3D%2520PencilSketch%26utm_medium%3Dicon%26anid%3Dadmob"));
      continue;
      localIntent.setData(Uri.parse("https://play.google.com/store/apps/details?id=com.iobit.mobilecare&referrer=utm_source%3DPSket%26utm_medium%3Dxpromo"));
    }
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setContentView(2130903072);
    display_featured_apps();
  }
}
