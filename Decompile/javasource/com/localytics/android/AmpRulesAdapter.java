package com.localytics.android;

import android.content.Context;
import android.content.res.Resources;
import android.util.DisplayMetrics;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AbsListView.LayoutParams;
import android.widget.BaseAdapter;
import android.widget.LinearLayout;
import android.widget.LinearLayout.LayoutParams;
import android.widget.TextView;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

class AmpRulesAdapter
  extends BaseAdapter
{
  private List<HashMap<String, Object>> mAmpRules;
  private Context mContext;
  
  public AmpRulesAdapter(Context paramContext)
  {
    mContext = paramContext;
    mAmpRules = new ArrayList();
  }
  
  public int getCount()
  {
    return mAmpRules.size();
  }
  
  public Map<String, Object> getItem(int paramInt)
  {
    return (Map)mAmpRules.get(paramInt);
  }
  
  public long getItemId(int paramInt)
  {
    return ((Integer)((HashMap)mAmpRules.get(paramInt)).get("campaign_id")).intValue();
  }
  
  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    paramViewGroup = paramView;
    paramView = paramViewGroup;
    if (paramViewGroup == null)
    {
      paramView = new LinearLayout(mContext);
      paramView.setLayoutParams(new AbsListView.LayoutParams(-1, -2));
      paramView.setOrientation(0);
      paramViewGroup = new LinearLayout(mContext);
      paramViewGroup.setLayoutParams(new LinearLayout.LayoutParams(-1, -2));
      paramViewGroup.setGravity(16);
      paramViewGroup.setOrientation(1);
      int i = (int)(mContext.getResources().getDisplayMetrics().density * 8.0F + 0.5F);
      paramViewGroup.setPadding(i << 1, i, i << 1, i);
      paramView.addView(paramViewGroup);
      localTextView1 = new TextView(mContext);
      localTextView1.setId(1);
      localTextView1.setTextSize(16.0F);
      localTextView1.setTextColor(-16777216);
      TextView localTextView2 = new TextView(mContext);
      localTextView2.setId(2);
      localTextView2.setTextSize(24.0F);
      localTextView2.setTextColor(-16777216);
      paramViewGroup.addView(localTextView2);
      paramViewGroup.addView(localTextView1);
    }
    paramViewGroup = (TextView)paramView.findViewById(1);
    TextView localTextView1 = (TextView)paramView.findViewById(2);
    paramViewGroup.setText(String.format("Campaign ID: %d", new Object[] { Long.valueOf(getItemId(paramInt)) }));
    localTextView1.setText((String)getItem(paramInt).get("rule_name"));
    return paramView;
  }
  
  /* Error */
  public boolean updateDataSet(LocalyticsProvider paramLocalyticsProvider)
  {
    // Byte code:
    //   0: iconst_0
    //   1: istore_3
    //   2: aload_0
    //   3: getfield 21	com/localytics/android/AmpRulesAdapter:mAmpRules	Ljava/util/List;
    //   6: invokeinterface 162 1 0
    //   11: aconst_null
    //   12: astore 5
    //   14: aconst_null
    //   15: astore 4
    //   17: aload_1
    //   18: ldc -92
    //   20: aconst_null
    //   21: aconst_null
    //   22: aconst_null
    //   23: ldc 47
    //   25: invokevirtual 170	com/localytics/android/LocalyticsProvider:query	(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   28: astore_1
    //   29: aload_1
    //   30: astore 4
    //   32: aload_1
    //   33: astore 5
    //   35: aload_1
    //   36: invokeinterface 176 1 0
    //   41: ifeq +603 -> 644
    //   44: aload_1
    //   45: astore 4
    //   47: aload_1
    //   48: astore 5
    //   50: new 45	java/util/HashMap
    //   53: dup
    //   54: invokespecial 177	java/util/HashMap:<init>	()V
    //   57: astore 6
    //   59: aload_1
    //   60: astore 4
    //   62: aload_1
    //   63: astore 5
    //   65: aload 6
    //   67: ldc -77
    //   69: aload_1
    //   70: aload_1
    //   71: ldc -77
    //   73: invokeinterface 183 2 0
    //   78: invokeinterface 187 2 0
    //   83: invokestatic 190	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   86: invokevirtual 194	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   89: pop
    //   90: aload_1
    //   91: astore 4
    //   93: aload_1
    //   94: astore 5
    //   96: aload 6
    //   98: ldc 47
    //   100: aload_1
    //   101: aload_1
    //   102: ldc 47
    //   104: invokeinterface 183 2 0
    //   109: invokeinterface 187 2 0
    //   114: invokestatic 190	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   117: invokevirtual 194	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   120: pop
    //   121: aload_1
    //   122: astore 4
    //   124: aload_1
    //   125: astore 5
    //   127: aload 6
    //   129: ldc -60
    //   131: aload_1
    //   132: aload_1
    //   133: ldc -60
    //   135: invokeinterface 183 2 0
    //   140: invokeinterface 187 2 0
    //   145: invokestatic 190	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   148: invokevirtual 194	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   151: pop
    //   152: aload_1
    //   153: astore 4
    //   155: aload_1
    //   156: astore 5
    //   158: aload 6
    //   160: ldc -58
    //   162: aload_1
    //   163: aload_1
    //   164: ldc -58
    //   166: invokeinterface 183 2 0
    //   171: invokeinterface 187 2 0
    //   176: invokestatic 190	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   179: invokevirtual 194	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   182: pop
    //   183: aload_1
    //   184: astore 4
    //   186: aload_1
    //   187: astore 5
    //   189: aload 6
    //   191: ldc -56
    //   193: aload_1
    //   194: aload_1
    //   195: ldc -56
    //   197: invokeinterface 183 2 0
    //   202: invokeinterface 187 2 0
    //   207: invokestatic 190	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   210: invokevirtual 194	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   213: pop
    //   214: aload_1
    //   215: astore 4
    //   217: aload_1
    //   218: astore 5
    //   220: aload 6
    //   222: ldc -54
    //   224: aload_1
    //   225: aload_1
    //   226: ldc -54
    //   228: invokeinterface 183 2 0
    //   233: invokeinterface 206 2 0
    //   238: invokevirtual 194	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   241: pop
    //   242: aload_1
    //   243: astore 4
    //   245: aload_1
    //   246: astore 5
    //   248: aload 6
    //   250: ldc -48
    //   252: aload_1
    //   253: aload_1
    //   254: ldc -48
    //   256: invokeinterface 183 2 0
    //   261: invokeinterface 206 2 0
    //   266: invokevirtual 194	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   269: pop
    //   270: aload_1
    //   271: astore 4
    //   273: aload_1
    //   274: astore 5
    //   276: aload 6
    //   278: ldc -46
    //   280: aload_1
    //   281: aload_1
    //   282: ldc -46
    //   284: invokeinterface 183 2 0
    //   289: invokeinterface 187 2 0
    //   294: invokestatic 190	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   297: invokevirtual 194	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   300: pop
    //   301: aload_1
    //   302: astore 4
    //   304: aload_1
    //   305: astore 5
    //   307: aload 6
    //   309: ldc -44
    //   311: aload_1
    //   312: aload_1
    //   313: ldc -44
    //   315: invokeinterface 183 2 0
    //   320: invokeinterface 187 2 0
    //   325: invokestatic 190	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   328: invokevirtual 194	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   331: pop
    //   332: aload_1
    //   333: astore 4
    //   335: aload_1
    //   336: astore 5
    //   338: aload 6
    //   340: ldc -42
    //   342: aload_1
    //   343: aload_1
    //   344: ldc -42
    //   346: invokeinterface 183 2 0
    //   351: invokeinterface 206 2 0
    //   356: invokevirtual 194	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   359: pop
    //   360: aload_1
    //   361: astore 4
    //   363: aload_1
    //   364: astore 5
    //   366: aload 6
    //   368: ldc -40
    //   370: aload_1
    //   371: aload_1
    //   372: ldc -40
    //   374: invokeinterface 183 2 0
    //   379: invokeinterface 187 2 0
    //   384: invokestatic 190	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   387: invokevirtual 194	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   390: pop
    //   391: aload_1
    //   392: astore 4
    //   394: aload_1
    //   395: astore 5
    //   397: aload 6
    //   399: ldc -38
    //   401: aload_1
    //   402: aload_1
    //   403: ldc -38
    //   405: invokeinterface 183 2 0
    //   410: invokeinterface 187 2 0
    //   415: invokestatic 190	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   418: invokevirtual 194	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   421: pop
    //   422: aload_1
    //   423: astore 4
    //   425: aload_1
    //   426: astore 5
    //   428: aload 6
    //   430: ldc -36
    //   432: aload_1
    //   433: aload_1
    //   434: ldc -36
    //   436: invokeinterface 183 2 0
    //   441: invokeinterface 187 2 0
    //   446: invokestatic 190	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   449: invokevirtual 194	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   452: pop
    //   453: aload_1
    //   454: astore 4
    //   456: aload_1
    //   457: astore 5
    //   459: aload 6
    //   461: ldc -34
    //   463: aload_1
    //   464: aload_1
    //   465: ldc -34
    //   467: invokeinterface 183 2 0
    //   472: invokeinterface 187 2 0
    //   477: invokestatic 190	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   480: invokevirtual 194	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   483: pop
    //   484: aload_1
    //   485: astore 4
    //   487: aload_1
    //   488: astore 5
    //   490: aload 6
    //   492: ldc -32
    //   494: aload_1
    //   495: aload_1
    //   496: ldc -32
    //   498: invokeinterface 183 2 0
    //   503: invokeinterface 206 2 0
    //   508: invokevirtual 194	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   511: pop
    //   512: aload_1
    //   513: astore 4
    //   515: aload_1
    //   516: astore 5
    //   518: aload 6
    //   520: ldc -102
    //   522: aload_1
    //   523: aload_1
    //   524: ldc -102
    //   526: invokeinterface 183 2 0
    //   531: invokeinterface 206 2 0
    //   536: invokevirtual 194	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   539: pop
    //   540: aload_1
    //   541: astore 4
    //   543: aload_1
    //   544: astore 5
    //   546: aload 6
    //   548: ldc -30
    //   550: aload_1
    //   551: aload_1
    //   552: ldc -30
    //   554: invokeinterface 183 2 0
    //   559: invokeinterface 206 2 0
    //   564: invokevirtual 194	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   567: pop
    //   568: aload_1
    //   569: astore 4
    //   571: aload_1
    //   572: astore 5
    //   574: aload 6
    //   576: ldc -28
    //   578: aload_1
    //   579: aload_1
    //   580: ldc -28
    //   582: invokeinterface 183 2 0
    //   587: invokeinterface 206 2 0
    //   592: invokevirtual 194	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   595: pop
    //   596: aload_1
    //   597: astore 4
    //   599: aload_1
    //   600: astore 5
    //   602: aload_0
    //   603: getfield 21	com/localytics/android/AmpRulesAdapter:mAmpRules	Ljava/util/List;
    //   606: aload 6
    //   608: invokeinterface 232 2 0
    //   613: pop
    //   614: goto -585 -> 29
    //   617: astore_1
    //   618: aload 4
    //   620: astore 5
    //   622: aload_1
    //   623: invokevirtual 235	java/lang/Exception:printStackTrace	()V
    //   626: iload_3
    //   627: istore_2
    //   628: aload 4
    //   630: ifnull +12 -> 642
    //   633: aload 4
    //   635: invokeinterface 238 1 0
    //   640: iload_3
    //   641: istore_2
    //   642: iload_2
    //   643: ireturn
    //   644: iconst_1
    //   645: istore_2
    //   646: aload_1
    //   647: ifnull -5 -> 642
    //   650: aload_1
    //   651: invokeinterface 238 1 0
    //   656: iconst_1
    //   657: ireturn
    //   658: astore_1
    //   659: aload 5
    //   661: ifnull +10 -> 671
    //   664: aload 5
    //   666: invokeinterface 238 1 0
    //   671: aload_1
    //   672: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	673	0	this	AmpRulesAdapter
    //   0	673	1	paramLocalyticsProvider	LocalyticsProvider
    //   627	19	2	bool1	boolean
    //   1	640	3	bool2	boolean
    //   15	619	4	localLocalyticsProvider	LocalyticsProvider
    //   12	653	5	localObject	Object
    //   57	550	6	localHashMap	HashMap
    // Exception table:
    //   from	to	target	type
    //   17	29	617	java/lang/Exception
    //   35	44	617	java/lang/Exception
    //   50	59	617	java/lang/Exception
    //   65	90	617	java/lang/Exception
    //   96	121	617	java/lang/Exception
    //   127	152	617	java/lang/Exception
    //   158	183	617	java/lang/Exception
    //   189	214	617	java/lang/Exception
    //   220	242	617	java/lang/Exception
    //   248	270	617	java/lang/Exception
    //   276	301	617	java/lang/Exception
    //   307	332	617	java/lang/Exception
    //   338	360	617	java/lang/Exception
    //   366	391	617	java/lang/Exception
    //   397	422	617	java/lang/Exception
    //   428	453	617	java/lang/Exception
    //   459	484	617	java/lang/Exception
    //   490	512	617	java/lang/Exception
    //   518	540	617	java/lang/Exception
    //   546	568	617	java/lang/Exception
    //   574	596	617	java/lang/Exception
    //   602	614	617	java/lang/Exception
    //   17	29	658	finally
    //   35	44	658	finally
    //   50	59	658	finally
    //   65	90	658	finally
    //   96	121	658	finally
    //   127	152	658	finally
    //   158	183	658	finally
    //   189	214	658	finally
    //   220	242	658	finally
    //   248	270	658	finally
    //   276	301	658	finally
    //   307	332	658	finally
    //   338	360	658	finally
    //   366	391	658	finally
    //   397	422	658	finally
    //   428	453	658	finally
    //   459	484	658	finally
    //   490	512	658	finally
    //   518	540	658	finally
    //   546	568	658	finally
    //   574	596	658	finally
    //   602	614	658	finally
    //   622	626	658	finally
  }
}
