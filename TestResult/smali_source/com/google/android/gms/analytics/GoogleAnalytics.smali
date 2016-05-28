.class public final Lcom/google/android/gms/analytics/GoogleAnalytics;
.super Lcom/google/android/gms/analytics/zza;


# static fields
.field private static zzKt:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private zzKu:Z

.field private zzKv:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private zzKx:Z

.field private volatile zzKy:Z

.field private zzKz:Z

.field private zzpr:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/google/android/gms/analytics/GoogleAnalytics;->zzKt:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Lcom/google/android/gms/analytics/internal/zzf;)V
    .registers 3
    .param p1, "context"    # Lcom/google/android/gms/analytics/internal/zzf;

    .prologue
    invoke-direct {p0, p1}, Lcom/google/android/gms/analytics/zza;-><init>(Lcom/google/android/gms/analytics/internal/zzf;)V

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/analytics/GoogleAnalytics;->zzKv:Ljava/util/Set;

    return-void
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/google/android/gms/analytics/GoogleAnalytics;
    .registers 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    invoke-static {p0}, Lcom/google/android/gms/analytics/internal/zzf;->zzX(Landroid/content/Context;)Lcom/google/android/gms/analytics/internal/zzf;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzf;->zzis()Lcom/google/android/gms/analytics/GoogleAnalytics;

    move-result-object v0

    return-object v0
.end method

.method private zzhA()Lcom/google/android/gms/analytics/internal/zzan;
    .registers 2

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/GoogleAnalytics;->zzhp()Lcom/google/android/gms/analytics/internal/zzf;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzf;->zzhA()Lcom/google/android/gms/analytics/internal/zzan;

    move-result-object v0

    return-object v0
.end method

.method public static zzhx()V
    .registers 3

    const-class v1, Lcom/google/android/gms/analytics/GoogleAnalytics;

    monitor-enter v1

    :try_start_3
    sget-object v0, Lcom/google/android/gms/analytics/GoogleAnalytics;->zzKt:Ljava/util/List;

    if-eqz v0, :cond_23

    sget-object v0, Lcom/google/android/gms/analytics/GoogleAnalytics;->zzKt:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_d
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_20

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    goto :goto_d

    :catchall_1d
    move-exception v0

    monitor-exit v1
    :try_end_1f
    .catchall {:try_start_3 .. :try_end_1f} :catchall_1d

    throw v0

    :cond_20
    const/4 v0, 0x0

    :try_start_21
    sput-object v0, Lcom/google/android/gms/analytics/GoogleAnalytics;->zzKt:Ljava/util/List;

    :cond_23
    monitor-exit v1
    :try_end_24
    .catchall {:try_start_21 .. :try_end_24} :catchall_1d

    return-void
.end method


# virtual methods
.method public getAppOptOut()Z
    .registers 2

    iget-boolean v0, p0, Lcom/google/android/gms/analytics/GoogleAnalytics;->zzKy:Z

    return v0
.end method

.method public getClientId()Ljava/lang/String;
    .registers 2

    const-string v0, "getClientId can not be called from the main thread"

    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzx;->zzci(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/GoogleAnalytics;->zzhp()Lcom/google/android/gms/analytics/internal/zzf;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzf;->zziv()Lcom/google/android/gms/analytics/internal/zzn;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzn;->zzjd()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLogger()Lcom/google/android/gms/analytics/Logger;
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-static {}, Lcom/google/android/gms/analytics/internal/zzae;->getLogger()Lcom/google/android/gms/analytics/Logger;

    move-result-object v0

    return-object v0
.end method

.method public isDryRunEnabled()Z
    .registers 2

    iget-boolean v0, p0, Lcom/google/android/gms/analytics/GoogleAnalytics;->zzKx:Z

    return v0
.end method

.method public isInitialized()Z
    .registers 2

    iget-boolean v0, p0, Lcom/google/android/gms/analytics/GoogleAnalytics;->zzpr:Z

    if-eqz v0, :cond_a

    iget-boolean v0, p0, Lcom/google/android/gms/analytics/GoogleAnalytics;->zzKu:Z

    if-nez v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public newTracker(Ljava/lang/String;)Lcom/google/android/gms/analytics/Tracker;
    .registers 5
    .param p1, "trackingId"    # Ljava/lang/String;

    .prologue
    monitor-enter p0

    :try_start_1
    new-instance v0, Lcom/google/android/gms/analytics/Tracker;

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/GoogleAnalytics;->zzhp()Lcom/google/android/gms/analytics/internal/zzf;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, p1, v2}, Lcom/google/android/gms/analytics/Tracker;-><init>(Lcom/google/android/gms/analytics/internal/zzf;Ljava/lang/String;Lcom/google/android/gms/analytics/internal/zzad;)V

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/Tracker;->zza()V

    monitor-exit p0

    return-object v0

    :catchall_10
    move-exception v0

    monitor-exit p0
    :try_end_12
    .catchall {:try_start_1 .. :try_end_12} :catchall_10

    throw v0
.end method

.method public setDryRun(Z)V
    .registers 2
    .param p1, "dryRun"    # Z

    .prologue
    iput-boolean p1, p0, Lcom/google/android/gms/analytics/GoogleAnalytics;->zzKx:Z

    return-void
.end method

.method public setLogger(Lcom/google/android/gms/analytics/Logger;)V
    .registers 5
    .param p1, "logger"    # Lcom/google/android/gms/analytics/Logger;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    invoke-static {p1}, Lcom/google/android/gms/analytics/internal/zzae;->setLogger(Lcom/google/android/gms/analytics/Logger;)V

    iget-boolean v0, p0, Lcom/google/android/gms/analytics/GoogleAnalytics;->zzKz:Z

    if-nez v0, :cond_36

    sget-object v0, Lcom/google/android/gms/analytics/internal/zzy;->zzNa:Lcom/google/android/gms/analytics/internal/zzy$zza;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzy$zza;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "GoogleAnalytics.setLogger() is deprecated. To enable debug logging, please run:\nadb shell setprop log.tag."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v1, Lcom/google/android/gms/analytics/internal/zzy;->zzNa:Lcom/google/android/gms/analytics/internal/zzy$zza;

    invoke-virtual {v1}, Lcom/google/android/gms/analytics/internal/zzy$zza;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " DEBUG"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/analytics/GoogleAnalytics;->zzKz:Z

    :cond_36
    return-void
.end method

.method public zza()V
    .registers 2

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/GoogleAnalytics;->zzhw()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/analytics/GoogleAnalytics;->zzpr:Z

    return-void
.end method

.method zzhw()V
    .registers 4

    invoke-direct {p0}, Lcom/google/android/gms/analytics/GoogleAnalytics;->zzhA()Lcom/google/android/gms/analytics/internal/zzan;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzan;->zzkc()Z

    move-result v1

    if-eqz v1, :cond_15

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/GoogleAnalytics;->getLogger()Lcom/google/android/gms/analytics/Logger;

    move-result-object v1

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzan;->getLogLevel()I

    move-result v2

    invoke-interface {v1, v2}, Lcom/google/android/gms/analytics/Logger;->setLogLevel(I)V

    :cond_15
    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzan;->zzkg()Z

    move-result v1

    if-eqz v1, :cond_22

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzan;->zzkh()Z

    move-result v1

    invoke-virtual {p0, v1}, Lcom/google/android/gms/analytics/GoogleAnalytics;->setDryRun(Z)V

    :cond_22
    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzan;->zzkc()Z

    move-result v1

    if-eqz v1, :cond_35

    invoke-static {}, Lcom/google/android/gms/analytics/internal/zzae;->getLogger()Lcom/google/android/gms/analytics/Logger;

    move-result-object v1

    if-eqz v1, :cond_35

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzan;->getLogLevel()I

    move-result v0

    invoke-interface {v1, v0}, Lcom/google/android/gms/analytics/Logger;->setLogLevel(I)V

    :cond_35
    return-void
.end method
