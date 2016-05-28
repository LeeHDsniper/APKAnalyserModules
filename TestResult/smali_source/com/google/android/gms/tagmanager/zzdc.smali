.class public Lcom/google/android/gms/tagmanager/zzdc;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/tagmanager/zzdc$zza;
    }
.end annotation


# instance fields
.field private mContext:Landroid/content/Context;

.field private zzKq:Lcom/google/android/gms/analytics/Tracker;

.field private zzKs:Lcom/google/android/gms/analytics/GoogleAnalytics;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/zzdc;->mContext:Landroid/content/Context;

    return-void
.end method

.method private declared-synchronized zzeW(Ljava/lang/String;)V
    .registers 4

    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzdc;->zzKs:Lcom/google/android/gms/analytics/GoogleAnalytics;

    if-nez v0, :cond_1f

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzdc;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/google/android/gms/analytics/GoogleAnalytics;->getInstance(Landroid/content/Context;)Lcom/google/android/gms/analytics/GoogleAnalytics;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/zzdc;->zzKs:Lcom/google/android/gms/analytics/GoogleAnalytics;

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzdc;->zzKs:Lcom/google/android/gms/analytics/GoogleAnalytics;

    new-instance v1, Lcom/google/android/gms/tagmanager/zzdc$zza;

    invoke-direct {v1}, Lcom/google/android/gms/tagmanager/zzdc$zza;-><init>()V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/analytics/GoogleAnalytics;->setLogger(Lcom/google/android/gms/analytics/Logger;)V

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzdc;->zzKs:Lcom/google/android/gms/analytics/GoogleAnalytics;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/analytics/GoogleAnalytics;->newTracker(Ljava/lang/String;)Lcom/google/android/gms/analytics/Tracker;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/zzdc;->zzKq:Lcom/google/android/gms/analytics/Tracker;
    :try_end_1f
    .catchall {:try_start_1 .. :try_end_1f} :catchall_21

    :cond_1f
    monitor-exit p0

    return-void

    :catchall_21
    move-exception v0

    monitor-exit p0

    throw v0
.end method


# virtual methods
.method public zzeV(Ljava/lang/String;)Lcom/google/android/gms/analytics/Tracker;
    .registers 3

    invoke-direct {p0, p1}, Lcom/google/android/gms/tagmanager/zzdc;->zzeW(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzdc;->zzKq:Lcom/google/android/gms/analytics/Tracker;

    return-object v0
.end method
