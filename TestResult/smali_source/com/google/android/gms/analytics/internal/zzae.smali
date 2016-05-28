.class public Lcom/google/android/gms/analytics/internal/zzae;
.super Ljava/lang/Object;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field private static volatile zzOk:Lcom/google/android/gms/analytics/Logger;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lcom/google/android/gms/analytics/internal/zzs;

    invoke-direct {v0}, Lcom/google/android/gms/analytics/internal/zzs;-><init>()V

    invoke-static {v0}, Lcom/google/android/gms/analytics/internal/zzae;->setLogger(Lcom/google/android/gms/analytics/Logger;)V

    return-void
.end method

.method public static getLogger()Lcom/google/android/gms/analytics/Logger;
    .registers 1

    sget-object v0, Lcom/google/android/gms/analytics/internal/zzae;->zzOk:Lcom/google/android/gms/analytics/Logger;

    return-object v0
.end method

.method public static setLogger(Lcom/google/android/gms/analytics/Logger;)V
    .registers 1
    .param p0, "logger"    # Lcom/google/android/gms/analytics/Logger;

    .prologue
    sput-object p0, Lcom/google/android/gms/analytics/internal/zzae;->zzOk:Lcom/google/android/gms/analytics/Logger;

    return-void
.end method

.method public static zzM(I)Z
    .registers 3

    const/4 v0, 0x0

    invoke-static {}, Lcom/google/android/gms/analytics/internal/zzae;->getLogger()Lcom/google/android/gms/analytics/Logger;

    move-result-object v1

    if-eqz v1, :cond_12

    invoke-static {}, Lcom/google/android/gms/analytics/internal/zzae;->getLogger()Lcom/google/android/gms/analytics/Logger;

    move-result-object v1

    invoke-interface {v1}, Lcom/google/android/gms/analytics/Logger;->getLogLevel()I

    move-result v1

    if-gt v1, p0, :cond_12

    const/4 v0, 0x1

    :cond_12
    return v0
.end method

.method public static zzaE(Ljava/lang/String;)V
    .registers 2

    invoke-static {}, Lcom/google/android/gms/analytics/internal/zzaf;->zzkq()Lcom/google/android/gms/analytics/internal/zzaf;

    move-result-object v0

    if-eqz v0, :cond_11

    invoke-virtual {v0, p0}, Lcom/google/android/gms/analytics/internal/zzaf;->zzbb(Ljava/lang/String;)V

    :cond_9
    :goto_9
    sget-object v0, Lcom/google/android/gms/analytics/internal/zzae;->zzOk:Lcom/google/android/gms/analytics/Logger;

    if-eqz v0, :cond_10

    invoke-interface {v0, p0}, Lcom/google/android/gms/analytics/Logger;->warn(Ljava/lang/String;)V

    :cond_10
    return-void

    :cond_11
    const/4 v0, 0x2

    invoke-static {v0}, Lcom/google/android/gms/analytics/internal/zzae;->zzM(I)Z

    move-result v0

    if-eqz v0, :cond_9

    sget-object v0, Lcom/google/android/gms/analytics/internal/zzy;->zzNa:Lcom/google/android/gms/analytics/internal/zzy$zza;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzy$zza;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_9
.end method

.method public static zzf(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 4

    invoke-static {}, Lcom/google/android/gms/analytics/internal/zzaf;->zzkq()Lcom/google/android/gms/analytics/internal/zzaf;

    move-result-object v0

    if-eqz v0, :cond_11

    invoke-virtual {v0, p0, p1}, Lcom/google/android/gms/analytics/internal/zzaf;->zze(Ljava/lang/String;Ljava/lang/Object;)V

    :cond_9
    :goto_9
    sget-object v0, Lcom/google/android/gms/analytics/internal/zzae;->zzOk:Lcom/google/android/gms/analytics/Logger;

    if-eqz v0, :cond_10

    invoke-interface {v0, p0}, Lcom/google/android/gms/analytics/Logger;->error(Ljava/lang/String;)V

    :cond_10
    return-void

    :cond_11
    const/4 v0, 0x3

    invoke-static {v0}, Lcom/google/android/gms/analytics/internal/zzae;->zzM(I)Z

    move-result v0

    if-eqz v0, :cond_9

    if-eqz p1, :cond_3e

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    move-object v1, v0

    :goto_32
    sget-object v0, Lcom/google/android/gms/analytics/internal/zzy;->zzNa:Lcom/google/android/gms/analytics/internal/zzy$zza;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzy$zza;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_9

    :cond_3e
    move-object v1, p0

    goto :goto_32
.end method
