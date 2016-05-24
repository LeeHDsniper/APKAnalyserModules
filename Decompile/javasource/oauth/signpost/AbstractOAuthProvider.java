package oauth.signpost;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;
import oauth.signpost.exception.OAuthCommunicationException;
import oauth.signpost.exception.OAuthExpectationFailedException;
import oauth.signpost.exception.OAuthMessageSignerException;
import oauth.signpost.exception.OAuthNotAuthorizedException;
import oauth.signpost.http.HttpParameters;
import oauth.signpost.http.HttpRequest;
import oauth.signpost.http.HttpResponse;

public abstract class AbstractOAuthProvider
  implements OAuthProvider
{
  private static final long serialVersionUID = 1L;
  private String accessTokenEndpointUrl;
  private String authorizationWebsiteUrl;
  private Map<String, String> defaultHeaders;
  private boolean isOAuth10a;
  private transient OAuthProviderListener listener;
  private String requestTokenEndpointUrl;
  private HttpParameters responseParameters;
  
  public AbstractOAuthProvider(String paramString1, String paramString2, String paramString3)
  {
    requestTokenEndpointUrl = paramString1;
    accessTokenEndpointUrl = paramString2;
    authorizationWebsiteUrl = paramString3;
    responseParameters = new HttpParameters();
    defaultHeaders = new HashMap();
  }
  
  protected void closeConnection(HttpRequest paramHttpRequest, HttpResponse paramHttpResponse)
    throws Exception
  {}
  
  protected abstract HttpRequest createRequest(String paramString)
    throws Exception;
  
  public Map<String, String> getRequestHeaders()
  {
    return defaultHeaders;
  }
  
  protected void handleUnexpectedResponse(int paramInt, HttpResponse paramHttpResponse)
    throws Exception
  {
    if (paramHttpResponse == null) {
      return;
    }
    BufferedReader localBufferedReader = new BufferedReader(new InputStreamReader(paramHttpResponse.getContent()));
    StringBuilder localStringBuilder = new StringBuilder();
    for (String str = localBufferedReader.readLine(); str != null; str = localBufferedReader.readLine()) {
      localStringBuilder.append(str);
    }
    switch (paramInt)
    {
    default: 
      throw new OAuthCommunicationException("Service provider responded in error: " + paramInt + " (" + paramHttpResponse.getReasonPhrase() + ")", localStringBuilder.toString());
    }
    throw new OAuthNotAuthorizedException(localStringBuilder.toString());
  }
  
  public void retrieveAccessToken(OAuthConsumer paramOAuthConsumer, String paramString, String... paramVarArgs)
    throws OAuthMessageSignerException, OAuthNotAuthorizedException, OAuthExpectationFailedException, OAuthCommunicationException
  {
    HttpParameters localHttpParameters;
    try
    {
      if ((paramOAuthConsumer.getToken() == null) || (paramOAuthConsumer.getTokenSecret() == null)) {
        throw new OAuthExpectationFailedException("Authorized request token or token secret not set. Did you retrieve an authorized request token before?");
      }
    }
    finally
    {
      throw paramOAuthConsumer;
      localHttpParameters = new HttpParameters();
      localHttpParameters.putAll(paramVarArgs, true);
      if ((isOAuth10a) && (paramString != null)) {
        localHttpParameters.put("oauth_verifier", paramString, true);
      }
    }
  }
  
  /* Error */
  public String retrieveRequestToken(OAuthConsumer paramOAuthConsumer, String paramString, String... paramVarArgs)
    throws OAuthMessageSignerException, OAuthNotAuthorizedException, OAuthExpectationFailedException, OAuthCommunicationException
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_1
    //   3: aconst_null
    //   4: aconst_null
    //   5: invokeinterface 148 3 0
    //   10: new 36	oauth/signpost/http/HttpParameters
    //   13: dup
    //   14: invokespecial 37	oauth/signpost/http/HttpParameters:<init>	()V
    //   17: astore 4
    //   19: aload 4
    //   21: aload_3
    //   22: iconst_1
    //   23: invokevirtual 131	oauth/signpost/http/HttpParameters:putAll	([Ljava/lang/String;Z)V
    //   26: aload 4
    //   28: ldc -106
    //   30: aload_2
    //   31: iconst_1
    //   32: invokevirtual 139	oauth/signpost/http/HttpParameters:put	(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;
    //   35: pop
    //   36: aload_0
    //   37: aload_1
    //   38: aload_0
    //   39: getfield 30	oauth/signpost/AbstractOAuthProvider:requestTokenEndpointUrl	Ljava/lang/String;
    //   42: aload 4
    //   44: invokevirtual 143	oauth/signpost/AbstractOAuthProvider:retrieveToken	(Loauth/signpost/OAuthConsumer;Ljava/lang/String;Loauth/signpost/http/HttpParameters;)V
    //   47: aload_0
    //   48: getfield 39	oauth/signpost/AbstractOAuthProvider:responseParameters	Loauth/signpost/http/HttpParameters;
    //   51: ldc -104
    //   53: invokevirtual 156	oauth/signpost/http/HttpParameters:getFirst	(Ljava/lang/Object;)Ljava/lang/String;
    //   56: astore_3
    //   57: aload_0
    //   58: getfield 39	oauth/signpost/AbstractOAuthProvider:responseParameters	Loauth/signpost/http/HttpParameters;
    //   61: ldc -104
    //   63: invokevirtual 160	oauth/signpost/http/HttpParameters:remove	(Ljava/lang/Object;)Ljava/util/SortedSet;
    //   66: pop
    //   67: aload_0
    //   68: getstatic 166	java/lang/Boolean:TRUE	Ljava/lang/Boolean;
    //   71: invokevirtual 167	java/lang/Boolean:toString	()Ljava/lang/String;
    //   74: aload_3
    //   75: invokevirtual 173	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   78: putfield 133	oauth/signpost/AbstractOAuthProvider:isOAuth10a	Z
    //   81: aload_0
    //   82: getfield 133	oauth/signpost/AbstractOAuthProvider:isOAuth10a	Z
    //   85: ifeq +33 -> 118
    //   88: aload_0
    //   89: getfield 34	oauth/signpost/AbstractOAuthProvider:authorizationWebsiteUrl	Ljava/lang/String;
    //   92: iconst_2
    //   93: anewarray 169	java/lang/String
    //   96: dup
    //   97: iconst_0
    //   98: ldc -81
    //   100: aastore
    //   101: dup
    //   102: iconst_1
    //   103: aload_1
    //   104: invokeinterface 121 1 0
    //   109: aastore
    //   110: invokestatic 181	oauth/signpost/OAuth:addQueryParameters	(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    //   113: astore_1
    //   114: aload_0
    //   115: monitorexit
    //   116: aload_1
    //   117: areturn
    //   118: aload_0
    //   119: getfield 34	oauth/signpost/AbstractOAuthProvider:authorizationWebsiteUrl	Ljava/lang/String;
    //   122: iconst_4
    //   123: anewarray 169	java/lang/String
    //   126: dup
    //   127: iconst_0
    //   128: ldc -81
    //   130: aastore
    //   131: dup
    //   132: iconst_1
    //   133: aload_1
    //   134: invokeinterface 121 1 0
    //   139: aastore
    //   140: dup
    //   141: iconst_2
    //   142: ldc -106
    //   144: aastore
    //   145: dup
    //   146: iconst_3
    //   147: aload_2
    //   148: aastore
    //   149: invokestatic 181	oauth/signpost/OAuth:addQueryParameters	(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    //   152: astore_1
    //   153: goto -39 -> 114
    //   156: astore_1
    //   157: aload_0
    //   158: monitorexit
    //   159: aload_1
    //   160: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	161	0	this	AbstractOAuthProvider
    //   0	161	1	paramOAuthConsumer	OAuthConsumer
    //   0	161	2	paramString	String
    //   0	161	3	paramVarArgs	String[]
    //   17	26	4	localHttpParameters	HttpParameters
    // Exception table:
    //   from	to	target	type
    //   2	114	156	finally
    //   118	153	156	finally
  }
  
  /* Error */
  protected void retrieveToken(OAuthConsumer paramOAuthConsumer, String paramString, HttpParameters paramHttpParameters)
    throws OAuthMessageSignerException, OAuthCommunicationException, OAuthNotAuthorizedException, OAuthExpectationFailedException
  {
    // Byte code:
    //   0: aload_0
    //   1: invokevirtual 183	oauth/signpost/AbstractOAuthProvider:getRequestHeaders	()Ljava/util/Map;
    //   4: astore 18
    //   6: aload_1
    //   7: invokeinterface 186 1 0
    //   12: ifnull +12 -> 24
    //   15: aload_1
    //   16: invokeinterface 189 1 0
    //   21: ifnonnull +13 -> 34
    //   24: new 116	oauth/signpost/exception/OAuthExpectationFailedException
    //   27: dup
    //   28: ldc -65
    //   30: invokespecial 127	oauth/signpost/exception/OAuthExpectationFailedException:<init>	(Ljava/lang/String;)V
    //   33: athrow
    //   34: aconst_null
    //   35: astore 6
    //   37: aconst_null
    //   38: astore 10
    //   40: aconst_null
    //   41: astore 12
    //   43: aconst_null
    //   44: astore 8
    //   46: aconst_null
    //   47: astore 15
    //   49: aconst_null
    //   50: astore 16
    //   52: aconst_null
    //   53: astore 17
    //   55: aconst_null
    //   56: astore 14
    //   58: aload 14
    //   60: astore 9
    //   62: aload 15
    //   64: astore 7
    //   66: aload 16
    //   68: astore 11
    //   70: aload 17
    //   72: astore 13
    //   74: aload_0
    //   75: aload_2
    //   76: invokevirtual 193	oauth/signpost/AbstractOAuthProvider:createRequest	(Ljava/lang/String;)Loauth/signpost/http/HttpRequest;
    //   79: astore_2
    //   80: aload_2
    //   81: astore 8
    //   83: aload 14
    //   85: astore 9
    //   87: aload_2
    //   88: astore 6
    //   90: aload 15
    //   92: astore 7
    //   94: aload_2
    //   95: astore 10
    //   97: aload 16
    //   99: astore 11
    //   101: aload_2
    //   102: astore 12
    //   104: aload 17
    //   106: astore 13
    //   108: aload 18
    //   110: invokeinterface 199 1 0
    //   115: invokeinterface 205 1 0
    //   120: astore 19
    //   122: aload_2
    //   123: astore 8
    //   125: aload 14
    //   127: astore 9
    //   129: aload_2
    //   130: astore 6
    //   132: aload 15
    //   134: astore 7
    //   136: aload_2
    //   137: astore 10
    //   139: aload 16
    //   141: astore 11
    //   143: aload_2
    //   144: astore 12
    //   146: aload 17
    //   148: astore 13
    //   150: aload 19
    //   152: invokeinterface 211 1 0
    //   157: ifeq +116 -> 273
    //   160: aload_2
    //   161: astore 8
    //   163: aload 14
    //   165: astore 9
    //   167: aload_2
    //   168: astore 6
    //   170: aload 15
    //   172: astore 7
    //   174: aload_2
    //   175: astore 10
    //   177: aload 16
    //   179: astore 11
    //   181: aload_2
    //   182: astore 12
    //   184: aload 17
    //   186: astore 13
    //   188: aload 19
    //   190: invokeinterface 215 1 0
    //   195: checkcast 169	java/lang/String
    //   198: astore 20
    //   200: aload_2
    //   201: astore 8
    //   203: aload 14
    //   205: astore 9
    //   207: aload_2
    //   208: astore 6
    //   210: aload 15
    //   212: astore 7
    //   214: aload_2
    //   215: astore 10
    //   217: aload 16
    //   219: astore 11
    //   221: aload_2
    //   222: astore 12
    //   224: aload 17
    //   226: astore 13
    //   228: aload_2
    //   229: aload 20
    //   231: aload 18
    //   233: aload 20
    //   235: invokeinterface 219 2 0
    //   240: checkcast 169	java/lang/String
    //   243: invokeinterface 224 3 0
    //   248: goto -126 -> 122
    //   251: astore_1
    //   252: aload 8
    //   254: astore 6
    //   256: aload 9
    //   258: astore 7
    //   260: aload_1
    //   261: athrow
    //   262: astore_1
    //   263: aload_0
    //   264: aload 6
    //   266: aload 7
    //   268: invokevirtual 226	oauth/signpost/AbstractOAuthProvider:closeConnection	(Loauth/signpost/http/HttpRequest;Loauth/signpost/http/HttpResponse;)V
    //   271: aload_1
    //   272: athrow
    //   273: aload_3
    //   274: ifnull +73 -> 347
    //   277: aload_2
    //   278: astore 8
    //   280: aload 14
    //   282: astore 9
    //   284: aload_2
    //   285: astore 6
    //   287: aload 15
    //   289: astore 7
    //   291: aload_2
    //   292: astore 10
    //   294: aload 16
    //   296: astore 11
    //   298: aload_2
    //   299: astore 12
    //   301: aload 17
    //   303: astore 13
    //   305: aload_3
    //   306: invokevirtual 229	oauth/signpost/http/HttpParameters:isEmpty	()Z
    //   309: ifne +38 -> 347
    //   312: aload_2
    //   313: astore 8
    //   315: aload 14
    //   317: astore 9
    //   319: aload_2
    //   320: astore 6
    //   322: aload 15
    //   324: astore 7
    //   326: aload_2
    //   327: astore 10
    //   329: aload 16
    //   331: astore 11
    //   333: aload_2
    //   334: astore 12
    //   336: aload 17
    //   338: astore 13
    //   340: aload_1
    //   341: aload_3
    //   342: invokeinterface 233 2 0
    //   347: aload_2
    //   348: astore 8
    //   350: aload 14
    //   352: astore 9
    //   354: aload_2
    //   355: astore 6
    //   357: aload 15
    //   359: astore 7
    //   361: aload_2
    //   362: astore 10
    //   364: aload 16
    //   366: astore 11
    //   368: aload_2
    //   369: astore 12
    //   371: aload 17
    //   373: astore 13
    //   375: aload_0
    //   376: getfield 235	oauth/signpost/AbstractOAuthProvider:listener	Loauth/signpost/OAuthProviderListener;
    //   379: ifnull +41 -> 420
    //   382: aload_2
    //   383: astore 8
    //   385: aload 14
    //   387: astore 9
    //   389: aload_2
    //   390: astore 6
    //   392: aload 15
    //   394: astore 7
    //   396: aload_2
    //   397: astore 10
    //   399: aload 16
    //   401: astore 11
    //   403: aload_2
    //   404: astore 12
    //   406: aload 17
    //   408: astore 13
    //   410: aload_0
    //   411: getfield 235	oauth/signpost/AbstractOAuthProvider:listener	Loauth/signpost/OAuthProviderListener;
    //   414: aload_2
    //   415: invokeinterface 241 2 0
    //   420: aload_2
    //   421: astore 8
    //   423: aload 14
    //   425: astore 9
    //   427: aload_2
    //   428: astore 6
    //   430: aload 15
    //   432: astore 7
    //   434: aload_2
    //   435: astore 10
    //   437: aload 16
    //   439: astore 11
    //   441: aload_2
    //   442: astore 12
    //   444: aload 17
    //   446: astore 13
    //   448: aload_1
    //   449: aload_2
    //   450: invokeinterface 245 2 0
    //   455: pop
    //   456: aload_2
    //   457: astore 8
    //   459: aload 14
    //   461: astore 9
    //   463: aload_2
    //   464: astore 6
    //   466: aload 15
    //   468: astore 7
    //   470: aload_2
    //   471: astore 10
    //   473: aload 16
    //   475: astore 11
    //   477: aload_2
    //   478: astore 12
    //   480: aload 17
    //   482: astore 13
    //   484: aload_0
    //   485: getfield 235	oauth/signpost/AbstractOAuthProvider:listener	Loauth/signpost/OAuthProviderListener;
    //   488: ifnull +41 -> 529
    //   491: aload_2
    //   492: astore 8
    //   494: aload 14
    //   496: astore 9
    //   498: aload_2
    //   499: astore 6
    //   501: aload 15
    //   503: astore 7
    //   505: aload_2
    //   506: astore 10
    //   508: aload 16
    //   510: astore 11
    //   512: aload_2
    //   513: astore 12
    //   515: aload 17
    //   517: astore 13
    //   519: aload_0
    //   520: getfield 235	oauth/signpost/AbstractOAuthProvider:listener	Loauth/signpost/OAuthProviderListener;
    //   523: aload_2
    //   524: invokeinterface 248 2 0
    //   529: aload_2
    //   530: astore 8
    //   532: aload 14
    //   534: astore 9
    //   536: aload_2
    //   537: astore 6
    //   539: aload 15
    //   541: astore 7
    //   543: aload_2
    //   544: astore 10
    //   546: aload 16
    //   548: astore 11
    //   550: aload_2
    //   551: astore 12
    //   553: aload 17
    //   555: astore 13
    //   557: aload_0
    //   558: aload_2
    //   559: invokevirtual 252	oauth/signpost/AbstractOAuthProvider:sendRequest	(Loauth/signpost/http/HttpRequest;)Loauth/signpost/http/HttpResponse;
    //   562: astore_3
    //   563: aload_2
    //   564: astore 8
    //   566: aload_3
    //   567: astore 9
    //   569: aload_2
    //   570: astore 6
    //   572: aload_3
    //   573: astore 7
    //   575: aload_2
    //   576: astore 10
    //   578: aload_3
    //   579: astore 11
    //   581: aload_2
    //   582: astore 12
    //   584: aload_3
    //   585: astore 13
    //   587: aload_3
    //   588: invokeinterface 256 1 0
    //   593: istore 4
    //   595: iconst_0
    //   596: istore 5
    //   598: aload_2
    //   599: astore 8
    //   601: aload_3
    //   602: astore 9
    //   604: aload_2
    //   605: astore 6
    //   607: aload_3
    //   608: astore 7
    //   610: aload_2
    //   611: astore 10
    //   613: aload_3
    //   614: astore 11
    //   616: aload_2
    //   617: astore 12
    //   619: aload_3
    //   620: astore 13
    //   622: aload_0
    //   623: getfield 235	oauth/signpost/AbstractOAuthProvider:listener	Loauth/signpost/OAuthProviderListener;
    //   626: ifnull +40 -> 666
    //   629: aload_2
    //   630: astore 8
    //   632: aload_3
    //   633: astore 9
    //   635: aload_2
    //   636: astore 6
    //   638: aload_3
    //   639: astore 7
    //   641: aload_2
    //   642: astore 10
    //   644: aload_3
    //   645: astore 11
    //   647: aload_2
    //   648: astore 12
    //   650: aload_3
    //   651: astore 13
    //   653: aload_0
    //   654: getfield 235	oauth/signpost/AbstractOAuthProvider:listener	Loauth/signpost/OAuthProviderListener;
    //   657: aload_2
    //   658: aload_3
    //   659: invokeinterface 260 3 0
    //   664: istore 5
    //   666: iload 5
    //   668: ifeq +20 -> 688
    //   671: aload_0
    //   672: aload_2
    //   673: aload_3
    //   674: invokevirtual 226	oauth/signpost/AbstractOAuthProvider:closeConnection	(Loauth/signpost/http/HttpRequest;Loauth/signpost/http/HttpResponse;)V
    //   677: return
    //   678: astore_1
    //   679: new 87	oauth/signpost/exception/OAuthCommunicationException
    //   682: dup
    //   683: aload_1
    //   684: invokespecial 263	oauth/signpost/exception/OAuthCommunicationException:<init>	(Ljava/lang/Exception;)V
    //   687: athrow
    //   688: iload 4
    //   690: sipush 300
    //   693: if_icmplt +34 -> 727
    //   696: aload_2
    //   697: astore 8
    //   699: aload_3
    //   700: astore 9
    //   702: aload_2
    //   703: astore 6
    //   705: aload_3
    //   706: astore 7
    //   708: aload_2
    //   709: astore 10
    //   711: aload_3
    //   712: astore 11
    //   714: aload_2
    //   715: astore 12
    //   717: aload_3
    //   718: astore 13
    //   720: aload_0
    //   721: iload 4
    //   723: aload_3
    //   724: invokevirtual 265	oauth/signpost/AbstractOAuthProvider:handleUnexpectedResponse	(ILoauth/signpost/http/HttpResponse;)V
    //   727: aload_2
    //   728: astore 8
    //   730: aload_3
    //   731: astore 9
    //   733: aload_2
    //   734: astore 6
    //   736: aload_3
    //   737: astore 7
    //   739: aload_2
    //   740: astore 10
    //   742: aload_3
    //   743: astore 11
    //   745: aload_2
    //   746: astore 12
    //   748: aload_3
    //   749: astore 13
    //   751: aload_3
    //   752: invokeinterface 68 1 0
    //   757: invokestatic 269	oauth/signpost/OAuth:decodeForm	(Ljava/io/InputStream;)Loauth/signpost/http/HttpParameters;
    //   760: astore 14
    //   762: aload_2
    //   763: astore 8
    //   765: aload_3
    //   766: astore 9
    //   768: aload_2
    //   769: astore 6
    //   771: aload_3
    //   772: astore 7
    //   774: aload_2
    //   775: astore 10
    //   777: aload_3
    //   778: astore 11
    //   780: aload_2
    //   781: astore 12
    //   783: aload_3
    //   784: astore 13
    //   786: aload 14
    //   788: ldc -81
    //   790: invokevirtual 156	oauth/signpost/http/HttpParameters:getFirst	(Ljava/lang/Object;)Ljava/lang/String;
    //   793: astore 15
    //   795: aload_2
    //   796: astore 8
    //   798: aload_3
    //   799: astore 9
    //   801: aload_2
    //   802: astore 6
    //   804: aload_3
    //   805: astore 7
    //   807: aload_2
    //   808: astore 10
    //   810: aload_3
    //   811: astore 11
    //   813: aload_2
    //   814: astore 12
    //   816: aload_3
    //   817: astore 13
    //   819: aload 14
    //   821: ldc_w 271
    //   824: invokevirtual 156	oauth/signpost/http/HttpParameters:getFirst	(Ljava/lang/Object;)Ljava/lang/String;
    //   827: astore 16
    //   829: aload_2
    //   830: astore 8
    //   832: aload_3
    //   833: astore 9
    //   835: aload_2
    //   836: astore 6
    //   838: aload_3
    //   839: astore 7
    //   841: aload_2
    //   842: astore 10
    //   844: aload_3
    //   845: astore 11
    //   847: aload_2
    //   848: astore 12
    //   850: aload_3
    //   851: astore 13
    //   853: aload 14
    //   855: ldc -81
    //   857: invokevirtual 160	oauth/signpost/http/HttpParameters:remove	(Ljava/lang/Object;)Ljava/util/SortedSet;
    //   860: pop
    //   861: aload_2
    //   862: astore 8
    //   864: aload_3
    //   865: astore 9
    //   867: aload_2
    //   868: astore 6
    //   870: aload_3
    //   871: astore 7
    //   873: aload_2
    //   874: astore 10
    //   876: aload_3
    //   877: astore 11
    //   879: aload_2
    //   880: astore 12
    //   882: aload_3
    //   883: astore 13
    //   885: aload 14
    //   887: ldc_w 271
    //   890: invokevirtual 160	oauth/signpost/http/HttpParameters:remove	(Ljava/lang/Object;)Ljava/util/SortedSet;
    //   893: pop
    //   894: aload_2
    //   895: astore 8
    //   897: aload_3
    //   898: astore 9
    //   900: aload_2
    //   901: astore 6
    //   903: aload_3
    //   904: astore 7
    //   906: aload_2
    //   907: astore 10
    //   909: aload_3
    //   910: astore 11
    //   912: aload_2
    //   913: astore 12
    //   915: aload_3
    //   916: astore 13
    //   918: aload_0
    //   919: aload 14
    //   921: invokevirtual 274	oauth/signpost/AbstractOAuthProvider:setResponseParameters	(Loauth/signpost/http/HttpParameters;)V
    //   924: aload 15
    //   926: ifnull +8 -> 934
    //   929: aload 16
    //   931: ifnonnull +49 -> 980
    //   934: aload_2
    //   935: astore 8
    //   937: aload_3
    //   938: astore 9
    //   940: aload_2
    //   941: astore 6
    //   943: aload_3
    //   944: astore 7
    //   946: aload_2
    //   947: astore 10
    //   949: aload_3
    //   950: astore 11
    //   952: aload_2
    //   953: astore 12
    //   955: aload_3
    //   956: astore 13
    //   958: new 116	oauth/signpost/exception/OAuthExpectationFailedException
    //   961: dup
    //   962: ldc_w 276
    //   965: invokespecial 127	oauth/signpost/exception/OAuthExpectationFailedException:<init>	(Ljava/lang/String;)V
    //   968: athrow
    //   969: astore_1
    //   970: aload 10
    //   972: astore 6
    //   974: aload 11
    //   976: astore 7
    //   978: aload_1
    //   979: athrow
    //   980: aload_2
    //   981: astore 8
    //   983: aload_3
    //   984: astore 9
    //   986: aload_2
    //   987: astore 6
    //   989: aload_3
    //   990: astore 7
    //   992: aload_2
    //   993: astore 10
    //   995: aload_3
    //   996: astore 11
    //   998: aload_2
    //   999: astore 12
    //   1001: aload_3
    //   1002: astore 13
    //   1004: aload_1
    //   1005: aload 15
    //   1007: aload 16
    //   1009: invokeinterface 148 3 0
    //   1014: aload_0
    //   1015: aload_2
    //   1016: aload_3
    //   1017: invokevirtual 226	oauth/signpost/AbstractOAuthProvider:closeConnection	(Loauth/signpost/http/HttpRequest;Loauth/signpost/http/HttpResponse;)V
    //   1020: return
    //   1021: astore_1
    //   1022: new 87	oauth/signpost/exception/OAuthCommunicationException
    //   1025: dup
    //   1026: aload_1
    //   1027: invokespecial 263	oauth/signpost/exception/OAuthCommunicationException:<init>	(Ljava/lang/Exception;)V
    //   1030: athrow
    //   1031: astore_1
    //   1032: aload 12
    //   1034: astore 6
    //   1036: aload 13
    //   1038: astore 7
    //   1040: new 87	oauth/signpost/exception/OAuthCommunicationException
    //   1043: dup
    //   1044: aload_1
    //   1045: invokespecial 263	oauth/signpost/exception/OAuthCommunicationException:<init>	(Ljava/lang/Exception;)V
    //   1048: athrow
    //   1049: astore_1
    //   1050: new 87	oauth/signpost/exception/OAuthCommunicationException
    //   1053: dup
    //   1054: aload_1
    //   1055: invokespecial 263	oauth/signpost/exception/OAuthCommunicationException:<init>	(Ljava/lang/Exception;)V
    //   1058: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	1059	0	this	AbstractOAuthProvider
    //   0	1059	1	paramOAuthConsumer	OAuthConsumer
    //   0	1059	2	paramString	String
    //   0	1059	3	paramHttpParameters	HttpParameters
    //   593	129	4	i	int
    //   596	71	5	bool	boolean
    //   35	1000	6	localObject1	Object
    //   64	975	7	localObject2	Object
    //   44	938	8	str1	String
    //   60	925	9	localHttpParameters1	HttpParameters
    //   38	956	10	str2	String
    //   68	929	11	localObject3	Object
    //   41	992	12	str3	String
    //   72	965	13	localObject4	Object
    //   56	864	14	localHttpParameters2	HttpParameters
    //   47	959	15	str4	String
    //   50	958	16	str5	String
    //   53	501	17	localObject5	Object
    //   4	228	18	localMap	Map
    //   120	69	19	localIterator	java.util.Iterator
    //   198	36	20	str6	String
    // Exception table:
    //   from	to	target	type
    //   74	80	251	oauth/signpost/exception/OAuthNotAuthorizedException
    //   108	122	251	oauth/signpost/exception/OAuthNotAuthorizedException
    //   150	160	251	oauth/signpost/exception/OAuthNotAuthorizedException
    //   188	200	251	oauth/signpost/exception/OAuthNotAuthorizedException
    //   228	248	251	oauth/signpost/exception/OAuthNotAuthorizedException
    //   305	312	251	oauth/signpost/exception/OAuthNotAuthorizedException
    //   340	347	251	oauth/signpost/exception/OAuthNotAuthorizedException
    //   375	382	251	oauth/signpost/exception/OAuthNotAuthorizedException
    //   410	420	251	oauth/signpost/exception/OAuthNotAuthorizedException
    //   448	456	251	oauth/signpost/exception/OAuthNotAuthorizedException
    //   484	491	251	oauth/signpost/exception/OAuthNotAuthorizedException
    //   519	529	251	oauth/signpost/exception/OAuthNotAuthorizedException
    //   557	563	251	oauth/signpost/exception/OAuthNotAuthorizedException
    //   587	595	251	oauth/signpost/exception/OAuthNotAuthorizedException
    //   622	629	251	oauth/signpost/exception/OAuthNotAuthorizedException
    //   653	666	251	oauth/signpost/exception/OAuthNotAuthorizedException
    //   720	727	251	oauth/signpost/exception/OAuthNotAuthorizedException
    //   751	762	251	oauth/signpost/exception/OAuthNotAuthorizedException
    //   786	795	251	oauth/signpost/exception/OAuthNotAuthorizedException
    //   819	829	251	oauth/signpost/exception/OAuthNotAuthorizedException
    //   853	861	251	oauth/signpost/exception/OAuthNotAuthorizedException
    //   885	894	251	oauth/signpost/exception/OAuthNotAuthorizedException
    //   918	924	251	oauth/signpost/exception/OAuthNotAuthorizedException
    //   958	969	251	oauth/signpost/exception/OAuthNotAuthorizedException
    //   1004	1014	251	oauth/signpost/exception/OAuthNotAuthorizedException
    //   74	80	262	finally
    //   108	122	262	finally
    //   150	160	262	finally
    //   188	200	262	finally
    //   228	248	262	finally
    //   260	262	262	finally
    //   305	312	262	finally
    //   340	347	262	finally
    //   375	382	262	finally
    //   410	420	262	finally
    //   448	456	262	finally
    //   484	491	262	finally
    //   519	529	262	finally
    //   557	563	262	finally
    //   587	595	262	finally
    //   622	629	262	finally
    //   653	666	262	finally
    //   720	727	262	finally
    //   751	762	262	finally
    //   786	795	262	finally
    //   819	829	262	finally
    //   853	861	262	finally
    //   885	894	262	finally
    //   918	924	262	finally
    //   958	969	262	finally
    //   978	980	262	finally
    //   1004	1014	262	finally
    //   1040	1049	262	finally
    //   671	677	678	java/lang/Exception
    //   74	80	969	oauth/signpost/exception/OAuthExpectationFailedException
    //   108	122	969	oauth/signpost/exception/OAuthExpectationFailedException
    //   150	160	969	oauth/signpost/exception/OAuthExpectationFailedException
    //   188	200	969	oauth/signpost/exception/OAuthExpectationFailedException
    //   228	248	969	oauth/signpost/exception/OAuthExpectationFailedException
    //   305	312	969	oauth/signpost/exception/OAuthExpectationFailedException
    //   340	347	969	oauth/signpost/exception/OAuthExpectationFailedException
    //   375	382	969	oauth/signpost/exception/OAuthExpectationFailedException
    //   410	420	969	oauth/signpost/exception/OAuthExpectationFailedException
    //   448	456	969	oauth/signpost/exception/OAuthExpectationFailedException
    //   484	491	969	oauth/signpost/exception/OAuthExpectationFailedException
    //   519	529	969	oauth/signpost/exception/OAuthExpectationFailedException
    //   557	563	969	oauth/signpost/exception/OAuthExpectationFailedException
    //   587	595	969	oauth/signpost/exception/OAuthExpectationFailedException
    //   622	629	969	oauth/signpost/exception/OAuthExpectationFailedException
    //   653	666	969	oauth/signpost/exception/OAuthExpectationFailedException
    //   720	727	969	oauth/signpost/exception/OAuthExpectationFailedException
    //   751	762	969	oauth/signpost/exception/OAuthExpectationFailedException
    //   786	795	969	oauth/signpost/exception/OAuthExpectationFailedException
    //   819	829	969	oauth/signpost/exception/OAuthExpectationFailedException
    //   853	861	969	oauth/signpost/exception/OAuthExpectationFailedException
    //   885	894	969	oauth/signpost/exception/OAuthExpectationFailedException
    //   918	924	969	oauth/signpost/exception/OAuthExpectationFailedException
    //   958	969	969	oauth/signpost/exception/OAuthExpectationFailedException
    //   1004	1014	969	oauth/signpost/exception/OAuthExpectationFailedException
    //   1014	1020	1021	java/lang/Exception
    //   74	80	1031	java/lang/Exception
    //   108	122	1031	java/lang/Exception
    //   150	160	1031	java/lang/Exception
    //   188	200	1031	java/lang/Exception
    //   228	248	1031	java/lang/Exception
    //   305	312	1031	java/lang/Exception
    //   340	347	1031	java/lang/Exception
    //   375	382	1031	java/lang/Exception
    //   410	420	1031	java/lang/Exception
    //   448	456	1031	java/lang/Exception
    //   484	491	1031	java/lang/Exception
    //   519	529	1031	java/lang/Exception
    //   557	563	1031	java/lang/Exception
    //   587	595	1031	java/lang/Exception
    //   622	629	1031	java/lang/Exception
    //   653	666	1031	java/lang/Exception
    //   720	727	1031	java/lang/Exception
    //   751	762	1031	java/lang/Exception
    //   786	795	1031	java/lang/Exception
    //   819	829	1031	java/lang/Exception
    //   853	861	1031	java/lang/Exception
    //   885	894	1031	java/lang/Exception
    //   918	924	1031	java/lang/Exception
    //   958	969	1031	java/lang/Exception
    //   1004	1014	1031	java/lang/Exception
    //   263	271	1049	java/lang/Exception
  }
  
  protected abstract HttpResponse sendRequest(HttpRequest paramHttpRequest)
    throws Exception;
  
  public void setResponseParameters(HttpParameters paramHttpParameters)
  {
    responseParameters = paramHttpParameters;
  }
}
