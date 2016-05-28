.class Lcom/google/android/gms/tagmanager/zzbe;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/tagmanager/zzcd;


# instance fields
.field private final zzOe:J

.field private final zzOf:I

.field private zzOg:D

.field private zzOh:J

.field private final zzOi:Ljava/lang/Object;

.field private final zzOj:Ljava/lang/String;

.field private final zzaQB:J

.field private final zzpO:Lcom/google/android/gms/internal/zzlm;


# direct methods
.method public constructor <init>(IJJLjava/lang/String;Lcom/google/android/gms/internal/zzlm;)V
    .registers 10

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/zzbe;->zzOi:Ljava/lang/Object;

    iput p1, p0, Lcom/google/android/gms/tagmanager/zzbe;->zzOf:I

    iget v0, p0, Lcom/google/android/gms/tagmanager/zzbe;->zzOf:I

    int-to-double v0, v0

    iput-wide v0, p0, Lcom/google/android/gms/tagmanager/zzbe;->zzOg:D

    iput-wide p2, p0, Lcom/google/android/gms/tagmanager/zzbe;->zzOe:J

    iput-wide p4, p0, Lcom/google/android/gms/tagmanager/zzbe;->zzaQB:J

    iput-object p6, p0, Lcom/google/android/gms/tagmanager/zzbe;->zzOj:Ljava/lang/String;

    iput-object p7, p0, Lcom/google/android/gms/tagmanager/zzbe;->zzpO:Lcom/google/android/gms/internal/zzlm;

    return-void
.end method


# virtual methods
.method public zzkp()Z
    .registers 13

    const/4 v0, 0x0

    const-wide/high16 v10, 0x3ff0000000000000L

    iget-object v1, p0, Lcom/google/android/gms/tagmanager/zzbe;->zzOi:Ljava/lang/Object;

    monitor-enter v1

    :try_start_6
    iget-object v2, p0, Lcom/google/android/gms/tagmanager/zzbe;->zzpO:Lcom/google/android/gms/internal/zzlm;

    invoke-interface {v2}, Lcom/google/android/gms/internal/zzlm;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/google/android/gms/tagmanager/zzbe;->zzOh:J

    sub-long v4, v2, v4

    iget-wide v6, p0, Lcom/google/android/gms/tagmanager/zzbe;->zzaQB:J

    cmp-long v4, v4, v6

    if-gez v4, :cond_36

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Excessive "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/gms/tagmanager/zzbe;->zzOj:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " detected; call ignored."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gms/tagmanager/zzbg;->zzaE(Ljava/lang/String;)V

    monitor-exit v1

    :goto_35
    return v0

    :cond_36
    iget-wide v4, p0, Lcom/google/android/gms/tagmanager/zzbe;->zzOg:D

    iget v6, p0, Lcom/google/android/gms/tagmanager/zzbe;->zzOf:I

    int-to-double v6, v6

    cmpg-double v4, v4, v6

    if-gez v4, :cond_5a

    iget-wide v4, p0, Lcom/google/android/gms/tagmanager/zzbe;->zzOh:J

    sub-long v4, v2, v4

    long-to-double v4, v4

    iget-wide v6, p0, Lcom/google/android/gms/tagmanager/zzbe;->zzOe:J

    long-to-double v6, v6

    div-double/2addr v4, v6

    const-wide/16 v6, 0x0

    cmpl-double v6, v4, v6

    if-lez v6, :cond_5a

    iget v6, p0, Lcom/google/android/gms/tagmanager/zzbe;->zzOf:I

    int-to-double v6, v6

    iget-wide v8, p0, Lcom/google/android/gms/tagmanager/zzbe;->zzOg:D

    add-double/2addr v4, v8

    invoke-static {v6, v7, v4, v5}, Ljava/lang/Math;->min(DD)D

    move-result-wide v4

    iput-wide v4, p0, Lcom/google/android/gms/tagmanager/zzbe;->zzOg:D

    :cond_5a
    iput-wide v2, p0, Lcom/google/android/gms/tagmanager/zzbe;->zzOh:J

    iget-wide v2, p0, Lcom/google/android/gms/tagmanager/zzbe;->zzOg:D

    cmpl-double v2, v2, v10

    if-ltz v2, :cond_6d

    iget-wide v2, p0, Lcom/google/android/gms/tagmanager/zzbe;->zzOg:D

    sub-double/2addr v2, v10

    iput-wide v2, p0, Lcom/google/android/gms/tagmanager/zzbe;->zzOg:D

    const/4 v0, 0x1

    monitor-exit v1

    goto :goto_35

    :catchall_6a
    move-exception v0

    monitor-exit v1
    :try_end_6c
    .catchall {:try_start_6 .. :try_end_6c} :catchall_6a

    throw v0

    :cond_6d
    :try_start_6d
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Excessive "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/gms/tagmanager/zzbe;->zzOj:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " detected; call ignored."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gms/tagmanager/zzbg;->zzaE(Ljava/lang/String;)V

    monitor-exit v1
    :try_end_8c
    .catchall {:try_start_6d .. :try_end_8c} :catchall_6a

    goto :goto_35
.end method
