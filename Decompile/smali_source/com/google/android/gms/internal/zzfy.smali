.class public Lcom/google/android/gms/internal/zzfy;
.super Lcom/google/android/gms/internal/zzfw;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/google/android/gms/internal/zzhj$zza;Lcom/google/android/gms/internal/zzip;Lcom/google/android/gms/internal/zzga$zza;)V
    .registers 5

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/google/android/gms/internal/zzfw;-><init>(Landroid/content/Context;Lcom/google/android/gms/internal/zzhj$zza;Lcom/google/android/gms/internal/zzip;Lcom/google/android/gms/internal/zzga$zza;)V

    return-void
.end method


# virtual methods
.method protected zzh(J)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/zzfz$zza;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfy;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzip;->zzaN()Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    move-result-object v0

    iget-boolean v1, v0, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->zzsH:Z

    if-eqz v1, :cond_4a

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfy;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v1, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfy;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    :goto_22
    new-instance v2, Lcom/google/android/gms/internal/zzfx;

    iget-object v3, p0, Lcom/google/android/gms/internal/zzfy;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-direct {v2, p0, v3, v1, v0}, Lcom/google/android/gms/internal/zzfx;-><init>(Lcom/google/android/gms/internal/zziq$zza;Lcom/google/android/gms/internal/zzip;II)V

    sget-object v0, Lcom/google/android/gms/internal/zzhu;->zzHK:Landroid/os/Handler;

    new-instance v1, Lcom/google/android/gms/internal/zzfy$1;

    invoke-direct {v1, p0, v2}, Lcom/google/android/gms/internal/zzfy$1;-><init>(Lcom/google/android/gms/internal/zzfy;Lcom/google/android/gms/internal/zzfx;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/internal/zzfy;->zzg(J)V

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzfx;->zzfn()Z

    move-result v0

    if-eqz v0, :cond_4f

    const-string v0, "Ad-Network indicated no fill with passback URL."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaC(Ljava/lang/String;)V

    new-instance v0, Lcom/google/android/gms/internal/zzfz$zza;

    const-string v1, "AdNetwork sent passback url"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/internal/zzfz$zza;-><init>(Ljava/lang/String;I)V

    throw v0

    :cond_4a
    iget v1, v0, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->widthPixels:I

    iget v0, v0, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->heightPixels:I

    goto :goto_22

    :cond_4f
    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzfx;->zzfo()Z

    move-result v0

    if-nez v0, :cond_5e

    new-instance v0, Lcom/google/android/gms/internal/zzfz$zza;

    const-string v1, "AdNetwork timed out"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/internal/zzfz$zza;-><init>(Ljava/lang/String;I)V

    throw v0

    :cond_5e
    return-void
.end method
