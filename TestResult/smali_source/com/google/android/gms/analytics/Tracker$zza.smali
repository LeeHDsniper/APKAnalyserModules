.class Lcom/google/android/gms/analytics/Tracker$zza;
.super Lcom/google/android/gms/analytics/internal/zzd;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/analytics/Tracker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "zza"
.end annotation


# instance fields
.field final synthetic zzKU:Lcom/google/android/gms/analytics/Tracker;

.field private zzKX:J

.field private zzKY:Z


# direct methods
.method protected constructor <init>(Lcom/google/android/gms/analytics/Tracker;Lcom/google/android/gms/analytics/internal/zzf;)V
    .registers 5

    iput-object p1, p0, Lcom/google/android/gms/analytics/Tracker$zza;->zzKU:Lcom/google/android/gms/analytics/Tracker;

    invoke-direct {p0, p2}, Lcom/google/android/gms/analytics/internal/zzd;-><init>(Lcom/google/android/gms/analytics/internal/zzf;)V

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/google/android/gms/analytics/Tracker$zza;->zzKX:J

    return-void
.end method


# virtual methods
.method protected zzhB()V
    .registers 1

    return-void
.end method

.method public declared-synchronized zzhE()Z
    .registers 3

    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lcom/google/android/gms/analytics/Tracker$zza;->zzKY:Z

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/google/android/gms/analytics/Tracker$zza;->zzKY:Z
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_8

    monitor-exit p0

    return v0

    :catchall_8
    move-exception v0

    monitor-exit p0

    throw v0
.end method
