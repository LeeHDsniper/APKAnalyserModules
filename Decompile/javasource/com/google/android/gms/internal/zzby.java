package com.google.android.gms.internal;

import android.content.Context;
import com.google.android.gms.ads.internal.zzp;
import java.util.List;

@zzgk
public final class zzby
{
  public static final zzbu<String> zztV = zzbu.zzP("gads:sdk_core_experiment_id");
  public static final zzbu<String> zztW = zzbu.zzc("gads:sdk_core_location", "https://googleads.g.doubleclick.net/mads/static/mad/sdk/native/sdk-core-v40.html");
  public static final zzbu<Boolean> zztX = zzbu.zza("gads:request_builder:singleton_webview", Boolean.valueOf(false));
  public static final zzbu<String> zztY = zzbu.zzP("gads:request_builder:singleton_webview_experiment_id");
  public static final zzbu<Boolean> zztZ = zzbu.zza("gads:sdk_use_dynamic_module", Boolean.valueOf(false));
  public static final zzbu<String> zzuA = zzbu.zzc("gad:mraid:url_interstitial", "https://googleads.g.doubleclick.net/mads/static/mad/sdk/native/mraid/v2/mraid_app_interstitial.js");
  public static final zzbu<Boolean> zzuB = zzbu.zza("gads:enabled_sdk_csi", Boolean.valueOf(false));
  public static final zzbu<String> zzuC = zzbu.zzc("gads:sdk_csi_server", "https://csi.gstatic.com/csi");
  public static final zzbu<Boolean> zzuD = zzbu.zza("gads:sdk_csi_write_to_file", Boolean.valueOf(false));
  public static final zzbu<Boolean> zzuE = zzbu.zza("gads:enable_content_fetching", Boolean.valueOf(true));
  public static final zzbu<Integer> zzuF = zzbu.zza("gads:content_length_weight", 1);
  public static final zzbu<Integer> zzuG = zzbu.zza("gads:content_age_weight", 1);
  public static final zzbu<Integer> zzuH = zzbu.zza("gads:min_content_len", 11);
  public static final zzbu<Integer> zzuI = zzbu.zza("gads:fingerprint_number", 10);
  public static final zzbu<Integer> zzuJ = zzbu.zza("gads:sleep_sec", 10);
  public static final zzbu<Boolean> zzuK = zzbu.zza("gad:app_index_enabled", Boolean.valueOf(true));
  public static final zzbu<String> zzuL = zzbu.zzP("gads:kitkat_interstitial_workaround:experiment_id");
  public static final zzbu<Boolean> zzuM = zzbu.zza("gads:kitkat_interstitial_workaround:enabled", Boolean.valueOf(true));
  public static final zzbu<Boolean> zzuN = zzbu.zza("gads:interstitial_follow_url", Boolean.valueOf(true));
  public static final zzbu<Boolean> zzuO = zzbu.zza("gads:interstitial_follow_url:register_click", Boolean.valueOf(true));
  public static final zzbu<String> zzuP = zzbu.zzP("gads:interstitial_follow_url:experiment_id");
  public static final zzbu<Boolean> zzuQ = zzbu.zza("gads:analytics_enabled", Boolean.valueOf(true));
  public static final zzbu<Boolean> zzuR = zzbu.zza("gads:ad_key_enabled", Boolean.valueOf(false));
  public static final zzbu<Integer> zzuS = zzbu.zza("gads:webview_cache_version", 0);
  public static final zzbu<String> zzuT = zzbu.zzQ("gads:pan:experiment_id");
  public static final zzbu<String> zzuU = zzbu.zzc("gads:native:engine_url", "//googleads.g.doubleclick.net/mads/static/mad/sdk/native/native_ads.html");
  public static final zzbu<Boolean> zzuV = zzbu.zza("gads:ad_manager_creator:enabled", Boolean.valueOf(true));
  public static final zzbu<Boolean> zzuW = zzbu.zza("gads:log:verbose_enabled", Boolean.valueOf(false));
  public static final zzbu<Boolean> zzuX = zzbu.zza("gads:device_info_caching:enabled", Boolean.valueOf(true));
  public static final zzbu<Long> zzuY = zzbu.zzb("gads:device_info_caching_expiry_ms:expiry", 300000L);
  public static final zzbu<Boolean> zzuZ = zzbu.zza("gads:gen204_signals:enabled", Boolean.valueOf(false));
  public static final zzbu<String> zzua = zzbu.zzP("gads:sdk_use_dynamic_module_experiment_id");
  public static final zzbu<Boolean> zzub = zzbu.zza("gads:sdk_crash_report_enabled", Boolean.valueOf(false));
  public static final zzbu<Boolean> zzuc = zzbu.zza("gads:sdk_crash_report_full_stacktrace", Boolean.valueOf(false));
  public static final zzbu<Boolean> zzud = zzbu.zza("gads:block_autoclicks", Boolean.valueOf(false));
  public static final zzbu<String> zzue = zzbu.zzP("gads:block_autoclicks_experiment_id");
  public static final zzbu<String> zzuf = zzbu.zzQ("gads:prefetch:experiment_id");
  public static final zzbu<String> zzug = zzbu.zzP("gads:spam_app_context:experiment_id");
  public static final zzbu<Boolean> zzuh = zzbu.zza("gads:spam_app_context:enabled", Boolean.valueOf(false));
  public static final zzbu<String> zzui = zzbu.zzP("gads:video_stream_cache:experiment_id");
  public static final zzbu<Integer> zzuj = zzbu.zza("gads:video_stream_cache:limit_count", 5);
  public static final zzbu<Integer> zzuk = zzbu.zza("gads:video_stream_cache:limit_space", 8388608);
  public static final zzbu<Integer> zzul = zzbu.zza("gads:video_stream_exo_cache:buffer_size", 8388608);
  public static final zzbu<Long> zzum = zzbu.zzb("gads:video_stream_cache:limit_time_sec", 300L);
  public static final zzbu<Long> zzun = zzbu.zzb("gads:video_stream_cache:notify_interval_millis", 1000L);
  public static final zzbu<Integer> zzuo = zzbu.zza("gads:video_stream_cache:connect_timeout_millis", 10000);
  public static final zzbu<Boolean> zzup = zzbu.zza("gads:video:metric_reporting_enabled", Boolean.valueOf(false));
  public static final zzbu<String> zzuq = zzbu.zzc("gads:video:metric_frame_hash_times", "");
  public static final zzbu<Long> zzur = zzbu.zzb("gads:video:metric_frame_hash_time_leniency", 500L);
  public static final zzbu<String> zzus = zzbu.zzQ("gads:spam_ad_id_decorator:experiment_id");
  public static final zzbu<Boolean> zzut = zzbu.zza("gads:spam_ad_id_decorator:enabled", Boolean.valueOf(false));
  public static final zzbu<String> zzuu = zzbu.zzQ("gads:looper_for_gms_client:experiment_id");
  public static final zzbu<Boolean> zzuv = zzbu.zza("gads:looper_for_gms_client:enabled", Boolean.valueOf(true));
  public static final zzbu<Boolean> zzuw = zzbu.zza("gads:sw_ad_request_service:enabled", Boolean.valueOf(true));
  public static final zzbu<Boolean> zzux = zzbu.zza("gads:sw_dynamite:enabled", Boolean.valueOf(true));
  public static final zzbu<String> zzuy = zzbu.zzc("gad:mraid:url_banner", "https://googleads.g.doubleclick.net/mads/static/mad/sdk/native/mraid/v2/mraid_app_banner.js");
  public static final zzbu<String> zzuz = zzbu.zzc("gad:mraid:url_expanded_banner", "https://googleads.g.doubleclick.net/mads/static/mad/sdk/native/mraid/v2/mraid_app_expanded_banner.js");
  public static final zzbu<Boolean> zzva = zzbu.zza("gads:webview:error_reporting_enabled", Boolean.valueOf(false));
  public static final zzbu<Boolean> zzvb = zzbu.zza("gads:adid_reporting:enabled", Boolean.valueOf(false));
  public static final zzbu<Boolean> zzvc = zzbu.zza("gads:request_pkg:enabled", Boolean.valueOf(true));
  public static final zzbu<Boolean> zzvd = zzbu.zza("gads:gmsg:disable_back_button:enabled", Boolean.valueOf(false));
  public static final zzbu<Long> zzve = zzbu.zzb("gads:network:cache_prediction_duration_s", 300L);
  
  public static List<String> zzde()
  {
    return zzp.zzbF().zzde();
  }
  
  public static void zzw(Context paramContext)
  {
    zzp.zzbG().zzw(paramContext);
  }
}
