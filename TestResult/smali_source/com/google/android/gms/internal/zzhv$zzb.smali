.class Lcom/google/android/gms/internal/zzhv$zzb;
.super Lcom/google/android/gms/internal/zzhv$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzhv;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "zzb"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzhv$zza;-><init>()V

    return-void
.end method


# virtual methods
.method public zza(Landroid/app/DownloadManager$Request;)Z
    .registers 3

    const/4 v0, 0x1

    invoke-virtual {p1}, Landroid/app/DownloadManager$Request;->allowScanningByMediaScanner()V

    invoke-virtual {p1, v0}, Landroid/app/DownloadManager$Request;->setNotificationVisibility(I)Landroid/app/DownloadManager$Request;

    return v0
.end method

.method public zza(Landroid/content/Context;Landroid/webkit/WebSettings;)Z
    .registers 6

    const/4 v2, 0x1

    invoke-virtual {p1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_1a

    invoke-virtual {p1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/webkit/WebSettings;->setAppCachePath(Ljava/lang/String;)V

    const-wide/16 v0, 0x0

    invoke-virtual {p2, v0, v1}, Landroid/webkit/WebSettings;->setAppCacheMaxSize(J)V

    invoke-virtual {p2, v2}, Landroid/webkit/WebSettings;->setAppCacheEnabled(Z)V

    :cond_1a
    const-string v0, "com.google.android.gms.ads.db"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/webkit/WebSettings;->setDatabasePath(Ljava/lang/String;)V

    invoke-virtual {p2, v2}, Landroid/webkit/WebSettings;->setDatabaseEnabled(Z)V

    invoke-virtual {p2, v2}, Landroid/webkit/WebSettings;->setDomStorageEnabled(Z)V

    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Landroid/webkit/WebSettings;->setDisplayZoomControls(Z)V

    invoke-virtual {p2, v2}, Landroid/webkit/WebSettings;->setBuiltInZoomControls(Z)V

    invoke-virtual {p2, v2}, Landroid/webkit/WebSettings;->setSupportZoom(Z)V

    return v2
.end method

.method public zza(Landroid/view/Window;)Z
    .registers 3

    const/high16 v0, 0x1000000

    invoke-virtual {p1, v0, v0}, Landroid/view/Window;->setFlags(II)V

    const/4 v0, 0x1

    return v0
.end method

.method public zza(Landroid/webkit/WebView;)Z
    .registers 3

    invoke-virtual {p1}, Landroid/webkit/WebView;->onPause()V

    const/4 v0, 0x1

    return v0
.end method

.method public zzb(Lcom/google/android/gms/internal/zzip;Z)Lcom/google/android/gms/internal/zziq;
    .registers 4

    new-instance v0, Lcom/google/android/gms/internal/zziv;

    invoke-direct {v0, p1, p2}, Lcom/google/android/gms/internal/zziv;-><init>(Lcom/google/android/gms/internal/zzip;Z)V

    return-object v0
.end method

.method public zzb(Landroid/webkit/WebView;)Z
    .registers 3

    invoke-virtual {p1}, Landroid/webkit/WebView;->onResume()V

    const/4 v0, 0x1

    return v0
.end method

.method public zzf(Lcom/google/android/gms/internal/zzip;)Landroid/webkit/WebChromeClient;
    .registers 3

    new-instance v0, Lcom/google/android/gms/internal/zziu;

    invoke-direct {v0, p1}, Lcom/google/android/gms/internal/zziu;-><init>(Lcom/google/android/gms/internal/zzip;)V

    return-object v0
.end method

.method public zzf(Landroid/net/Uri;)Ljava/util/Set;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            ")",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    invoke-virtual {p1}, Landroid/net/Uri;->getQueryParameterNames()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public zzk(Landroid/view/View;)Z
    .registers 4

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    const/4 v0, 0x1

    return v0
.end method

.method public zzl(Landroid/view/View;)Z
    .registers 4

    const/4 v1, 0x1

    const/4 v0, 0x0

    invoke-virtual {p1, v1, v0}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    return v1
.end method
