package com.google.android.gms.internal;

import android.app.Activity;
import android.app.ActivityManager;
import android.app.ActivityManager.RunningAppProcessInfo;
import android.app.ActivityManager.RunningTaskInfo;
import android.app.AlertDialog.Builder;
import android.app.KeyguardManager;
import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.graphics.Bitmap;
import android.net.Uri;
import android.net.Uri.Builder;
import android.os.Build;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.PowerManager;
import android.os.Process;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.view.Display;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import android.view.ViewTreeObserver.OnScrollChangedListener;
import android.view.Window;
import android.view.WindowManager;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.widget.PopupWindow;
import com.google.android.gms.ads.AdLoader;
import com.google.android.gms.ads.AdView;
import com.google.android.gms.ads.InterstitialAd;
import com.google.android.gms.ads.doubleclick.PublisherAdView;
import com.google.android.gms.ads.doubleclick.PublisherInterstitialAd;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.client.zzk;
import com.google.android.gms.ads.internal.overlay.AdOverlayInfoParcel;
import com.google.android.gms.ads.internal.util.client.zza;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.ads.internal.zzm;
import com.google.android.gms.ads.internal.zzp;
import com.google.android.gms.ads.search.SearchAdView;
import java.io.IOException;
import java.io.InputStreamReader;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@zzgk
public class zzhu
{
  private static final String zzHE = AdView.class.getName();
  private static final String zzHF = InterstitialAd.class.getName();
  private static final String zzHG = PublisherAdView.class.getName();
  private static final String zzHH = PublisherInterstitialAd.class.getName();
  private static final String zzHI = SearchAdView.class.getName();
  private static final String zzHJ = AdLoader.class.getName();
  public static final Handler zzHK = new zzhr(Looper.getMainLooper());
  private boolean zzHL = true;
  private boolean zzHM = false;
  private String zzHj;
  private final Object zzpc = new Object();
  
  public zzhu() {}
  
  public static void runOnUiThread(Runnable paramRunnable)
  {
    if (Looper.getMainLooper().getThread() == Thread.currentThread())
    {
      paramRunnable.run();
      return;
    }
    zzHK.post(paramRunnable);
  }
  
  private JSONArray zza(Collection<?> paramCollection)
    throws JSONException
  {
    JSONArray localJSONArray = new JSONArray();
    paramCollection = paramCollection.iterator();
    while (paramCollection.hasNext()) {
      zza(localJSONArray, paramCollection.next());
    }
    return localJSONArray;
  }
  
  private void zza(JSONArray paramJSONArray, Object paramObject)
    throws JSONException
  {
    if ((paramObject instanceof Bundle))
    {
      paramJSONArray.put(zze((Bundle)paramObject));
      return;
    }
    if ((paramObject instanceof Map))
    {
      paramJSONArray.put(zzx((Map)paramObject));
      return;
    }
    if ((paramObject instanceof Collection))
    {
      paramJSONArray.put(zza((Collection)paramObject));
      return;
    }
    if ((paramObject instanceof Object[]))
    {
      paramJSONArray.put(zza((Object[])paramObject));
      return;
    }
    paramJSONArray.put(paramObject);
  }
  
  private void zza(JSONObject paramJSONObject, String paramString, Object paramObject)
    throws JSONException
  {
    if ((paramObject instanceof Bundle))
    {
      paramJSONObject.put(paramString, zze((Bundle)paramObject));
      return;
    }
    if ((paramObject instanceof Map))
    {
      paramJSONObject.put(paramString, zzx((Map)paramObject));
      return;
    }
    if ((paramObject instanceof Collection))
    {
      if (paramString != null) {}
      for (;;)
      {
        paramJSONObject.put(paramString, zza((Collection)paramObject));
        return;
        paramString = "null";
      }
    }
    if ((paramObject instanceof Object[]))
    {
      paramJSONObject.put(paramString, zza(Arrays.asList((Object[])paramObject)));
      return;
    }
    paramJSONObject.put(paramString, paramObject);
  }
  
  public static void zzb(Runnable paramRunnable)
  {
    if (Looper.getMainLooper().getThread() != Thread.currentThread())
    {
      paramRunnable.run();
      return;
    }
    zzht.zza(paramRunnable);
  }
  
  private JSONObject zze(Bundle paramBundle)
    throws JSONException
  {
    JSONObject localJSONObject = new JSONObject();
    Iterator localIterator = paramBundle.keySet().iterator();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      zza(localJSONObject, str, paramBundle.get(str));
    }
    return localJSONObject;
  }
  
  private boolean zzr(Context paramContext)
  {
    paramContext = (PowerManager)paramContext.getSystemService("power");
    if (paramContext == null) {
      return false;
    }
    return paramContext.isScreenOn();
  }
  
  public boolean zzI(Context paramContext)
  {
    Intent localIntent = new Intent();
    localIntent.setClassName(paramContext, "com.google.android.gms.ads.AdActivity");
    paramContext = paramContext.getPackageManager().resolveActivity(localIntent, 65536);
    if ((paramContext == null) || (activityInfo == null))
    {
      zzb.zzaE("Could not find com.google.android.gms.ads.AdActivity, please make sure it is declared in AndroidManifest.xml.");
      return false;
    }
    if ((activityInfo.configChanges & 0x10) == 0) {
      zzb.zzaE(String.format("com.google.android.gms.ads.AdActivity requires the android:configChanges value to contain \"%s\".", new Object[] { "keyboard" }));
    }
    for (boolean bool = false;; bool = true)
    {
      if ((activityInfo.configChanges & 0x20) == 0)
      {
        zzb.zzaE(String.format("com.google.android.gms.ads.AdActivity requires the android:configChanges value to contain \"%s\".", new Object[] { "keyboardHidden" }));
        bool = false;
      }
      if ((activityInfo.configChanges & 0x80) == 0)
      {
        zzb.zzaE(String.format("com.google.android.gms.ads.AdActivity requires the android:configChanges value to contain \"%s\".", new Object[] { "orientation" }));
        bool = false;
      }
      if ((activityInfo.configChanges & 0x100) == 0)
      {
        zzb.zzaE(String.format("com.google.android.gms.ads.AdActivity requires the android:configChanges value to contain \"%s\".", new Object[] { "screenLayout" }));
        bool = false;
      }
      if ((activityInfo.configChanges & 0x200) == 0)
      {
        zzb.zzaE(String.format("com.google.android.gms.ads.AdActivity requires the android:configChanges value to contain \"%s\".", new Object[] { "uiMode" }));
        bool = false;
      }
      if ((activityInfo.configChanges & 0x400) == 0)
      {
        zzb.zzaE(String.format("com.google.android.gms.ads.AdActivity requires the android:configChanges value to contain \"%s\".", new Object[] { "screenSize" }));
        bool = false;
      }
      if ((activityInfo.configChanges & 0x800) == 0)
      {
        zzb.zzaE(String.format("com.google.android.gms.ads.AdActivity requires the android:configChanges value to contain \"%s\".", new Object[] { "smallestScreenSize" }));
        return false;
      }
      return bool;
    }
  }
  
  public boolean zzJ(Context paramContext)
  {
    if (zzHM) {
      return false;
    }
    IntentFilter localIntentFilter = new IntentFilter();
    localIntentFilter.addAction("android.intent.action.USER_PRESENT");
    localIntentFilter.addAction("android.intent.action.SCREEN_OFF");
    paramContext.getApplicationContext().registerReceiver(new zza(null), localIntentFilter);
    zzHM = true;
    return true;
  }
  
  protected String zzK(Context paramContext)
  {
    return new WebView(paramContext).getSettings().getUserAgentString();
  }
  
  public AlertDialog.Builder zzL(Context paramContext)
  {
    return new AlertDialog.Builder(paramContext);
  }
  
  public zzbq zzM(Context paramContext)
  {
    return new zzbq(paramContext);
  }
  
  public String zzN(Context paramContext)
  {
    try
    {
      paramContext = (ActivityManager)paramContext.getSystemService("activity");
      if (paramContext == null) {
        return null;
      }
      paramContext = paramContext.getRunningTasks(1);
      if ((paramContext != null) && (!paramContext.isEmpty()))
      {
        paramContext = (ActivityManager.RunningTaskInfo)paramContext.get(0);
        if ((paramContext != null) && (topActivity != null))
        {
          paramContext = topActivity.getClassName();
          return paramContext;
        }
      }
    }
    catch (Exception paramContext) {}
    return null;
  }
  
  public boolean zzO(Context paramContext)
  {
    try
    {
      Object localObject = (ActivityManager)paramContext.getSystemService("activity");
      KeyguardManager localKeyguardManager = (KeyguardManager)paramContext.getSystemService("keyguard");
      if ((localObject != null) && (localKeyguardManager != null))
      {
        localObject = ((ActivityManager)localObject).getRunningAppProcesses();
        if (localObject == null) {
          return false;
        }
        localObject = ((List)localObject).iterator();
        while (((Iterator)localObject).hasNext())
        {
          ActivityManager.RunningAppProcessInfo localRunningAppProcessInfo = (ActivityManager.RunningAppProcessInfo)((Iterator)localObject).next();
          if (Process.myPid() == pid) {
            if ((importance == 100) && (!localKeyguardManager.inKeyguardRestrictedInputMode()))
            {
              boolean bool = zzr(paramContext);
              if (bool) {
                return true;
              }
            }
          }
        }
        return false;
      }
    }
    catch (Throwable paramContext)
    {
      return false;
    }
    return false;
  }
  
  public DisplayMetrics zza(WindowManager paramWindowManager)
  {
    DisplayMetrics localDisplayMetrics = new DisplayMetrics();
    paramWindowManager.getDefaultDisplay().getMetrics(localDisplayMetrics);
    return localDisplayMetrics;
  }
  
  public PopupWindow zza(View paramView, int paramInt1, int paramInt2, boolean paramBoolean)
  {
    return new PopupWindow(paramView, paramInt1, paramInt2, paramBoolean);
  }
  
  public String zza(Context paramContext, View paramView, AdSizeParcel paramAdSizeParcel)
  {
    if (!((Boolean)zzby.zzuR.get()).booleanValue()) {
      return null;
    }
    try
    {
      JSONObject localJSONObject1 = new JSONObject();
      JSONObject localJSONObject2 = new JSONObject();
      localJSONObject2.put("width", width);
      localJSONObject2.put("height", height);
      localJSONObject1.put("size", localJSONObject2);
      localJSONObject1.put("activity", zzN(paramContext));
      if (!zzsH)
      {
        paramAdSizeParcel = new JSONArray();
        if (paramView != null)
        {
          paramContext = paramView.getParent();
          if (paramContext != null)
          {
            int i = -1;
            if ((paramContext instanceof ViewGroup)) {
              i = ((ViewGroup)paramContext).indexOfChild(paramView);
            }
            paramView = new JSONObject();
            paramView.put("type", paramContext.getClass().getName());
            paramView.put("index_of_child", i);
            paramAdSizeParcel.put(paramView);
          }
          if ((paramContext == null) || (!(paramContext instanceof View))) {
            break label232;
          }
          paramContext = (View)paramContext;
          break label227;
        }
        if (paramAdSizeParcel.length() > 0) {
          localJSONObject1.put("parents", paramAdSizeParcel);
        }
      }
      paramContext = localJSONObject1.toString();
      return paramContext;
    }
    catch (JSONException paramContext)
    {
      zzb.zzd("Fail to get view hierarchy json", paramContext);
      return null;
    }
    for (;;)
    {
      label227:
      paramView = paramContext;
      break;
      label232:
      paramContext = null;
    }
  }
  
  public String zza(Context paramContext, zzan paramZzan, String paramString)
  {
    if (paramZzan == null) {
      return paramString;
    }
    try
    {
      Uri localUri2 = Uri.parse(paramString);
      Uri localUri1 = localUri2;
      if (paramZzan.zzc(localUri2)) {
        localUri1 = paramZzan.zza(localUri2, paramContext);
      }
      paramContext = localUri1.toString();
      return paramContext;
    }
    catch (Exception paramContext) {}
    return paramString;
  }
  
  public String zza(Context paramContext, String paramString1, String paramString2, int paramInt)
  {
    if ((!((Boolean)zzby.zzuQ.get()).booleanValue()) || (!zzm.zzq(paramContext).zzbn()) || (TextUtils.isEmpty(paramString1)) || (!zzb(Uri.parse(paramString1)))) {
      return paramString1;
    }
    paramContext = new HashMap();
    paramContext.put("ga_cid", paramString2);
    paramContext.put("ga_hid", String.valueOf(paramInt));
    return zza(paramString1, paramContext);
  }
  
  public String zza(zzip paramZzip, String paramString)
  {
    return zza(paramZzip.getContext(), paramZzip.zzgU(), paramString);
  }
  
  public String zza(InputStreamReader paramInputStreamReader)
    throws IOException
  {
    StringBuilder localStringBuilder = new StringBuilder(8192);
    char[] arrayOfChar = new char['ࠀ'];
    for (;;)
    {
      int i = paramInputStreamReader.read(arrayOfChar);
      if (i == -1) {
        break;
      }
      localStringBuilder.append(arrayOfChar, 0, i);
    }
    return localStringBuilder.toString();
  }
  
  String zza(String paramString, Map<String, String> paramMap)
  {
    int i = paramString.indexOf("&adurl");
    if (i == -1) {
      i = paramString.indexOf("?adurl");
    }
    for (;;)
    {
      Object localObject1 = Uri.parse(paramString);
      Object localObject2;
      if ((zzc((Uri)localObject1)) && (i != -1))
      {
        localObject1 = new StringBuilder(paramString.substring(0, i + 1));
        localObject2 = paramMap.keySet().iterator();
        while (((Iterator)localObject2).hasNext())
        {
          String str = (String)((Iterator)localObject2).next();
          ((StringBuilder)localObject1).append(str).append("=").append((String)paramMap.get(str)).append("&");
        }
        return paramString.substring(i + 1);
      }
      paramString = ((Uri)localObject1).buildUpon();
      localObject1 = paramMap.keySet().iterator();
      while (((Iterator)localObject1).hasNext())
      {
        localObject2 = (String)((Iterator)localObject1).next();
        paramString = paramString.appendQueryParameter((String)localObject2, (String)paramMap.get(localObject2));
      }
      return paramString.build().toString();
    }
  }
  
  public String zza(StackTraceElement[] paramArrayOfStackTraceElement, String paramString)
  {
    int i;
    if (((Boolean)zzby.zzvc.get()).booleanValue())
    {
      i = 0;
      if (i + 1 >= paramArrayOfStackTraceElement.length) {
        break label149;
      }
      StackTraceElement localStackTraceElement = paramArrayOfStackTraceElement[i];
      String str = localStackTraceElement.getClassName();
      if ((!"loadAd".equalsIgnoreCase(localStackTraceElement.getMethodName())) || ((!zzHE.equalsIgnoreCase(str)) && (!zzHF.equalsIgnoreCase(str)) && (!zzHG.equalsIgnoreCase(str)) && (!zzHH.equalsIgnoreCase(str)) && (!zzHI.equalsIgnoreCase(str)) && (!zzHJ.equalsIgnoreCase(str)))) {}
    }
    label149:
    for (paramArrayOfStackTraceElement = paramArrayOfStackTraceElement[(i + 1)].getClassName();; paramArrayOfStackTraceElement = null)
    {
      if ((paramArrayOfStackTraceElement != null) && (!paramArrayOfStackTraceElement.contains(paramString)))
      {
        return paramArrayOfStackTraceElement;
        i += 1;
        break;
      }
      return null;
    }
  }
  
  public ArrayList<String> zza(Context paramContext, List<String> paramList, String paramString)
  {
    int i = zzm.zzq(paramContext).zzbp();
    ArrayList localArrayList = new ArrayList();
    paramList = paramList.iterator();
    while (paramList.hasNext()) {
      localArrayList.add(zza(paramContext, (String)paramList.next(), paramString, i));
    }
    return localArrayList;
  }
  
  JSONArray zza(Object[] paramArrayOfObject)
    throws JSONException
  {
    JSONArray localJSONArray = new JSONArray();
    int j = paramArrayOfObject.length;
    int i = 0;
    while (i < j)
    {
      zza(localJSONArray, paramArrayOfObject[i]);
      i += 1;
    }
    return localJSONArray;
  }
  
  public void zza(Activity paramActivity, ViewTreeObserver.OnGlobalLayoutListener paramOnGlobalLayoutListener)
  {
    paramActivity = paramActivity.getWindow();
    if ((paramActivity != null) && (paramActivity.getDecorView() != null) && (paramActivity.getDecorView().getViewTreeObserver() != null)) {
      paramActivity.getDecorView().getViewTreeObserver().addOnGlobalLayoutListener(paramOnGlobalLayoutListener);
    }
  }
  
  public void zza(Activity paramActivity, ViewTreeObserver.OnScrollChangedListener paramOnScrollChangedListener)
  {
    paramActivity = paramActivity.getWindow();
    if ((paramActivity != null) && (paramActivity.getDecorView() != null) && (paramActivity.getDecorView().getViewTreeObserver() != null)) {
      paramActivity.getDecorView().getViewTreeObserver().addOnScrollChangedListener(paramOnScrollChangedListener);
    }
  }
  
  public void zza(Context paramContext, String paramString, WebSettings paramWebSettings)
  {
    paramWebSettings.setUserAgentString(zzf(paramContext, paramString));
  }
  
  public void zza(Context paramContext, String paramString1, String paramString2, Bundle paramBundle, boolean paramBoolean)
  {
    Object localObject2;
    if (paramBoolean)
    {
      localObject2 = paramContext.getApplicationContext();
      localObject1 = localObject2;
      if (localObject2 == null) {
        localObject1 = paramContext;
      }
      paramBundle.putString("os", Build.VERSION.RELEASE);
      paramBundle.putString("api", String.valueOf(Build.VERSION.SDK_INT));
      paramBundle.putString("device", zzp.zzbx().zzgt());
      paramBundle.putString("js", paramString1);
      paramBundle.putString("appid", ((Context)localObject1).getPackageName());
      paramBundle.putString("eids", TextUtils.join(",", zzby.zzde()));
    }
    paramString2 = new Uri.Builder().scheme("https").path("//pagead2.googlesyndication.com/pagead/gen_204").appendQueryParameter("id", paramString2);
    Object localObject1 = paramBundle.keySet().iterator();
    while (((Iterator)localObject1).hasNext())
    {
      localObject2 = (String)((Iterator)localObject1).next();
      paramString2.appendQueryParameter((String)localObject2, paramBundle.getString((String)localObject2));
    }
    zzp.zzbx().zzc(paramContext, paramString1, paramString2.toString());
  }
  
  public void zza(Context paramContext, String paramString, List<String> paramList)
  {
    paramList = paramList.iterator();
    while (paramList.hasNext()) {
      new zzia(paramContext, paramString, (String)paramList.next()).zzgn();
    }
  }
  
  public void zza(Context paramContext, String paramString1, List<String> paramList, String paramString2)
  {
    paramList = paramList.iterator();
    while (paramList.hasNext()) {
      new zzia(paramContext, paramString1, (String)paramList.next(), paramString2).zzgn();
    }
  }
  
  public void zza(Context paramContext, String paramString, boolean paramBoolean, HttpURLConnection paramHttpURLConnection)
  {
    zza(paramContext, paramString, paramBoolean, paramHttpURLConnection, false);
  }
  
  public void zza(Context paramContext, String paramString1, boolean paramBoolean, HttpURLConnection paramHttpURLConnection, String paramString2)
  {
    paramHttpURLConnection.setConnectTimeout(60000);
    paramHttpURLConnection.setInstanceFollowRedirects(paramBoolean);
    paramHttpURLConnection.setReadTimeout(60000);
    paramHttpURLConnection.setRequestProperty("User-Agent", paramString2);
    paramHttpURLConnection.setUseCaches(false);
  }
  
  public void zza(Context paramContext, String paramString, boolean paramBoolean1, HttpURLConnection paramHttpURLConnection, boolean paramBoolean2)
  {
    paramHttpURLConnection.setConnectTimeout(60000);
    paramHttpURLConnection.setInstanceFollowRedirects(paramBoolean1);
    paramHttpURLConnection.setReadTimeout(60000);
    paramHttpURLConnection.setRequestProperty("User-Agent", zzf(paramContext, paramString));
    paramHttpURLConnection.setUseCaches(paramBoolean2);
  }
  
  public boolean zza(PackageManager paramPackageManager, String paramString1, String paramString2)
  {
    return paramPackageManager.checkPermission(paramString2, paramString1) == 0;
  }
  
  public boolean zza(ClassLoader paramClassLoader, Class<?> paramClass, String paramString)
  {
    try
    {
      boolean bool = paramClass.isAssignableFrom(Class.forName(paramString, false, paramClassLoader));
      return bool;
    }
    catch (Throwable paramClassLoader) {}
    return false;
  }
  
  public String zzaw(String paramString)
  {
    return Uri.parse(paramString).buildUpon().query(null).build().toString();
  }
  
  public int zzax(String paramString)
  {
    try
    {
      int i = Integer.parseInt(paramString);
      return i;
    }
    catch (NumberFormatException paramString)
    {
      zzb.zzaE("Could not parse value:" + paramString);
    }
    return 0;
  }
  
  public boolean zzay(String paramString)
  {
    if (TextUtils.isEmpty(paramString)) {
      return false;
    }
    return paramString.matches("([^\\s]+(\\.(?i)(jpg|png|gif|bmp|webp))$)");
  }
  
  public void zzb(Activity paramActivity, ViewTreeObserver.OnScrollChangedListener paramOnScrollChangedListener)
  {
    paramActivity = paramActivity.getWindow();
    if ((paramActivity != null) && (paramActivity.getDecorView() != null) && (paramActivity.getDecorView().getViewTreeObserver() != null)) {
      paramActivity.getDecorView().getViewTreeObserver().removeOnScrollChangedListener(paramOnScrollChangedListener);
    }
  }
  
  public void zzb(Context paramContext, String paramString1, String paramString2, Bundle paramBundle, boolean paramBoolean)
  {
    if (((Boolean)zzby.zzuZ.get()).booleanValue()) {
      zza(paramContext, paramString1, paramString2, paramBundle, paramBoolean);
    }
  }
  
  public boolean zzb(Uri paramUri)
  {
    return new zzan(null).zzb(paramUri);
  }
  
  public void zzc(Context paramContext, String paramString1, String paramString2)
  {
    ArrayList localArrayList = new ArrayList();
    localArrayList.add(paramString2);
    zza(paramContext, paramString1, localArrayList);
  }
  
  public boolean zzc(Uri paramUri)
  {
    return new zzan(null).zzc(paramUri);
  }
  
  public String zzd(Context paramContext, String paramString1, String paramString2)
  {
    return zza(paramContext, paramString1, paramString2, zzm.zzq(paramContext).zzbp());
  }
  
  public Map<String, String> zze(Uri paramUri)
  {
    if (paramUri == null) {
      return null;
    }
    HashMap localHashMap = new HashMap();
    Iterator localIterator = zzp.zzbz().zzf(paramUri).iterator();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      localHashMap.put(str, paramUri.getQueryParameter(str));
    }
    return localHashMap;
  }
  
  public String zzf(final Context paramContext, String paramString)
  {
    synchronized (zzpc)
    {
      if (zzHj != null)
      {
        paramContext = zzHj;
        return paramContext;
      }
    }
    try
    {
      zzHj = zzp.zzbz().getDefaultUserAgent(paramContext);
      if (TextUtils.isEmpty(zzHj)) {
        if (!zzk.zzcE().zzgI())
        {
          zzHj = null;
          zzHK.post(new Runnable()
          {
            public void run()
            {
              synchronized (zzhu.zza(zzhu.this))
              {
                zzhu.zza(zzhu.this, zzK(paramContext));
                zzhu.zza(zzhu.this).notifyAll();
                return;
              }
            }
          });
          for (;;)
          {
            paramContext = zzHj;
            if (paramContext != null) {
              break;
            }
            try
            {
              zzpc.wait();
            }
            catch (InterruptedException paramContext)
            {
              zzHj = zzgr();
              zzb.zzaE("Interrupted, use default user agent: " + zzHj);
            }
          }
          paramContext = finally;
          throw paramContext;
        }
      }
      try
      {
        zzHj = zzK(paramContext);
        zzHj = (zzHj + " (Mobile; " + paramString + ")");
        paramContext = zzHj;
        return paramContext;
      }
      catch (Exception paramContext)
      {
        for (;;)
        {
          zzHj = zzgr();
        }
      }
    }
    catch (Exception localException)
    {
      for (;;) {}
    }
  }
  
  public int[] zzg(Activity paramActivity)
  {
    paramActivity = paramActivity.getWindow();
    if (paramActivity != null)
    {
      paramActivity = paramActivity.findViewById(16908290);
      if (paramActivity != null) {
        return new int[] { paramActivity.getWidth(), paramActivity.getHeight() };
      }
    }
    return zzgu();
  }
  
  public boolean zzgq()
  {
    return zzHL;
  }
  
  String zzgr()
  {
    StringBuffer localStringBuffer = new StringBuffer(256);
    localStringBuffer.append("Mozilla/5.0 (Linux; U; Android");
    if (Build.VERSION.RELEASE != null) {
      localStringBuffer.append(" ").append(Build.VERSION.RELEASE);
    }
    localStringBuffer.append("; ").append(Locale.getDefault());
    if (Build.DEVICE != null)
    {
      localStringBuffer.append("; ").append(Build.DEVICE);
      if (Build.DISPLAY != null) {
        localStringBuffer.append(" Build/").append(Build.DISPLAY);
      }
    }
    localStringBuffer.append(") AppleWebKit/533 Version/4.0 Safari/533");
    return localStringBuffer.toString();
  }
  
  public String zzgs()
  {
    Object localObject1 = UUID.randomUUID();
    byte[] arrayOfByte1 = BigInteger.valueOf(((UUID)localObject1).getLeastSignificantBits()).toByteArray();
    byte[] arrayOfByte2 = BigInteger.valueOf(((UUID)localObject1).getMostSignificantBits()).toByteArray();
    localObject1 = new BigInteger(1, arrayOfByte1).toString();
    int i = 0;
    while (i < 2)
    {
      try
      {
        Object localObject2 = MessageDigest.getInstance("MD5");
        ((MessageDigest)localObject2).update(arrayOfByte1);
        ((MessageDigest)localObject2).update(arrayOfByte2);
        byte[] arrayOfByte3 = new byte[8];
        System.arraycopy(((MessageDigest)localObject2).digest(), 0, arrayOfByte3, 0, 8);
        localObject2 = new BigInteger(1, arrayOfByte3).toString();
        localObject1 = localObject2;
      }
      catch (NoSuchAlgorithmException localNoSuchAlgorithmException)
      {
        for (;;) {}
      }
      i += 1;
    }
    return localObject1;
  }
  
  public String zzgt()
  {
    String str1 = Build.MANUFACTURER;
    String str2 = Build.MODEL;
    if (str2.startsWith(str1)) {
      return str2;
    }
    return str1 + " " + str2;
  }
  
  protected int[] zzgu()
  {
    return new int[] { 0, 0 };
  }
  
  public int[] zzh(Activity paramActivity)
  {
    int[] arrayOfInt = zzg(paramActivity);
    return new int[] { zzk.zzcE().zzc(paramActivity, arrayOfInt[0]), zzk.zzcE().zzc(paramActivity, arrayOfInt[1]) };
  }
  
  public int[] zzi(Activity paramActivity)
  {
    paramActivity = paramActivity.getWindow();
    if (paramActivity != null)
    {
      paramActivity = paramActivity.findViewById(16908290);
      if (paramActivity != null) {
        return new int[] { paramActivity.getTop(), paramActivity.getBottom() };
      }
    }
    return zzgu();
  }
  
  public Bitmap zzj(View paramView)
  {
    paramView.setDrawingCacheEnabled(true);
    Bitmap localBitmap = Bitmap.createBitmap(paramView.getDrawingCache());
    paramView.setDrawingCacheEnabled(false);
    return localBitmap;
  }
  
  public int[] zzj(Activity paramActivity)
  {
    int[] arrayOfInt = zzi(paramActivity);
    return new int[] { zzk.zzcE().zzc(paramActivity, arrayOfInt[0]), zzk.zzcE().zzc(paramActivity, arrayOfInt[1]) };
  }
  
  public int zzk(Activity paramActivity)
  {
    if (paramActivity == null)
    {
      zzb.zzaE("Fail to get AdActivity type since it is null");
      return 0;
    }
    paramActivity = AdOverlayInfoParcel.zzb(paramActivity.getIntent());
    if (paramActivity == null)
    {
      zzb.zzaE("Fail to get AdOverlayInfo");
      return 0;
    }
    switch (zzAX)
    {
    default: 
      return 0;
    case 1: 
      return 1;
    case 2: 
      return 2;
    }
    return 3;
  }
  
  public JSONObject zzx(Map<String, ?> paramMap)
    throws JSONException
  {
    try
    {
      JSONObject localJSONObject = new JSONObject();
      Iterator localIterator = paramMap.keySet().iterator();
      while (localIterator.hasNext())
      {
        String str = (String)localIterator.next();
        zza(localJSONObject, str, paramMap.get(str));
      }
      return localJSONObject;
    }
    catch (ClassCastException paramMap)
    {
      throw new JSONException("Could not convert map to JSON: " + paramMap.getMessage());
    }
  }
  
  private final class zza
    extends BroadcastReceiver
  {
    private zza() {}
    
    public void onReceive(Context paramContext, Intent paramIntent)
    {
      if ("android.intent.action.USER_PRESENT".equals(paramIntent.getAction())) {
        zzhu.zza(zzhu.this, true);
      }
      while (!"android.intent.action.SCREEN_OFF".equals(paramIntent.getAction())) {
        return;
      }
      zzhu.zza(zzhu.this, false);
    }
  }
}
