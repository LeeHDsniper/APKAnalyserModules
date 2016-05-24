package com.dumplingsandwich.pencilsketch.activities;

import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.ImageView;
import android.widget.Toast;
import com.dumplingsandwich.pencilsketch.processor.ColorImageProcessor;

public class ImagePreprocessActivity
  extends AppCompatActivity
{
  public static Bitmap current;
  private ImageView imageView;
  
  public ImagePreprocessActivity() {}
  
  public void onBackPressed()
  {
    if (current != null) {
      current.recycle();
    }
    super.onBackPressed();
  }
  
  public void onClick(View paramView)
  {
    switch (paramView.getId())
    {
    }
    for (;;)
    {
      imageView.setImageBitmap(current);
      return;
      current = ColorImageProcessor.rotateImage(current, -90.0F);
      continue;
      current = ColorImageProcessor.rotateImage(current, 90.0F);
      continue;
      current = ColorImageProcessor.flipImage(current, 1);
      continue;
      current = ColorImageProcessor.flipImage(current, 2);
    }
  }
  
  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setContentView(2130903074);
    if (current == null)
    {
      Toast.makeText(this, "Error when loading this photo. If the image was from cloud storage, please make sure you have network connected.", 1).show();
      finish();
      return;
    }
    imageView = ((ImageView)findViewById(2131689652));
    imageView.setImageBitmap(current);
  }
  
  public boolean onCreateOptionsMenu(Menu paramMenu)
  {
    getMenuInflater().inflate(2131755021, paramMenu);
    return true;
  }
  
  public boolean onOptionsItemSelected(MenuItem paramMenuItem)
  {
    switch (paramMenuItem.getItemId())
    {
    }
    for (;;)
    {
      return super.onOptionsItemSelected(paramMenuItem);
      ImageEditingActivity.original = current.copy(Bitmap.Config.ARGB_8888, true);
      startActivity(new Intent(this, ImageEditingActivity.class));
      finish();
    }
  }
}
