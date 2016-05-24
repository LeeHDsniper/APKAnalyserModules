package com.behance.sdk.OAuth;

import oauth.signpost.OAuthConsumer;
import oauth.signpost.commonshttp.CommonsHttpOAuthConsumer;
import oauth.signpost.commonshttp.CommonsHttpOAuthProvider;

public class TwitterClient
{
  private static TwitterClient instance;
  private OAuthConsumer mConsumer;
  private CommonsHttpOAuthProvider mProvider;
  
  private TwitterClient(String paramString1, String paramString2)
  {
    initialize(paramString1, paramString2);
  }
  
  public static TwitterClient getInstance(String paramString1, String paramString2)
  {
    if (instance == null) {
      instance = new TwitterClient(paramString1, paramString2);
    }
    return instance;
  }
  
  private void initialize(String paramString1, String paramString2)
  {
    mProvider = new CommonsHttpOAuthProvider("https://api.twitter.com/oauth/request_token", "https://api.twitter.com/oauth/access_token", "https://api.twitter.com/oauth/authorize");
    mConsumer = new CommonsHttpOAuthConsumer(paramString1, paramString2);
  }
  
  public OAuthConsumer getOAuthConsumer()
  {
    return mConsumer;
  }
  
  public CommonsHttpOAuthProvider getOAuthProvider()
  {
    return mProvider;
  }
}
