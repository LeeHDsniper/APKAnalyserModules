.class Lcom/google/android/gms/ads/internal/zzf$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zziq$zzb;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/ads/internal/zzf;->zza(Lcom/google/android/gms/internal/zzhj;Lcom/google/android/gms/internal/zzhj;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzoN:Lcom/google/android/gms/internal/zzhj;

.field final synthetic zzoO:Lcom/google/android/gms/ads/internal/zzf;


# direct methods
.method constructor <init>(Lcom/google/android/gms/ads/internal/zzf;Lcom/google/android/gms/internal/zzhj;)V
    .registers 3

    iput-object p1, p0, Lcom/google/android/gms/ads/internal/zzf$1;->zzoO:Lcom/google/android/gms/ads/internal/zzf;

    iput-object p2, p0, Lcom/google/android/gms/ads/internal/zzf$1;->zzoN:Lcom/google/android/gms/internal/zzhj;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zzbf()V
    .registers 4

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzf$1;->zzoO:Lcom/google/android/gms/ads/internal/zzf;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzf;->zzou:Lcom/google/android/gms/internal/zzay;

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zzf$1;->zzoO:Lcom/google/android/gms/ads/internal/zzf;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/zzf;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/zzq;->zzqf:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/zzf$1;->zzoN:Lcom/google/android/gms/internal/zzhj;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzay;->zza(Lcom/google/android/gms/ads/internal/client/AdSizeParcel;Lcom/google/android/gms/internal/zzhj;)Lcom/google/android/gms/internal/zzaz;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zzf$1;->zzoN:Lcom/google/android/gms/internal/zzhj;

    iget-object v1, v1, Lcom/google/android/gms/internal/zzhj;->zzAR:Lcom/google/android/gms/internal/zzip;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzaz;->zza(Lcom/google/android/gms/internal/zzaw;)V

    return-void
.end method
