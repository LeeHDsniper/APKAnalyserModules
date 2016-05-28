.class public Lcom/google/android/gms/analytics/internal/zzad;
.super Ljava/lang/Object;


# instance fields
.field private final zzOe:J

.field private final zzOf:I

.field private zzOg:D

.field private zzOh:J

.field private final zzOi:Ljava/lang/Object;

.field private final zzOj:Ljava/lang/String;


# direct methods
.method public constructor <init>(IJLjava/lang/String;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/analytics/internal/zzad;->zzOi:Ljava/lang/Object;

    iput p1, p0, Lcom/google/android/gms/analytics/internal/zzad;->zzOf:I

    iget v0, p0, Lcom/google/android/gms/analytics/internal/zzad;->zzOf:I

    int-to-double v0, v0

    iput-wide v0, p0, Lcom/google/android/gms/analytics/internal/zzad;->zzOg:D

    iput-wide p2, p0, Lcom/google/android/gms/analytics/internal/zzad;->zzOe:J

    iput-object p4, p0, Lcom/google/android/gms/analytics/internal/zzad;->zzOj:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 6

    const/16 v0, 0x3c

    const-wide/16 v2, 0x7d0

    invoke-direct {p0, v0, v2, v3, p1}, Lcom/google/android/gms/analytics/internal/zzad;-><init>(IJLjava/lang/String;)V

    return-void
.end method


# virtual methods
.method public zzkp()Z
    .registers 13

    const-wide/high16 v10, 0x3ff0000000000000L

    iget-object v1, p0, Lcom/google/android/gms/analytics/internal/zzad;->zzOi:Ljava/lang/Object;

    monitor-enter v1

    :try_start_5
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/google/android/gms/analytics/internal/zzad;->zzOg:D

    iget v0, p0, Lcom/google/android/gms/analytics/internal/zzad;->zzOf:I

    int-to-double v6, v0

    cmpg-double v0, v4, v6

    if-gez v0, :cond_2d

    iget-wide v4, p0, Lcom/google/android/gms/analytics/internal/zzad;->zzOh:J

    sub-long v4, v2, v4

    long-to-double v4, v4

    iget-wide v6, p0, Lcom/google/android/gms/analytics/internal/zzad;->zzOe:J

    long-to-double v6, v6

    div-double/2addr v4, v6

    const-wide/16 v6, 0x0

    cmpl-double v0, v4, v6

    if-lez v0, :cond_2d

    iget v0, p0, Lcom/google/android/gms/analytics/internal/zzad;->zzOf:I

    int-to-double v6, v0

    iget-wide v8, p0, Lcom/google/android/gms/analytics/internal/zzad;->zzOg:D

    add-double/2addr v4, v8

    invoke-static {v6, v7, v4, v5}, Ljava/lang/Math;->min(DD)D

    move-result-wide v4

    iput-wide v4, p0, Lcom/google/android/gms/analytics/internal/zzad;->zzOg:D

    :cond_2d
    iput-wide v2, p0, Lcom/google/android/gms/analytics/internal/zzad;->zzOh:J

    iget-wide v2, p0, Lcom/google/android/gms/analytics/internal/zzad;->zzOg:D

    cmpl-double v0, v2, v10

    if-ltz v0, :cond_3d

    iget-wide v2, p0, Lcom/google/android/gms/analytics/internal/zzad;->zzOg:D

    sub-double/2addr v2, v10

    iput-wide v2, p0, Lcom/google/android/gms/analytics/internal/zzad;->zzOg:D

    const/4 v0, 0x1

    monitor-exit v1

    :goto_3c
    return v0

    :cond_3d
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Excessive "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lcom/google/android/gms/analytics/internal/zzad;->zzOj:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " detected; call ignored."

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/analytics/internal/zzae;->zzaE(Ljava/lang/String;)V

    const/4 v0, 0x0

    monitor-exit v1

    goto :goto_3c

    :catchall_5e
    move-exception v0

    monitor-exit v1
    :try_end_60
    .catchall {:try_start_5 .. :try_end_60} :catchall_5e

    throw v0
.end method
