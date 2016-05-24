package com.localytics.android;

class Constants
{
  public static String ANALYTICS_URL;
  static final String CLOSE_EVENT;
  static final int CURRENT_API_LEVEL;
  static final String FLOW_EVENT = String.format("%s:%s", new Object[] { "com.localytics.android", "flow" });
  public static boolean IS_LOGGABLE;
  static final String OPEN_EVENT;
  static final String OPT_IN_EVENT;
  static final String OPT_OUT_EVENT;
  public static String PROFILES_URL;
  public static long SESSION_EXPIRATION = 15000L;
  public static boolean USE_HTTPS;
  
  static
  {
    IS_LOGGABLE = false;
    USE_HTTPS = true;
    CURRENT_API_LEVEL = DatapointHelper.getApiLevel();
    ANALYTICS_URL = "analytics.localytics.com";
    PROFILES_URL = "profile.localytics.com";
    OPEN_EVENT = String.format("%s:%s", new Object[] { "com.localytics.android", "open" });
    CLOSE_EVENT = String.format("%s:%s", new Object[] { "com.localytics.android", "close" });
    OPT_IN_EVENT = String.format("%s:%s", new Object[] { "com.localytics.android", "opt_in" });
    OPT_OUT_EVENT = String.format("%s:%s", new Object[] { "com.localytics.android", "opt_out" });
  }
}
