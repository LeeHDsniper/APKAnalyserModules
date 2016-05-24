.class public Lcom/google/android/gms/internal/zzir;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zza(Landroid/content/Context;Lcom/google/android/gms/ads/internal/client/AdSizeParcel;ZZLcom/google/android/gms/internal/zzan;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;)Lcom/google/android/gms/internal/zzip;
    .registers 14

    const/4 v6, 0x0

    move-object v0, p1

    move-object v1, p2

    move v2, p3

    move v3, p4

    move-object v4, p5

    move-object v5, p6

    invoke-static/range {v0 .. v6}, Lcom/google/android/gms/internal/zzis;->zzb(Landroid/content/Context;Lcom/google/android/gms/ads/internal/client/AdSizeParcel;ZZLcom/google/android/gms/internal/zzan;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Lcom/google/android/gms/ads/internal/zzd;)Lcom/google/android/gms/internal/zzis;

    move-result-object v0

    return-object v0
.end method

.method public zza(Landroid/content/Context;Lcom/google/android/gms/ads/internal/client/AdSizeParcel;ZZLcom/google/android/gms/internal/zzan;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Lcom/google/android/gms/ads/internal/zzd;)Lcom/google/android/gms/internal/zzip;
    .registers 9

    invoke-static/range {p1 .. p7}, Lcom/google/android/gms/internal/zzis;->zzb(Landroid/content/Context;Lcom/google/android/gms/ads/internal/client/AdSizeParcel;ZZLcom/google/android/gms/internal/zzan;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Lcom/google/android/gms/ads/internal/zzd;)Lcom/google/android/gms/internal/zzis;

    move-result-object v0

    return-object v0
.end method
