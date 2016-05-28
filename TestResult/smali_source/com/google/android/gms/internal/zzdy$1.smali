.class Lcom/google/android/gms/internal/zzdy$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzdy;->zza(JJLcom/google/android/gms/internal/zzcd;)Lcom/google/android/gms/internal/zzee;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzyi:Lcom/google/android/gms/internal/zzee;

.field final synthetic zzyj:Lcom/google/android/gms/internal/zzdy;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzdy;Lcom/google/android/gms/internal/zzee;)V
    .registers 3

    iput-object p1, p0, Lcom/google/android/gms/internal/zzdy$1;->zzyj:Lcom/google/android/gms/internal/zzdy;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzdy$1;->zzyi:Lcom/google/android/gms/internal/zzee;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzdy$1;->zzyi:Lcom/google/android/gms/internal/zzee;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzee;->zzyR:Lcom/google/android/gms/internal/zzei;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzei;->destroy()V
    :try_end_7
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_7} :catch_8

    :goto_7
    return-void

    :catch_8
    move-exception v0

    const-string v1, "Could not destroy mediation adapter."

    invoke-static {v1, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_7
.end method
