.class public final Lcom/google/android/gms/analytics/AnalyticsService;
.super Landroid/app/Service;


# static fields
.field private static zzKe:Ljava/lang/Boolean;


# instance fields
.field private final mHandler:Landroid/os/Handler;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/analytics/AnalyticsService;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method public static zzW(Landroid/content/Context;)Z
    .registers 3

    invoke-static {p0}, Lcom/google/android/gms/common/internal/zzx;->zzv(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/google/android/gms/analytics/AnalyticsService;->zzKe:Ljava/lang/Boolean;

    if-eqz v0, :cond_e

    sget-object v0, Lcom/google/android/gms/analytics/AnalyticsService;->zzKe:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    :goto_d
    return v0

    :cond_e
    const-class v0, Lcom/google/android/gms/analytics/AnalyticsService;

    invoke-static {p0, v0}, Lcom/google/android/gms/analytics/internal/zzam;->zza(Landroid/content/Context;Ljava/lang/Class;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    sput-object v1, Lcom/google/android/gms/analytics/AnalyticsService;->zzKe:Ljava/lang/Boolean;

    goto :goto_d
.end method

.method static synthetic zza(Lcom/google/android/gms/analytics/AnalyticsService;)Landroid/os/Handler;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/analytics/AnalyticsService;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method private zzhr()V
    .registers 4

    :try_start_0
    sget-object v1, Lcom/google/android/gms/analytics/AnalyticsReceiver;->zzpm:Ljava/lang/Object;

    monitor-enter v1
    :try_end_3
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_3} :catch_15

    :try_start_3
    sget-object v0, Lcom/google/android/gms/analytics/AnalyticsReceiver;->zzKc:Lcom/google/android/gms/internal/zzqd;

    if-eqz v0, :cond_10

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzqd;->isHeld()Z

    move-result v2

    if-eqz v2, :cond_10

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzqd;->release()V

    :cond_10
    monitor-exit v1

    :goto_11
    return-void

    :catchall_12
    move-exception v0

    monitor-exit v1
    :try_end_14
    .catchall {:try_start_3 .. :try_end_14} :catchall_12

    :try_start_14
    throw v0
    :try_end_15
    .catch Ljava/lang/SecurityException; {:try_start_14 .. :try_end_15} :catch_15

    :catch_15
    move-exception v0

    goto :goto_11
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .registers 3
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreate()V
    .registers 3

    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    invoke-static {p0}, Lcom/google/android/gms/analytics/internal/zzf;->zzX(Landroid/content/Context;)Lcom/google/android/gms/analytics/internal/zzf;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzf;->zzie()Lcom/google/android/gms/analytics/internal/zzaf;

    move-result-object v1

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzf;->zzif()Lcom/google/android/gms/analytics/internal/zzr;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzr;->zzjk()Z

    move-result v0

    if-eqz v0, :cond_1b

    const-string v0, "Device AnalyticsService is starting up"

    invoke-virtual {v1, v0}, Lcom/google/android/gms/analytics/internal/zzaf;->zzaY(Ljava/lang/String;)V

    :goto_1a
    return-void

    :cond_1b
    const-string v0, "Local AnalyticsService is starting up"

    invoke-virtual {v1, v0}, Lcom/google/android/gms/analytics/internal/zzaf;->zzaY(Ljava/lang/String;)V

    goto :goto_1a
.end method

.method public onDestroy()V
    .registers 3

    invoke-static {p0}, Lcom/google/android/gms/analytics/internal/zzf;->zzX(Landroid/content/Context;)Lcom/google/android/gms/analytics/internal/zzf;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzf;->zzie()Lcom/google/android/gms/analytics/internal/zzaf;

    move-result-object v1

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzf;->zzif()Lcom/google/android/gms/analytics/internal/zzr;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzr;->zzjk()Z

    move-result v0

    if-eqz v0, :cond_1b

    const-string v0, "Device AnalyticsService is shutting down"

    invoke-virtual {v1, v0}, Lcom/google/android/gms/analytics/internal/zzaf;->zzaY(Ljava/lang/String;)V

    :goto_17
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    return-void

    :cond_1b
    const-string v0, "Local AnalyticsService is shutting down"

    invoke-virtual {v1, v0}, Lcom/google/android/gms/analytics/internal/zzaf;->zzaY(Ljava/lang/String;)V

    goto :goto_17
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .registers 10
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "flags"    # I
    .param p3, "startId"    # I

    .prologue
    const/4 v5, 0x2

    invoke-direct {p0}, Lcom/google/android/gms/analytics/AnalyticsService;->zzhr()V

    invoke-static {p0}, Lcom/google/android/gms/analytics/internal/zzf;->zzX(Landroid/content/Context;)Lcom/google/android/gms/analytics/internal/zzf;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzf;->zzie()Lcom/google/android/gms/analytics/internal/zzaf;

    move-result-object v1

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzf;->zzif()Lcom/google/android/gms/analytics/internal/zzr;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gms/analytics/internal/zzr;->zzjk()Z

    move-result v3

    if-eqz v3, :cond_38

    const-string v3, "Device AnalyticsService called. startId, action"

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v3, v4, v2}, Lcom/google/android/gms/analytics/internal/zzaf;->zza(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :goto_23
    const-string v3, "com.google.android.gms.analytics.ANALYTICS_DISPATCH"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_37

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzf;->zzhz()Lcom/google/android/gms/analytics/internal/zzb;

    move-result-object v2

    new-instance v3, Lcom/google/android/gms/analytics/AnalyticsService$1;

    invoke-direct {v3, p0, p3, v0, v1}, Lcom/google/android/gms/analytics/AnalyticsService$1;-><init>(Lcom/google/android/gms/analytics/AnalyticsService;ILcom/google/android/gms/analytics/internal/zzf;Lcom/google/android/gms/analytics/internal/zzaf;)V

    invoke-virtual {v2, v3}, Lcom/google/android/gms/analytics/internal/zzb;->zza(Lcom/google/android/gms/analytics/internal/zzw;)V

    :cond_37
    return v5

    :cond_38
    const-string v3, "Local AnalyticsService called. startId, action"

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v3, v4, v2}, Lcom/google/android/gms/analytics/internal/zzaf;->zza(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_23
.end method
