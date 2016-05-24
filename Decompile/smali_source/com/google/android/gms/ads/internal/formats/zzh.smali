.class public Lcom/google/android/gms/ads/internal/formats/zzh;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/ads/internal/formats/zzh$zza;
    }
.end annotation


# instance fields
.field private final mContext:Landroid/content/Context;

.field private zzoL:Lcom/google/android/gms/internal/zzip;

.field private final zzpa:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

.field private final zzpc:Ljava/lang/Object;

.field private final zzwb:Lcom/google/android/gms/ads/internal/zzn;

.field private final zzwe:Lorg/json/JSONObject;

.field private final zzwf:Lcom/google/android/gms/internal/zzbb;

.field private final zzwg:Lcom/google/android/gms/ads/internal/formats/zzh$zza;

.field private final zzwh:Lcom/google/android/gms/internal/zzan;

.field private zzwi:Z

.field private zzwj:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/zzn;Lcom/google/android/gms/internal/zzbb;Lcom/google/android/gms/internal/zzan;Lorg/json/JSONObject;Lcom/google/android/gms/ads/internal/formats/zzh$zza;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzpc:Ljava/lang/Object;

    iput-object p1, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzwb:Lcom/google/android/gms/ads/internal/zzn;

    iput-object p3, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzwf:Lcom/google/android/gms/internal/zzbb;

    iput-object p4, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzwh:Lcom/google/android/gms/internal/zzan;

    iput-object p5, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzwe:Lorg/json/JSONObject;

    iput-object p6, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzwg:Lcom/google/android/gms/ads/internal/formats/zzh$zza;

    iput-object p7, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzpa:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/ads/internal/formats/zzh;Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    iput-object p1, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzwj:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic zzc(Lcom/google/android/gms/ads/internal/formats/zzh;)Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzwj:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic zzd(Lcom/google/android/gms/ads/internal/formats/zzh;)Lcom/google/android/gms/internal/zzbb;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzwf:Lcom/google/android/gms/internal/zzbb;

    return-object v0
.end method

.method static synthetic zze(Lcom/google/android/gms/ads/internal/formats/zzh;)Lcom/google/android/gms/internal/zzip;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzoL:Lcom/google/android/gms/internal/zzip;

    return-object v0
.end method


# virtual methods
.method public performClick(Ljava/lang/String;)V
    .registers 6
    .param p1, "assetId"    # Ljava/lang/String;

    .prologue
    const-string v0, "performClick must be called on the main UI thread."

    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzx;->zzch(Ljava/lang/String;)V

    :try_start_5
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "asset"

    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "template"

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzwg:Lcom/google/android/gms/ads/internal/formats/zzh$zza;

    invoke-interface {v2}, Lcom/google/android/gms/ads/internal/formats/zzh$zza;->zzdu()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "ad"

    iget-object v3, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzwe:Lorg/json/JSONObject;

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "click"

    invoke-virtual {v1, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "has_custom_click_handler"

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzwb:Lcom/google/android/gms/ads/internal/zzn;

    iget-object v3, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzwg:Lcom/google/android/gms/ads/internal/formats/zzh$zza;

    invoke-interface {v3}, Lcom/google/android/gms/ads/internal/formats/zzh$zza;->getCustomTemplateId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/google/android/gms/ads/internal/zzn;->zzr(Ljava/lang/String;)Lcom/google/android/gms/internal/zzcv;

    move-result-object v0

    if-eqz v0, :cond_47

    const/4 v0, 0x1

    :goto_3c
    invoke-virtual {v1, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzwf:Lcom/google/android/gms/internal/zzbb;

    const-string v2, "google.afma.nativeAds.handleClickGmsg"

    invoke-interface {v0, v2, v1}, Lcom/google/android/gms/internal/zzbb;->zza(Ljava/lang/String;Lorg/json/JSONObject;)V
    :try_end_46
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_46} :catch_49

    :goto_46
    return-void

    :cond_47
    const/4 v0, 0x0

    goto :goto_3c

    :catch_49
    move-exception v0

    const-string v1, "Unable to create click JSON."

    invoke-static {v1, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzb(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_46
.end method

.method public recordImpression()V
    .registers 2

    const-string v0, "recordImpression must be called on the main UI thread."

    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzx;->zzch(Ljava/lang/String;)V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/google/android/gms/ads/internal/formats/zzh;->zzl(Z)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzwb:Lcom/google/android/gms/ads/internal/zzn;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/zzn;->zzaP()V

    return-void
.end method

.method public zza(Landroid/view/View$OnClickListener;)Lcom/google/android/gms/ads/internal/formats/zzb;
    .registers 6

    const/4 v3, -0x1

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzwg:Lcom/google/android/gms/ads/internal/formats/zzh$zza;

    invoke-interface {v0}, Lcom/google/android/gms/ads/internal/formats/zzh$zza;->zzdv()Lcom/google/android/gms/ads/internal/formats/zza;

    move-result-object v1

    if-nez v1, :cond_b

    const/4 v0, 0x0

    :goto_a
    return-object v0

    :cond_b
    new-instance v0, Lcom/google/android/gms/ads/internal/formats/zzb;

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->mContext:Landroid/content/Context;

    invoke-direct {v0, v2, v1}, Lcom/google/android/gms/ads/internal/formats/zzb;-><init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/formats/zza;)V

    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v1, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/ads/internal/formats/zzb;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/formats/zzb;->zzdq()Landroid/view/ViewGroup;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/view/ViewGroup;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/formats/zzb;->zzdq()Landroid/view/ViewGroup;

    move-result-object v1

    const-string v2, "Ad attribution icon"

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_a
.end method

.method public zzb(Landroid/view/MotionEvent;)V
    .registers 3

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzwh:Lcom/google/android/gms/internal/zzan;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzan;->zza(Landroid/view/MotionEvent;)V

    return-void
.end method

.method public zzb(Landroid/view/View;Ljava/util/Map;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/view/View;",
            ">;>;)V"
        }
    .end annotation

    const-string v0, "performClick must be called on the main UI thread."

    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzx;->zzch(Ljava/lang/String;)V

    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_d
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_34

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_d

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/ads/internal/formats/zzh;->performClick(Ljava/lang/String;)V

    :cond_34
    return-void
.end method

.method public zzdy()Lcom/google/android/gms/internal/zzip;
    .registers 4

    invoke-virtual {p0}, Lcom/google/android/gms/ads/internal/formats/zzh;->zzdz()Lcom/google/android/gms/internal/zzip;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzoL:Lcom/google/android/gms/internal/zzip;

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzip;->getWebView()Landroid/webkit/WebView;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setVisibility(I)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzwf:Lcom/google/android/gms/internal/zzbb;

    const-string v1, "/loadHtml"

    new-instance v2, Lcom/google/android/gms/ads/internal/formats/zzh$1;

    invoke-direct {v2, p0}, Lcom/google/android/gms/ads/internal/formats/zzh$1;-><init>(Lcom/google/android/gms/ads/internal/formats/zzh;)V

    invoke-interface {v0, v1, v2}, Lcom/google/android/gms/internal/zzbb;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzdg;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzwf:Lcom/google/android/gms/internal/zzbb;

    const-string v1, "/showOverlay"

    new-instance v2, Lcom/google/android/gms/ads/internal/formats/zzh$2;

    invoke-direct {v2, p0}, Lcom/google/android/gms/ads/internal/formats/zzh$2;-><init>(Lcom/google/android/gms/ads/internal/formats/zzh;)V

    invoke-interface {v0, v1, v2}, Lcom/google/android/gms/internal/zzbb;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzdg;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzwf:Lcom/google/android/gms/internal/zzbb;

    const-string v1, "/hideOverlay"

    new-instance v2, Lcom/google/android/gms/ads/internal/formats/zzh$3;

    invoke-direct {v2, p0}, Lcom/google/android/gms/ads/internal/formats/zzh$3;-><init>(Lcom/google/android/gms/ads/internal/formats/zzh;)V

    invoke-interface {v0, v1, v2}, Lcom/google/android/gms/internal/zzbb;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzdg;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzip;->zzgS()Lcom/google/android/gms/internal/zziq;

    move-result-object v0

    const-string v1, "/hideOverlay"

    new-instance v2, Lcom/google/android/gms/ads/internal/formats/zzh$4;

    invoke-direct {v2, p0}, Lcom/google/android/gms/ads/internal/formats/zzh$4;-><init>(Lcom/google/android/gms/ads/internal/formats/zzh;)V

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zziq;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzdg;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzip;->zzgS()Lcom/google/android/gms/internal/zziq;

    move-result-object v0

    const-string v1, "/sendMessageToSdk"

    new-instance v2, Lcom/google/android/gms/ads/internal/formats/zzh$5;

    invoke-direct {v2, p0}, Lcom/google/android/gms/ads/internal/formats/zzh$5;-><init>(Lcom/google/android/gms/ads/internal/formats/zzh;)V

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zziq;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzdg;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzoL:Lcom/google/android/gms/internal/zzip;

    return-object v0
.end method

.method zzdz()Lcom/google/android/gms/internal/zzip;
    .registers 8

    const/4 v3, 0x0

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzby()Lcom/google/android/gms/internal/zzir;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->mContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->zzs(Landroid/content/Context;)Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    move-result-object v2

    iget-object v5, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzwh:Lcom/google/android/gms/internal/zzan;

    iget-object v6, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzpa:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    move v4, v3

    invoke-virtual/range {v0 .. v6}, Lcom/google/android/gms/internal/zzir;->zza(Landroid/content/Context;Lcom/google/android/gms/ads/internal/client/AdSizeParcel;ZZLcom/google/android/gms/internal/zzan;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;)Lcom/google/android/gms/internal/zzip;

    move-result-object v0

    return-object v0
.end method

.method public zzh(Landroid/view/View;)V
    .registers 2

    return-void
.end method

.method public zzi(Landroid/view/View;)V
    .registers 5

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-boolean v0, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzwi:Z

    if-eqz v0, :cond_9

    monitor-exit v1

    :goto_8
    return-void

    :cond_9
    invoke-virtual {p1}, Landroid/view/View;->isShown()Z

    move-result v0

    if-nez v0, :cond_14

    monitor-exit v1

    goto :goto_8

    :catchall_11
    move-exception v0

    monitor-exit v1
    :try_end_13
    .catchall {:try_start_3 .. :try_end_13} :catchall_11

    throw v0

    :cond_14
    :try_start_14
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v2}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;Landroid/graphics/Point;)Z

    move-result v0

    if-nez v0, :cond_22

    monitor-exit v1

    goto :goto_8

    :cond_22
    invoke-virtual {p0}, Lcom/google/android/gms/ads/internal/formats/zzh;->recordImpression()V

    monitor-exit v1
    :try_end_26
    .catchall {:try_start_14 .. :try_end_26} :catchall_11

    goto :goto_8
.end method

.method protected zzl(Z)V
    .registers 2

    iput-boolean p1, p0, Lcom/google/android/gms/ads/internal/formats/zzh;->zzwi:Z

    return-void
.end method
