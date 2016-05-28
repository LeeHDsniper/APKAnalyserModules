.class Lcom/google/android/gms/ads/internal/zzb$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/ads/internal/zzb;->zza(Ljava/lang/String;ZILandroid/content/Intent;Lcom/google/android/gms/ads/internal/purchase/zzf;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzoy:Landroid/content/Intent;

.field final synthetic zzoz:Lcom/google/android/gms/ads/internal/zzb;


# direct methods
.method constructor <init>(Lcom/google/android/gms/ads/internal/zzb;Landroid/content/Intent;)V
    .registers 3

    iput-object p1, p0, Lcom/google/android/gms/ads/internal/zzb$1;->zzoz:Lcom/google/android/gms/ads/internal/zzb;

    iput-object p2, p0, Lcom/google/android/gms/ads/internal/zzb$1;->zzoy:Landroid/content/Intent;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbH()Lcom/google/android/gms/ads/internal/purchase/zzi;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zzb$1;->zzoy:Landroid/content/Intent;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/ads/internal/purchase/zzi;->zzd(Landroid/content/Intent;)I

    move-result v0

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbH()Lcom/google/android/gms/ads/internal/purchase/zzi;

    if-nez v0, :cond_3e

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzb$1;->zzoz:Lcom/google/android/gms/ads/internal/zzb;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    if-eqz v0, :cond_3e

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzb$1;->zzoz:Lcom/google/android/gms/ads/internal/zzb;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzhj;->zzAR:Lcom/google/android/gms/internal/zzip;

    if-eqz v0, :cond_3e

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzb$1;->zzoz:Lcom/google/android/gms/ads/internal/zzb;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzhj;->zzAR:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzip;->zzgQ()Lcom/google/android/gms/ads/internal/overlay/zzd;

    move-result-object v0

    if-eqz v0, :cond_3e

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzb$1;->zzoz:Lcom/google/android/gms/ads/internal/zzb;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzhj;->zzAR:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzip;->zzgQ()Lcom/google/android/gms/ads/internal/overlay/zzd;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/overlay/zzd;->close()V

    :cond_3e
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzb$1;->zzoz:Lcom/google/android/gms/ads/internal/zzb;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzb;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqA:Z

    return-void
.end method
