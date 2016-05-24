.class public Lcom/google/android/gms/tagmanager/TagManager;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/tagmanager/TagManager$4;,
        Lcom/google/android/gms/tagmanager/TagManager$zza;
    }
.end annotation


# static fields
.field private static zzaSv:Lcom/google/android/gms/tagmanager/TagManager;


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final zzaOT:Lcom/google/android/gms/tagmanager/DataLayer;

.field private final zzaRp:Lcom/google/android/gms/tagmanager/zzs;

.field private final zzaSs:Lcom/google/android/gms/tagmanager/TagManager$zza;

.field private final zzaSt:Lcom/google/android/gms/tagmanager/zzct;

.field private final zzaSu:Ljava/util/concurrent/ConcurrentMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentMap",
            "<",
            "Lcom/google/android/gms/tagmanager/zzo;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/google/android/gms/tagmanager/TagManager$zza;Lcom/google/android/gms/tagmanager/DataLayer;Lcom/google/android/gms/tagmanager/zzct;)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "containerHolderLoaderProvider"    # Lcom/google/android/gms/tagmanager/TagManager$zza;
    .param p3, "dataLayer"    # Lcom/google/android/gms/tagmanager/DataLayer;
    .param p4, "serviceManager"    # Lcom/google/android/gms/tagmanager/zzct;

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-nez p1, :cond_d

    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "context cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_d
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/TagManager;->mContext:Landroid/content/Context;

    iput-object p4, p0, Lcom/google/android/gms/tagmanager/TagManager;->zzaSt:Lcom/google/android/gms/tagmanager/zzct;

    iput-object p2, p0, Lcom/google/android/gms/tagmanager/TagManager;->zzaSs:Lcom/google/android/gms/tagmanager/TagManager$zza;

    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/TagManager;->zzaSu:Ljava/util/concurrent/ConcurrentMap;

    iput-object p3, p0, Lcom/google/android/gms/tagmanager/TagManager;->zzaOT:Lcom/google/android/gms/tagmanager/DataLayer;

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/TagManager;->zzaOT:Lcom/google/android/gms/tagmanager/DataLayer;

    new-instance v1, Lcom/google/android/gms/tagmanager/TagManager$1;

    invoke-direct {v1, p0}, Lcom/google/android/gms/tagmanager/TagManager$1;-><init>(Lcom/google/android/gms/tagmanager/TagManager;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/tagmanager/DataLayer;->zza(Lcom/google/android/gms/tagmanager/DataLayer$zzb;)V

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/TagManager;->zzaOT:Lcom/google/android/gms/tagmanager/DataLayer;

    new-instance v1, Lcom/google/android/gms/tagmanager/zzd;

    iget-object v2, p0, Lcom/google/android/gms/tagmanager/TagManager;->mContext:Landroid/content/Context;

    invoke-direct {v1, v2}, Lcom/google/android/gms/tagmanager/zzd;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/tagmanager/DataLayer;->zza(Lcom/google/android/gms/tagmanager/DataLayer$zzb;)V

    new-instance v0, Lcom/google/android/gms/tagmanager/zzs;

    invoke-direct {v0}, Lcom/google/android/gms/tagmanager/zzs;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/TagManager;->zzaRp:Lcom/google/android/gms/tagmanager/zzs;

    invoke-direct {p0}, Lcom/google/android/gms/tagmanager/TagManager;->zzAU()V

    return-void
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/google/android/gms/tagmanager/TagManager;
    .registers 6
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const-class v1, Lcom/google/android/gms/tagmanager/TagManager;

    monitor-enter v1

    :try_start_3
    sget-object v0, Lcom/google/android/gms/tagmanager/TagManager;->zzaSv:Lcom/google/android/gms/tagmanager/TagManager;

    if-nez v0, :cond_31

    if-nez p0, :cond_17

    const-string v0, "TagManager.getInstance requires non-null context."

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->e(Ljava/lang/String;)V

    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    :catchall_14
    move-exception v0

    monitor-exit v1
    :try_end_16
    .catchall {:try_start_3 .. :try_end_16} :catchall_14

    throw v0

    :cond_17
    :try_start_17
    new-instance v0, Lcom/google/android/gms/tagmanager/TagManager$2;

    invoke-direct {v0}, Lcom/google/android/gms/tagmanager/TagManager$2;-><init>()V

    new-instance v2, Lcom/google/android/gms/tagmanager/zzw;

    invoke-direct {v2, p0}, Lcom/google/android/gms/tagmanager/zzw;-><init>(Landroid/content/Context;)V

    new-instance v3, Lcom/google/android/gms/tagmanager/TagManager;

    new-instance v4, Lcom/google/android/gms/tagmanager/DataLayer;

    invoke-direct {v4, v2}, Lcom/google/android/gms/tagmanager/DataLayer;-><init>(Lcom/google/android/gms/tagmanager/DataLayer$zzc;)V

    invoke-static {}, Lcom/google/android/gms/tagmanager/zzcu;->zzAP()Lcom/google/android/gms/tagmanager/zzcu;

    move-result-object v2

    invoke-direct {v3, p0, v0, v4, v2}, Lcom/google/android/gms/tagmanager/TagManager;-><init>(Landroid/content/Context;Lcom/google/android/gms/tagmanager/TagManager$zza;Lcom/google/android/gms/tagmanager/DataLayer;Lcom/google/android/gms/tagmanager/zzct;)V

    sput-object v3, Lcom/google/android/gms/tagmanager/TagManager;->zzaSv:Lcom/google/android/gms/tagmanager/TagManager;

    :cond_31
    sget-object v0, Lcom/google/android/gms/tagmanager/TagManager;->zzaSv:Lcom/google/android/gms/tagmanager/TagManager;

    monitor-exit v1
    :try_end_34
    .catchall {:try_start_17 .. :try_end_34} :catchall_14

    return-object v0
.end method

.method private zzAU()V
    .registers 3

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-lt v0, v1, :cond_10

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/TagManager;->mContext:Landroid/content/Context;

    new-instance v1, Lcom/google/android/gms/tagmanager/TagManager$3;

    invoke-direct {v1, p0}, Lcom/google/android/gms/tagmanager/TagManager$3;-><init>(Lcom/google/android/gms/tagmanager/TagManager;)V

    invoke-virtual {v0, v1}, Landroid/content/Context;->registerComponentCallbacks(Landroid/content/ComponentCallbacks;)V

    :cond_10
    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/tagmanager/TagManager;Ljava/lang/String;)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/google/android/gms/tagmanager/TagManager;->zzeU(Ljava/lang/String;)V

    return-void
.end method

.method private zzeU(Ljava/lang/String;)V
    .registers 4

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/TagManager;->zzaSu:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0}, Ljava/util/concurrent/ConcurrentMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/tagmanager/zzo;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/tagmanager/zzo;->zzew(Ljava/lang/String;)V

    goto :goto_a

    :cond_1a
    return-void
.end method


# virtual methods
.method public dispatch()V
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/TagManager;->zzaSt:Lcom/google/android/gms/tagmanager/zzct;

    invoke-virtual {v0}, Lcom/google/android/gms/tagmanager/zzct;->dispatch()V

    return-void
.end method

.method public getDataLayer()Lcom/google/android/gms/tagmanager/DataLayer;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/TagManager;->zzaOT:Lcom/google/android/gms/tagmanager/DataLayer;

    return-object v0
.end method

.method zza(Lcom/google/android/gms/tagmanager/zzo;)V
    .registers 4

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/TagManager;->zzaSu:Ljava/util/concurrent/ConcurrentMap;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Ljava/util/concurrent/ConcurrentMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method zzb(Lcom/google/android/gms/tagmanager/zzo;)Z
    .registers 3

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/TagManager;->zzaSu:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0, p1}, Ljava/util/concurrent/ConcurrentMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public zzc(Ljava/lang/String;ILjava/lang/String;)Lcom/google/android/gms/common/api/PendingResult;
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Ljava/lang/String;",
            ")",
            "Lcom/google/android/gms/common/api/PendingResult",
            "<",
            "Lcom/google/android/gms/tagmanager/ContainerHolder;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/TagManager;->zzaSs:Lcom/google/android/gms/tagmanager/TagManager$zza;

    iget-object v1, p0, Lcom/google/android/gms/tagmanager/TagManager;->mContext:Landroid/content/Context;

    const/4 v3, 0x0

    iget-object v6, p0, Lcom/google/android/gms/tagmanager/TagManager;->zzaRp:Lcom/google/android/gms/tagmanager/zzs;

    move-object v2, p0

    move-object v4, p1

    move v5, p2

    invoke-interface/range {v0 .. v6}, Lcom/google/android/gms/tagmanager/TagManager$zza;->zza(Landroid/content/Context;Lcom/google/android/gms/tagmanager/TagManager;Landroid/os/Looper;Ljava/lang/String;ILcom/google/android/gms/tagmanager/zzs;)Lcom/google/android/gms/tagmanager/zzp;

    move-result-object v0

    invoke-virtual {v0, p3}, Lcom/google/android/gms/tagmanager/zzp;->load(Ljava/lang/String;)V

    return-object v0
.end method

.method declared-synchronized zzm(Landroid/net/Uri;)Z
    .registers 7

    monitor-enter p0

    :try_start_1
    invoke-static {}, Lcom/google/android/gms/tagmanager/zzcb;->zzAv()Lcom/google/android/gms/tagmanager/zzcb;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/google/android/gms/tagmanager/zzcb;->zzm(Landroid/net/Uri;)Z

    move-result v0

    if-eqz v0, :cond_85

    invoke-virtual {v1}, Lcom/google/android/gms/tagmanager/zzcb;->getContainerId()Ljava/lang/String;

    move-result-object v2

    sget-object v0, Lcom/google/android/gms/tagmanager/TagManager$4;->zzaSx:[I

    invoke-virtual {v1}, Lcom/google/android/gms/tagmanager/zzcb;->zzAw()Lcom/google/android/gms/tagmanager/zzcb$zza;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gms/tagmanager/zzcb$zza;->ordinal()I

    move-result v3

    aget v0, v0, v3
    :try_end_1b
    .catchall {:try_start_1 .. :try_end_1b} :catchall_49

    packed-switch v0, :pswitch_data_88

    :cond_1e
    const/4 v0, 0x1

    :goto_1f
    monitor-exit p0

    return v0

    :pswitch_21
    :try_start_21
    iget-object v0, p0, Lcom/google/android/gms/tagmanager/TagManager;->zzaSu:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0}, Ljava/util/concurrent/ConcurrentMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2b
    :goto_2b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1e

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/tagmanager/zzo;

    invoke-virtual {v0}, Lcom/google/android/gms/tagmanager/zzo;->getContainerId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2b

    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Lcom/google/android/gms/tagmanager/zzo;->zzey(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/google/android/gms/tagmanager/zzo;->refresh()V
    :try_end_48
    .catchall {:try_start_21 .. :try_end_48} :catchall_49

    goto :goto_2b

    :catchall_49
    move-exception v0

    monitor-exit p0

    throw v0

    :pswitch_4c
    :try_start_4c
    iget-object v0, p0, Lcom/google/android/gms/tagmanager/TagManager;->zzaSu:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0}, Ljava/util/concurrent/ConcurrentMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_56
    :goto_56
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1e

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/tagmanager/zzo;

    invoke-virtual {v0}, Lcom/google/android/gms/tagmanager/zzo;->getContainerId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_77

    invoke-virtual {v1}, Lcom/google/android/gms/tagmanager/zzcb;->zzAx()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Lcom/google/android/gms/tagmanager/zzo;->zzey(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/google/android/gms/tagmanager/zzo;->refresh()V

    goto :goto_56

    :cond_77
    invoke-virtual {v0}, Lcom/google/android/gms/tagmanager/zzo;->zzzE()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_56

    const/4 v4, 0x0

    invoke-virtual {v0, v4}, Lcom/google/android/gms/tagmanager/zzo;->zzey(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/google/android/gms/tagmanager/zzo;->refresh()V
    :try_end_84
    .catchall {:try_start_4c .. :try_end_84} :catchall_49

    goto :goto_56

    :cond_85
    const/4 v0, 0x0

    goto :goto_1f

    nop

    :pswitch_data_88
    .packed-switch 0x1
        :pswitch_21
        :pswitch_4c
        :pswitch_4c
    .end packed-switch
.end method
