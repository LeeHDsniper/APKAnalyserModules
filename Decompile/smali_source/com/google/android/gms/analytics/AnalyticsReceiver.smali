.class public final Lcom/google/android/gms/analytics/AnalyticsReceiver;
.super Landroid/content/BroadcastReceiver;


# static fields
.field static zzKc:Lcom/google/android/gms/internal/zzqd;

.field static zzKd:Ljava/lang/Boolean;

.field static zzpm:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/google/android/gms/analytics/AnalyticsReceiver;->zzpm:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method public static zzV(Landroid/content/Context;)Z
    .registers 3

    invoke-static {p0}, Lcom/google/android/gms/common/internal/zzx;->zzv(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/google/android/gms/analytics/AnalyticsReceiver;->zzKd:Ljava/lang/Boolean;

    if-eqz v0, :cond_e

    sget-object v0, Lcom/google/android/gms/analytics/AnalyticsReceiver;->zzKd:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    :goto_d
    return v0

    :cond_e
    const-class v0, Lcom/google/android/gms/analytics/AnalyticsReceiver;

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lcom/google/android/gms/analytics/internal/zzam;->zza(Landroid/content/Context;Ljava/lang/Class;Z)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    sput-object v1, Lcom/google/android/gms/analytics/AnalyticsReceiver;->zzKd:Ljava/lang/Boolean;

    goto :goto_d
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    invoke-static {p1}, Lcom/google/android/gms/analytics/internal/zzf;->zzX(Landroid/content/Context;)Lcom/google/android/gms/analytics/internal/zzf;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzf;->zzie()Lcom/google/android/gms/analytics/internal/zzaf;

    move-result-object v1

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzf;->zzif()Lcom/google/android/gms/analytics/internal/zzr;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzr;->zzjk()Z

    move-result v0

    if-eqz v0, :cond_3d

    const-string v0, "Device AnalyticsReceiver got"

    invoke-virtual {v1, v0, v2}, Lcom/google/android/gms/analytics/internal/zzaf;->zza(Ljava/lang/String;Ljava/lang/Object;)V

    :goto_1b
    const-string v0, "com.google.android.gms.analytics.ANALYTICS_DISPATCH"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3c

    invoke-static {p1}, Lcom/google/android/gms/analytics/AnalyticsService;->zzW(Landroid/content/Context;)Z

    move-result v0

    new-instance v2, Landroid/content/Intent;

    const-class v3, Lcom/google/android/gms/analytics/AnalyticsService;

    invoke-direct {v2, p1, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v3, "com.google.android.gms.analytics.ANALYTICS_DISPATCH"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    sget-object v3, Lcom/google/android/gms/analytics/AnalyticsReceiver;->zzpm:Ljava/lang/Object;

    monitor-enter v3

    :try_start_36
    invoke-virtual {p1, v2}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    if-nez v0, :cond_43

    monitor-exit v3
    :try_end_3c
    .catchall {:try_start_36 .. :try_end_3c} :catchall_60

    :cond_3c
    :goto_3c
    return-void

    :cond_3d
    const-string v0, "Local AnalyticsReceiver got"

    invoke-virtual {v1, v0, v2}, Lcom/google/android/gms/analytics/internal/zzaf;->zza(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_1b

    :cond_43
    :try_start_43
    sget-object v0, Lcom/google/android/gms/analytics/AnalyticsReceiver;->zzKc:Lcom/google/android/gms/internal/zzqd;

    if-nez v0, :cond_57

    new-instance v0, Lcom/google/android/gms/internal/zzqd;

    const/4 v2, 0x1

    const-string v4, "Analytics WakeLock"

    invoke-direct {v0, p1, v2, v4}, Lcom/google/android/gms/internal/zzqd;-><init>(Landroid/content/Context;ILjava/lang/String;)V

    sput-object v0, Lcom/google/android/gms/analytics/AnalyticsReceiver;->zzKc:Lcom/google/android/gms/internal/zzqd;

    sget-object v0, Lcom/google/android/gms/analytics/AnalyticsReceiver;->zzKc:Lcom/google/android/gms/internal/zzqd;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lcom/google/android/gms/internal/zzqd;->setReferenceCounted(Z)V

    :cond_57
    sget-object v0, Lcom/google/android/gms/analytics/AnalyticsReceiver;->zzKc:Lcom/google/android/gms/internal/zzqd;

    const-wide/16 v4, 0x3e8

    invoke-virtual {v0, v4, v5}, Lcom/google/android/gms/internal/zzqd;->acquire(J)V
    :try_end_5e
    .catch Ljava/lang/SecurityException; {:try_start_43 .. :try_end_5e} :catch_63
    .catchall {:try_start_43 .. :try_end_5e} :catchall_60

    :goto_5e
    :try_start_5e
    monitor-exit v3

    goto :goto_3c

    :catchall_60
    move-exception v0

    monitor-exit v3
    :try_end_62
    .catchall {:try_start_5e .. :try_end_62} :catchall_60

    throw v0

    :catch_63
    move-exception v0

    :try_start_64
    const-string v0, "Analytics service at risk of not starting. For more reliable analytics, add the WAKE_LOCK permission to your manifest. See http://goo.gl/8Rd3yj for instructions."

    invoke-virtual {v1, v0}, Lcom/google/android/gms/analytics/internal/zzaf;->zzbb(Ljava/lang/String;)V
    :try_end_69
    .catchall {:try_start_64 .. :try_end_69} :catchall_60

    goto :goto_5e
.end method
