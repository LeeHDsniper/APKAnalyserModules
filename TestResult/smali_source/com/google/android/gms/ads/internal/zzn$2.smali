.class Lcom/google/android/gms/ads/internal/zzn$2;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/ads/internal/zzn;->zza(Lcom/google/android/gms/ads/internal/formats/zzd;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzpt:Lcom/google/android/gms/ads/internal/zzn;

.field final synthetic zzpu:Lcom/google/android/gms/ads/internal/formats/zzd;


# direct methods
.method constructor <init>(Lcom/google/android/gms/ads/internal/zzn;Lcom/google/android/gms/ads/internal/formats/zzd;)V
    .registers 3

    iput-object p1, p0, Lcom/google/android/gms/ads/internal/zzn$2;->zzpt:Lcom/google/android/gms/ads/internal/zzn;

    iput-object p2, p0, Lcom/google/android/gms/ads/internal/zzn$2;->zzpu:Lcom/google/android/gms/ads/internal/formats/zzd;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzn$2;->zzpt:Lcom/google/android/gms/ads/internal/zzn;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzn;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqp:Lcom/google/android/gms/internal/zzct;

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zzn$2;->zzpu:Lcom/google/android/gms/ads/internal/formats/zzd;

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzct;->zza(Lcom/google/android/gms/internal/zzcn;)V
    :try_end_b
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_b} :catch_c

    :goto_b
    return-void

    :catch_c
    move-exception v0

    const-string v1, "Could not call OnAppInstallAdLoadedListener.onAppInstallAdLoaded()."

    invoke-static {v1, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_b
.end method
