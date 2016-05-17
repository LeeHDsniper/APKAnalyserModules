import android.widget.ImageView;
import com.tencent.mobileqq.activity.aio.item.PAWeatherItemBuilder;
import com.tencent.mobileqq.app.PublicAccountHandler.IWeatherInfoListener;
import com.tencent.mobileqq.data.PAMessage;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.troop.widget.EllipsizingTextView;

public class kyz
  implements PublicAccountHandler.IWeatherInfoListener
{
  public kyz(PAWeatherItemBuilder paramPAWeatherItemBuilder, PAMessage paramPAMessage, long paramLong, EllipsizingTextView paramEllipsizingTextView, ImageView paramImageView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  /* Error */
  public void a(String paramString)
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 16	kyz:jdField_a_of_type_ComTencentMobileqqActivityAioItemPAWeatherItemBuilder	Lcom/tencent/mobileqq/activity/aio/item/PAWeatherItemBuilder;
    //   4: getfield 43	com/tencent/mobileqq/activity/aio/item/PAWeatherItemBuilder:b	Landroid/widget/BaseAdapter;
    //   7: ifnonnull +4 -> 11
    //   10: return
    //   11: invokestatic 49	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   14: ifeq +10 -> 24
    //   17: ldc 51
    //   19: iconst_2
    //   20: aload_1
    //   21: invokestatic 55	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   24: aconst_null
    //   25: astore_3
    //   26: new 57	org/json/JSONObject
    //   29: dup
    //   30: aload_1
    //   31: invokespecial 59	org/json/JSONObject:<init>	(Ljava/lang/String;)V
    //   34: astore_1
    //   35: aload_1
    //   36: ldc 61
    //   38: invokevirtual 65	org/json/JSONObject:getInt	(Ljava/lang/String;)I
    //   41: pop
    //   42: aload_1
    //   43: ldc 67
    //   45: invokevirtual 71	org/json/JSONObject:getJSONArray	(Ljava/lang/String;)Lorg/json/JSONArray;
    //   48: astore_1
    //   49: aload_1
    //   50: ifnull -40 -> 10
    //   53: aload_1
    //   54: invokevirtual 77	org/json/JSONArray:length	()I
    //   57: ifeq -47 -> 10
    //   60: ldc 79
    //   62: astore 8
    //   64: ldc 79
    //   66: astore_3
    //   67: ldc 79
    //   69: astore 7
    //   71: aload 7
    //   73: astore 4
    //   75: aload_3
    //   76: astore 5
    //   78: aload 8
    //   80: astore 6
    //   82: aload_1
    //   83: iconst_0
    //   84: invokevirtual 83	org/json/JSONArray:getJSONObject	(I)Lorg/json/JSONObject;
    //   87: astore 9
    //   89: aload 7
    //   91: astore 4
    //   93: aload_3
    //   94: astore 5
    //   96: aload 8
    //   98: astore 6
    //   100: aload 9
    //   102: ldc 85
    //   104: invokevirtual 89	org/json/JSONObject:getString	(Ljava/lang/String;)Ljava/lang/String;
    //   107: astore_1
    //   108: aload 7
    //   110: astore 4
    //   112: aload_3
    //   113: astore 5
    //   115: aload_1
    //   116: astore 6
    //   118: aload 9
    //   120: ldc 91
    //   122: invokevirtual 89	org/json/JSONObject:getString	(Ljava/lang/String;)Ljava/lang/String;
    //   125: astore_3
    //   126: aload 7
    //   128: astore 4
    //   130: aload_3
    //   131: astore 5
    //   133: aload_1
    //   134: astore 6
    //   136: aload 9
    //   138: ldc 93
    //   140: invokevirtual 89	org/json/JSONObject:getString	(Ljava/lang/String;)Ljava/lang/String;
    //   143: astore 7
    //   145: aload 7
    //   147: astore 4
    //   149: aload_3
    //   150: astore 5
    //   152: aload_1
    //   153: astore 6
    //   155: aload 9
    //   157: ldc 95
    //   159: invokevirtual 89	org/json/JSONObject:getString	(Ljava/lang/String;)Ljava/lang/String;
    //   162: astore 8
    //   164: aload 8
    //   166: astore 5
    //   168: aload 9
    //   170: ldc 97
    //   172: invokevirtual 100	org/json/JSONObject:optString	(Ljava/lang/String;)Ljava/lang/String;
    //   175: astore 4
    //   177: aload_1
    //   178: invokestatic 106	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   181: ifne +11 -> 192
    //   184: aload 5
    //   186: invokestatic 106	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   189: ifeq +64 -> 253
    //   192: invokestatic 49	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   195: ifeq -185 -> 10
    //   198: ldc 51
    //   200: iconst_2
    //   201: ldc 108
    //   203: invokestatic 55	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   206: return
    //   207: astore_1
    //   208: aload_1
    //   209: invokevirtual 111	org/json/JSONException:printStackTrace	()V
    //   212: aload_3
    //   213: astore_1
    //   214: goto -165 -> 49
    //   217: astore 7
    //   219: ldc 79
    //   221: astore 8
    //   223: aload 6
    //   225: astore_1
    //   226: aload 5
    //   228: astore_3
    //   229: aload 8
    //   231: astore 5
    //   233: aload 7
    //   235: invokevirtual 111	org/json/JSONException:printStackTrace	()V
    //   238: ldc 79
    //   240: astore 6
    //   242: aload 4
    //   244: astore 7
    //   246: aload 6
    //   248: astore 4
    //   250: goto -73 -> 177
    //   253: aload_0
    //   254: getfield 18	kyz:jdField_a_of_type_ComTencentMobileqqDataPAMessage	Lcom/tencent/mobileqq/data/PAMessage;
    //   257: ifnull +88 -> 345
    //   260: iconst_0
    //   261: istore_2
    //   262: iload_2
    //   263: aload_0
    //   264: getfield 18	kyz:jdField_a_of_type_ComTencentMobileqqDataPAMessage	Lcom/tencent/mobileqq/data/PAMessage;
    //   267: getfield 117	com/tencent/mobileqq/data/PAMessage:items	Ljava/util/ArrayList;
    //   270: invokevirtual 122	java/util/ArrayList:size	()I
    //   273: if_icmpge +72 -> 345
    //   276: aload_0
    //   277: getfield 18	kyz:jdField_a_of_type_ComTencentMobileqqDataPAMessage	Lcom/tencent/mobileqq/data/PAMessage;
    //   280: getfield 117	com/tencent/mobileqq/data/PAMessage:items	Ljava/util/ArrayList;
    //   283: iload_2
    //   284: invokevirtual 126	java/util/ArrayList:get	(I)Ljava/lang/Object;
    //   287: checkcast 128	com/tencent/mobileqq/data/PAMessage$Item
    //   290: astore 6
    //   292: ldc -126
    //   294: aload 6
    //   296: getfield 134	com/tencent/mobileqq/data/PAMessage$Item:type	Ljava/lang/String;
    //   299: invokevirtual 140	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   302: ifeq +36 -> 338
    //   305: aload 6
    //   307: aload_1
    //   308: putfield 142	com/tencent/mobileqq/data/PAMessage$Item:title	Ljava/lang/String;
    //   311: aload 6
    //   313: aload_3
    //   314: putfield 144	com/tencent/mobileqq/data/PAMessage$Item:url	Ljava/lang/String;
    //   317: aload 6
    //   319: aload 7
    //   321: putfield 147	com/tencent/mobileqq/data/PAMessage$Item:weaExposeUrl	Ljava/lang/String;
    //   324: aload 6
    //   326: aload 5
    //   328: putfield 149	com/tencent/mobileqq/data/PAMessage$Item:cover	Ljava/lang/String;
    //   331: aload 6
    //   333: aload 4
    //   335: putfield 152	com/tencent/mobileqq/data/PAMessage$Item:isAd	Ljava/lang/String;
    //   338: iload_2
    //   339: iconst_1
    //   340: iadd
    //   341: istore_2
    //   342: goto -80 -> 262
    //   345: aload_0
    //   346: getfield 16	kyz:jdField_a_of_type_ComTencentMobileqqActivityAioItemPAWeatherItemBuilder	Lcom/tencent/mobileqq/activity/aio/item/PAWeatherItemBuilder;
    //   349: getfield 155	com/tencent/mobileqq/activity/aio/item/PAWeatherItemBuilder:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   352: invokevirtual 160	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/mobileqq/app/message/QQMessageFacade;
    //   355: aload_0
    //   356: getfield 16	kyz:jdField_a_of_type_ComTencentMobileqqActivityAioItemPAWeatherItemBuilder	Lcom/tencent/mobileqq/activity/aio/item/PAWeatherItemBuilder;
    //   359: getfield 163	com/tencent/mobileqq/activity/aio/item/PAWeatherItemBuilder:jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo	Lcom/tencent/mobileqq/activity/aio/SessionInfo;
    //   362: getfield 167	com/tencent/mobileqq/activity/aio/SessionInfo:jdField_a_of_type_JavaLangString	Ljava/lang/String;
    //   365: aload_0
    //   366: getfield 16	kyz:jdField_a_of_type_ComTencentMobileqqActivityAioItemPAWeatherItemBuilder	Lcom/tencent/mobileqq/activity/aio/item/PAWeatherItemBuilder;
    //   369: getfield 163	com/tencent/mobileqq/activity/aio/item/PAWeatherItemBuilder:jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo	Lcom/tencent/mobileqq/activity/aio/SessionInfo;
    //   372: getfield 170	com/tencent/mobileqq/activity/aio/SessionInfo:jdField_a_of_type_Int	I
    //   375: aload_0
    //   376: getfield 20	kyz:jdField_a_of_type_Long	J
    //   379: aload_0
    //   380: getfield 18	kyz:jdField_a_of_type_ComTencentMobileqqDataPAMessage	Lcom/tencent/mobileqq/data/PAMessage;
    //   383: invokestatic 175	com/tencent/biz/pubaccount/util/PAMessageUtil:a	(Lcom/tencent/mobileqq/data/PAMessage;)[B
    //   386: invokevirtual 180	com/tencent/mobileqq/app/message/QQMessageFacade:a	(Ljava/lang/String;IJ[B)V
    //   389: aload_0
    //   390: getfield 22	kyz:jdField_a_of_type_ComTencentMobileqqTroopWidgetEllipsizingTextView	Lcom/tencent/mobileqq/troop/widget/EllipsizingTextView;
    //   393: aload_1
    //   394: invokevirtual 186	com/tencent/mobileqq/troop/widget/EllipsizingTextView:setText	(Ljava/lang/CharSequence;)V
    //   397: aload 5
    //   399: invokestatic 192	com/tencent/image/URLDrawable:getDrawable	(Ljava/lang/String;)Lcom/tencent/image/URLDrawable;
    //   402: astore_1
    //   403: aload_1
    //   404: ifnull +11 -> 415
    //   407: aload_0
    //   408: getfield 24	kyz:jdField_a_of_type_AndroidWidgetImageView	Landroid/widget/ImageView;
    //   411: aload_1
    //   412: invokevirtual 198	android/widget/ImageView:setImageDrawable	(Landroid/graphics/drawable/Drawable;)V
    //   415: aload_0
    //   416: getfield 16	kyz:jdField_a_of_type_ComTencentMobileqqActivityAioItemPAWeatherItemBuilder	Lcom/tencent/mobileqq/activity/aio/item/PAWeatherItemBuilder;
    //   419: getfield 43	com/tencent/mobileqq/activity/aio/item/PAWeatherItemBuilder:b	Landroid/widget/BaseAdapter;
    //   422: invokevirtual 203	android/widget/BaseAdapter:notifyDataSetChanged	()V
    //   425: ldc -51
    //   427: aload 4
    //   429: invokevirtual 140	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   432: ifeq -422 -> 10
    //   435: aload_0
    //   436: getfield 16	kyz:jdField_a_of_type_ComTencentMobileqqActivityAioItemPAWeatherItemBuilder	Lcom/tencent/mobileqq/activity/aio/item/PAWeatherItemBuilder;
    //   439: getfield 155	com/tencent/mobileqq/activity/aio/item/PAWeatherItemBuilder:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   442: ldc -49
    //   444: ldc -47
    //   446: ldc 79
    //   448: ldc -47
    //   450: ldc -45
    //   452: iconst_0
    //   453: iconst_0
    //   454: ldc 79
    //   456: ldc 79
    //   458: ldc 79
    //   460: ldc 79
    //   462: invokestatic 216	com/tencent/mobileqq/statistics/ReportController:b	(Lcom/tencent/mobileqq/app/QQAppInterface;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    //   465: return
    //   466: astore 6
    //   468: aload 7
    //   470: astore 4
    //   472: aload 6
    //   474: astore 7
    //   476: goto -243 -> 233
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	479	0	this	kyz
    //   0	479	1	paramString	String
    //   261	81	2	i	int
    //   25	289	3	localObject1	Object
    //   73	398	4	localObject2	Object
    //   76	322	5	localObject3	Object
    //   80	252	6	localObject4	Object
    //   466	7	6	localJSONException1	org.json.JSONException
    //   69	77	7	str1	String
    //   217	17	7	localJSONException2	org.json.JSONException
    //   244	231	7	localObject5	Object
    //   62	168	8	str2	String
    //   87	82	9	localJSONObject	org.json.JSONObject
    // Exception table:
    //   from	to	target	type
    //   26	49	207	org/json/JSONException
    //   82	89	217	org/json/JSONException
    //   100	108	217	org/json/JSONException
    //   118	126	217	org/json/JSONException
    //   136	145	217	org/json/JSONException
    //   155	164	217	org/json/JSONException
    //   168	177	466	org/json/JSONException
  }
}
