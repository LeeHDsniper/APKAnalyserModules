.class public Lcom/google/android/gms/internal/zzis;
.super Landroid/webkit/WebView;

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;
.implements Landroid/webkit/DownloadListener;
.implements Lcom/google/android/gms/internal/zzip;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/zzis$zza;
    }
.end annotation


# instance fields
.field private zzBm:Ljava/lang/String;

.field private final zzCq:Lcom/google/android/gms/internal/zziq;

.field private zzHi:Ljava/lang/Boolean;

.field private final zzJk:Lcom/google/android/gms/internal/zzis$zza;

.field private zzJl:Lcom/google/android/gms/ads/internal/overlay/zzd;

.field private zzJm:Z

.field private zzJn:Z

.field private zzJo:Z

.field private zzJp:Z

.field private zzJq:I

.field private zzJr:Z

.field private zzJs:Ljava/lang/String;

.field private zzJt:Lcom/google/android/gms/ads/internal/overlay/zzd;

.field private zzJu:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/zzdr;",
            ">;"
        }
    .end annotation
.end field

.field private final zzov:Lcom/google/android/gms/ads/internal/zzd;

.field private final zzpa:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

.field private final zzpc:Ljava/lang/Object;

.field private zzqG:Lcom/google/android/gms/internal/zzid;

.field private final zzqX:Landroid/view/WindowManager;

.field private final zzwh:Lcom/google/android/gms/internal/zzan;

.field private zzyK:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

.field private zzzQ:I

.field private zzzR:I

.field private zzzT:I

.field private zzzU:I


# direct methods
.method protected constructor <init>(Lcom/google/android/gms/internal/zzis$zza;Lcom/google/android/gms/ads/internal/client/AdSizeParcel;ZZLcom/google/android/gms/internal/zzan;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Lcom/google/android/gms/ads/internal/zzd;)V
    .registers 12

    const/4 v3, 0x0

    const/4 v2, 0x1

    const/4 v1, -0x1

    invoke-direct {p0, p1}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzis;->zzpc:Ljava/lang/Object;

    iput-boolean v2, p0, Lcom/google/android/gms/internal/zzis;->zzJr:Z

    const-string v0, ""

    iput-object v0, p0, Lcom/google/android/gms/internal/zzis;->zzBm:Ljava/lang/String;

    iput v1, p0, Lcom/google/android/gms/internal/zzis;->zzzR:I

    iput v1, p0, Lcom/google/android/gms/internal/zzis;->zzzQ:I

    iput v1, p0, Lcom/google/android/gms/internal/zzis;->zzzT:I

    iput v1, p0, Lcom/google/android/gms/internal/zzis;->zzzU:I

    iput-object p1, p0, Lcom/google/android/gms/internal/zzis;->zzJk:Lcom/google/android/gms/internal/zzis$zza;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzis;->zzyK:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    iput-boolean p3, p0, Lcom/google/android/gms/internal/zzis;->zzJo:Z

    iput v1, p0, Lcom/google/android/gms/internal/zzis;->zzJq:I

    iput-object p5, p0, Lcom/google/android/gms/internal/zzis;->zzwh:Lcom/google/android/gms/internal/zzan;

    iput-object p6, p0, Lcom/google/android/gms/internal/zzis;->zzpa:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    iput-object p7, p0, Lcom/google/android/gms/internal/zzis;->zzov:Lcom/google/android/gms/ads/internal/zzd;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzis;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "window"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzis;->zzqX:Landroid/view/WindowManager;

    invoke-virtual {p0, v3}, Lcom/google/android/gms/internal/zzis;->setBackgroundColor(I)V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzis;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    invoke-virtual {v0, v3}, Landroid/webkit/WebSettings;->setSavePassword(Z)V

    invoke-virtual {v0, v2}, Landroid/webkit/WebSettings;->setSupportMultipleWindows(Z)V

    invoke-virtual {v0, v2}, Landroid/webkit/WebSettings;->setJavaScriptCanOpenWindowsAutomatically(Z)V

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-lt v1, v2, :cond_53

    invoke-virtual {v0, v3}, Landroid/webkit/WebSettings;->setMixedContentMode(I)V

    :cond_53
    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbx()Lcom/google/android/gms/internal/zzhu;

    move-result-object v1

    iget-object v2, p6, Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;->zzIz:Ljava/lang/String;

    invoke-virtual {v1, p1, v2, v0}, Lcom/google/android/gms/internal/zzhu;->zza(Landroid/content/Context;Ljava/lang/String;Landroid/webkit/WebSettings;)V

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbz()Lcom/google/android/gms/internal/zzhv;

    move-result-object v1

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzis;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lcom/google/android/gms/internal/zzhv;->zza(Landroid/content/Context;Landroid/webkit/WebSettings;)Z

    invoke-virtual {p0, p0}, Lcom/google/android/gms/internal/zzis;->setDownloadListener(Landroid/webkit/DownloadListener;)V

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbz()Lcom/google/android/gms/internal/zzhv;

    move-result-object v0

    invoke-virtual {v0, p0, p4}, Lcom/google/android/gms/internal/zzhv;->zzb(Lcom/google/android/gms/internal/zzip;Z)Lcom/google/android/gms/internal/zziq;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzis;->zzCq:Lcom/google/android/gms/internal/zziq;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzis;->zzCq:Lcom/google/android/gms/internal/zziq;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzis;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbz()Lcom/google/android/gms/internal/zzhv;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/google/android/gms/internal/zzhv;->zzf(Lcom/google/android/gms/internal/zzip;)Landroid/webkit/WebChromeClient;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzis;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzis;->zzhk()V

    invoke-static {}, Lcom/google/android/gms/internal/zzlv;->zzpT()Z

    move-result v0

    if-eqz v0, :cond_97

    new-instance v0, Lcom/google/android/gms/internal/zzit;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/zzit;-><init>(Lcom/google/android/gms/internal/zzip;)V

    const-string v1, "googleAdsJsInterface"

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/zzis;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_97
    new-instance v0, Lcom/google/android/gms/internal/zzid;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzis;->zzJk:Lcom/google/android/gms/internal/zzis$zza;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzis$zza;->zzgN()Landroid/app/Activity;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, p0, v2}, Lcom/google/android/gms/internal/zzid;-><init>(Landroid/app/Activity;Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;Landroid/view/ViewTreeObserver$OnScrollChangedListener;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzis;->zzqG:Lcom/google/android/gms/internal/zzid;

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzis;)V
    .registers 1

    invoke-super {p0}, Landroid/webkit/WebView;->destroy()V

    return-void
.end method

.method static zzb(Landroid/content/Context;Lcom/google/android/gms/ads/internal/client/AdSizeParcel;ZZLcom/google/android/gms/internal/zzan;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Lcom/google/android/gms/ads/internal/zzd;)Lcom/google/android/gms/internal/zzis;
    .registers 15

    new-instance v1, Lcom/google/android/gms/internal/zzis$zza;

    invoke-direct {v1, p0}, Lcom/google/android/gms/internal/zzis$zza;-><init>(Landroid/content/Context;)V

    new-instance v0, Lcom/google/android/gms/internal/zzis;

    move-object v2, p1

    move v3, p2

    move v4, p3

    move-object v5, p4

    move-object v6, p5

    move-object v7, p6

    invoke-direct/range {v0 .. v7}, Lcom/google/android/gms/internal/zzis;-><init>(Lcom/google/android/gms/internal/zzis$zza;Lcom/google/android/gms/ads/internal/client/AdSizeParcel;ZZLcom/google/android/gms/internal/zzan;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Lcom/google/android/gms/ads/internal/zzd;)V

    return-object v0
.end method

.method private zzhj()V
    .registers 4

    iget-object v1, p0, Lcom/google/android/gms/internal/zzis;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbA()Lcom/google/android/gms/internal/zzhl;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzhl;->zzgg()Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzis;->zzHi:Ljava/lang/Boolean;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzis;->zzHi:Ljava/lang/Boolean;
    :try_end_f
    .catchall {:try_start_3 .. :try_end_f} :catchall_2b

    if-nez v0, :cond_1f

    :try_start_11
    const-string v0, "(function(){})()"

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v2}, Lcom/google/android/gms/internal/zzis;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzis;->zzb(Ljava/lang/Boolean;)V
    :try_end_1f
    .catch Ljava/lang/IllegalStateException; {:try_start_11 .. :try_end_1f} :catch_21
    .catchall {:try_start_11 .. :try_end_1f} :catchall_2b

    :cond_1f
    :goto_1f
    :try_start_1f
    monitor-exit v1

    return-void

    :catch_21
    move-exception v0

    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzis;->zzb(Ljava/lang/Boolean;)V

    goto :goto_1f

    :catchall_2b
    move-exception v0

    monitor-exit v1
    :try_end_2d
    .catchall {:try_start_1f .. :try_end_2d} :catchall_2b

    throw v0
.end method

.method private zzhk()V
    .registers 4

    iget-object v1, p0, Lcom/google/android/gms/internal/zzis;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzis;->zzJo:Z

    if-nez v0, :cond_d

    iget-object v0, p0, Lcom/google/android/gms/internal/zzis;->zzyK:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    iget-boolean v0, v0, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->zzsH:Z

    if-eqz v0, :cond_29

    :cond_d
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xe

    if-ge v0, v2, :cond_1d

    const-string v0, "Disabling hardware acceleration on an overlay."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaC(Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzis;->zzhl()V

    :goto_1b
    monitor-exit v1

    return-void

    :cond_1d
    const-string v0, "Enabling hardware acceleration on an overlay."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaC(Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzis;->zzhm()V

    goto :goto_1b

    :catchall_26
    move-exception v0

    monitor-exit v1
    :try_end_28
    .catchall {:try_start_3 .. :try_end_28} :catchall_26

    throw v0

    :cond_29
    :try_start_29
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x12

    if-ge v0, v2, :cond_38

    const-string v0, "Disabling hardware acceleration on an AdView."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaC(Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzis;->zzhl()V

    goto :goto_1b

    :cond_38
    const-string v0, "Enabling hardware acceleration on an AdView."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaC(Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzis;->zzhm()V
    :try_end_40
    .catchall {:try_start_29 .. :try_end_40} :catchall_26

    goto :goto_1b
.end method

.method private zzhl()V
    .registers 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzis;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzis;->zzJp:Z

    if-nez v0, :cond_e

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbz()Lcom/google/android/gms/internal/zzhv;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/google/android/gms/internal/zzhv;->zzl(Landroid/view/View;)Z

    :cond_e
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzis;->zzJp:Z

    monitor-exit v1

    return-void

    :catchall_13
    move-exception v0

    monitor-exit v1
    :try_end_15
    .catchall {:try_start_3 .. :try_end_15} :catchall_13

    throw v0
.end method

.method private zzhm()V
    .registers 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzis;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzis;->zzJp:Z

    if-eqz v0, :cond_e

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbz()Lcom/google/android/gms/internal/zzhv;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/google/android/gms/internal/zzhv;->zzk(Landroid/view/View;)Z

    :cond_e
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzis;->zzJp:Z

    monitor-exit v1

    return-void

    :catchall_13
    move-exception v0

    monitor-exit v1
    :try_end_15
    .catchall {:try_start_3 .. :try_end_15} :catchall_13

    throw v0
.end method

.method private zzhn()V
    .registers 4

    iget-object v1, p0, Lcom/google/android/gms/internal/zzis;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzis;->zzJu:Ljava/util/Map;

    if-eqz v0, :cond_24

    iget-object v0, p0, Lcom/google/android/gms/internal/zzis;->zzJu:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_11
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_24

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzdr;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzdr;->release()V

    goto :goto_11

    :catchall_21
    move-exception v0

    monitor-exit v1
    :try_end_23
    .catchall {:try_start_3 .. :try_end_23} :catchall_21

    throw v0

    :cond_24
    :try_start_24
    monitor-exit v1
    :try_end_25
    .catchall {:try_start_24 .. :try_end_25} :catchall_21

    return-void
.end method


# virtual methods
.method public destroy()V
    .registers 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzis;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzis;->zzqG:Lcom/google/android/gms/internal/zzid;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzid;->zzgE()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzis;->zzJl:Lcom/google/android/gms/ads/internal/overlay/zzd;

    if-eqz v0, :cond_19

    iget-object v0, p0, Lcom/google/android/gms/internal/zzis;->zzJl:Lcom/google/android/gms/ads/internal/overlay/zzd;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/overlay/zzd;->close()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzis;->zzJl:Lcom/google/android/gms/ads/internal/overlay/zzd;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/overlay/zzd;->onDestroy()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzis;->zzJl:Lcom/google/android/gms/ads/internal/overlay/zzd;

    :cond_19
    iget-object v0, p0, Lcom/google/android/gms/internal/zzis;->zzCq:Lcom/google/android/gms/internal/zziq;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zziq;->reset()V

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzis;->zzJn:Z

    if-eqz v0, :cond_24

    monitor-exit v1

    :goto_23
    return-void

    :cond_24
    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbK()Lcom/google/android/gms/internal/zzdq;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/google/android/gms/internal/zzdq;->zza(Lcom/google/android/gms/internal/zzip;)Z

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzis;->zzhn()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzis;->zzJn:Z

    const-string v0, "Initiating WebView self destruct sequence in 3..."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->v(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzis;->zzCq:Lcom/google/android/gms/internal/zziq;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zziq;->zzhd()V

    monitor-exit v1

    goto :goto_23

    :catchall_3d
    move-exception v0

    monitor-exit v1
    :try_end_3f
    .catchall {:try_start_3 .. :try_end_3f} :catchall_3d

    throw v0
.end method

.method public evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    .registers 5
    .param p1, "script"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroid/webkit/ValueCallback",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p2, "resultCallback":Landroid/webkit/ValueCallback;, "Landroid/webkit/ValueCallback<Ljava/lang/String;>;"
    iget-object v1, p0, Lcom/google/android/gms/internal/zzis;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzis;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_16

    const-string v0, "The webview is destroyed. Ignoring action."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    if-eqz p2, :cond_14

    const/4 v0, 0x0

    invoke-interface {p2, v0}, Landroid/webkit/ValueCallback;->onReceiveValue(Ljava/lang/Object;)V

    :cond_14
    monitor-exit v1

    :goto_15
    return-void

    :cond_16
    invoke-super {p0, p1, p2}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    monitor-exit v1

    goto :goto_15

    :catchall_1b
    move-exception v0

    monitor-exit v1
    :try_end_1d
    .catchall {:try_start_3 .. :try_end_1d} :catchall_1b

    throw v0
.end method

.method public getRequestId()Ljava/lang/String;
    .registers 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzis;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzis;->zzBm:Ljava/lang/String;

    monitor-exit v1

    return-object v0

    :catchall_7
    move-exception v0

    monitor-exit v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v0
.end method

.method public getRequestedOrientation()I
    .registers 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzis;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget v0, p0, Lcom/google/android/gms/internal/zzis;->zzJq:I

    monitor-exit v1

    return v0

    :catchall_7
    move-exception v0

    monitor-exit v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v0
.end method

.method public getWebView()Landroid/webkit/WebView;
    .registers 1

    return-object p0
.end method

.method public isDestroyed()Z
    .registers 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzis;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzis;->zzJn:Z

    monitor-exit v1

    return v0

    :catchall_7
    move-exception v0

    monitor-exit v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v0
.end method

.method public loadData(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1, "data"    # Ljava/lang/String;
    .param p2, "mimeType"    # Ljava/lang/String;
    .param p3, "encoding"    # Ljava/lang/String;

    .prologue
    iget-object v1, p0, Lcom/google/android/gms/internal/zzis;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzis;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_e

    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebView;->loadData(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :goto_c
    monitor-exit v1

    return-void

    :cond_e
    const-string v0, "The webview is destroyed. Ignoring action."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    goto :goto_c

    :catchall_14
    move-exception v0

    monitor-exit v1
    :try_end_16
    .catchall {:try_start_3 .. :try_end_16} :catchall_14

    throw v0
.end method

.method public loadDataWithBaseURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 8
    .param p1, "baseUrl"    # Ljava/lang/String;
    .param p2, "data"    # Ljava/lang/String;
    .param p3, "mimeType"    # Ljava/lang/String;
    .param p4, "encoding"    # Ljava/lang/String;
    .param p5, "historyUrl"    # Ljava/lang/String;

    .prologue
    iget-object v1, p0, Lcom/google/android/gms/internal/zzis;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzis;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_e

    invoke-super/range {p0 .. p5}, Landroid/webkit/WebView;->loadDataWithBaseURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :goto_c
    monitor-exit v1

    return-void

    :cond_e
    const-string v0, "The webview is destroyed. Ignoring action."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    goto :goto_c

    :catchall_14
    move-exception v0

    monitor-exit v1
    :try_end_16
    .catchall {:try_start_3 .. :try_end_16} :catchall_14

    throw v0
.end method

.method public loadUrl(Ljava/lang/String;)V
    .registers 4
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    iget-object v1, p0, Lcom/google/android/gms/internal/zzis;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzis;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_e

    invoke-super {p0, p1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    :goto_c
    monitor-exit v1

    return-void

    :cond_e
    const-string v0, "The webview is destroyed. Ignoring action."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    goto :goto_c

    :catchall_14
    move-exception v0

    monitor-exit v1
    :try_end_16
    .catchall {:try_start_3 .. :try_end_16} :catchall_14

    throw v0
.end method

.method protected onAttachedToWindow()V
    .registers 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzis;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    invoke-super {p0}, Landroid/webkit/WebView;->onAttachedToWindow()V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzis;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_11

    iget-object v0, p0, Lcom/google/android/gms/internal/zzis;->zzqG:Lcom/google/android/gms/internal/zzid;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzid;->onAttachedToWindow()V

    :cond_11
    monitor-exit v1

    return-void

    :catchall_13
    move-exception v0

    monitor-exit v1
    :try_end_15
    .catchall {:try_start_3 .. :try_end_15} :catchall_13

    throw v0
.end method

.method protected onDetachedFromWindow()V
    .registers 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzis;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzis;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_e

    iget-object v0, p0, Lcom/google/android/gms/internal/zzis;->zzqG:Lcom/google/android/gms/internal/zzid;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzid;->onDetachedFromWindow()V

    :cond_e
    invoke-super {p0}, Landroid/webkit/WebView;->onDetachedFromWindow()V

    monitor-exit v1

    return-void

    :catchall_13
    move-exception v0

    monitor-exit v1
    :try_end_15
    .catchall {:try_start_3 .. :try_end_15} :catchall_13

    throw v0
.end method

.method public onDownloadStart(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V
    .registers 9
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "userAgent"    # Ljava/lang/String;
    .param p3, "contentDisposition"    # Ljava/lang/String;
    .param p4, "mimeType"    # Ljava/lang/String;
    .param p5, "size"    # J

    .prologue
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1, p4}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzis;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_15
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_15} :catch_16

    :goto_15
    return-void

    :catch_16
    move-exception v0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Couldn\'t find an Activity to view url/mimetype: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " / "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaC(Ljava/lang/String;)V

    goto :goto_15
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 4
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzis;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_7

    :cond_6
    :goto_6
    return-void

    :cond_7
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-ne v0, v1, :cond_19

    invoke-virtual {p1}, Landroid/graphics/Canvas;->isHardwareAccelerated()Z

    move-result v0

    if-eqz v0, :cond_19

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzis;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_6

    :cond_19
    invoke-super {p0, p1}, Landroid/webkit/WebView;->onDraw(Landroid/graphics/Canvas;)V

    goto :goto_6
.end method

.method public onGlobalLayout()V
    .registers 3

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzis;->zzhi()Z

    move-result v0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzis;->zzgQ()Lcom/google/android/gms/ads/internal/overlay/zzd;

    move-result-object v1

    if-eqz v1, :cond_f

    if-eqz v0, :cond_f

    invoke-virtual {v1}, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzeC()V

    :cond_f
    return-void
.end method

.method protected onMeasure(II)V
    .registers 12
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    const v0, 0x7fffffff

    const/high16 v8, 0x40000000

    const/16 v7, 0x8

    const/high16 v6, -0x80000000

    iget-object v4, p0, Lcom/google/android/gms/internal/zzis;->zzpc:Ljava/lang/Object;

    monitor-enter v4

    :try_start_c
    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzis;->isDestroyed()Z

    move-result v1

    if-eqz v1, :cond_19

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/zzis;->setMeasuredDimension(II)V

    monitor-exit v4

    :goto_18
    return-void

    :cond_19
    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzis;->isInEditMode()Z

    move-result v1

    if-nez v1, :cond_29

    iget-boolean v1, p0, Lcom/google/android/gms/internal/zzis;->zzJo:Z

    if-nez v1, :cond_29

    iget-object v1, p0, Lcom/google/android/gms/internal/zzis;->zzyK:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    iget-boolean v1, v1, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->zzsJ:Z

    if-eqz v1, :cond_31

    :cond_29
    invoke-super {p0, p1, p2}, Landroid/webkit/WebView;->onMeasure(II)V

    monitor-exit v4

    goto :goto_18

    :catchall_2e
    move-exception v0

    monitor-exit v4
    :try_end_30
    .catchall {:try_start_c .. :try_end_30} :catchall_2e

    throw v0

    :cond_31
    :try_start_31
    iget-object v1, p0, Lcom/google/android/gms/internal/zzis;->zzyK:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    iget-boolean v1, v1, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->zzsH:Z

    if-eqz v1, :cond_4e

    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    iget-object v1, p0, Lcom/google/android/gms/internal/zzis;->zzqX:Landroid/view/WindowManager;

    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    iget v1, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    iget v0, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-virtual {p0, v1, v0}, Lcom/google/android/gms/internal/zzis;->setMeasuredDimension(II)V

    monitor-exit v4

    goto :goto_18

    :cond_4e
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v2

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v3

    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v5

    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    if-eq v2, v6, :cond_62

    if-ne v2, v8, :cond_f7

    :cond_62
    move v2, v3

    :goto_63
    if-eq v5, v6, :cond_67

    if-ne v5, v8, :cond_68

    :cond_67
    move v0, v1

    :cond_68
    iget-object v5, p0, Lcom/google/android/gms/internal/zzis;->zzyK:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    iget v5, v5, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->widthPixels:I

    if-gt v5, v2, :cond_74

    iget-object v2, p0, Lcom/google/android/gms/internal/zzis;->zzyK:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    iget v2, v2, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->heightPixels:I

    if-le v2, v0, :cond_e1

    :cond_74
    iget-object v0, p0, Lcom/google/android/gms/internal/zzis;->zzJk:Lcom/google/android/gms/internal/zzis$zza;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzis$zza;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Not enough space to show ad. Needs "

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v5, p0, Lcom/google/android/gms/internal/zzis;->zzyK:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    iget v5, v5, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->widthPixels:I

    int-to-float v5, v5

    div-float/2addr v5, v0

    float-to-int v5, v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v5, "x"

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v5, p0, Lcom/google/android/gms/internal/zzis;->zzyK:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    iget v5, v5, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->heightPixels:I

    int-to-float v5, v5

    div-float/2addr v5, v0

    float-to-int v5, v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v5, " dp, but only has "

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    int-to-float v3, v3

    div-float/2addr v3, v0

    float-to-int v3, v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "x"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    int-to-float v1, v1

    div-float v0, v1, v0

    float-to-int v0, v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " dp."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzis;->getVisibility()I

    move-result v0

    if-eq v0, v7, :cond_d9

    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzis;->setVisibility(I)V

    :cond_d9
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/zzis;->setMeasuredDimension(II)V

    :goto_de
    monitor-exit v4

    goto/16 :goto_18

    :cond_e1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzis;->getVisibility()I

    move-result v0

    if-eq v0, v7, :cond_eb

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzis;->setVisibility(I)V

    :cond_eb
    iget-object v0, p0, Lcom/google/android/gms/internal/zzis;->zzyK:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    iget v0, v0, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->widthPixels:I

    iget-object v1, p0, Lcom/google/android/gms/internal/zzis;->zzyK:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    iget v1, v1, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->heightPixels:I

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/zzis;->setMeasuredDimension(II)V
    :try_end_f6
    .catchall {:try_start_31 .. :try_end_f6} :catchall_2e

    goto :goto_de

    :cond_f7
    move v2, v0

    goto/16 :goto_63
.end method

.method public onPause()V
    .registers 3

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzis;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_7

    :goto_6
    return-void

    :cond_7
    :try_start_7
    invoke-super {p0}, Landroid/webkit/WebView;->onPause()V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_a} :catch_b

    goto :goto_6

    :catch_b
    move-exception v0

    const-string v1, "Could not pause webview."

    invoke-static {v1, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzb(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_6
.end method

.method public onResume()V
    .registers 3

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzis;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_7

    :goto_6
    return-void

    :cond_7
    :try_start_7
    invoke-super {p0}, Landroid/webkit/WebView;->onResume()V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_a} :catch_b

    goto :goto_6

    :catch_b
    move-exception v0

    const-string v1, "Could not resume webview."

    invoke-static {v1, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzb(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_6
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 3
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/internal/zzis;->zzwh:Lcom/google/android/gms/internal/zzan;

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/google/android/gms/internal/zzis;->zzwh:Lcom/google/android/gms/internal/zzan;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzan;->zza(Landroid/view/MotionEvent;)V

    :cond_9
    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzis;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_11

    const/4 v0, 0x0

    :goto_10
    return v0

    :cond_11
    invoke-super {p0, p1}, Landroid/webkit/WebView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    goto :goto_10
.end method

.method public setContext(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/internal/zzis;->zzJk:Lcom/google/android/gms/internal/zzis$zza;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzis$zza;->setBaseContext(Landroid/content/Context;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzis;->zzqG:Lcom/google/android/gms/internal/zzid;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzis;->zzJk:Lcom/google/android/gms/internal/zzis$zza;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzis$zza;->zzgN()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzid;->zzl(Landroid/app/Activity;)V

    return-void
.end method

.method public setRequestedOrientation(I)V
    .registers 5
    .param p1, "requestedOrientation"    # I

    .prologue
    iget-object v1, p0, Lcom/google/android/gms/internal/zzis;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iput p1, p0, Lcom/google/android/gms/internal/zzis;->zzJq:I

    iget-object v0, p0, Lcom/google/android/gms/internal/zzis;->zzJl:Lcom/google/android/gms/ads/internal/overlay/zzd;

    if-eqz v0, :cond_10

    iget-object v0, p0, Lcom/google/android/gms/internal/zzis;->zzJl:Lcom/google/android/gms/ads/internal/overlay/zzd;

    iget v2, p0, Lcom/google/android/gms/internal/zzis;->zzJq:I

    invoke-virtual {v0, v2}, Lcom/google/android/gms/ads/internal/overlay/zzd;->setRequestedOrientation(I)V

    :cond_10
    monitor-exit v1

    return-void

    :catchall_12
    move-exception v0

    monitor-exit v1
    :try_end_14
    .catchall {:try_start_3 .. :try_end_14} :catchall_12

    throw v0
.end method

.method public stopLoading()V
    .registers 3

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzis;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_7

    :goto_6
    return-void

    :cond_7
    :try_start_7
    invoke-super {p0}, Landroid/webkit/WebView;->stopLoading()V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_a} :catch_b

    goto :goto_6

    :catch_b
    move-exception v0

    const-string v1, "Could not stop loading webview."

    invoke-static {v1, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzb(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_6
.end method

.method public zzC(Z)V
    .registers 4

    iget-object v1, p0, Lcom/google/android/gms/internal/zzis;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iput-boolean p1, p0, Lcom/google/android/gms/internal/zzis;->zzJo:Z

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzis;->zzhk()V

    monitor-exit v1

    return-void

    :catchall_a
    move-exception v0

    monitor-exit v1
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_a

    throw v0
.end method

.method public zzD(Z)V
    .registers 5

    iget-object v1, p0, Lcom/google/android/gms/internal/zzis;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzis;->zzJl:Lcom/google/android/gms/ads/internal/overlay/zzd;

    if-eqz v0, :cond_14

    iget-object v0, p0, Lcom/google/android/gms/internal/zzis;->zzJl:Lcom/google/android/gms/ads/internal/overlay/zzd;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzis;->zzCq:Lcom/google/android/gms/internal/zziq;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zziq;->zzbY()Z

    move-result v2

    invoke-virtual {v0, v2, p1}, Lcom/google/android/gms/ads/internal/overlay/zzd;->zza(ZZ)V

    :goto_12
    monitor-exit v1

    return-void

    :cond_14
    iput-boolean p1, p0, Lcom/google/android/gms/internal/zzis;->zzJm:Z

    goto :goto_12

    :catchall_17
    move-exception v0

    monitor-exit v1
    :try_end_19
    .catchall {:try_start_3 .. :try_end_19} :catchall_17

    throw v0
.end method

.method public zzE(Z)V
    .registers 4

    iget-object v1, p0, Lcom/google/android/gms/internal/zzis;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iput-boolean p1, p0, Lcom/google/android/gms/internal/zzis;->zzJr:Z

    monitor-exit v1

    return-void

    :catchall_7
    move-exception v0

    monitor-exit v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v0
.end method

.method public zza(Landroid/content/Context;Lcom/google/android/gms/ads/internal/client/AdSizeParcel;)V
    .registers 5

    iget-object v1, p0, Lcom/google/android/gms/internal/zzis;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzis;->zzqG:Lcom/google/android/gms/internal/zzid;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzid;->zzgE()V

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzis;->setContext(Landroid/content/Context;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzis;->zzJl:Lcom/google/android/gms/ads/internal/overlay/zzd;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzis;->zzyK:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzis;->zzJo:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzis;->zzJm:Z

    const-string v0, ""

    iput-object v0, p0, Lcom/google/android/gms/internal/zzis;->zzBm:Ljava/lang/String;

    const/4 v0, -0x1

    iput v0, p0, Lcom/google/android/gms/internal/zzis;->zzJq:I

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbz()Lcom/google/android/gms/internal/zzhv;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/google/android/gms/internal/zzhv;->zzb(Landroid/webkit/WebView;)Z

    const-string v0, "about:blank"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzis;->loadUrl(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzis;->zzCq:Lcom/google/android/gms/internal/zziq;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zziq;->reset()V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzis;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzis;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzis;->zzJr:Z

    monitor-exit v1

    return-void

    :catchall_3b
    move-exception v0

    monitor-exit v1
    :try_end_3d
    .catchall {:try_start_3 .. :try_end_3d} :catchall_3b

    throw v0
.end method

.method public zza(Lcom/google/android/gms/ads/internal/client/AdSizeParcel;)V
    .registers 4

    iget-object v1, p0, Lcom/google/android/gms/internal/zzis;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iput-object p1, p0, Lcom/google/android/gms/internal/zzis;->zzyK:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzis;->requestLayout()V

    monitor-exit v1

    return-void

    :catchall_a
    move-exception v0

    monitor-exit v1
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_a

    throw v0
.end method

.method public zza(Lcom/google/android/gms/ads/internal/overlay/zzd;)V
    .registers 4

    iget-object v1, p0, Lcom/google/android/gms/internal/zzis;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iput-object p1, p0, Lcom/google/android/gms/internal/zzis;->zzJl:Lcom/google/android/gms/ads/internal/overlay/zzd;

    monitor-exit v1

    return-void

    :catchall_7
    move-exception v0

    monitor-exit v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v0
.end method

.method public zza(Lcom/google/android/gms/internal/zzaz;Z)V
    .registers 6

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    const-string v2, "isVisible"

    if-eqz p2, :cond_14

    const-string v0, "1"

    :goto_b
    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "onAdVisibilityChanged"

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/zzis;->zzc(Ljava/lang/String;Ljava/util/Map;)V

    return-void

    :cond_14
    const-string v0, "0"

    goto :goto_b
.end method

.method protected zza(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroid/webkit/ValueCallback",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    iget-object v1, p0, Lcom/google/android/gms/internal/zzis;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzis;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_e

    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/internal/zzis;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    :cond_c
    :goto_c
    monitor-exit v1

    return-void

    :cond_e
    const-string v0, "The webview is destroyed. Ignoring action."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    if-eqz p2, :cond_c

    const/4 v0, 0x0

    invoke-interface {p2, v0}, Landroid/webkit/ValueCallback;->onReceiveValue(Ljava/lang/Object;)V

    goto :goto_c

    :catchall_1a
    move-exception v0

    monitor-exit v1
    :try_end_1c
    .catchall {:try_start_3 .. :try_end_1c} :catchall_1a

    throw v0
.end method

.method public zza(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ");"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzis;->zzaK(Ljava/lang/String;)V

    return-void
.end method

.method public zza(Ljava/lang/String;Lorg/json/JSONObject;)V
    .registers 4

    if-nez p2, :cond_7

    new-instance p2, Lorg/json/JSONObject;

    invoke-direct {p2}, Lorg/json/JSONObject;-><init>()V

    :cond_7
    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/internal/zzis;->zza(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public zzaF(Ljava/lang/String;)V
    .registers 4

    iget-object v1, p0, Lcom/google/android/gms/internal/zzis;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    invoke-super {p0, p1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    monitor-exit v1

    return-void

    :catchall_8
    move-exception v0

    monitor-exit v1
    :try_end_a
    .catchall {:try_start_3 .. :try_end_a} :catchall_8

    throw v0
.end method

.method public zzaG(Ljava/lang/String;)V
    .registers 4

    iget-object v1, p0, Lcom/google/android/gms/internal/zzis;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    if-nez p1, :cond_7

    :try_start_5
    const-string p1, ""

    :cond_7
    iput-object p1, p0, Lcom/google/android/gms/internal/zzis;->zzBm:Ljava/lang/String;

    monitor-exit v1

    return-void

    :catchall_b
    move-exception v0

    monitor-exit v1
    :try_end_d
    .catchall {:try_start_5 .. :try_end_d} :catchall_b

    throw v0
.end method

.method public zzaH(Ljava/lang/String;)V
    .registers 4

    iget-object v1, p0, Lcom/google/android/gms/internal/zzis;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iput-object p1, p0, Lcom/google/android/gms/internal/zzis;->zzJs:Ljava/lang/String;

    monitor-exit v1

    return-void

    :catchall_7
    move-exception v0

    monitor-exit v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v0
.end method

.method protected zzaJ(Ljava/lang/String;)V
    .registers 4

    iget-object v1, p0, Lcom/google/android/gms/internal/zzis;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzis;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_e

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzis;->loadUrl(Ljava/lang/String;)V

    :goto_c
    monitor-exit v1

    return-void

    :cond_e
    const-string v0, "The webview is destroyed. Ignoring action."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    goto :goto_c

    :catchall_14
    move-exception v0

    monitor-exit v1
    :try_end_16
    .catchall {:try_start_3 .. :try_end_16} :catchall_14

    throw v0
.end method

.method protected zzaK(Ljava/lang/String;)V
    .registers 4

    invoke-static {}, Lcom/google/android/gms/internal/zzlv;->zzpV()Z

    move-result v0

    if-eqz v0, :cond_35

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzis;->zzgg()Ljava/lang/Boolean;

    move-result-object v0

    if-nez v0, :cond_f

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzis;->zzhj()V

    :cond_f
    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzis;->zzgg()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1e

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/internal/zzis;->zza(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    :goto_1d
    return-void

    :cond_1e
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "javascript:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzis;->zzaJ(Ljava/lang/String;)V

    goto :goto_1d

    :cond_35
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "javascript:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzis;->zzaJ(Ljava/lang/String;)V

    goto :goto_1d
.end method

.method public zzaN()Lcom/google/android/gms/ads/internal/client/AdSizeParcel;
    .registers 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzis;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzis;->zzyK:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    monitor-exit v1

    return-object v0

    :catchall_7
    move-exception v0

    monitor-exit v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v0
.end method

.method public zzb(Lcom/google/android/gms/ads/internal/overlay/zzd;)V
    .registers 4

    iget-object v1, p0, Lcom/google/android/gms/internal/zzis;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iput-object p1, p0, Lcom/google/android/gms/internal/zzis;->zzJt:Lcom/google/android/gms/ads/internal/overlay/zzd;

    monitor-exit v1

    return-void

    :catchall_7
    move-exception v0

    monitor-exit v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v0
.end method

.method zzb(Ljava/lang/Boolean;)V
    .registers 3

    iput-object p1, p0, Lcom/google/android/gms/internal/zzis;->zzHi:Ljava/lang/Boolean;

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbA()Lcom/google/android/gms/internal/zzhl;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzhl;->zzb(Ljava/lang/Boolean;)V

    return-void
.end method

.method public zzb(Ljava/lang/String;Lorg/json/JSONObject;)V
    .registers 6

    if-nez p2, :cond_7

    new-instance p2, Lorg/json/JSONObject;

    invoke-direct {p2}, Lorg/json/JSONObject;-><init>()V

    :cond_7
    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "AFMA_ReceiveMessage(\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ");"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Dispatching AFMA event: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->v(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzis;->zzaK(Ljava/lang/String;)V

    return-void
.end method

.method public zzc(Ljava/lang/String;Ljava/util/Map;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "*>;)V"
        }
    .end annotation

    :try_start_0
    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbx()Lcom/google/android/gms/internal/zzhu;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/google/android/gms/internal/zzhu;->zzx(Ljava/util/Map;)Lorg/json/JSONObject;
    :try_end_7
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_7} :catch_c

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/internal/zzis;->zzb(Ljava/lang/String;Lorg/json/JSONObject;)V

    :goto_b
    return-void

    :catch_c
    move-exception v0

    const-string v0, "Could not convert parameters to JSON."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    goto :goto_b
.end method

.method public zzeD()V
    .registers 4

    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    const-string v1, "version"

    iget-object v2, p0, Lcom/google/android/gms/internal/zzis;->zzpa:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;->zzIz:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "onshow"

    invoke-virtual {p0, v1, v0}, Lcom/google/android/gms/internal/zzis;->zzc(Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public zzgM()V
    .registers 4

    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    const-string v1, "version"

    iget-object v2, p0, Lcom/google/android/gms/internal/zzis;->zzpa:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;->zzIz:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "onhide"

    invoke-virtual {p0, v1, v0}, Lcom/google/android/gms/internal/zzis;->zzc(Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public zzgN()Landroid/app/Activity;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzis;->zzJk:Lcom/google/android/gms/internal/zzis$zza;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzis$zza;->zzgN()Landroid/app/Activity;

    move-result-object v0

    return-object v0
.end method

.method public zzgO()Landroid/content/Context;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzis;->zzJk:Lcom/google/android/gms/internal/zzis$zza;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzis$zza;->zzgO()Landroid/content/Context;

    move-result-object v0

    return-object v0
.end method

.method public zzgP()Lcom/google/android/gms/ads/internal/zzd;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzis;->zzov:Lcom/google/android/gms/ads/internal/zzd;

    return-object v0
.end method

.method public zzgQ()Lcom/google/android/gms/ads/internal/overlay/zzd;
    .registers 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzis;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzis;->zzJl:Lcom/google/android/gms/ads/internal/overlay/zzd;

    monitor-exit v1

    return-object v0

    :catchall_7
    move-exception v0

    monitor-exit v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v0
.end method

.method public zzgR()Lcom/google/android/gms/ads/internal/overlay/zzd;
    .registers 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzis;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzis;->zzJt:Lcom/google/android/gms/ads/internal/overlay/zzd;

    monitor-exit v1

    return-object v0

    :catchall_7
    move-exception v0

    monitor-exit v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v0
.end method

.method public zzgS()Lcom/google/android/gms/internal/zziq;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzis;->zzCq:Lcom/google/android/gms/internal/zziq;

    return-object v0
.end method

.method public zzgT()Z
    .registers 2

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzis;->zzJm:Z

    return v0
.end method

.method public zzgU()Lcom/google/android/gms/internal/zzan;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzis;->zzwh:Lcom/google/android/gms/internal/zzan;

    return-object v0
.end method

.method public zzgV()Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzis;->zzpa:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    return-object v0
.end method

.method public zzgW()Z
    .registers 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzis;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzis;->zzJo:Z

    monitor-exit v1

    return v0

    :catchall_7
    move-exception v0

    monitor-exit v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v0
.end method

.method public zzgX()V
    .registers 4

    iget-object v1, p0, Lcom/google/android/gms/internal/zzis;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    const-string v0, "Destroying WebView!"

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->v(Ljava/lang/String;)V

    sget-object v0, Lcom/google/android/gms/internal/zzhu;->zzHK:Landroid/os/Handler;

    new-instance v2, Lcom/google/android/gms/internal/zzis$1;

    invoke-direct {v2, p0}, Lcom/google/android/gms/internal/zzis$1;-><init>(Lcom/google/android/gms/internal/zzis;)V

    invoke-virtual {v0, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    monitor-exit v1

    return-void

    :catchall_14
    move-exception v0

    monitor-exit v1
    :try_end_16
    .catchall {:try_start_3 .. :try_end_16} :catchall_14

    throw v0
.end method

.method public zzgY()Z
    .registers 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzis;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzis;->zzJr:Z

    monitor-exit v1

    return v0

    :catchall_7
    move-exception v0

    monitor-exit v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v0
.end method

.method public zzgZ()V
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzis;->zzqG:Lcom/google/android/gms/internal/zzid;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzid;->zzgD()V

    return-void
.end method

.method zzgg()Ljava/lang/Boolean;
    .registers 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzis;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzis;->zzHi:Ljava/lang/Boolean;

    monitor-exit v1

    return-object v0

    :catchall_7
    move-exception v0

    monitor-exit v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v0
.end method

.method public zzha()Ljava/lang/String;
    .registers 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzis;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzis;->zzJs:Ljava/lang/String;

    monitor-exit v1

    return-object v0

    :catchall_7
    move-exception v0

    monitor-exit v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v0
.end method

.method public zzhi()Z
    .registers 9

    const/4 v5, 0x1

    const/4 v0, 0x0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzis;->zzgS()Lcom/google/android/gms/internal/zziq;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zziq;->zzbY()Z

    move-result v1

    if-nez v1, :cond_d

    :cond_c
    :goto_c
    return v0

    :cond_d
    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbx()Lcom/google/android/gms/internal/zzhu;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzis;->zzqX:Landroid/view/WindowManager;

    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/zzhu;->zza(Landroid/view/WindowManager;)Landroid/util/DisplayMetrics;

    move-result-object v6

    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzk;->zzcE()Lcom/google/android/gms/ads/internal/util/client/zza;

    move-result-object v1

    iget v2, v6, Landroid/util/DisplayMetrics;->widthPixels:I

    invoke-virtual {v1, v6, v2}, Lcom/google/android/gms/ads/internal/util/client/zza;->zzb(Landroid/util/DisplayMetrics;I)I

    move-result v1

    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzk;->zzcE()Lcom/google/android/gms/ads/internal/util/client/zza;

    move-result-object v2

    iget v3, v6, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-virtual {v2, v6, v3}, Lcom/google/android/gms/ads/internal/util/client/zza;->zzb(Landroid/util/DisplayMetrics;I)I

    move-result v2

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzis;->zzgN()Landroid/app/Activity;

    move-result-object v3

    if-eqz v3, :cond_37

    invoke-virtual {v3}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v4

    if-nez v4, :cond_70

    :cond_37
    move v4, v2

    move v3, v1

    :goto_39
    iget v7, p0, Lcom/google/android/gms/internal/zzis;->zzzQ:I

    if-ne v7, v1, :cond_49

    iget v7, p0, Lcom/google/android/gms/internal/zzis;->zzzR:I

    if-ne v7, v2, :cond_49

    iget v7, p0, Lcom/google/android/gms/internal/zzis;->zzzT:I

    if-ne v7, v3, :cond_49

    iget v7, p0, Lcom/google/android/gms/internal/zzis;->zzzU:I

    if-eq v7, v4, :cond_c

    :cond_49
    iget v7, p0, Lcom/google/android/gms/internal/zzis;->zzzQ:I

    if-ne v7, v1, :cond_51

    iget v7, p0, Lcom/google/android/gms/internal/zzis;->zzzR:I

    if-eq v7, v2, :cond_8d

    :cond_51
    move v7, v5

    :goto_52
    iput v1, p0, Lcom/google/android/gms/internal/zzis;->zzzQ:I

    iput v2, p0, Lcom/google/android/gms/internal/zzis;->zzzR:I

    iput v3, p0, Lcom/google/android/gms/internal/zzis;->zzzT:I

    iput v4, p0, Lcom/google/android/gms/internal/zzis;->zzzU:I

    new-instance v0, Lcom/google/android/gms/internal/zzfb;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/zzfb;-><init>(Lcom/google/android/gms/internal/zzip;)V

    iget v5, v6, Landroid/util/DisplayMetrics;->density:F

    iget-object v6, p0, Lcom/google/android/gms/internal/zzis;->zzqX:Landroid/view/WindowManager;

    invoke-interface {v6}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v6

    invoke-virtual {v6}, Landroid/view/Display;->getRotation()I

    move-result v6

    invoke-virtual/range {v0 .. v6}, Lcom/google/android/gms/internal/zzfb;->zza(IIIIFI)V

    move v0, v7

    goto :goto_c

    :cond_70
    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbx()Lcom/google/android/gms/internal/zzhu;

    move-result-object v4

    invoke-virtual {v4, v3}, Lcom/google/android/gms/internal/zzhu;->zzg(Landroid/app/Activity;)[I

    move-result-object v4

    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzk;->zzcE()Lcom/google/android/gms/ads/internal/util/client/zza;

    move-result-object v3

    aget v7, v4, v0

    invoke-virtual {v3, v6, v7}, Lcom/google/android/gms/ads/internal/util/client/zza;->zzb(Landroid/util/DisplayMetrics;I)I

    move-result v3

    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzk;->zzcE()Lcom/google/android/gms/ads/internal/util/client/zza;

    move-result-object v7

    aget v4, v4, v5

    invoke-virtual {v7, v6, v4}, Lcom/google/android/gms/ads/internal/util/client/zza;->zzb(Landroid/util/DisplayMetrics;I)I

    move-result v4

    goto :goto_39

    :cond_8d
    move v7, v0

    goto :goto_52
.end method

.method public zzv(I)V
    .registers 5

    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    const-string v1, "closetype"

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "version"

    iget-object v2, p0, Lcom/google/android/gms/internal/zzis;->zzpa:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;->zzIz:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "onhide"

    invoke-virtual {p0, v1, v0}, Lcom/google/android/gms/internal/zzis;->zzc(Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method
