.class final Lcom/google/android/gms/common/api/zzi;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/api/GoogleApiClient;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/common/api/zzi$zzb;,
        Lcom/google/android/gms/common/api/zzi$zza;,
        Lcom/google/android/gms/common/api/zzi$zzc;,
        Lcom/google/android/gms/common/api/zzi$zze;,
        Lcom/google/android/gms/common/api/zzi$zzd;
    }
.end annotation


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final zzYV:Landroid/os/Looper;

.field final zzZH:Lcom/google/android/gms/common/internal/zzf;

.field final zzZI:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/google/android/gms/common/api/Api",
            "<*>;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private final zzZX:Ljava/util/concurrent/locks/Condition;

.field final zzZY:Lcom/google/android/gms/common/internal/zzk;

.field final zzZZ:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Lcom/google/android/gms/common/api/zzi$zze",
            "<*>;>;"
        }
    .end annotation
.end field

.field private final zzZf:I

.field private final zzZg:I

.field private final zzZi:Lcom/google/android/gms/common/GoogleApiAvailability;

.field final zzZj:Lcom/google/android/gms/common/api/Api$zza;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/Api$zza",
            "<+",
            "Lcom/google/android/gms/signin/zzd;",
            "Lcom/google/android/gms/signin/zze;",
            ">;"
        }
    .end annotation
.end field

.field private final zzZs:Ljava/util/concurrent/locks/Lock;

.field private volatile zzaaa:Z

.field private zzaab:J

.field private zzaac:J

.field private final zzaad:Lcom/google/android/gms/common/api/zzi$zza;

.field zzaae:Landroid/content/BroadcastReceiver;

.field final zzaaf:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/google/android/gms/common/api/Api$zzc",
            "<*>;",
            "Lcom/google/android/gms/common/api/Api$zzb;",
            ">;"
        }
    .end annotation
.end field

.field final zzaag:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/google/android/gms/common/api/Api$zzc",
            "<*>;",
            "Lcom/google/android/gms/common/ConnectionResult;",
            ">;"
        }
    .end annotation
.end field

.field zzaah:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/google/android/gms/common/api/Scope;",
            ">;"
        }
    .end annotation
.end field

.field private volatile zzaai:Lcom/google/android/gms/common/api/zzj;

.field private zzaaj:Lcom/google/android/gms/common/ConnectionResult;

.field private final zzaak:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/google/android/gms/common/api/zzl",
            "<*>;>;"
        }
    .end annotation
.end field

.field final zzaal:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/google/android/gms/common/api/zzi$zze",
            "<*>;>;"
        }
    .end annotation
.end field

.field private final zzaam:Lcom/google/android/gms/common/api/zzi$zzd;

.field private final zzaan:Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;

.field private final zzaao:Lcom/google/android/gms/common/internal/zzk$zza;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/os/Looper;Lcom/google/android/gms/common/internal/zzf;Lcom/google/android/gms/common/GoogleApiAvailability;Lcom/google/android/gms/common/api/Api$zza;Ljava/util/Map;Ljava/util/ArrayList;Ljava/util/ArrayList;II)V
    .registers 23
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/os/Looper;",
            "Lcom/google/android/gms/common/internal/zzf;",
            "Lcom/google/android/gms/common/GoogleApiAvailability;",
            "Lcom/google/android/gms/common/api/Api$zza",
            "<+",
            "Lcom/google/android/gms/signin/zzd;",
            "Lcom/google/android/gms/signin/zze;",
            ">;",
            "Ljava/util/Map",
            "<",
            "Lcom/google/android/gms/common/api/Api",
            "<*>;",
            "Lcom/google/android/gms/common/api/Api$ApiOptions;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;",
            ">;II)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v2, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v2}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v2, p0, Lcom/google/android/gms/common/api/zzi;->zzZs:Ljava/util/concurrent/locks/Lock;

    new-instance v2, Ljava/util/LinkedList;

    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    iput-object v2, p0, Lcom/google/android/gms/common/api/zzi;->zzZZ:Ljava/util/Queue;

    const-wide/32 v2, 0x1d4c0

    iput-wide v2, p0, Lcom/google/android/gms/common/api/zzi;->zzaab:J

    const-wide/16 v2, 0x1388

    iput-wide v2, p0, Lcom/google/android/gms/common/api/zzi;->zzaac:J

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    iput-object v2, p0, Lcom/google/android/gms/common/api/zzi;->zzaaf:Ljava/util/Map;

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    iput-object v2, p0, Lcom/google/android/gms/common/api/zzi;->zzaag:Ljava/util/Map;

    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    iput-object v2, p0, Lcom/google/android/gms/common/api/zzi;->zzaah:Ljava/util/Set;

    const/4 v2, 0x0

    iput-object v2, p0, Lcom/google/android/gms/common/api/zzi;->zzaaj:Lcom/google/android/gms/common/ConnectionResult;

    new-instance v2, Ljava/util/WeakHashMap;

    invoke-direct {v2}, Ljava/util/WeakHashMap;-><init>()V

    invoke-static {v2}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object v2

    iput-object v2, p0, Lcom/google/android/gms/common/api/zzi;->zzaak:Ljava/util/Set;

    new-instance v2, Ljava/util/concurrent/ConcurrentHashMap;

    const/16 v3, 0x10

    const/high16 v4, 0x3f400000

    const/4 v5, 0x2

    invoke-direct {v2, v3, v4, v5}, Ljava/util/concurrent/ConcurrentHashMap;-><init>(IFI)V

    invoke-static {v2}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object v2

    iput-object v2, p0, Lcom/google/android/gms/common/api/zzi;->zzaal:Ljava/util/Set;

    new-instance v2, Lcom/google/android/gms/common/api/zzi$1;

    invoke-direct {v2, p0}, Lcom/google/android/gms/common/api/zzi$1;-><init>(Lcom/google/android/gms/common/api/zzi;)V

    iput-object v2, p0, Lcom/google/android/gms/common/api/zzi;->zzaam:Lcom/google/android/gms/common/api/zzi$zzd;

    new-instance v2, Lcom/google/android/gms/common/api/zzi$2;

    invoke-direct {v2, p0}, Lcom/google/android/gms/common/api/zzi$2;-><init>(Lcom/google/android/gms/common/api/zzi;)V

    iput-object v2, p0, Lcom/google/android/gms/common/api/zzi;->zzaan:Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;

    new-instance v2, Lcom/google/android/gms/common/api/zzi$3;

    invoke-direct {v2, p0}, Lcom/google/android/gms/common/api/zzi$3;-><init>(Lcom/google/android/gms/common/api/zzi;)V

    iput-object v2, p0, Lcom/google/android/gms/common/api/zzi;->zzaao:Lcom/google/android/gms/common/internal/zzk$zza;

    iput-object p1, p0, Lcom/google/android/gms/common/api/zzi;->mContext:Landroid/content/Context;

    new-instance v2, Lcom/google/android/gms/common/internal/zzk;

    iget-object v3, p0, Lcom/google/android/gms/common/api/zzi;->zzaao:Lcom/google/android/gms/common/internal/zzk$zza;

    invoke-direct {v2, p2, v3}, Lcom/google/android/gms/common/internal/zzk;-><init>(Landroid/os/Looper;Lcom/google/android/gms/common/internal/zzk$zza;)V

    iput-object v2, p0, Lcom/google/android/gms/common/api/zzi;->zzZY:Lcom/google/android/gms/common/internal/zzk;

    iput-object p2, p0, Lcom/google/android/gms/common/api/zzi;->zzYV:Landroid/os/Looper;

    new-instance v2, Lcom/google/android/gms/common/api/zzi$zza;

    invoke-direct {v2, p0, p2}, Lcom/google/android/gms/common/api/zzi$zza;-><init>(Lcom/google/android/gms/common/api/zzi;Landroid/os/Looper;)V

    iput-object v2, p0, Lcom/google/android/gms/common/api/zzi;->zzaad:Lcom/google/android/gms/common/api/zzi$zza;

    move-object/from16 v0, p4

    iput-object v0, p0, Lcom/google/android/gms/common/api/zzi;->zzZi:Lcom/google/android/gms/common/GoogleApiAvailability;

    move/from16 v0, p9

    iput v0, p0, Lcom/google/android/gms/common/api/zzi;->zzZf:I

    move/from16 v0, p10

    iput v0, p0, Lcom/google/android/gms/common/api/zzi;->zzZg:I

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    iput-object v2, p0, Lcom/google/android/gms/common/api/zzi;->zzZI:Ljava/util/Map;

    iget-object v2, p0, Lcom/google/android/gms/common/api/zzi;->zzZs:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->newCondition()Ljava/util/concurrent/locks/Condition;

    move-result-object v2

    iput-object v2, p0, Lcom/google/android/gms/common/api/zzi;->zzZX:Ljava/util/concurrent/locks/Condition;

    new-instance v2, Lcom/google/android/gms/common/api/zzh;

    invoke-direct {v2, p0}, Lcom/google/android/gms/common/api/zzh;-><init>(Lcom/google/android/gms/common/api/zzi;)V

    iput-object v2, p0, Lcom/google/android/gms/common/api/zzi;->zzaai:Lcom/google/android/gms/common/api/zzj;

    invoke-virtual/range {p7 .. p7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_9c
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_ae

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;

    iget-object v4, p0, Lcom/google/android/gms/common/api/zzi;->zzZY:Lcom/google/android/gms/common/internal/zzk;

    invoke-virtual {v4, v2}, Lcom/google/android/gms/common/internal/zzk;->registerConnectionCallbacks(Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;)V

    goto :goto_9c

    :cond_ae
    invoke-virtual/range {p8 .. p8}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_b2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_c4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;

    iget-object v4, p0, Lcom/google/android/gms/common/api/zzi;->zzZY:Lcom/google/android/gms/common/internal/zzk;

    invoke-virtual {v4, v2}, Lcom/google/android/gms/common/internal/zzk;->registerConnectionFailedListener(Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;)V

    goto :goto_b2

    :cond_c4
    invoke-virtual {p3}, Lcom/google/android/gms/common/internal/zzf;->zzok()Ljava/util/Map;

    move-result-object v10

    invoke-interface/range {p6 .. p6}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_d0
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_134

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v9, v2

    check-cast v9, Lcom/google/android/gms/common/api/Api;

    move-object/from16 v0, p6

    invoke-interface {v0, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    const/4 v2, 0x0

    invoke-interface {v10, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_13b

    invoke-interface {v10, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/common/internal/zzf$zza;

    iget-boolean v2, v2, Lcom/google/android/gms/common/internal/zzf$zza;->zzadg:Z

    if-eqz v2, :cond_120

    const/4 v2, 0x1

    :goto_f5
    move v4, v2

    :goto_f6
    iget-object v2, p0, Lcom/google/android/gms/common/api/zzi;->zzZI:Ljava/util/Map;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v2, v9, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v9}, Lcom/google/android/gms/common/api/Api;->zzne()Z

    move-result v2

    if-eqz v2, :cond_122

    invoke-virtual {v9}, Lcom/google/android/gms/common/api/Api;->zznc()Lcom/google/android/gms/common/api/Api$zze;

    move-result-object v2

    iget-object v7, p0, Lcom/google/android/gms/common/api/zzi;->zzaan:Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;

    invoke-direct {p0, v9, v4}, Lcom/google/android/gms/common/api/zzi;->zza(Lcom/google/android/gms/common/api/Api;I)Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;

    move-result-object v8

    move-object v4, p1

    move-object v5, p2

    move-object v6, p3

    invoke-static/range {v2 .. v8}, Lcom/google/android/gms/common/api/zzi;->zza(Lcom/google/android/gms/common/api/Api$zze;Ljava/lang/Object;Landroid/content/Context;Landroid/os/Looper;Lcom/google/android/gms/common/internal/zzf;Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;)Lcom/google/android/gms/common/internal/zzac;

    move-result-object v2

    :goto_116
    iget-object v3, p0, Lcom/google/android/gms/common/api/zzi;->zzaaf:Ljava/util/Map;

    invoke-virtual {v9}, Lcom/google/android/gms/common/api/Api;->zznd()Lcom/google/android/gms/common/api/Api$zzc;

    move-result-object v4

    invoke-interface {v3, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_d0

    :cond_120
    const/4 v2, 0x2

    goto :goto_f5

    :cond_122
    invoke-virtual {v9}, Lcom/google/android/gms/common/api/Api;->zznb()Lcom/google/android/gms/common/api/Api$zza;

    move-result-object v2

    iget-object v7, p0, Lcom/google/android/gms/common/api/zzi;->zzaan:Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;

    invoke-direct {p0, v9, v4}, Lcom/google/android/gms/common/api/zzi;->zza(Lcom/google/android/gms/common/api/Api;I)Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;

    move-result-object v8

    move-object v4, p1

    move-object v5, p2

    move-object v6, p3

    invoke-static/range {v2 .. v8}, Lcom/google/android/gms/common/api/zzi;->zza(Lcom/google/android/gms/common/api/Api$zza;Ljava/lang/Object;Landroid/content/Context;Landroid/os/Looper;Lcom/google/android/gms/common/internal/zzf;Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;)Lcom/google/android/gms/common/api/Api$zzb;

    move-result-object v2

    goto :goto_116

    :cond_134
    iput-object p3, p0, Lcom/google/android/gms/common/api/zzi;->zzZH:Lcom/google/android/gms/common/internal/zzf;

    move-object/from16 v0, p5

    iput-object v0, p0, Lcom/google/android/gms/common/api/zzi;->zzZj:Lcom/google/android/gms/common/api/Api$zza;

    return-void

    :cond_13b
    move v4, v2

    goto :goto_f6
.end method

.method private resume()V
    .registers 3

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzi;->zzZs:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    :try_start_5
    invoke-virtual {p0}, Lcom/google/android/gms/common/api/zzi;->zznB()Z

    move-result v0

    if-eqz v0, :cond_e

    invoke-virtual {p0}, Lcom/google/android/gms/common/api/zzi;->connect()V
    :try_end_e
    .catchall {:try_start_5 .. :try_end_e} :catchall_14

    :cond_e
    iget-object v0, p0, Lcom/google/android/gms/common/api/zzi;->zzZs:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :catchall_14
    move-exception v0

    iget-object v1, p0, Lcom/google/android/gms/common/api/zzi;->zzZs:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method private static zza(Lcom/google/android/gms/common/api/Api$zza;Ljava/lang/Object;Landroid/content/Context;Landroid/os/Looper;Lcom/google/android/gms/common/internal/zzf;Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;)Lcom/google/android/gms/common/api/Api$zzb;
    .registers 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<C::",
            "Lcom/google/android/gms/common/api/Api$zzb;",
            "O:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/android/gms/common/api/Api$zza",
            "<TC;TO;>;",
            "Ljava/lang/Object;",
            "Landroid/content/Context;",
            "Landroid/os/Looper;",
            "Lcom/google/android/gms/common/internal/zzf;",
            "Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;",
            "Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;",
            ")TC;"
        }
    .end annotation

    move-object v0, p0

    move-object v1, p2

    move-object v2, p3

    move-object v3, p4

    move-object v4, p1

    move-object v5, p5

    move-object v6, p6

    invoke-virtual/range {v0 .. v6}, Lcom/google/android/gms/common/api/Api$zza;->zza(Landroid/content/Context;Landroid/os/Looper;Lcom/google/android/gms/common/internal/zzf;Ljava/lang/Object;Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;)Lcom/google/android/gms/common/api/Api$zzb;

    move-result-object v0

    return-object v0
.end method

.method private final zza(Lcom/google/android/gms/common/api/Api;I)Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/Api",
            "<*>;I)",
            "Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;"
        }
    .end annotation

    new-instance v0, Lcom/google/android/gms/common/api/zzi$4;

    invoke-direct {v0, p0, p1, p2}, Lcom/google/android/gms/common/api/zzi$4;-><init>(Lcom/google/android/gms/common/api/zzi;Lcom/google/android/gms/common/api/Api;I)V

    return-object v0
.end method

.method private static zza(Lcom/google/android/gms/common/api/Api$zze;Ljava/lang/Object;Landroid/content/Context;Landroid/os/Looper;Lcom/google/android/gms/common/internal/zzf;Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;)Lcom/google/android/gms/common/internal/zzac;
    .registers 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<C::",
            "Lcom/google/android/gms/common/api/Api$zzd;",
            "O:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/android/gms/common/api/Api$zze",
            "<TC;TO;>;",
            "Ljava/lang/Object;",
            "Landroid/content/Context;",
            "Landroid/os/Looper;",
            "Lcom/google/android/gms/common/internal/zzf;",
            "Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;",
            "Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;",
            ")",
            "Lcom/google/android/gms/common/internal/zzac;"
        }
    .end annotation

    new-instance v0, Lcom/google/android/gms/common/internal/zzac;

    invoke-interface {p0}, Lcom/google/android/gms/common/api/Api$zze;->zznf()I

    move-result v3

    invoke-interface {p0, p1}, Lcom/google/android/gms/common/api/Api$zze;->zzm(Ljava/lang/Object;)Lcom/google/android/gms/common/api/Api$zzd;

    move-result-object v7

    move-object v1, p2

    move-object v2, p3

    move-object v4, p5

    move-object v5, p6

    move-object v6, p4

    invoke-direct/range {v0 .. v7}, Lcom/google/android/gms/common/internal/zzac;-><init>(Landroid/content/Context;Landroid/os/Looper;ILcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;Lcom/google/android/gms/common/internal/zzf;Lcom/google/android/gms/common/api/Api$zzd;)V

    return-object v0
.end method

.method static synthetic zza(Lcom/google/android/gms/common/api/zzi;)Ljava/util/concurrent/locks/Lock;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzi;->zzZs:Ljava/util/concurrent/locks/Lock;

    return-object v0
.end method

.method static synthetic zzb(Lcom/google/android/gms/common/api/zzi;)Lcom/google/android/gms/common/api/zzj;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzi;->zzaai:Lcom/google/android/gms/common/api/zzj;

    return-object v0
.end method

.method static synthetic zzc(Lcom/google/android/gms/common/api/zzi;)V
    .registers 1

    invoke-direct {p0}, Lcom/google/android/gms/common/api/zzi;->resume()V

    return-void
.end method

.method static synthetic zzd(Lcom/google/android/gms/common/api/zzi;)V
    .registers 1

    invoke-direct {p0}, Lcom/google/android/gms/common/api/zzi;->zznC()V

    return-void
.end method

.method private zznC()V
    .registers 3

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzi;->zzZs:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    :try_start_5
    invoke-virtual {p0}, Lcom/google/android/gms/common/api/zzi;->zznE()Z

    move-result v0

    if-eqz v0, :cond_e

    invoke-virtual {p0}, Lcom/google/android/gms/common/api/zzi;->connect()V
    :try_end_e
    .catchall {:try_start_5 .. :try_end_e} :catchall_14

    :cond_e
    iget-object v0, p0, Lcom/google/android/gms/common/api/zzi;->zzZs:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :catchall_14
    move-exception v0

    iget-object v1, p0, Lcom/google/android/gms/common/api/zzi;->zzZs:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method


# virtual methods
.method public connect()V
    .registers 3

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzi;->zzZs:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    :try_start_5
    iget-object v0, p0, Lcom/google/android/gms/common/api/zzi;->zzaai:Lcom/google/android/gms/common/api/zzj;

    invoke-interface {v0}, Lcom/google/android/gms/common/api/zzj;->connect()V
    :try_end_a
    .catchall {:try_start_5 .. :try_end_a} :catchall_10

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzi;->zzZs:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :catchall_10
    move-exception v0

    iget-object v1, p0, Lcom/google/android/gms/common/api/zzi;->zzZs:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method public disconnect()V
    .registers 3

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzi;->zzZs:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    :try_start_5
    invoke-virtual {p0}, Lcom/google/android/gms/common/api/zzi;->zznE()Z

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzi;->zzaai:Lcom/google/android/gms/common/api/zzj;

    invoke-interface {v0}, Lcom/google/android/gms/common/api/zzj;->disconnect()V
    :try_end_d
    .catchall {:try_start_5 .. :try_end_d} :catchall_13

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzi;->zzZs:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :catchall_13
    move-exception v0

    iget-object v1, p0, Lcom/google/android/gms/common/api/zzi;->zzZs:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method public dump(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .registers 10
    .param p1, "prefix"    # Ljava/lang/String;
    .param p2, "fd"    # Ljava/io/FileDescriptor;
    .param p3, "writer"    # Ljava/io/PrintWriter;
    .param p4, "args"    # [Ljava/lang/String;

    .prologue
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object v0

    const-string v1, "mState="

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/common/api/zzi;->zzaai:Lcom/google/android/gms/common/api/zzj;

    invoke-interface {v1}, Lcom/google/android/gms/common/api/zzj;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    const-string v0, " mResuming="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object v0

    iget-boolean v1, p0, Lcom/google/android/gms/common/api/zzi;->zzaaa:Z

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->print(Z)V

    const-string v0, " mWorkQueue.size()="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/common/api/zzi;->zzZZ:Ljava/util/Queue;

    invoke-interface {v1}, Ljava/util/Queue;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->print(I)V

    const-string v0, " mUnconsumedRunners.size()="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/common/api/zzi;->zzaal:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(I)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "  "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzi;->zzZI:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_59
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_86

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/api/Api;

    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object v3

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/Api;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object v3

    const-string v4, ":"

    invoke-virtual {v3, v4}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/google/android/gms/common/api/zzi;->zzaaf:Ljava/util/Map;

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/Api;->zznd()Lcom/google/android/gms/common/api/Api$zzc;

    move-result-object v0

    invoke-interface {v3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/api/Api$zzb;

    invoke-interface {v0, v1, p2, p3, p4}, Lcom/google/android/gms/common/api/Api$zzb;->dump(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V

    goto :goto_59

    :cond_86
    return-void
.end method

.method public getLooper()Landroid/os/Looper;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzi;->zzYV:Landroid/os/Looper;

    return-object v0
.end method

.method public getSessionId()I
    .registers 2

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public isConnected()Z
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzi;->zzaai:Lcom/google/android/gms/common/api/zzj;

    instance-of v0, v0, Lcom/google/android/gms/common/api/zzf;

    return v0
.end method

.method public isConnecting()Z
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzi;->zzaai:Lcom/google/android/gms/common/api/zzj;

    instance-of v0, v0, Lcom/google/android/gms/common/api/zzg;

    return v0
.end method

.method public registerConnectionCallbacks(Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;)V
    .registers 3
    .param p1, "listener"    # Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/common/api/zzi;->zzZY:Lcom/google/android/gms/common/internal/zzk;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/common/internal/zzk;->registerConnectionCallbacks(Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;)V

    return-void
.end method

.method public registerConnectionFailedListener(Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;)V
    .registers 3
    .param p1, "listener"    # Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/common/api/zzi;->zzZY:Lcom/google/android/gms/common/internal/zzk;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/common/internal/zzk;->registerConnectionFailedListener(Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;)V

    return-void
.end method

.method public unregisterConnectionCallbacks(Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;)V
    .registers 3
    .param p1, "listener"    # Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/common/api/zzi;->zzZY:Lcom/google/android/gms/common/internal/zzk;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/common/internal/zzk;->unregisterConnectionCallbacks(Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;)V

    return-void
.end method

.method public unregisterConnectionFailedListener(Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;)V
    .registers 3
    .param p1, "listener"    # Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/common/api/zzi;->zzZY:Lcom/google/android/gms/common/internal/zzk;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/common/internal/zzk;->unregisterConnectionFailedListener(Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;)V

    return-void
.end method

.method public zza(Lcom/google/android/gms/common/api/Api$zzc;)Lcom/google/android/gms/common/api/Api$zzb;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<C::",
            "Lcom/google/android/gms/common/api/Api$zzb;",
            ">(",
            "Lcom/google/android/gms/common/api/Api$zzc",
            "<TC;>;)TC;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzi;->zzaaf:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/api/Api$zzb;

    const-string v1, "Appropriate Api was not requested."

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/zzx;->zzb(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method

.method public zza(Lcom/google/android/gms/common/api/zzc$zza;)Lcom/google/android/gms/common/api/zzc$zza;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<A::",
            "Lcom/google/android/gms/common/api/Api$zzb;",
            "R::",
            "Lcom/google/android/gms/common/api/Result;",
            "T:",
            "Lcom/google/android/gms/common/api/zzc$zza",
            "<TR;TA;>;>(TT;)TT;"
        }
    .end annotation

    invoke-virtual {p1}, Lcom/google/android/gms/common/api/zzc$zza;->zznd()Lcom/google/android/gms/common/api/Api$zzc;

    move-result-object v0

    if-eqz v0, :cond_2c

    const/4 v0, 0x1

    :goto_7
    const-string v1, "This task can not be enqueued (it\'s probably a Batch or malformed)"

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/zzx;->zzb(ZLjava/lang/Object;)V

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzi;->zzaaf:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/google/android/gms/common/api/zzc$zza;->zznd()Lcom/google/android/gms/common/api/Api$zzc;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    const-string v1, "GoogleApiClient is not configured to use the API required for this call."

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/zzx;->zzb(ZLjava/lang/Object;)V

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzi;->zzZs:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    :try_start_20
    iget-object v0, p0, Lcom/google/android/gms/common/api/zzi;->zzaai:Lcom/google/android/gms/common/api/zzj;

    invoke-interface {v0, p1}, Lcom/google/android/gms/common/api/zzj;->zza(Lcom/google/android/gms/common/api/zzc$zza;)Lcom/google/android/gms/common/api/zzc$zza;
    :try_end_25
    .catchall {:try_start_20 .. :try_end_25} :catchall_2e

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/common/api/zzi;->zzZs:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-object v0

    :cond_2c
    const/4 v0, 0x0

    goto :goto_7

    :catchall_2e
    move-exception v0

    iget-object v1, p0, Lcom/google/android/gms/common/api/zzi;->zzZs:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method zza(Lcom/google/android/gms/common/api/zzi$zzb;)V
    .registers 4

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzi;->zzaad:Lcom/google/android/gms/common/api/zzi$zza;

    const/4 v1, 0x3

    invoke-virtual {v0, v1, p1}, Lcom/google/android/gms/common/api/zzi$zza;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/common/api/zzi;->zzaad:Lcom/google/android/gms/common/api/zzi$zza;

    invoke-virtual {v1, v0}, Lcom/google/android/gms/common/api/zzi$zza;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method zza(Ljava/lang/RuntimeException;)V
    .registers 4

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzi;->zzaad:Lcom/google/android/gms/common/api/zzi$zza;

    const/4 v1, 0x4

    invoke-virtual {v0, v1, p1}, Lcom/google/android/gms/common/api/zzi$zza;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/common/api/zzi;->zzaad:Lcom/google/android/gms/common/api/zzi$zza;

    invoke-virtual {v1, v0}, Lcom/google/android/gms/common/api/zzi$zza;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method zzb(Lcom/google/android/gms/common/api/zzi$zze;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<A::",
            "Lcom/google/android/gms/common/api/Api$zzb;",
            ">(",
            "Lcom/google/android/gms/common/api/zzi$zze",
            "<TA;>;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzi;->zzaal:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzi;->zzaam:Lcom/google/android/gms/common/api/zzi$zzd;

    invoke-interface {p1, v0}, Lcom/google/android/gms/common/api/zzi$zze;->zza(Lcom/google/android/gms/common/api/zzi$zzd;)V

    return-void
.end method

.method zzg(Lcom/google/android/gms/common/ConnectionResult;)V
    .registers 4

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzi;->zzZs:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    :try_start_5
    iput-object p1, p0, Lcom/google/android/gms/common/api/zzi;->zzaaj:Lcom/google/android/gms/common/ConnectionResult;

    new-instance v0, Lcom/google/android/gms/common/api/zzh;

    invoke-direct {v0, p0}, Lcom/google/android/gms/common/api/zzh;-><init>(Lcom/google/android/gms/common/api/zzi;)V

    iput-object v0, p0, Lcom/google/android/gms/common/api/zzi;->zzaai:Lcom/google/android/gms/common/api/zzj;

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzi;->zzaai:Lcom/google/android/gms/common/api/zzj;

    invoke-interface {v0}, Lcom/google/android/gms/common/api/zzj;->begin()V

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzi;->zzZX:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Condition;->signalAll()V
    :try_end_18
    .catchall {:try_start_5 .. :try_end_18} :catchall_1e

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzi;->zzZs:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :catchall_1e
    move-exception v0

    iget-object v1, p0, Lcom/google/android/gms/common/api/zzi;->zzZs:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method zznA()V
    .registers 3

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzi;->zzZs:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    :try_start_5
    invoke-virtual {p0}, Lcom/google/android/gms/common/api/zzi;->zznE()Z

    new-instance v0, Lcom/google/android/gms/common/api/zzf;

    invoke-direct {v0, p0}, Lcom/google/android/gms/common/api/zzf;-><init>(Lcom/google/android/gms/common/api/zzi;)V

    iput-object v0, p0, Lcom/google/android/gms/common/api/zzi;->zzaai:Lcom/google/android/gms/common/api/zzj;

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzi;->zzaai:Lcom/google/android/gms/common/api/zzj;

    invoke-interface {v0}, Lcom/google/android/gms/common/api/zzj;->begin()V

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzi;->zzZX:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Condition;->signalAll()V
    :try_end_19
    .catchall {:try_start_5 .. :try_end_19} :catchall_1f

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzi;->zzZs:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :catchall_1f
    move-exception v0

    iget-object v1, p0, Lcom/google/android/gms/common/api/zzi;->zzZs:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method zznB()Z
    .registers 2

    iget-boolean v0, p0, Lcom/google/android/gms/common/api/zzi;->zzaaa:Z

    return v0
.end method

.method zznD()V
    .registers 5

    const/4 v3, 0x1

    invoke-virtual {p0}, Lcom/google/android/gms/common/api/zzi;->zznB()Z

    move-result v0

    if-eqz v0, :cond_8

    :goto_7
    return-void

    :cond_8
    iput-boolean v3, p0, Lcom/google/android/gms/common/api/zzi;->zzaaa:Z

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzi;->zzaae:Landroid/content/BroadcastReceiver;

    if-nez v0, :cond_2c

    new-instance v0, Lcom/google/android/gms/common/api/zzi$zzc;

    invoke-direct {v0, p0}, Lcom/google/android/gms/common/api/zzi$zzc;-><init>(Lcom/google/android/gms/common/api/zzi;)V

    iput-object v0, p0, Lcom/google/android/gms/common/api/zzi;->zzaae:Landroid/content/BroadcastReceiver;

    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.PACKAGE_ADDED"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const-string v1, "package"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addDataScheme(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/google/android/gms/common/api/zzi;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/common/api/zzi;->zzaae:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    :cond_2c
    iget-object v0, p0, Lcom/google/android/gms/common/api/zzi;->zzaad:Lcom/google/android/gms/common/api/zzi$zza;

    iget-object v1, p0, Lcom/google/android/gms/common/api/zzi;->zzaad:Lcom/google/android/gms/common/api/zzi$zza;

    invoke-virtual {v1, v3}, Lcom/google/android/gms/common/api/zzi$zza;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    iget-wide v2, p0, Lcom/google/android/gms/common/api/zzi;->zzaab:J

    invoke-virtual {v0, v1, v2, v3}, Lcom/google/android/gms/common/api/zzi$zza;->sendMessageDelayed(Landroid/os/Message;J)Z

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzi;->zzaad:Lcom/google/android/gms/common/api/zzi$zza;

    iget-object v1, p0, Lcom/google/android/gms/common/api/zzi;->zzaad:Lcom/google/android/gms/common/api/zzi$zza;

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Lcom/google/android/gms/common/api/zzi$zza;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    iget-wide v2, p0, Lcom/google/android/gms/common/api/zzi;->zzaac:J

    invoke-virtual {v0, v1, v2, v3}, Lcom/google/android/gms/common/api/zzi$zza;->sendMessageDelayed(Landroid/os/Message;J)Z

    goto :goto_7
.end method

.method zznE()Z
    .registers 4

    const/4 v1, 0x1

    const/4 v0, 0x0

    invoke-virtual {p0}, Lcom/google/android/gms/common/api/zzi;->zznB()Z

    move-result v2

    if-nez v2, :cond_9

    :goto_8
    return v0

    :cond_9
    iput-boolean v0, p0, Lcom/google/android/gms/common/api/zzi;->zzaaa:Z

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzi;->zzaad:Lcom/google/android/gms/common/api/zzi$zza;

    const/4 v2, 0x2

    invoke-virtual {v0, v2}, Lcom/google/android/gms/common/api/zzi$zza;->removeMessages(I)V

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzi;->zzaad:Lcom/google/android/gms/common/api/zzi$zza;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/common/api/zzi$zza;->removeMessages(I)V

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzi;->zzaae:Landroid/content/BroadcastReceiver;

    if-eqz v0, :cond_28

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzi;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v2, p0, Lcom/google/android/gms/common/api/zzi;->zzaae:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v2}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/common/api/zzi;->zzaae:Landroid/content/BroadcastReceiver;

    :cond_28
    move v0, v1

    goto :goto_8
.end method

.method zznx()V
    .registers 4

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzi;->zzaal:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/api/zzi$zze;

    const/4 v2, 0x0

    invoke-interface {v0, v2}, Lcom/google/android/gms/common/api/zzi$zze;->zza(Lcom/google/android/gms/common/api/zzi$zzd;)V

    invoke-interface {v0}, Lcom/google/android/gms/common/api/zzi$zze;->cancel()V

    goto :goto_6

    :cond_1a
    iget-object v0, p0, Lcom/google/android/gms/common/api/zzi;->zzaal:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzi;->zzaak:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_25
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_35

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/api/zzl;

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/zzl;->clear()V

    goto :goto_25

    :cond_35
    iget-object v0, p0, Lcom/google/android/gms/common/api/zzi;->zzaak:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    return-void
.end method

.method zzny()V
    .registers 3

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzi;->zzaaf:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/api/Api$zzb;

    invoke-interface {v0}, Lcom/google/android/gms/common/api/Api$zzb;->disconnect()V

    goto :goto_a

    :cond_1a
    return-void
.end method

.method zznz()V
    .registers 9

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzi;->zzZs:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    :try_start_5
    new-instance v0, Lcom/google/android/gms/common/api/zzg;

    iget-object v2, p0, Lcom/google/android/gms/common/api/zzi;->zzZH:Lcom/google/android/gms/common/internal/zzf;

    iget-object v3, p0, Lcom/google/android/gms/common/api/zzi;->zzZI:Ljava/util/Map;

    iget-object v4, p0, Lcom/google/android/gms/common/api/zzi;->zzZi:Lcom/google/android/gms/common/GoogleApiAvailability;

    iget-object v5, p0, Lcom/google/android/gms/common/api/zzi;->zzZj:Lcom/google/android/gms/common/api/Api$zza;

    iget-object v6, p0, Lcom/google/android/gms/common/api/zzi;->zzZs:Ljava/util/concurrent/locks/Lock;

    iget-object v7, p0, Lcom/google/android/gms/common/api/zzi;->mContext:Landroid/content/Context;

    move-object v1, p0

    invoke-direct/range {v0 .. v7}, Lcom/google/android/gms/common/api/zzg;-><init>(Lcom/google/android/gms/common/api/zzi;Lcom/google/android/gms/common/internal/zzf;Ljava/util/Map;Lcom/google/android/gms/common/GoogleApiAvailability;Lcom/google/android/gms/common/api/Api$zza;Ljava/util/concurrent/locks/Lock;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/google/android/gms/common/api/zzi;->zzaai:Lcom/google/android/gms/common/api/zzj;

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzi;->zzaai:Lcom/google/android/gms/common/api/zzj;

    invoke-interface {v0}, Lcom/google/android/gms/common/api/zzj;->begin()V

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzi;->zzZX:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Condition;->signalAll()V
    :try_end_23
    .catchall {:try_start_5 .. :try_end_23} :catchall_29

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzi;->zzZs:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :catchall_29
    move-exception v0

    iget-object v1, p0, Lcom/google/android/gms/common/api/zzi;->zzZs:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method
