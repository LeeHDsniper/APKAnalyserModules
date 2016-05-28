.class public Lcom/google/android/gms/internal/zzhk;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/zzhk$zza;
    }
.end annotation


# instance fields
.field private zzFm:Z

.field private final zzGN:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lcom/google/android/gms/internal/zzhk$zza;",
            ">;"
        }
    .end annotation
.end field

.field private final zzGO:Ljava/lang/String;

.field private final zzGP:Ljava/lang/String;

.field private zzGQ:J

.field private zzGR:J

.field private zzGS:J

.field private zzGT:J

.field private zzGU:J

.field private zzGV:J

.field private final zzpN:Lcom/google/android/gms/internal/zzhl;

.field private final zzpc:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzhl;Ljava/lang/String;Ljava/lang/String;)V
    .registers 8

    const-wide/16 v2, -0x1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzhk;->zzpc:Ljava/lang/Object;

    iput-wide v2, p0, Lcom/google/android/gms/internal/zzhk;->zzGQ:J

    iput-wide v2, p0, Lcom/google/android/gms/internal/zzhk;->zzGR:J

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzhk;->zzFm:Z

    iput-wide v2, p0, Lcom/google/android/gms/internal/zzhk;->zzGS:J

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/google/android/gms/internal/zzhk;->zzGT:J

    iput-wide v2, p0, Lcom/google/android/gms/internal/zzhk;->zzGU:J

    iput-wide v2, p0, Lcom/google/android/gms/internal/zzhk;->zzGV:J

    iput-object p1, p0, Lcom/google/android/gms/internal/zzhk;->zzpN:Lcom/google/android/gms/internal/zzhl;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzhk;->zzGO:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzhk;->zzGP:Ljava/lang/String;

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzhk;->zzGN:Ljava/util/LinkedList;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbA()Lcom/google/android/gms/internal/zzhl;

    move-result-object v0

    invoke-direct {p0, v0, p1, p2}, Lcom/google/android/gms/internal/zzhk;-><init>(Lcom/google/android/gms/internal/zzhl;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public toBundle()Landroid/os/Bundle;
    .registers 7

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhk;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    const-string v0, "seq_num"

    iget-object v3, p0, Lcom/google/android/gms/internal/zzhk;->zzGO:Ljava/lang/String;

    invoke-virtual {v2, v0, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "slotid"

    iget-object v3, p0, Lcom/google/android/gms/internal/zzhk;->zzGP:Ljava/lang/String;

    invoke-virtual {v2, v0, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "ismediation"

    iget-boolean v3, p0, Lcom/google/android/gms/internal/zzhk;->zzFm:Z

    invoke-virtual {v2, v0, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v0, "treq"

    iget-wide v4, p0, Lcom/google/android/gms/internal/zzhk;->zzGU:J

    invoke-virtual {v2, v0, v4, v5}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    const-string v0, "tresponse"

    iget-wide v4, p0, Lcom/google/android/gms/internal/zzhk;->zzGV:J

    invoke-virtual {v2, v0, v4, v5}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    const-string v0, "timp"

    iget-wide v4, p0, Lcom/google/android/gms/internal/zzhk;->zzGR:J

    invoke-virtual {v2, v0, v4, v5}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    const-string v0, "tload"

    iget-wide v4, p0, Lcom/google/android/gms/internal/zzhk;->zzGS:J

    invoke-virtual {v2, v0, v4, v5}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    const-string v0, "pcc"

    iget-wide v4, p0, Lcom/google/android/gms/internal/zzhk;->zzGT:J

    invoke-virtual {v2, v0, v4, v5}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    const-string v0, "tfetch"

    iget-wide v4, p0, Lcom/google/android/gms/internal/zzhk;->zzGQ:J

    invoke-virtual {v2, v0, v4, v5}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzhk;->zzGN:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_52
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_69

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzhk$zza;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzhk$zza;->toBundle()Landroid/os/Bundle;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_52

    :catchall_66
    move-exception v0

    monitor-exit v1
    :try_end_68
    .catchall {:try_start_3 .. :try_end_68} :catchall_66

    throw v0

    :cond_69
    :try_start_69
    const-string v0, "tclick"

    invoke-virtual {v2, v0, v3}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    monitor-exit v1
    :try_end_6f
    .catchall {:try_start_69 .. :try_end_6f} :catchall_66

    return-object v2
.end method

.method public zzfT()V
    .registers 7

    const-wide/16 v4, -0x1

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhk;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_5
    iget-wide v2, p0, Lcom/google/android/gms/internal/zzhk;->zzGV:J

    cmp-long v0, v2, v4

    if-eqz v0, :cond_1c

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzhk;->zzGR:J

    cmp-long v0, v2, v4

    if-nez v0, :cond_1c

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/google/android/gms/internal/zzhk;->zzGR:J

    iget-object v0, p0, Lcom/google/android/gms/internal/zzhk;->zzpN:Lcom/google/android/gms/internal/zzhl;

    invoke-virtual {v0, p0}, Lcom/google/android/gms/internal/zzhl;->zza(Lcom/google/android/gms/internal/zzhk;)V

    :cond_1c
    iget-object v0, p0, Lcom/google/android/gms/internal/zzhk;->zzpN:Lcom/google/android/gms/internal/zzhl;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzhl;->zzgb()Lcom/google/android/gms/internal/zzhm;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzhm;->zzfT()V

    monitor-exit v1

    return-void

    :catchall_27
    move-exception v0

    monitor-exit v1
    :try_end_29
    .catchall {:try_start_5 .. :try_end_29} :catchall_27

    throw v0
.end method

.method public zzfU()V
    .registers 7

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhk;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-wide v2, p0, Lcom/google/android/gms/internal/zzhk;->zzGV:J

    const-wide/16 v4, -0x1

    cmp-long v0, v2, v4

    if-eqz v0, :cond_2d

    new-instance v0, Lcom/google/android/gms/internal/zzhk$zza;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzhk$zza;-><init>()V

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzhk$zza;->zzfY()V

    iget-object v2, p0, Lcom/google/android/gms/internal/zzhk;->zzGN:Ljava/util/LinkedList;

    invoke-virtual {v2, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzhk;->zzGT:J

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    iput-wide v2, p0, Lcom/google/android/gms/internal/zzhk;->zzGT:J

    iget-object v0, p0, Lcom/google/android/gms/internal/zzhk;->zzpN:Lcom/google/android/gms/internal/zzhl;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzhl;->zzgb()Lcom/google/android/gms/internal/zzhm;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzhm;->zzfU()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzhk;->zzpN:Lcom/google/android/gms/internal/zzhl;

    invoke-virtual {v0, p0}, Lcom/google/android/gms/internal/zzhl;->zza(Lcom/google/android/gms/internal/zzhk;)V

    :cond_2d
    monitor-exit v1

    return-void

    :catchall_2f
    move-exception v0

    monitor-exit v1
    :try_end_31
    .catchall {:try_start_3 .. :try_end_31} :catchall_2f

    throw v0
.end method

.method public zzfV()V
    .registers 7

    const-wide/16 v4, -0x1

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhk;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_5
    iget-wide v2, p0, Lcom/google/android/gms/internal/zzhk;->zzGV:J

    cmp-long v0, v2, v4

    if-eqz v0, :cond_2b

    iget-object v0, p0, Lcom/google/android/gms/internal/zzhk;->zzGN:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2b

    iget-object v0, p0, Lcom/google/android/gms/internal/zzhk;->zzGN:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->getLast()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzhk$zza;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzhk$zza;->zzfW()J

    move-result-wide v2

    cmp-long v2, v2, v4

    if-nez v2, :cond_2b

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzhk$zza;->zzfX()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzhk;->zzpN:Lcom/google/android/gms/internal/zzhl;

    invoke-virtual {v0, p0}, Lcom/google/android/gms/internal/zzhl;->zza(Lcom/google/android/gms/internal/zzhk;)V

    :cond_2b
    monitor-exit v1

    return-void

    :catchall_2d
    move-exception v0

    monitor-exit v1
    :try_end_2f
    .catchall {:try_start_5 .. :try_end_2f} :catchall_2d

    throw v0
.end method

.method public zzh(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;)V
    .registers 6

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhk;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/google/android/gms/internal/zzhk;->zzGU:J

    iget-object v0, p0, Lcom/google/android/gms/internal/zzhk;->zzpN:Lcom/google/android/gms/internal/zzhl;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzhl;->zzgb()Lcom/google/android/gms/internal/zzhm;

    move-result-object v0

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzhk;->zzGU:J

    invoke-virtual {v0, p1, v2, v3}, Lcom/google/android/gms/internal/zzhm;->zzb(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;J)V

    monitor-exit v1

    return-void

    :catchall_16
    move-exception v0

    monitor-exit v1
    :try_end_18
    .catchall {:try_start_3 .. :try_end_18} :catchall_16

    throw v0
.end method

.method public zzl(J)V
    .registers 10

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhk;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iput-wide p1, p0, Lcom/google/android/gms/internal/zzhk;->zzGV:J

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzhk;->zzGV:J

    const-wide/16 v4, -0x1

    cmp-long v0, v2, v4

    if-eqz v0, :cond_12

    iget-object v0, p0, Lcom/google/android/gms/internal/zzhk;->zzpN:Lcom/google/android/gms/internal/zzhl;

    invoke-virtual {v0, p0}, Lcom/google/android/gms/internal/zzhl;->zza(Lcom/google/android/gms/internal/zzhk;)V

    :cond_12
    monitor-exit v1

    return-void

    :catchall_14
    move-exception v0

    monitor-exit v1
    :try_end_16
    .catchall {:try_start_3 .. :try_end_16} :catchall_14

    throw v0
.end method

.method public zzm(J)V
    .registers 10

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhk;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-wide v2, p0, Lcom/google/android/gms/internal/zzhk;->zzGV:J

    const-wide/16 v4, -0x1

    cmp-long v0, v2, v4

    if-eqz v0, :cond_12

    iput-wide p1, p0, Lcom/google/android/gms/internal/zzhk;->zzGQ:J

    iget-object v0, p0, Lcom/google/android/gms/internal/zzhk;->zzpN:Lcom/google/android/gms/internal/zzhl;

    invoke-virtual {v0, p0}, Lcom/google/android/gms/internal/zzhl;->zza(Lcom/google/android/gms/internal/zzhk;)V

    :cond_12
    monitor-exit v1

    return-void

    :catchall_14
    move-exception v0

    monitor-exit v1
    :try_end_16
    .catchall {:try_start_3 .. :try_end_16} :catchall_14

    throw v0
.end method

.method public zzy(Z)V
    .registers 8

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhk;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-wide v2, p0, Lcom/google/android/gms/internal/zzhk;->zzGV:J

    const-wide/16 v4, -0x1

    cmp-long v0, v2, v4

    if-eqz v0, :cond_1c

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/google/android/gms/internal/zzhk;->zzGS:J

    if-nez p1, :cond_1c

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzhk;->zzGS:J

    iput-wide v2, p0, Lcom/google/android/gms/internal/zzhk;->zzGR:J

    iget-object v0, p0, Lcom/google/android/gms/internal/zzhk;->zzpN:Lcom/google/android/gms/internal/zzhl;

    invoke-virtual {v0, p0}, Lcom/google/android/gms/internal/zzhl;->zza(Lcom/google/android/gms/internal/zzhk;)V

    :cond_1c
    monitor-exit v1

    return-void

    :catchall_1e
    move-exception v0

    monitor-exit v1
    :try_end_20
    .catchall {:try_start_3 .. :try_end_20} :catchall_1e

    throw v0
.end method

.method public zzz(Z)V
    .registers 8

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhk;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-wide v2, p0, Lcom/google/android/gms/internal/zzhk;->zzGV:J

    const-wide/16 v4, -0x1

    cmp-long v0, v2, v4

    if-eqz v0, :cond_12

    iput-boolean p1, p0, Lcom/google/android/gms/internal/zzhk;->zzFm:Z

    iget-object v0, p0, Lcom/google/android/gms/internal/zzhk;->zzpN:Lcom/google/android/gms/internal/zzhl;

    invoke-virtual {v0, p0}, Lcom/google/android/gms/internal/zzhl;->zza(Lcom/google/android/gms/internal/zzhk;)V

    :cond_12
    monitor-exit v1

    return-void

    :catchall_14
    move-exception v0

    monitor-exit v1
    :try_end_16
    .catchall {:try_start_3 .. :try_end_16} :catchall_14

    throw v0
.end method
