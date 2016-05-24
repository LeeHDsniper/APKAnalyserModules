package org.lucasr.twowayview.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.LayoutManager;
import android.text.TextUtils;
import android.util.AttributeSet;
import com.adobe.creativesdk.foundation.assets.R.styleable;
import org.lucasr.twowayview.TwoWayLayoutManager;
import org.lucasr.twowayview.TwoWayLayoutManager.Orientation;

public class TwoWayView
  extends RecyclerView
{
  private static final Class<?>[] sConstructorSignature = { Context.class, AttributeSet.class };
  final Object[] sConstructorArgs = new Object[2];
  
  public TwoWayView(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public TwoWayView(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
  }
  
  public TwoWayView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    TypedArray localTypedArray = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.twowayview_TwoWayView, paramInt, 0);
    String str = localTypedArray.getString(R.styleable.twowayview_TwoWayView_twowayview_layoutManager);
    if (!TextUtils.isEmpty(str)) {
      loadLayoutManagerFromName(paramContext, paramAttributeSet, str);
    }
    localTypedArray.recycle();
  }
  
  /* Error */
  private void loadLayoutManagerFromName(Context paramContext, AttributeSet paramAttributeSet, String paramString)
  {
    // Byte code:
    //   0: aload_3
    //   1: astore 6
    //   3: aload_3
    //   4: bipush 46
    //   6: invokevirtual 74	java/lang/String:indexOf	(I)I
    //   9: istore 4
    //   11: iload 4
    //   13: iconst_m1
    //   14: if_icmpne +94 -> 108
    //   17: aload_3
    //   18: astore 6
    //   20: new 76	java/lang/StringBuilder
    //   23: dup
    //   24: invokespecial 78	java/lang/StringBuilder:<init>	()V
    //   27: ldc 80
    //   29: invokevirtual 84	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   32: aload_3
    //   33: invokevirtual 84	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   36: invokevirtual 88	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   39: astore 5
    //   41: aload 5
    //   43: astore 6
    //   45: aload_1
    //   46: invokevirtual 92	android/content/Context:getClassLoader	()Ljava/lang/ClassLoader;
    //   49: aload 5
    //   51: invokevirtual 98	java/lang/ClassLoader:loadClass	(Ljava/lang/String;)Ljava/lang/Class;
    //   54: ldc 100
    //   56: invokevirtual 104	java/lang/Class:asSubclass	(Ljava/lang/Class;)Ljava/lang/Class;
    //   59: getstatic 19	org/lucasr/twowayview/widget/TwoWayView:sConstructorSignature	[Ljava/lang/Class;
    //   62: invokevirtual 108	java/lang/Class:getConstructor	([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;
    //   65: astore_3
    //   66: aload 5
    //   68: astore 6
    //   70: aload_0
    //   71: getfield 33	org/lucasr/twowayview/widget/TwoWayView:sConstructorArgs	[Ljava/lang/Object;
    //   74: iconst_0
    //   75: aload_1
    //   76: aastore
    //   77: aload 5
    //   79: astore 6
    //   81: aload_0
    //   82: getfield 33	org/lucasr/twowayview/widget/TwoWayView:sConstructorArgs	[Ljava/lang/Object;
    //   85: iconst_1
    //   86: aload_2
    //   87: aastore
    //   88: aload 5
    //   90: astore 6
    //   92: aload_0
    //   93: aload_3
    //   94: aload_0
    //   95: getfield 33	org/lucasr/twowayview/widget/TwoWayView:sConstructorArgs	[Ljava/lang/Object;
    //   98: invokevirtual 114	java/lang/reflect/Constructor:newInstance	([Ljava/lang/Object;)Ljava/lang/Object;
    //   101: checkcast 116	android/support/v7/widget/RecyclerView$LayoutManager
    //   104: invokevirtual 120	org/lucasr/twowayview/widget/TwoWayView:setLayoutManager	(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V
    //   107: return
    //   108: aload_3
    //   109: astore 5
    //   111: iload 4
    //   113: ifne -72 -> 41
    //   116: aload_3
    //   117: astore 6
    //   119: aload_1
    //   120: invokevirtual 123	android/content/Context:getPackageName	()Ljava/lang/String;
    //   123: astore 5
    //   125: aload_3
    //   126: astore 6
    //   128: new 76	java/lang/StringBuilder
    //   131: dup
    //   132: invokespecial 78	java/lang/StringBuilder:<init>	()V
    //   135: aload 5
    //   137: invokevirtual 84	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   140: ldc 125
    //   142: invokevirtual 84	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   145: aload_3
    //   146: invokevirtual 84	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   149: invokevirtual 88	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   152: astore 5
    //   154: goto -113 -> 41
    //   157: astore_1
    //   158: new 127	java/lang/IllegalStateException
    //   161: dup
    //   162: new 76	java/lang/StringBuilder
    //   165: dup
    //   166: invokespecial 78	java/lang/StringBuilder:<init>	()V
    //   169: ldc -127
    //   171: invokevirtual 84	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   174: aload 6
    //   176: invokevirtual 84	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   179: invokevirtual 88	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   182: aload_1
    //   183: invokespecial 132	java/lang/IllegalStateException:<init>	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   186: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	187	0	this	TwoWayView
    //   0	187	1	paramContext	Context
    //   0	187	2	paramAttributeSet	AttributeSet
    //   0	187	3	paramString	String
    //   9	103	4	i	int
    //   39	114	5	str	String
    //   1	174	6	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   3	11	157	java/lang/Exception
    //   20	41	157	java/lang/Exception
    //   45	66	157	java/lang/Exception
    //   70	77	157	java/lang/Exception
    //   81	88	157	java/lang/Exception
    //   92	107	157	java/lang/Exception
    //   119	125	157	java/lang/Exception
    //   128	154	157	java/lang/Exception
  }
  
  public int getFirstVisiblePosition()
  {
    return ((TwoWayLayoutManager)getLayoutManager()).getFirstVisiblePosition();
  }
  
  public int getLastVisiblePosition()
  {
    return ((TwoWayLayoutManager)getLayoutManager()).getLastVisiblePosition();
  }
  
  public TwoWayLayoutManager.Orientation getOrientation()
  {
    return ((TwoWayLayoutManager)getLayoutManager()).getOrientation();
  }
  
  public void setLayoutManager(RecyclerView.LayoutManager paramLayoutManager)
  {
    if (!(paramLayoutManager instanceof TwoWayLayoutManager)) {
      throw new IllegalArgumentException("TwoWayView can only use TwoWayLayoutManager subclasses as its layout manager");
    }
    super.setLayoutManager(paramLayoutManager);
  }
  
  public void setOrientation(TwoWayLayoutManager.Orientation paramOrientation)
  {
    ((TwoWayLayoutManager)getLayoutManager()).setOrientation(paramOrientation);
  }
}
