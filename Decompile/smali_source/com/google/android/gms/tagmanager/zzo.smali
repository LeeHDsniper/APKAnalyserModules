.class Lcom/google/android/gms/tagmanager/zzo;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/tagmanager/ContainerHolder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/tagmanager/zzo$zzb;,
        Lcom/google/android/gms/tagmanager/zzo$zza;
    }
.end annotation


# instance fields
.field private zzQA:Lcom/google/android/gms/common/api/Status;

.field private final zzYV:Landroid/os/Looper;

.field private zzaPa:Lcom/google/android/gms/tagmanager/Container;

.field private zzaPb:Lcom/google/android/gms/tagmanager/Container;

.field private zzaPc:Lcom/google/android/gms/tagmanager/zzo$zzb;

.field private zzaPd:Lcom/google/android/gms/tagmanager/zzo$zza;

.field private zzaPe:Lcom/google/android/gms/tagmanager/TagManager;

.field private zzahz:Z


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/api/Status;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/zzo;->zzQA:Lcom/google/android/gms/common/api/Status;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/zzo;->zzYV:Landroid/os/Looper;

    return-void
.end method

.method public constructor <init>(Lcom/google/android/gms/tagmanager/TagManager;Landroid/os/Looper;Lcom/google/android/gms/tagmanager/Container;Lcom/google/android/gms/tagmanager/zzo$zza;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/zzo;->zzaPe:Lcom/google/android/gms/tagmanager/TagManager;

    if-eqz p2, :cond_15

    :goto_7
    iput-object p2, p0, Lcom/google/android/gms/tagmanager/zzo;->zzYV:Landroid/os/Looper;

    iput-object p3, p0, Lcom/google/android/gms/tagmanager/zzo;->zzaPa:Lcom/google/android/gms/tagmanager/Container;

    iput-object p4, p0, Lcom/google/android/gms/tagmanager/zzo;->zzaPd:Lcom/google/android/gms/tagmanager/zzo$zza;

    sget-object v0, Lcom/google/android/gms/common/api/Status;->zzaaD:Lcom/google/android/gms/common/api/Status;

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/zzo;->zzQA:Lcom/google/android/gms/common/api/Status;

    invoke-virtual {p1, p0}, Lcom/google/android/gms/tagmanager/TagManager;->zza(Lcom/google/android/gms/tagmanager/zzo;)V

    return-void

    :cond_15
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object p2

    goto :goto_7
.end method


# virtual methods
.method public declared-synchronized getContainer()Lcom/google/android/gms/tagmanager/Container;
    .registers 3

    const/4 v0, 0x0

    monitor-enter p0

    :try_start_2
    iget-boolean v1, p0, Lcom/google/android/gms/tagmanager/zzo;->zzahz:Z

    if-eqz v1, :cond_d

    const-string v1, "ContainerHolder is released."

    invoke-static {v1}, Lcom/google/android/gms/tagmanager/zzbg;->e(Ljava/lang/String;)V
    :try_end_b
    .catchall {:try_start_2 .. :try_end_b} :catchall_1b

    :goto_b
    monitor-exit p0

    return-object v0

    :cond_d
    :try_start_d
    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzo;->zzaPb:Lcom/google/android/gms/tagmanager/Container;

    if-eqz v0, :cond_18

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzo;->zzaPb:Lcom/google/android/gms/tagmanager/Container;

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/zzo;->zzaPa:Lcom/google/android/gms/tagmanager/Container;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/zzo;->zzaPb:Lcom/google/android/gms/tagmanager/Container;

    :cond_18
    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzo;->zzaPa:Lcom/google/android/gms/tagmanager/Container;
    :try_end_1a
    .catchall {:try_start_d .. :try_end_1a} :catchall_1b

    goto :goto_b

    :catchall_1b
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method getContainerId()Ljava/lang/String;
    .registers 2

    iget-boolean v0, p0, Lcom/google/android/gms/tagmanager/zzo;->zzahz:Z

    if-eqz v0, :cond_c

    const-string v0, "getContainerId called on a released ContainerHolder."

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->e(Ljava/lang/String;)V

    const-string v0, ""

    :goto_b
    return-object v0

    :cond_c
    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzo;->zzaPa:Lcom/google/android/gms/tagmanager/Container;

    invoke-virtual {v0}, Lcom/google/android/gms/tagmanager/Container;->getContainerId()Ljava/lang/String;

    move-result-object v0

    goto :goto_b
.end method

.method public getStatus()Lcom/google/android/gms/common/api/Status;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzo;->zzQA:Lcom/google/android/gms/common/api/Status;

    return-object v0
.end method

.method public declared-synchronized refresh()V
    .registers 2

    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lcom/google/android/gms/tagmanager/zzo;->zzahz:Z

    if-eqz v0, :cond_c

    const-string v0, "Refreshing a released ContainerHolder."

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->e(Ljava/lang/String;)V
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_12

    :goto_a
    monitor-exit p0

    return-void

    :cond_c
    :try_start_c
    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzo;->zzaPd:Lcom/google/android/gms/tagmanager/zzo$zza;

    invoke-interface {v0}, Lcom/google/android/gms/tagmanager/zzo$zza;->zzzG()V
    :try_end_11
    .catchall {:try_start_c .. :try_end_11} :catchall_12

    goto :goto_a

    :catchall_12
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized release()V
    .registers 2

    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lcom/google/android/gms/tagmanager/zzo;->zzahz:Z

    if-eqz v0, :cond_c

    const-string v0, "Releasing a released ContainerHolder."

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->e(Ljava/lang/String;)V
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_26

    :goto_a
    monitor-exit p0

    return-void

    :cond_c
    const/4 v0, 0x1

    :try_start_d
    iput-boolean v0, p0, Lcom/google/android/gms/tagmanager/zzo;->zzahz:Z

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzo;->zzaPe:Lcom/google/android/gms/tagmanager/TagManager;

    invoke-virtual {v0, p0}, Lcom/google/android/gms/tagmanager/TagManager;->zzb(Lcom/google/android/gms/tagmanager/zzo;)Z

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzo;->zzaPa:Lcom/google/android/gms/tagmanager/Container;

    invoke-virtual {v0}, Lcom/google/android/gms/tagmanager/Container;->release()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/zzo;->zzaPa:Lcom/google/android/gms/tagmanager/Container;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/zzo;->zzaPb:Lcom/google/android/gms/tagmanager/Container;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/zzo;->zzaPd:Lcom/google/android/gms/tagmanager/zzo$zza;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/zzo;->zzaPc:Lcom/google/android/gms/tagmanager/zzo$zzb;
    :try_end_25
    .catchall {:try_start_d .. :try_end_25} :catchall_26

    goto :goto_a

    :catchall_26
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized zzew(Ljava/lang/String;)V
    .registers 3

    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lcom/google/android/gms/tagmanager/zzo;->zzahz:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_d

    if-eqz v0, :cond_7

    :goto_5
    monitor-exit p0

    return-void

    :cond_7
    :try_start_7
    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzo;->zzaPa:Lcom/google/android/gms/tagmanager/Container;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/tagmanager/Container;->zzew(Ljava/lang/String;)V
    :try_end_c
    .catchall {:try_start_7 .. :try_end_c} :catchall_d

    goto :goto_5

    :catchall_d
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method zzey(Ljava/lang/String;)V
    .registers 3

    iget-boolean v0, p0, Lcom/google/android/gms/tagmanager/zzo;->zzahz:Z

    if-eqz v0, :cond_a

    const-string v0, "setCtfeUrlPathAndQuery called on a released ContainerHolder."

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->e(Ljava/lang/String;)V

    :goto_9
    return-void

    :cond_a
    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzo;->zzaPd:Lcom/google/android/gms/tagmanager/zzo$zza;

    invoke-interface {v0, p1}, Lcom/google/android/gms/tagmanager/zzo$zza;->zzey(Ljava/lang/String;)V

    goto :goto_9
.end method

.method zzzE()Ljava/lang/String;
    .registers 2

    iget-boolean v0, p0, Lcom/google/android/gms/tagmanager/zzo;->zzahz:Z

    if-eqz v0, :cond_c

    const-string v0, "setCtfeUrlPathAndQuery called on a released ContainerHolder."

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->e(Ljava/lang/String;)V

    const-string v0, ""

    :goto_b
    return-object v0

    :cond_c
    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzo;->zzaPd:Lcom/google/android/gms/tagmanager/zzo$zza;

    invoke-interface {v0}, Lcom/google/android/gms/tagmanager/zzo$zza;->zzzE()Ljava/lang/String;

    move-result-object v0

    goto :goto_b
.end method
