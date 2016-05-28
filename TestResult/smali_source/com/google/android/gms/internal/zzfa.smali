.class public Lcom/google/android/gms/internal/zzfa;
.super Lcom/google/android/gms/internal/zzfb;

# interfaces
.implements Lcom/google/android/gms/internal/zzdg;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final zzoL:Lcom/google/android/gms/internal/zzip;

.field private final zzqX:Landroid/view/WindowManager;

.field private final zzzN:Lcom/google/android/gms/internal/zzbq;

.field zzzO:Landroid/util/DisplayMetrics;

.field private zzzP:F

.field zzzQ:I

.field zzzR:I

.field private zzzS:I

.field zzzT:I

.field zzzU:I

.field zzzV:I

.field zzzW:I


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzip;Landroid/content/Context;Lcom/google/android/gms/internal/zzbq;)V
    .registers 5

    const/4 v0, -0x1

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzfb;-><init>(Lcom/google/android/gms/internal/zzip;)V

    iput v0, p0, Lcom/google/android/gms/internal/zzfa;->zzzQ:I

    iput v0, p0, Lcom/google/android/gms/internal/zzfa;->zzzR:I

    iput v0, p0, Lcom/google/android/gms/internal/zzfa;->zzzT:I

    iput v0, p0, Lcom/google/android/gms/internal/zzfa;->zzzU:I

    iput v0, p0, Lcom/google/android/gms/internal/zzfa;->zzzV:I

    iput v0, p0, Lcom/google/android/gms/internal/zzfa;->zzzW:I

    iput-object p1, p0, Lcom/google/android/gms/internal/zzfa;->zzoL:Lcom/google/android/gms/internal/zzip;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzfa;->mContext:Landroid/content/Context;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzfa;->zzzN:Lcom/google/android/gms/internal/zzbq;

    const-string v0, "window"

    invoke-virtual {p2, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzfa;->zzqX:Landroid/view/WindowManager;

    return-void
.end method

.method private zzeb()V
    .registers 3

    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzfa;->zzzO:Landroid/util/DisplayMetrics;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfa;->zzqX:Landroid/view/WindowManager;

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzfa;->zzzO:Landroid/util/DisplayMetrics;

    invoke-virtual {v0, v1}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    iget-object v1, p0, Lcom/google/android/gms/internal/zzfa;->zzzO:Landroid/util/DisplayMetrics;

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    iput v1, p0, Lcom/google/android/gms/internal/zzfa;->zzzP:F

    invoke-virtual {v0}, Landroid/view/Display;->getRotation()I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/zzfa;->zzzS:I

    return-void
.end method

.method private zzeg()V
    .registers 6

    const/4 v0, 0x2

    new-array v0, v0, [I

    iget-object v1, p0, Lcom/google/android/gms/internal/zzfa;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v1, v0}, Lcom/google/android/gms/internal/zzip;->getLocationOnScreen([I)V

    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzk;->zzcE()Lcom/google/android/gms/ads/internal/util/client/zza;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzfa;->mContext:Landroid/content/Context;

    const/4 v3, 0x0

    aget v3, v0, v3

    invoke-virtual {v1, v2, v3}, Lcom/google/android/gms/ads/internal/util/client/zza;->zzc(Landroid/content/Context;I)I

    move-result v1

    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzk;->zzcE()Lcom/google/android/gms/ads/internal/util/client/zza;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/gms/internal/zzfa;->mContext:Landroid/content/Context;

    const/4 v4, 0x1

    aget v0, v0, v4

    invoke-virtual {v2, v3, v0}, Lcom/google/android/gms/ads/internal/util/client/zza;->zzc(Landroid/content/Context;I)I

    move-result v0

    invoke-virtual {p0, v1, v0}, Lcom/google/android/gms/internal/zzfa;->zze(II)V

    return-void
.end method

.method private zzej()Lcom/google/android/gms/internal/zzez;
    .registers 3

    new-instance v0, Lcom/google/android/gms/internal/zzez$zza;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzez$zza;-><init>()V

    iget-object v1, p0, Lcom/google/android/gms/internal/zzfa;->zzzN:Lcom/google/android/gms/internal/zzbq;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzbq;->zzcV()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzez$zza;->zzp(Z)Lcom/google/android/gms/internal/zzez$zza;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzfa;->zzzN:Lcom/google/android/gms/internal/zzbq;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzbq;->zzcW()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzez$zza;->zzo(Z)Lcom/google/android/gms/internal/zzez$zza;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzfa;->zzzN:Lcom/google/android/gms/internal/zzbq;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzbq;->zzda()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzez$zza;->zzq(Z)Lcom/google/android/gms/internal/zzez$zza;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzfa;->zzzN:Lcom/google/android/gms/internal/zzbq;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzbq;->zzcX()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzez$zza;->zzr(Z)Lcom/google/android/gms/internal/zzez$zza;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzfa;->zzzN:Lcom/google/android/gms/internal/zzbq;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzbq;->zzcY()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzez$zza;->zzs(Z)Lcom/google/android/gms/internal/zzez$zza;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzez$zza;->zzea()Lcom/google/android/gms/internal/zzez;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/internal/zzip;Ljava/util/Map;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzip;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzfa;->zzee()V

    return-void
.end method

.method public zze(II)V
    .registers 6

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfa;->mContext:Landroid/content/Context;

    instance-of v0, v0, Landroid/app/Activity;

    if-eqz v0, :cond_28

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbx()Lcom/google/android/gms/internal/zzhu;

    move-result-object v2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfa;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    invoke-virtual {v2, v0}, Lcom/google/android/gms/internal/zzhu;->zzj(Landroid/app/Activity;)[I

    move-result-object v0

    aget v0, v0, v1

    :goto_15
    sub-int v0, p2, v0

    iget v1, p0, Lcom/google/android/gms/internal/zzfa;->zzzV:I

    iget v2, p0, Lcom/google/android/gms/internal/zzfa;->zzzW:I

    invoke-virtual {p0, p1, v0, v1, v2}, Lcom/google/android/gms/internal/zzfa;->zzc(IIII)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfa;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzip;->zzgS()Lcom/google/android/gms/internal/zziq;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/google/android/gms/internal/zziq;->zzd(II)V

    return-void

    :cond_28
    move v0, v1

    goto :goto_15
.end method

.method zzec()V
    .registers 5

    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzk;->zzcE()Lcom/google/android/gms/ads/internal/util/client/zza;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzfa;->zzzO:Landroid/util/DisplayMetrics;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzfa;->zzzO:Landroid/util/DisplayMetrics;

    iget v2, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/ads/internal/util/client/zza;->zzb(Landroid/util/DisplayMetrics;I)I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/zzfa;->zzzQ:I

    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzk;->zzcE()Lcom/google/android/gms/ads/internal/util/client/zza;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzfa;->zzzO:Landroid/util/DisplayMetrics;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzfa;->zzzO:Landroid/util/DisplayMetrics;

    iget v2, v2, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/ads/internal/util/client/zza;->zzb(Landroid/util/DisplayMetrics;I)I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/zzfa;->zzzR:I

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfa;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzip;->zzgN()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_2e

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    if-nez v1, :cond_37

    :cond_2e
    iget v0, p0, Lcom/google/android/gms/internal/zzfa;->zzzQ:I

    iput v0, p0, Lcom/google/android/gms/internal/zzfa;->zzzT:I

    iget v0, p0, Lcom/google/android/gms/internal/zzfa;->zzzR:I

    iput v0, p0, Lcom/google/android/gms/internal/zzfa;->zzzU:I

    :goto_36
    return-void

    :cond_37
    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbx()Lcom/google/android/gms/internal/zzhu;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/google/android/gms/internal/zzhu;->zzg(Landroid/app/Activity;)[I

    move-result-object v0

    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzk;->zzcE()Lcom/google/android/gms/ads/internal/util/client/zza;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzfa;->zzzO:Landroid/util/DisplayMetrics;

    const/4 v3, 0x0

    aget v3, v0, v3

    invoke-virtual {v1, v2, v3}, Lcom/google/android/gms/ads/internal/util/client/zza;->zzb(Landroid/util/DisplayMetrics;I)I

    move-result v1

    iput v1, p0, Lcom/google/android/gms/internal/zzfa;->zzzT:I

    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzk;->zzcE()Lcom/google/android/gms/ads/internal/util/client/zza;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzfa;->zzzO:Landroid/util/DisplayMetrics;

    const/4 v3, 0x1

    aget v0, v0, v3

    invoke-virtual {v1, v2, v0}, Lcom/google/android/gms/ads/internal/util/client/zza;->zzb(Landroid/util/DisplayMetrics;I)I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/zzfa;->zzzU:I

    goto :goto_36
.end method

.method zzed()V
    .registers 4

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfa;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzip;->zzaN()Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    move-result-object v0

    iget-boolean v0, v0, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->zzsH:Z

    if-eqz v0, :cond_14

    iget v0, p0, Lcom/google/android/gms/internal/zzfa;->zzzQ:I

    iput v0, p0, Lcom/google/android/gms/internal/zzfa;->zzzV:I

    iget v0, p0, Lcom/google/android/gms/internal/zzfa;->zzzR:I

    iput v0, p0, Lcom/google/android/gms/internal/zzfa;->zzzW:I

    :goto_13
    return-void

    :cond_14
    iget-object v0, p0, Lcom/google/android/gms/internal/zzfa;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v0, v1, v1}, Lcom/google/android/gms/internal/zzip;->measure(II)V

    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzk;->zzcE()Lcom/google/android/gms/ads/internal/util/client/zza;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzfa;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzfa;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v2}, Lcom/google/android/gms/internal/zzip;->getMeasuredWidth()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/ads/internal/util/client/zza;->zzc(Landroid/content/Context;I)I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/zzfa;->zzzV:I

    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzk;->zzcE()Lcom/google/android/gms/ads/internal/util/client/zza;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzfa;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzfa;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v2}, Lcom/google/android/gms/internal/zzip;->getMeasuredHeight()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/ads/internal/util/client/zza;->zzc(Landroid/content/Context;I)I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/zzfa;->zzzW:I

    goto :goto_13
.end method

.method public zzee()V
    .registers 1

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzfa;->zzeb()V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzfa;->zzec()V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzfa;->zzed()V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzfa;->zzeh()V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzfa;->zzei()V

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzfa;->zzeg()V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzfa;->zzef()V

    return-void
.end method

.method zzef()V
    .registers 2

    const/4 v0, 0x2

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzM(I)Z

    move-result v0

    if-eqz v0, :cond_c

    const-string v0, "Dispatching Ready Event."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaD(Ljava/lang/String;)V

    :cond_c
    iget-object v0, p0, Lcom/google/android/gms/internal/zzfa;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzip;->zzgV()Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    move-result-object v0

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;->zzIz:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzfa;->zzai(Ljava/lang/String;)V

    return-void
.end method

.method zzeh()V
    .registers 8

    iget v1, p0, Lcom/google/android/gms/internal/zzfa;->zzzQ:I

    iget v2, p0, Lcom/google/android/gms/internal/zzfa;->zzzR:I

    iget v3, p0, Lcom/google/android/gms/internal/zzfa;->zzzT:I

    iget v4, p0, Lcom/google/android/gms/internal/zzfa;->zzzU:I

    iget v5, p0, Lcom/google/android/gms/internal/zzfa;->zzzP:F

    iget v6, p0, Lcom/google/android/gms/internal/zzfa;->zzzS:I

    move-object v0, p0

    invoke-virtual/range {v0 .. v6}, Lcom/google/android/gms/internal/zzfa;->zza(IIIIFI)V

    return-void
.end method

.method zzei()V
    .registers 4

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzfa;->zzej()Lcom/google/android/gms/internal/zzez;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzfa;->zzoL:Lcom/google/android/gms/internal/zzip;

    const-string v2, "onDeviceFeaturesReceived"

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzez;->toJson()Lorg/json/JSONObject;

    move-result-object v0

    invoke-interface {v1, v2, v0}, Lcom/google/android/gms/internal/zzip;->zzb(Ljava/lang/String;Lorg/json/JSONObject;)V

    return-void
.end method
