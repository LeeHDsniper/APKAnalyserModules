.class Lcom/google/android/gms/ads/internal/request/zzm$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/ads/internal/request/zzm;->zzdG()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzEB:Lcom/google/android/gms/ads/internal/request/zzm;

.field final synthetic zzoA:Lcom/google/android/gms/internal/zzhj$zza;


# direct methods
.method constructor <init>(Lcom/google/android/gms/ads/internal/request/zzm;Lcom/google/android/gms/internal/zzhj$zza;)V
    .registers 3

    iput-object p1, p0, Lcom/google/android/gms/ads/internal/request/zzm$1;->zzEB:Lcom/google/android/gms/ads/internal/request/zzm;

    iput-object p2, p0, Lcom/google/android/gms/ads/internal/request/zzm$1;->zzoA:Lcom/google/android/gms/internal/zzhj$zza;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/request/zzm$1;->zzEB:Lcom/google/android/gms/ads/internal/request/zzm;

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/request/zzm;->zza(Lcom/google/android/gms/ads/internal/request/zzm;)Lcom/google/android/gms/ads/internal/request/zza$zza;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/request/zzm$1;->zzoA:Lcom/google/android/gms/internal/zzhj$zza;

    invoke-interface {v0, v1}, Lcom/google/android/gms/ads/internal/request/zza$zza;->zza(Lcom/google/android/gms/internal/zzhj$zza;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/request/zzm$1;->zzEB:Lcom/google/android/gms/ads/internal/request/zzm;

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/request/zzm;->zzb(Lcom/google/android/gms/ads/internal/request/zzm;)Lcom/google/android/gms/internal/zzdv$zzd;

    move-result-object v0

    if-eqz v0, :cond_22

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/request/zzm$1;->zzEB:Lcom/google/android/gms/ads/internal/request/zzm;

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/request/zzm;->zzb(Lcom/google/android/gms/ads/internal/request/zzm;)Lcom/google/android/gms/internal/zzdv$zzd;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzdv$zzd;->release()V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/request/zzm$1;->zzEB:Lcom/google/android/gms/ads/internal/request/zzm;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/google/android/gms/ads/internal/request/zzm;->zza(Lcom/google/android/gms/ads/internal/request/zzm;Lcom/google/android/gms/internal/zzdv$zzd;)Lcom/google/android/gms/internal/zzdv$zzd;

    :cond_22
    return-void
.end method
