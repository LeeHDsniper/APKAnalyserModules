.class public Lcom/google/android/gms/internal/zziv;
.super Lcom/google/android/gms/internal/zziq;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzip;Z)V
    .registers 3

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/zziq;-><init>(Lcom/google/android/gms/internal/zzip;Z)V

    return-void
.end method


# virtual methods
.method public shouldInterceptRequest(Landroid/webkit/WebView;Ljava/lang/String;)Landroid/webkit/WebResourceResponse;
    .registers 8
    .param p1, "webView"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    :try_start_0
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "mraid.js"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_16

    invoke-super {p0, p1, p2}, Lcom/google/android/gms/internal/zziq;->shouldInterceptRequest(Landroid/webkit/WebView;Ljava/lang/String;)Landroid/webkit/WebResourceResponse;

    move-result-object v1

    :goto_15
    return-object v1

    :cond_16
    instance-of v1, p1, Lcom/google/android/gms/internal/zzip;

    if-nez v1, :cond_24

    const-string v1, "Tried to intercept request from a WebView that wasn\'t an AdWebView."

    invoke-static {v1}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    invoke-super {p0, p1, p2}, Lcom/google/android/gms/internal/zziq;->shouldInterceptRequest(Landroid/webkit/WebView;Ljava/lang/String;)Landroid/webkit/WebResourceResponse;

    move-result-object v1

    goto :goto_15

    :cond_24
    move-object v0, p1

    check-cast v0, Lcom/google/android/gms/internal/zzip;

    move-object v1, v0

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzip;->zzgS()Lcom/google/android/gms/internal/zziq;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zziq;->zzeA()V

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzip;->zzaN()Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    move-result-object v2

    iget-boolean v2, v2, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->zzsH:Z

    if-eqz v2, :cond_6c

    sget-object v2, Lcom/google/android/gms/internal/zzby;->zzuA:Lcom/google/android/gms/internal/zzbu;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzbu;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    :goto_3f
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "shouldInterceptRequest("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/google/android/gms/ads/internal/util/client/zzb;->v(Ljava/lang/String;)V

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzip;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v3, p0, Lcom/google/android/gms/internal/zziv;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v3}, Lcom/google/android/gms/internal/zzip;->zzgV()Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    move-result-object v3

    iget-object v3, v3, Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;->zzIz:Ljava/lang/String;

    invoke-virtual {p0, v1, v3, v2}, Lcom/google/android/gms/internal/zziv;->zze(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/webkit/WebResourceResponse;

    move-result-object v1

    goto :goto_15

    :cond_6c
    invoke-interface {v1}, Lcom/google/android/gms/internal/zzip;->zzgW()Z

    move-result v2

    if-eqz v2, :cond_7b

    sget-object v2, Lcom/google/android/gms/internal/zzby;->zzuz:Lcom/google/android/gms/internal/zzbu;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzbu;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    goto :goto_3f

    :cond_7b
    sget-object v2, Lcom/google/android/gms/internal/zzby;->zzuy:Lcom/google/android/gms/internal/zzbu;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzbu;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;
    :try_end_83
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_83} :catch_a7
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_83} :catch_a9
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_83} :catch_84
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_0 .. :try_end_83} :catch_a5

    goto :goto_3f

    :catch_84
    move-exception v1

    :goto_85
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Could not fetch MRAID JS. "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    invoke-super {p0, p1, p2}, Lcom/google/android/gms/internal/zziq;->shouldInterceptRequest(Landroid/webkit/WebView;Ljava/lang/String;)Landroid/webkit/WebResourceResponse;

    move-result-object v1

    goto/16 :goto_15

    :catch_a5
    move-exception v1

    goto :goto_85

    :catch_a7
    move-exception v1

    goto :goto_85

    :catch_a9
    move-exception v1

    goto :goto_85
.end method

.method protected zze(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/webkit/WebResourceResponse;
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/util/concurrent/ExecutionException;,
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/TimeoutException;
        }
    .end annotation

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "User-Agent"

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbx()Lcom/google/android/gms/internal/zzhu;

    move-result-object v2

    invoke-virtual {v2, p1, p2}, Lcom/google/android/gms/internal/zzhu;->zzf(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "Cache-Control"

    const-string v2, "max-stale=3600"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Lcom/google/android/gms/internal/zzhy;

    invoke-direct {v1, p1}, Lcom/google/android/gms/internal/zzhy;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, p3, v0}, Lcom/google/android/gms/internal/zzhy;->zzb(Ljava/lang/String;Ljava/util/Map;)Lcom/google/android/gms/internal/zzih;

    move-result-object v0

    const-wide/16 v2, 0x3c

    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v0, v2, v3, v1}, Lcom/google/android/gms/internal/zzih;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-nez v0, :cond_30

    const/4 v0, 0x0

    :goto_2f
    return-object v0

    :cond_30
    new-instance v1, Landroid/webkit/WebResourceResponse;

    const-string v2, "application/javascript"

    const-string v3, "UTF-8"

    new-instance v4, Ljava/io/ByteArrayInputStream;

    const-string v5, "UTF-8"

    invoke-virtual {v0, v5}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    invoke-direct {v4, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {v1, v2, v3, v4}, Landroid/webkit/WebResourceResponse;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;)V

    move-object v0, v1

    goto :goto_2f
.end method
