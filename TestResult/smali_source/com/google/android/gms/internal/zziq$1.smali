.class Lcom/google/android/gms/internal/zziq$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zziq;->zzeA()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzJi:Lcom/google/android/gms/internal/zziq;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zziq;)V
    .registers 2

    iput-object p1, p0, Lcom/google/android/gms/internal/zziq$1;->zzJi:Lcom/google/android/gms/internal/zziq;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    iget-object v0, p0, Lcom/google/android/gms/internal/zziq$1;->zzJi:Lcom/google/android/gms/internal/zziq;

    iget-object v0, v0, Lcom/google/android/gms/internal/zziq;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzip;->zzgZ()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zziq$1;->zzJi:Lcom/google/android/gms/internal/zziq;

    iget-object v0, v0, Lcom/google/android/gms/internal/zziq;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzip;->zzgQ()Lcom/google/android/gms/ads/internal/overlay/zzd;

    move-result-object v0

    if-eqz v0, :cond_14

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzeA()V

    :cond_14
    iget-object v0, p0, Lcom/google/android/gms/internal/zziq$1;->zzJi:Lcom/google/android/gms/internal/zziq;

    invoke-static {v0}, Lcom/google/android/gms/internal/zziq;->zzd(Lcom/google/android/gms/internal/zziq;)Lcom/google/android/gms/internal/zziq$zzb;

    move-result-object v0

    if-eqz v0, :cond_2b

    iget-object v0, p0, Lcom/google/android/gms/internal/zziq$1;->zzJi:Lcom/google/android/gms/internal/zziq;

    invoke-static {v0}, Lcom/google/android/gms/internal/zziq;->zzd(Lcom/google/android/gms/internal/zziq;)Lcom/google/android/gms/internal/zziq$zzb;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/internal/zziq$zzb;->zzbf()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zziq$1;->zzJi:Lcom/google/android/gms/internal/zziq;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/zziq;->zza(Lcom/google/android/gms/internal/zziq;Lcom/google/android/gms/internal/zziq$zzb;)Lcom/google/android/gms/internal/zziq$zzb;

    :cond_2b
    return-void
.end method
