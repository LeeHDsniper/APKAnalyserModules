package com.tencent.mobileqq.activity.aio.item;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.view.Display;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.BaseAdapter;
import android.widget.FrameLayout;
import android.widget.FrameLayout.LayoutParams;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.LinearLayout.LayoutParams;
import android.widget.TextView;
import com.tencent.biz.pubaccount.util.PublicAccountUtil;
import com.tencent.image.URLDrawable;
import com.tencent.mobileqq.activity.ChatActivityFacade;
import com.tencent.mobileqq.activity.QQBrowserActivity;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.AbstractChatItemBuilder;
import com.tencent.mobileqq.activity.aio.AbstractChatItemBuilder.ViewHolder;
import com.tencent.mobileqq.activity.aio.ChatAdapter1;
import com.tencent.mobileqq.activity.aio.OnLongClickAndTouchListener;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.app.PublicAccountHandler;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageForPubAccount;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.data.PAMessage;
import com.tencent.mobileqq.data.PAMessage.Item;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.troop.widget.EllipsizingTextView;
import com.tencent.mobileqq.utils.DeviceInfoUtil;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenu;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenuItem;
import com.tencent.qphone.base.util.QLog;
import java.net.URLEncoder;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import kyz;
import kza;
import kzc;
import mqq.app.NewIntent;

public class PAWeatherItemBuilder
  extends AbstractChatItemBuilder
  implements View.OnClickListener
{
  public static boolean a = false;
  public static final String b = "PAWeatherItemBuilder";
  public static final String c = "2658655094";
  public static final String d = "3142131160";
  public static final String e = "public_account_weather";
  public static final String f = "weather_public_account";
  public static final String g = "weather_public_account";
  public int a;
  SharedPreferences jdField_a_of_type_AndroidContentSharedPreferences;
  PaWeatherItemFactory jdField_a_of_type_ComTencentMobileqqActivityAioItemPaWeatherItemFactory;
  private PublicAccountHandler jdField_a_of_type_ComTencentMobileqqAppPublicAccountHandler = (PublicAccountHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(11);
  public NewIntent a;
  int[] jdField_a_of_type_ArrayOfInt = { 2130839299, 2130839287, 2130839285, 2130839293, 2130839297, 2130839289, 2130839295, 2130839291 };
  public int b;
  Context jdField_b_of_type_AndroidContentContext;
  public BaseAdapter b;
  int[] jdField_b_of_type_ArrayOfInt = { 2130839298, 2130839286, 2130839284, 2130839292, 2130839296, 2130839288, 2130839294, 2130839290 };
  public boolean d = false;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Boolean = false;
  }
  
  public PAWeatherItemBuilder(QQAppInterface paramQQAppInterface, BaseAdapter paramBaseAdapter, Context paramContext, SessionInfo paramSessionInfo)
  {
    super(paramQQAppInterface, paramBaseAdapter, paramContext, paramSessionInfo);
    jdField_b_of_type_AndroidContentContext = paramContext;
    jdField_b_of_type_AndroidWidgetBaseAdapter = paramBaseAdapter;
    jdField_a_of_type_ComTencentMobileqqActivityAioItemPaWeatherItemFactory = new PaWeatherItemFactory(paramContext);
    jdField_a_of_type_AndroidContentSharedPreferences = jdField_b_of_type_AndroidContentContext.getSharedPreferences("public_account_weather", 0);
    paramQQAppInterface = (WindowManager)jdField_b_of_type_AndroidContentContext.getSystemService("window");
    paramBaseAdapter = new DisplayMetrics();
    paramQQAppInterface.getDefaultDisplay().getMetrics(paramBaseAdapter);
    jdField_b_of_type_Int = heightPixels;
    jdField_a_of_type_Int = widthPixels;
  }
  
  /* Error */
  public static PAMessage a(String paramString)
  {
    // Byte code:
    //   0: aload_0
    //   1: invokestatic 148	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   4: ifeq +19 -> 23
    //   7: invokestatic 154	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   10: ifeq +11 -> 21
    //   13: ldc 13
    //   15: iconst_2
    //   16: ldc -100
    //   18: invokestatic 159	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   21: aconst_null
    //   22: areturn
    //   23: invokestatic 165	javax/xml/parsers/DocumentBuilderFactory:newInstance	()Ljavax/xml/parsers/DocumentBuilderFactory;
    //   26: invokevirtual 169	javax/xml/parsers/DocumentBuilderFactory:newDocumentBuilder	()Ljavax/xml/parsers/DocumentBuilder;
    //   29: astore_3
    //   30: aload_3
    //   31: ifnull -10 -> 21
    //   34: new 171	java/io/ByteArrayInputStream
    //   37: dup
    //   38: aload_0
    //   39: invokevirtual 177	java/lang/String:getBytes	()[B
    //   42: invokespecial 180	java/io/ByteArrayInputStream:<init>	([B)V
    //   45: astore_0
    //   46: aload_3
    //   47: aload_0
    //   48: invokevirtual 186	javax/xml/parsers/DocumentBuilder:parse	(Ljava/io/InputStream;)Lorg/w3c/dom/Document;
    //   51: astore_0
    //   52: aload_0
    //   53: ifnull -32 -> 21
    //   56: aload_0
    //   57: invokeinterface 192 1 0
    //   62: astore_3
    //   63: aload_3
    //   64: invokeinterface 198 1 0
    //   69: astore 4
    //   71: aload 4
    //   73: ifnull -52 -> 21
    //   76: aload 4
    //   78: ldc -56
    //   80: invokeinterface 206 2 0
    //   85: astore_0
    //   86: aload_0
    //   87: ifnull -66 -> 21
    //   90: ldc -48
    //   92: aload_0
    //   93: invokeinterface 212 1 0
    //   98: invokevirtual 216	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   101: ifeq -80 -> 21
    //   104: new 218	com/tencent/mobileqq/data/PAMessage
    //   107: dup
    //   108: invokespecial 219	com/tencent/mobileqq/data/PAMessage:<init>	()V
    //   111: astore_0
    //   112: aload 4
    //   114: ldc -35
    //   116: invokeinterface 206 2 0
    //   121: astore 4
    //   123: aload 4
    //   125: ifnull +17 -> 142
    //   128: aload_0
    //   129: aload 4
    //   131: invokeinterface 212 1 0
    //   136: invokestatic 227	java/lang/Long:parseLong	(Ljava/lang/String;)J
    //   139: putfield 231	com/tencent/mobileqq/data/PAMessage:sendTime	J
    //   142: aload_0
    //   143: new 233	java/util/ArrayList
    //   146: dup
    //   147: invokespecial 234	java/util/ArrayList:<init>	()V
    //   150: putfield 238	com/tencent/mobileqq/data/PAMessage:items	Ljava/util/ArrayList;
    //   153: aload_3
    //   154: invokeinterface 242 1 0
    //   159: astore_3
    //   160: iconst_0
    //   161: istore_1
    //   162: aload_3
    //   163: invokeinterface 248 1 0
    //   168: istore_2
    //   169: iload_1
    //   170: iload_2
    //   171: if_icmpge +221 -> 392
    //   174: aload_3
    //   175: iload_1
    //   176: invokeinterface 252 2 0
    //   181: astore 4
    //   183: ldc -3
    //   185: aload 4
    //   187: invokeinterface 256 1 0
    //   192: invokevirtual 216	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   195: ifeq +20 -> 215
    //   198: aload 4
    //   200: invokestatic 261	com/tencent/biz/pubaccount/util/PAMessageUtil:a	(Lorg/w3c/dom/Node;)Lcom/tencent/mobileqq/data/PAMessage$Item;
    //   203: astore 4
    //   205: aload_0
    //   206: getfield 238	com/tencent/mobileqq/data/PAMessage:items	Ljava/util/ArrayList;
    //   209: aload 4
    //   211: invokevirtual 264	java/util/ArrayList:add	(Ljava/lang/Object;)Z
    //   214: pop
    //   215: iload_1
    //   216: iconst_1
    //   217: iadd
    //   218: istore_1
    //   219: goto -50 -> 169
    //   222: astore_3
    //   223: invokestatic 154	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   226: ifeq +32 -> 258
    //   229: ldc 13
    //   231: iconst_2
    //   232: new 266	java/lang/StringBuilder
    //   235: dup
    //   236: invokespecial 267	java/lang/StringBuilder:<init>	()V
    //   239: ldc_w 269
    //   242: invokevirtual 273	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   245: aload_3
    //   246: invokevirtual 276	javax/xml/parsers/ParserConfigurationException:getMessage	()Ljava/lang/String;
    //   249: invokevirtual 273	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   252: invokevirtual 279	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   255: invokestatic 281	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;)V
    //   258: aconst_null
    //   259: astore_3
    //   260: goto -230 -> 30
    //   263: astore_0
    //   264: invokestatic 154	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   267: ifeq +32 -> 299
    //   270: ldc 13
    //   272: iconst_2
    //   273: new 266	java/lang/StringBuilder
    //   276: dup
    //   277: invokespecial 267	java/lang/StringBuilder:<init>	()V
    //   280: ldc_w 269
    //   283: invokevirtual 273	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   286: aload_0
    //   287: invokevirtual 282	org/xml/sax/SAXException:getMessage	()Ljava/lang/String;
    //   290: invokevirtual 273	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   293: invokevirtual 279	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   296: invokestatic 281	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;)V
    //   299: aconst_null
    //   300: astore_0
    //   301: goto -249 -> 52
    //   304: astore_0
    //   305: invokestatic 154	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   308: ifeq +32 -> 340
    //   311: ldc 13
    //   313: iconst_2
    //   314: new 266	java/lang/StringBuilder
    //   317: dup
    //   318: invokespecial 267	java/lang/StringBuilder:<init>	()V
    //   321: ldc_w 269
    //   324: invokevirtual 273	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   327: aload_0
    //   328: invokevirtual 283	java/io/IOException:getMessage	()Ljava/lang/String;
    //   331: invokevirtual 273	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   334: invokevirtual 279	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   337: invokestatic 281	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;)V
    //   340: aconst_null
    //   341: astore_0
    //   342: goto -290 -> 52
    //   345: astore 4
    //   347: invokestatic 154	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   350: ifeq -208 -> 142
    //   353: invokestatic 154	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   356: ifeq -214 -> 142
    //   359: ldc 13
    //   361: iconst_2
    //   362: new 266	java/lang/StringBuilder
    //   365: dup
    //   366: invokespecial 267	java/lang/StringBuilder:<init>	()V
    //   369: ldc_w 285
    //   372: invokevirtual 273	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   375: aload 4
    //   377: invokevirtual 286	java/lang/NumberFormatException:getMessage	()Ljava/lang/String;
    //   380: invokevirtual 273	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   383: invokevirtual 279	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   386: invokestatic 281	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;)V
    //   389: goto -247 -> 142
    //   392: aload_0
    //   393: getfield 238	com/tencent/mobileqq/data/PAMessage:items	Ljava/util/ArrayList;
    //   396: invokevirtual 289	java/util/ArrayList:size	()I
    //   399: ifle -378 -> 21
    //   402: aload_0
    //   403: areturn
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	404	0	paramString	String
    //   161	58	1	i	int
    //   168	4	2	j	int
    //   29	146	3	localObject1	Object
    //   222	24	3	localParserConfigurationException	javax.xml.parsers.ParserConfigurationException
    //   259	1	3	localObject2	Object
    //   69	141	4	localObject3	Object
    //   345	31	4	localNumberFormatException	NumberFormatException
    // Exception table:
    //   from	to	target	type
    //   23	30	222	javax/xml/parsers/ParserConfigurationException
    //   46	52	263	org/xml/sax/SAXException
    //   46	52	304	java/io/IOException
    //   128	142	345	java/lang/NumberFormatException
  }
  
  public static boolean a(String paramString)
  {
    return ("2658655094".equals(paramString)) || ("3142131160".equals(paramString));
  }
  
  protected View a(MessageRecord paramMessageRecord, AbstractChatItemBuilder.ViewHolder paramViewHolder, View paramView, LinearLayout paramLinearLayout, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    paramView = new LinearLayout(jdField_b_of_type_AndroidContentContext);
    ((LinearLayout)paramView).setOrientation(1);
    paramLinearLayout = mPAMessage;
    ArrayList localArrayList = items;
    ViewGroup localViewGroup = (ViewGroup)paramView;
    int j = (int)(jdField_a_of_type_Int * 7.0D / 8.0D);
    int k = AIOUtils.a(15.0F, jdField_b_of_type_AndroidContentContext.getResources());
    int m = jdField_a_of_type_Int;
    paramViewHolder = new LinearLayout.LayoutParams(-1, (localArrayList.size() - 1) * (int)(78.0F * DeviceInfoUtil.a()) + j);
    paramViewHolder.setMargins(k, k, k, k);
    localViewGroup.setLayoutParams(paramViewHolder);
    int i;
    if (jdField_a_of_type_AndroidContentSharedPreferences.getLong("pa_time_stamp" + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), 0L) == sendTime)
    {
      d = false;
      if ((jdField_b_of_type_AndroidWidgetBaseAdapter instanceof ChatAdapter1))
      {
        paramViewHolder = ((ChatAdapter1)jdField_b_of_type_AndroidWidgetBaseAdapter).a();
        i = paramViewHolder.size() - 1;
      }
    }
    label231:
    label241:
    kzc localKzc;
    for (;;)
    {
      Object localObject2;
      if (i >= 0)
      {
        if (paramMessageRecord == (ChatMessage)paramViewHolder.get(i)) {
          d = true;
        }
      }
      else
      {
        int n = localArrayList.size();
        i = 0;
        if (i >= n) {
          return paramView;
        }
        localKzc = new kzc(this);
        paramViewHolder = (PAMessage.Item)localArrayList.get(i);
        jdField_b_of_type_Int = i;
        k = title;
        jdField_a_of_type_Long = time;
        n = type;
        if (i != 0) {
          break label1813;
        }
        localObject1 = new StringBuilder();
        localObject2 = jdField_a_of_type_ComTencentMobileqqActivityAioItemPaWeatherItemFactory.a(weaArea);
        if (localObject2 != null)
        {
          jdField_a_of_type_JavaLangString = localObject2[0];
          if (localObject2.length >= 2) {
            jdField_b_of_type_JavaLangString = localObject2[1];
          }
        }
      }
      try
      {
        ((StringBuilder)localObject1).append("http://web.p.qq.com/qqmpmobile/weather/weather.html?_wv=5127&_bid=2187&city=").append(URLEncoder.encode(jdField_a_of_type_JavaLangString, "utf-8"));
        localObject2 = new StringBuilder().append("&hasAd=");
        if (localArrayList.size() > 0)
        {
          bool1 = true;
          ((StringBuilder)localObject1).append(bool1);
          ((StringBuilder)localObject1).append("&time=" + jdField_a_of_type_Long);
          if (!d) {
            ((StringBuilder)localObject1).append("&from=history");
          }
          localObject2 = jdField_a_of_type_ComTencentMobileqqActivityAioItemPaWeatherItemFactory.a(weaTemper);
          if ((localObject2 != null) && (localObject2.length >= 3))
          {
            jdField_e_of_type_JavaLangString = localObject2[0];
            jdField_c_of_type_JavaLangString = localObject2[1];
            jdField_d_of_type_JavaLangString = localObject2[2];
            ((StringBuilder)localObject1).append("&cTemper=" + jdField_c_of_type_JavaLangString);
            ((StringBuilder)localObject1).append("&lTemper=" + jdField_e_of_type_JavaLangString);
            ((StringBuilder)localObject1).append("&hTemper=" + jdField_d_of_type_JavaLangString);
          }
          p = nowTime;
          localObject2 = jdField_a_of_type_ComTencentMobileqqActivityAioItemPaWeatherItemFactory.a(oneWeather);
          if ((localObject2 != null) && (localObject2.length >= 3))
          {
            g = localObject2[0];
            jdField_d_of_type_Int = Integer.valueOf(localObject2[1]).intValue();
            h = localObject2[2];
          }
          localObject2 = jdField_a_of_type_ComTencentMobileqqActivityAioItemPaWeatherItemFactory.a(twoWeather);
          if ((localObject2 != null) && (localObject2.length >= 3))
          {
            i = localObject2[0];
            jdField_e_of_type_Int = Integer.valueOf(localObject2[1]).intValue();
            j = localObject2[2];
          }
          localObject2 = jdField_a_of_type_ComTencentMobileqqActivityAioItemPaWeatherItemFactory.a(weather);
          if ((localObject2 != null) && (localObject2.length >= 2))
          {
            jdField_c_of_type_Int = (Integer.valueOf(localObject2[0]).intValue() - 200);
            f = localObject2[1];
            ((StringBuilder)localObject1).append("&wt=" + (jdField_c_of_type_Int + 200));
          }
        }
      }
      catch (Exception localException1)
      {
        try
        {
          for (;;)
          {
            ((StringBuilder)localObject1).append("&desc=").append(URLEncoder.encode(f, "utf-8"));
            localObject1 = ((StringBuilder)localObject1).toString();
            if (!TextUtils.isEmpty((CharSequence)localObject1)) {
              l = ((String)localObject1);
            }
            localObject1 = new FrameLayout(jdField_b_of_type_AndroidContentContext);
            ((FrameLayout)localObject1).setLayoutParams(new FrameLayout.LayoutParams(-1, j));
            localViewGroup.addView((View)localObject1);
            localObject2 = jdField_a_of_type_ComTencentMobileqqActivityAioItemPaWeatherItemFactory;
            int i1 = jdField_c_of_type_Int;
            paramViewHolder = cover;
            boolean bool2 = d;
            if (localArrayList.size() <= 1) {
              break label1723;
            }
            bool1 = true;
            ((PaWeatherItemFactory)localObject2).a(i1, paramViewHolder, (FrameLayout)localObject1, m - k * 2, j, bool2, bool1);
            localObject2 = LayoutInflater.from(jdField_b_of_type_AndroidContentContext).inflate(2130903170, null);
            ((TextView)((View)localObject2).findViewById(2131297444)).setText(jdField_a_of_type_JavaLangString);
            ((TextView)((View)localObject2).findViewById(2131297445)).setText(jdField_c_of_type_JavaLangString);
            paramViewHolder = (TextView)((View)localObject2).findViewById(2131297446);
            if (d)
            {
              if (jdField_a_of_type_Long != 0L)
              {
                localObject4 = new SimpleDateFormat("HH:mm");
                StringBuilder localStringBuilder = new StringBuilder("[");
                localStringBuilder.append(((SimpleDateFormat)localObject4).format(new Date(jdField_a_of_type_Long * 1000L)));
                localStringBuilder.append("更新");
                localStringBuilder.append("]");
                paramViewHolder.setText(localStringBuilder.toString());
              }
              paramViewHolder.setVisibility(0);
            }
            ((TextView)((View)localObject2).findViewById(2131297449)).setText(f);
            ((ImageView)((View)localObject2).findViewById(2131297448)).setImageResource(jdField_b_of_type_ArrayOfInt[(jdField_c_of_type_Int - 1)]);
            ((TextView)((View)localObject2).findViewById(2131297450)).setText(jdField_e_of_type_JavaLangString + "°" + "/" + jdField_d_of_type_JavaLangString + "°");
            localObject4 = (TextView)((View)localObject2).findViewById(2131297429);
            if (!TextUtils.isEmpty(p)) {
              break label1729;
            }
            paramViewHolder = "现在";
            ((TextView)localObject4).setText(paramViewHolder);
            ((ImageView)((View)localObject2).findViewById(2131297430)).setImageResource(jdField_a_of_type_ArrayOfInt[(jdField_c_of_type_Int - 1)]);
            ((TextView)((View)localObject2).findViewById(2131297431)).setText(jdField_c_of_type_JavaLangString + "°");
            localObject4 = (TextView)((View)localObject2).findViewById(2131297437);
            if (!TextUtils.isEmpty(i)) {
              break label1757;
            }
            paramViewHolder = "";
            ((TextView)localObject4).setText(paramViewHolder);
            if ((jdField_e_of_type_Int - 200 > 0) && (jdField_e_of_type_Int - 200 <= jdField_a_of_type_ArrayOfInt.length)) {
              ((ImageView)((View)localObject2).findViewById(2131297438)).setImageResource(jdField_a_of_type_ArrayOfInt[(jdField_e_of_type_Int - 201)]);
            }
            ((TextView)((View)localObject2).findViewById(2131297439)).setText(j + "°");
            localObject4 = (TextView)((View)localObject2).findViewById(2131297433);
            if (!TextUtils.isEmpty(g)) {
              break label1785;
            }
            paramViewHolder = "";
            ((TextView)localObject4).setText(paramViewHolder);
            if ((jdField_d_of_type_Int - 200 > 0) && (jdField_d_of_type_Int - 200 <= jdField_a_of_type_ArrayOfInt.length)) {
              ((ImageView)((View)localObject2).findViewById(2131297434)).setImageResource(jdField_a_of_type_ArrayOfInt[(jdField_d_of_type_Int - 201)]);
            }
            ((TextView)((View)localObject2).findViewById(2131297435)).setText(h + "°");
            ((FrameLayout)localObject1).addView((View)localObject2);
            ((View)localObject2).setTag(localKzc);
            ((View)localObject2).setOnClickListener(this);
            ((View)localObject2).setOnLongClickListener(paramOnLongClickAndTouchListener);
            ((View)localObject2).setOnTouchListener(paramOnLongClickAndTouchListener);
            ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "weather_public_account", "", "weather_public_account", "detail_weather_expose", 0, 0, "", "", "", "");
            i += 1;
            break label241;
            if (jdField_b_of_type_AndroidWidgetBaseAdapter.getItemViewType(i) == 43) {
              break label231;
            }
            i -= 1;
            break;
            d = false;
            break label231;
            bool1 = false;
          }
          localException1 = localException1;
          localException1.printStackTrace();
        }
        catch (Exception localException2)
        {
          for (;;)
          {
            localException2.printStackTrace();
            continue;
            label1723:
            boolean bool1 = false;
            continue;
            label1729:
            paramViewHolder = p + "时";
            continue;
            label1757:
            paramViewHolder = i + "时";
            continue;
            label1785:
            paramViewHolder = g + "时";
          }
        }
      }
    }
    label1813:
    l = url;
    m = weaExposeUrl;
    k = title;
    o = isAd;
    Object localObject4 = LayoutInflater.from(jdField_b_of_type_AndroidContentContext).inflate(2130903171, null);
    Object localObject1 = ((View)localObject4).findViewById(2131297453);
    if (i == localArrayList.size() - 1)
    {
      ((View)localObject4).setBackgroundResource(2130839281);
      ((View)localObject1).setVisibility(8);
      ((View)localObject4).findViewById(2131297454).setVisibility(0);
    }
    localObject1 = (EllipsizingTextView)((View)localObject4).findViewById(2131297018);
    Object localObject3 = ((View)localObject4).findViewById(2131297452);
    if (("4".equals(n)) && ("1".equals(o)))
    {
      if ((k != null) && (k.startsWith("【广告】"))) {
        k = k.substring(4);
      }
      ((EllipsizingTextView)localObject1).setEndStrWidth(AIOUtils.a(28.0F, jdField_b_of_type_AndroidContentContext.getResources()));
      ((EllipsizingTextView)localObject1).setLines(2);
      ((View)localObject3).setVisibility(0);
    }
    ((EllipsizingTextView)localObject1).setMaxLines(2);
    ((EllipsizingTextView)localObject1).setText(k);
    localObject3 = (ImageView)((View)localObject4).findViewById(2131297451);
    paramViewHolder = URLDrawable.getDrawable(cover);
    if (paramViewHolder != null) {
      ((ImageView)localObject3).setImageDrawable(paramViewHolder);
    }
    localViewGroup.addView((View)localObject4);
    ((View)localObject4).setTag(localKzc);
    ((View)localObject4).setOnClickListener(this);
    ((View)localObject4).setOnLongClickListener(paramOnLongClickAndTouchListener);
    ((View)localObject4).setOnTouchListener(paramOnLongClickAndTouchListener);
    if ("4".equals(n))
    {
      if ("1".equals(o)) {}
      for (paramViewHolder = "8";; paramViewHolder = "1")
      {
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "weather_public_account", "", "weather_public_account", "weather_tab_expose", 0, 0, paramViewHolder, "", "", "");
        if ((!isread) && ("4".equals(n)))
        {
          long l = uniseq;
          jdField_a_of_type_ComTencentMobileqqAppPublicAccountHandler.a(1, new kyz(this, paramLinearLayout, l, (EllipsizingTextView)localObject1, (ImageView)localObject3));
        }
        paramViewHolder = m;
        if (TextUtils.isEmpty(paramViewHolder)) {
          break;
        }
        ThreadManager.a(new kza(this, paramViewHolder), 8, null, true);
        break;
      }
    }
    if (n == null) {}
    for (paramViewHolder = "";; paramViewHolder = n) {
      break;
    }
    return paramView;
  }
  
  protected AbstractChatItemBuilder.ViewHolder a()
  {
    return new kzc(this);
  }
  
  public void a(int paramInt, Context paramContext, ChatMessage paramChatMessage)
  {
    boolean bool = true;
    switch (paramInt)
    {
    default: 
      return;
    }
    paramContext = ChatActivityFacade.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo);
    if ((paramContext != null) && (uniseq == uniseq)) {
      ChatActivityFacade.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo);
    }
    paramContext = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
    Context localContext = jdField_b_of_type_AndroidContentContext;
    String str = jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString;
    paramInt = jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int;
    long l = uniseq;
    if (issend == 1) {}
    for (;;)
    {
      PublicAccountUtil.a(paramContext, localContext, str, paramInt, l, bool);
      return;
      bool = false;
    }
  }
  
  public QQCustomMenuItem[] a(View paramView)
  {
    paramView = new QQCustomMenu();
    paramView.a(2131304463, jdField_b_of_type_AndroidContentContext.getString(2131367614));
    return paramView.a();
  }
  
  public void onClick(View paramView)
  {
    kzc localKzc = (kzc)paramView.getTag();
    paramView = AIOUtils.a(paramView);
    long l2 = -1L;
    long l1 = l2;
    if ((paramView instanceof MessageForPubAccount))
    {
      MessageForPubAccount localMessageForPubAccount = (MessageForPubAccount)paramView;
      l1 = l2;
      if (mPAMessage != null)
      {
        l1 = l2;
        if (mPAMessage.mMsgId > 0L) {
          l1 = mPAMessage.mMsgId;
        }
      }
    }
    if ((localKzc == null) || (!(paramView instanceof MessageForPubAccount))) {
      if (QLog.isColorLevel()) {
        QLog.d("PAWeatherItemBuilder", 2, "PAMultiItemBuilder onClickListener holder = " + localKzc + ", msg = " + paramView);
      }
    }
    do
    {
      return;
      paramView = (MessageForPubAccount)paramView;
      if ((mPAMessage != null) && (mPAMessage.items != null) && (!mPAMessage.items.isEmpty())) {
        break;
      }
    } while (!QLog.isColorLevel());
    QLog.d("PAWeatherItemBuilder", 2, "PAMultiItemBuilder onClickListener mPAMessage or items is empty !");
    return;
    if (jdField_b_of_type_Int == 0)
    {
      PASingleItemBuilder.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_b_of_type_AndroidContentContext, null, null, l, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_d_of_type_JavaLangString, l1);
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "weather_public_account", "", "weather_public_account", "detail_weather_click", 0, 0, "", "", "", "");
      return;
    }
    paramView = new Intent(jdField_b_of_type_AndroidContentContext, QQBrowserActivity.class);
    if (l != null) {
      paramView.putExtra("url", l.trim());
    }
    paramView.putExtra("fromAio", true);
    jdField_b_of_type_AndroidContentContext.startActivity(paramView);
    if ("4".equals(n))
    {
      if ("1".equals(o)) {}
      for (paramView = "8";; paramView = "1")
      {
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "weather_public_account", "", "weather_public_account", "weather_tab_click", 0, 0, paramView, "", "", "");
        return;
      }
    }
    if (n == null) {}
    for (paramView = "";; paramView = n) {
      break;
    }
  }
}
