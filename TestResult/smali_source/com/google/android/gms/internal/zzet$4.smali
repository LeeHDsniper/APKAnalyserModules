.class Lcom/google/android/gms/internal/zzet$4;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzet;->onDismissScreen(Lcom/google/ads/mediation/MediationBannerAdapter;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzze:Lcom/google/android/gms/internal/zzet;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzet;)V
    .registers 2

    iput-object p1, p0, Lcom/google/android/gms/internal/zzet$4;->zzze:Lcom/google/android/gms/internal/zzet;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzet$4;->zzze:Lcom/google/android/gms/internal/zzet;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzet;->zza(Lcom/google/android/gms/internal/zzet;)Lcom/google/android/gms/internal/zzej;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzej;->onAdClosed()V
    :try_end_9
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_9} :catch_a

    :goto_9
    return-void

    :catch_a
    move-exception v0

    const-string v1, "Could not call onAdClosed."

    invoke-static {v1, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_9
.end method
