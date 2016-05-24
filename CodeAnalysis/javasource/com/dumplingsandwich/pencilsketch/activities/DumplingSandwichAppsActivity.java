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

public class DumplingSandwichAppsActivity
  extends AppCompatActivity
{
  private String[] descriptions = { "Generate realistic water ripple reflection of your photos", "Create beautiful & personalized photo gifts on your phone", "A master collection of sketch effects", "Automatic cartoon generator", "An all-in-one toolbox for your android phones", "Make your photo focus" };
  private int[] icons = { 2130837896, 2130837894, 2130837895, 2130837892, 2130837891, 2130837893 };
  private int[] layoutIds = { 2131689626, 2131689627, 2131689628, 2131689629, 2131689630, 2131689631 };
  private String[] titles = { "Water Reflection", "Photo Gifts", "Sketch Master", "Cartoon Maker", "Toolbox for Android", "Focus Effect" };
  
  public DumplingSandwichAppsActivity() {}
  
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
          DumplingSandwichAppsActivity.this.onClick(localLinearLayout);
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
      localIntent.setData(Uri.parse("market://details?id=com.dumplingsandwich.cartoonmaker"));
      continue;
      localIntent.setData(Uri.parse("market://details?id=com.dumplingsandwich.photogifts"));
      continue;
      localIntent.setData(Uri.parse("market://details?id=com.dumplingsandwich.sketchmaster"));
      continue;
      localIntent.setData(Uri.parse("market://details?id=com.dumplingsandwich.androidtoolbox"));
      continue;
      localIntent.setData(Uri.parse("market://details?id=com.dumplingsandwich.waterreflection"));
      continue;
      localIntent.setData(Uri.parse("market://details?id=com.dumplingsandwich.focuseffect"));
    }
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setContentView(2130903070);
    display_featured_apps();
  }
}
