.class Lcom/google/android/gms/internal/zzdv$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzdv;->zzdJ()Lcom/google/android/gms/internal/zzdv$zze;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzxK:Lcom/google/android/gms/internal/zzdv$zze;

.field final synthetic zzxL:Lcom/google/android/gms/internal/zzdv;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzdv;Lcom/google/android/gms/internal/zzdv$zze;)V
    .registers 3

    iput-object p1, p0, Lcom/google/android/gms/internal/zzdv$1;->zzxL:Lcom/google/android/gms/internal/zzdv;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzdv$1;->zzxK:Lcom/google/android/gms/internal/zzdv$zze;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 7

    iget-object v0, p0, Lcom/google/android/gms/internal/zzdv$1;->zzxL:Lcom/google/android/gms/internal/zzdv;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzdv$1;->zzxL:Lcom/google/android/gms/internal/zzdv;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzdv;->zza(Lcom/google/android/gms/internal/zzdv;)Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzdv$1;->zzxL:Lcom/google/android/gms/internal/zzdv;

    invoke-static {v2}, Lcom/google/android/gms/internal/zzdv;->zzb(Lcom/google/android/gms/internal/zzdv;)Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzdv;->zza(Landroid/content/Context;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;)Lcom/google/android/gms/internal/zzbb;

    move-result-object v0

    new-instance v1, Lcom/google/android/gms/internal/zzdv$1$1;

    invoke-direct {v1, p0, v0}, Lcom/google/android/gms/internal/zzdv$1$1;-><init>(Lcom/google/android/gms/internal/zzdv$1;Lcom/google/android/gms/internal/zzbb;)V

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzbb;->zza(Lcom/google/android/gms/internal/zzbb$zza;)V

    const-string v1, "/jsLoaded"

    new-instance v2, Lcom/google/android/gms/internal/zzdv$1$2;

    invoke-direct {v2, p0, v0}, Lcom/google/android/gms/internal/zzdv$1$2;-><init>(Lcom/google/android/gms/internal/zzdv$1;Lcom/google/android/gms/internal/zzbb;)V

    invoke-interface {v0, v1, v2}, Lcom/google/android/gms/internal/zzbb;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzdg;)V

    new-instance v1, Lcom/google/android/gms/internal/zzic;

    invoke-direct {v1}, Lcom/google/android/gms/internal/zzic;-><init>()V

    new-instance v2, Lcom/google/android/gms/internal/zzdv$1$3;

    invoke-direct {v2, p0, v0, v1}, Lcom/google/android/gms/internal/zzdv$1$3;-><init>(Lcom/google/android/gms/internal/zzdv$1;Lcom/google/android/gms/internal/zzbb;Lcom/google/android/gms/internal/zzic;)V

    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/zzic;->set(Ljava/lang/Object;)V

    const-string v1, "/requestReload"

    invoke-interface {v0, v1, v2}, Lcom/google/android/gms/internal/zzbb;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzdg;)V

    iget-object v1, p0, Lcom/google/android/gms/internal/zzdv$1;->zzxL:Lcom/google/android/gms/internal/zzdv;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzdv;->zzf(Lcom/google/android/gms/internal/zzdv;)Ljava/lang/String;

    move-result-object v1

    const-string v2, ".js"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5e

    iget-object v1, p0, Lcom/google/android/gms/internal/zzdv$1;->zzxL:Lcom/google/android/gms/internal/zzdv;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzdv;->zzf(Lcom/google/android/gms/internal/zzdv;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzbb;->zzs(Ljava/lang/String;)V

    :goto_4d
    new-instance v1, Ljava/util/Timer;

    invoke-direct {v1}, Ljava/util/Timer;-><init>()V

    new-instance v2, Lcom/google/android/gms/internal/zzdv$1$4;

    invoke-direct {v2, p0, v0}, Lcom/google/android/gms/internal/zzdv$1$4;-><init>(Lcom/google/android/gms/internal/zzdv$1;Lcom/google/android/gms/internal/zzbb;)V

    sget v0, Lcom/google/android/gms/internal/zzdv$zza;->zzxT:I

    int-to-long v4, v0

    invoke-virtual {v1, v2, v4, v5}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    return-void

    :cond_5e
    iget-object v1, p0, Lcom/google/android/gms/internal/zzdv$1;->zzxL:Lcom/google/android/gms/internal/zzdv;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzdv;->zzf(Lcom/google/android/gms/internal/zzdv;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "<html>"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_76

    iget-object v1, p0, Lcom/google/android/gms/internal/zzdv$1;->zzxL:Lcom/google/android/gms/internal/zzdv;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzdv;->zzf(Lcom/google/android/gms/internal/zzdv;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzbb;->zzu(Ljava/lang/String;)V

    goto :goto_4d

    :cond_76
    iget-object v1, p0, Lcom/google/android/gms/internal/zzdv$1;->zzxL:Lcom/google/android/gms/internal/zzdv;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzdv;->zzf(Lcom/google/android/gms/internal/zzdv;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzbb;->zzt(Ljava/lang/String;)V

    goto :goto_4d
.end method
