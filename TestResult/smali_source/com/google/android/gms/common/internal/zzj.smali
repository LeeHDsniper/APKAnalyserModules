.class public abstract Lcom/google/android/gms/common/internal/zzj;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/api/Api$zzb;
.implements Lcom/google/android/gms/common/internal/zzk$zza;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/common/internal/zzj$zzd;,
        Lcom/google/android/gms/common/internal/zzj$zza;,
        Lcom/google/android/gms/common/internal/zzj$zzg;,
        Lcom/google/android/gms/common/internal/zzj$zzi;,
        Lcom/google/android/gms/common/internal/zzj$zzh;,
        Lcom/google/android/gms/common/internal/zzj$zzf;,
        Lcom/google/android/gms/common/internal/zzj$zzc;,
        Lcom/google/android/gms/common/internal/zzj$zzb;,
        Lcom/google/android/gms/common/internal/zzj$zze;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Landroid/os/IInterface;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/common/api/Api$zzb;",
        "Lcom/google/android/gms/common/internal/zzk$zza;"
    }
.end annotation


# static fields
.field public static final zzadF:[Ljava/lang/String;


# instance fields
.field private final mContext:Landroid/content/Context;

.field final mHandler:Landroid/os/Handler;

.field private final zzOY:Landroid/accounts/Account;

.field private final zzYV:Landroid/os/Looper;

.field private final zzZH:Lcom/google/android/gms/common/internal/zzf;

.field private final zzZi:Lcom/google/android/gms/common/GoogleApiAvailability;

.field private final zzZp:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/google/android/gms/common/api/Scope;",
            ">;"
        }
    .end annotation
.end field

.field private zzadA:I

.field private final zzadB:Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;

.field private final zzadC:Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;

.field private final zzadD:I

.field protected zzadE:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final zzadu:Lcom/google/android/gms/common/internal/zzl;

.field private zzadv:Lcom/google/android/gms/common/internal/zzs;

.field private zzadw:Lcom/google/android/gms/common/api/GoogleApiClient$zza;

.field private zzadx:Landroid/os/IInterface;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private final zzady:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/google/android/gms/common/internal/zzj",
            "<TT;>.com/google/android/gms/common/internal/zzj$zzc<*>;>;"
        }
    .end annotation
.end field

.field private zzadz:Lcom/google/android/gms/common/internal/zzj$zze;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/internal/zzj",
            "<TT;>.com/google/android/gms/common/internal/zzj$zze;"
        }
    .end annotation
.end field

.field private final zzpc:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "service_esmobile"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "service_googleme"

    aput-object v2, v0, v1

    sput-object v0, Lcom/google/android/gms/common/internal/zzj;->zzadF:[Ljava/lang/String;

    return-void
.end method

.method protected constructor <init>(Landroid/content/Context;Landroid/os/Looper;ILcom/google/android/gms/common/internal/zzf;Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;)V
    .registers 16

    invoke-static {p1}, Lcom/google/android/gms/common/internal/zzl;->zzak(Landroid/content/Context;)Lcom/google/android/gms/common/internal/zzl;

    move-result-object v3

    invoke-static {}, Lcom/google/android/gms/common/GoogleApiAvailability;->getInstance()Lcom/google/android/gms/common/GoogleApiAvailability;

    move-result-object v4

    invoke-static {p5}, Lcom/google/android/gms/common/internal/zzx;->zzv(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;

    invoke-static {p6}, Lcom/google/android/gms/common/internal/zzx;->zzv(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v5, p3

    move-object v6, p4

    invoke-direct/range {v0 .. v8}, Lcom/google/android/gms/common/internal/zzj;-><init>(Landroid/content/Context;Landroid/os/Looper;Lcom/google/android/gms/common/internal/zzl;Lcom/google/android/gms/common/GoogleApiAvailability;ILcom/google/android/gms/common/internal/zzf;Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;)V

    return-void
.end method

.method protected constructor <init>(Landroid/content/Context;Landroid/os/Looper;Lcom/google/android/gms/common/internal/zzl;Lcom/google/android/gms/common/GoogleApiAvailability;ILcom/google/android/gms/common/internal/zzf;Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;)V
    .registers 11

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/common/internal/zzj;->zzpc:Ljava/lang/Object;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/common/internal/zzj;->zzady:Ljava/util/ArrayList;

    const/4 v0, 0x1

    iput v0, p0, Lcom/google/android/gms/common/internal/zzj;->zzadA:I

    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/gms/common/internal/zzj;->zzadE:Ljava/util/concurrent/atomic/AtomicInteger;

    const-string v0, "Context must not be null"

    invoke-static {p1, v0}, Lcom/google/android/gms/common/internal/zzx;->zzb(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    iput-object v0, p0, Lcom/google/android/gms/common/internal/zzj;->mContext:Landroid/content/Context;

    const-string v0, "Looper must not be null"

    invoke-static {p2, v0}, Lcom/google/android/gms/common/internal/zzx;->zzb(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Looper;

    iput-object v0, p0, Lcom/google/android/gms/common/internal/zzj;->zzYV:Landroid/os/Looper;

    const-string v0, "Supervisor must not be null"

    invoke-static {p3, v0}, Lcom/google/android/gms/common/internal/zzx;->zzb(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/internal/zzl;

    iput-object v0, p0, Lcom/google/android/gms/common/internal/zzj;->zzadu:Lcom/google/android/gms/common/internal/zzl;

    const-string v0, "API availability must not be null"

    invoke-static {p4, v0}, Lcom/google/android/gms/common/internal/zzx;->zzb(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/GoogleApiAvailability;

    iput-object v0, p0, Lcom/google/android/gms/common/internal/zzj;->zzZi:Lcom/google/android/gms/common/GoogleApiAvailability;

    new-instance v0, Lcom/google/android/gms/common/internal/zzj$zzb;

    invoke-direct {v0, p0, p2}, Lcom/google/android/gms/common/internal/zzj$zzb;-><init>(Lcom/google/android/gms/common/internal/zzj;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/google/android/gms/common/internal/zzj;->mHandler:Landroid/os/Handler;

    iput p5, p0, Lcom/google/android/gms/common/internal/zzj;->zzadD:I

    invoke-static {p6}, Lcom/google/android/gms/common/internal/zzx;->zzv(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/internal/zzf;

    iput-object v0, p0, Lcom/google/android/gms/common/internal/zzj;->zzZH:Lcom/google/android/gms/common/internal/zzf;

    invoke-virtual {p6}, Lcom/google/android/gms/common/internal/zzf;->getAccount()Landroid/accounts/Account;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/common/internal/zzj;->zzOY:Landroid/accounts/Account;

    invoke-virtual {p6}, Lcom/google/android/gms/common/internal/zzf;->zzoj()Ljava/util/Set;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/gms/common/internal/zzj;->zzb(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/common/internal/zzj;->zzZp:Ljava/util/Set;

    iput-object p7, p0, Lcom/google/android/gms/common/internal/zzj;->zzadB:Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;

    iput-object p8, p0, Lcom/google/android/gms/common/internal/zzj;->zzadC:Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/common/internal/zzj;)Lcom/google/android/gms/common/api/GoogleApiClient$zza;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/common/internal/zzj;->zzadw:Lcom/google/android/gms/common/api/GoogleApiClient$zza;

    return-object v0
.end method

.method static synthetic zza(Lcom/google/android/gms/common/internal/zzj;Lcom/google/android/gms/common/internal/zzs;)Lcom/google/android/gms/common/internal/zzs;
    .registers 2

    iput-object p1, p0, Lcom/google/android/gms/common/internal/zzj;->zzadv:Lcom/google/android/gms/common/internal/zzs;

    return-object p1
.end method

.method static synthetic zza(Lcom/google/android/gms/common/internal/zzj;ILandroid/os/IInterface;)V
    .registers 3

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/common/internal/zzj;->zzb(ILandroid/os/IInterface;)V

    return-void
.end method

.method private zza(IILandroid/os/IInterface;)Z
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IITT;)Z"
        }
    .end annotation

    iget-object v1, p0, Lcom/google/android/gms/common/internal/zzj;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget v0, p0, Lcom/google/android/gms/common/internal/zzj;->zzadA:I

    if-eq v0, p1, :cond_a

    const/4 v0, 0x0

    monitor-exit v1

    :goto_9
    return v0

    :cond_a
    invoke-direct {p0, p2, p3}, Lcom/google/android/gms/common/internal/zzj;->zzb(ILandroid/os/IInterface;)V

    const/4 v0, 0x1

    monitor-exit v1

    goto :goto_9

    :catchall_10
    move-exception v0

    monitor-exit v1
    :try_end_12
    .catchall {:try_start_3 .. :try_end_12} :catchall_10

    throw v0
.end method

.method static synthetic zza(Lcom/google/android/gms/common/internal/zzj;IILandroid/os/IInterface;)Z
    .registers 5

    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/gms/common/internal/zzj;->zza(IILandroid/os/IInterface;)Z

    move-result v0

    return v0
.end method

.method static synthetic zzb(Lcom/google/android/gms/common/internal/zzj;)Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/common/internal/zzj;->zzadB:Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;

    return-object v0
.end method

.method private zzb(Ljava/util/Set;)Ljava/util/Set;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Lcom/google/android/gms/common/api/Scope;",
            ">;)",
            "Ljava/util/Set",
            "<",
            "Lcom/google/android/gms/common/api/Scope;",
            ">;"
        }
    .end annotation

    invoke-virtual {p0, p1}, Lcom/google/android/gms/common/internal/zzj;->zza(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v1

    if-nez v1, :cond_8

    move-object v0, v1

    :goto_7
    return-object v0

    :cond_8
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_c
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_26

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/api/Scope;

    invoke-interface {p1, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Expanding scopes is not permitted, use implied scopes instead"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_26
    move-object v0, v1

    goto :goto_7
.end method

.method private zzb(ILandroid/os/IInterface;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITT;)V"
        }
    .end annotation

    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x3

    if-ne p1, v2, :cond_1d

    move v3, v0

    :goto_6
    if-eqz p2, :cond_1f

    move v2, v0

    :goto_9
    if-ne v3, v2, :cond_21

    :goto_b
    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzx;->zzZ(Z)V

    iget-object v1, p0, Lcom/google/android/gms/common/internal/zzj;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_11
    iput p1, p0, Lcom/google/android/gms/common/internal/zzj;->zzadA:I

    iput-object p2, p0, Lcom/google/android/gms/common/internal/zzj;->zzadx:Landroid/os/IInterface;

    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/common/internal/zzj;->zzc(ILandroid/os/IInterface;)V

    packed-switch p1, :pswitch_data_32

    :goto_1b
    monitor-exit v1

    return-void

    :cond_1d
    move v3, v1

    goto :goto_6

    :cond_1f
    move v2, v1

    goto :goto_9

    :cond_21
    move v0, v1

    goto :goto_b

    :pswitch_23
    invoke-direct {p0}, Lcom/google/android/gms/common/internal/zzj;->zzov()V

    goto :goto_1b

    :catchall_27
    move-exception v0

    monitor-exit v1
    :try_end_29
    .catchall {:try_start_11 .. :try_end_29} :catchall_27

    throw v0

    :pswitch_2a
    :try_start_2a
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/zzj;->zzou()V

    goto :goto_1b

    :pswitch_2e
    invoke-direct {p0}, Lcom/google/android/gms/common/internal/zzj;->zzow()V
    :try_end_31
    .catchall {:try_start_2a .. :try_end_31} :catchall_27

    goto :goto_1b

    :pswitch_data_32
    .packed-switch 0x1
        :pswitch_2e
        :pswitch_23
        :pswitch_2a
    .end packed-switch
.end method

.method static synthetic zzc(Lcom/google/android/gms/common/internal/zzj;)Ljava/util/ArrayList;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/common/internal/zzj;->zzady:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic zzd(Lcom/google/android/gms/common/internal/zzj;)Ljava/util/Set;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/common/internal/zzj;->zzZp:Ljava/util/Set;

    return-object v0
.end method

.method static synthetic zze(Lcom/google/android/gms/common/internal/zzj;)Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/common/internal/zzj;->zzadC:Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;

    return-object v0
.end method

.method private zzov()V
    .registers 6

    iget-object v0, p0, Lcom/google/android/gms/common/internal/zzj;->zzadz:Lcom/google/android/gms/common/internal/zzj$zze;

    if-eqz v0, :cond_34

    const-string v0, "GmsClient"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Calling connect() while still connected, missing disconnect() for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/zzj;->zzfA()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/google/android/gms/common/internal/zzj;->zzadu:Lcom/google/android/gms/common/internal/zzl;

    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/zzj;->zzfA()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/common/internal/zzj;->zzadz:Lcom/google/android/gms/common/internal/zzj$zze;

    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/zzj;->zzot()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Lcom/google/android/gms/common/internal/zzl;->zzb(Ljava/lang/String;Landroid/content/ServiceConnection;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/common/internal/zzj;->zzadE:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    :cond_34
    new-instance v0, Lcom/google/android/gms/common/internal/zzj$zze;

    iget-object v1, p0, Lcom/google/android/gms/common/internal/zzj;->zzadE:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v1

    invoke-direct {v0, p0, v1}, Lcom/google/android/gms/common/internal/zzj$zze;-><init>(Lcom/google/android/gms/common/internal/zzj;I)V

    iput-object v0, p0, Lcom/google/android/gms/common/internal/zzj;->zzadz:Lcom/google/android/gms/common/internal/zzj$zze;

    iget-object v0, p0, Lcom/google/android/gms/common/internal/zzj;->zzadu:Lcom/google/android/gms/common/internal/zzl;

    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/zzj;->zzfA()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/common/internal/zzj;->zzadz:Lcom/google/android/gms/common/internal/zzj$zze;

    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/zzj;->zzot()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Lcom/google/android/gms/common/internal/zzl;->zza(Ljava/lang/String;Landroid/content/ServiceConnection;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_83

    const-string v0, "GmsClient"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "unable to connect to service: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/zzj;->zzfA()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/google/android/gms/common/internal/zzj;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/google/android/gms/common/internal/zzj;->mHandler:Landroid/os/Handler;

    const/4 v2, 0x3

    iget-object v3, p0, Lcom/google/android/gms/common/internal/zzj;->zzadE:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v3

    const/16 v4, 0x9

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :cond_83
    return-void
.end method

.method private zzow()V
    .registers 5

    iget-object v0, p0, Lcom/google/android/gms/common/internal/zzj;->zzadz:Lcom/google/android/gms/common/internal/zzj$zze;

    if-eqz v0, :cond_16

    iget-object v0, p0, Lcom/google/android/gms/common/internal/zzj;->zzadu:Lcom/google/android/gms/common/internal/zzl;

    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/zzj;->zzfA()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/common/internal/zzj;->zzadz:Lcom/google/android/gms/common/internal/zzj$zze;

    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/zzj;->zzot()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Lcom/google/android/gms/common/internal/zzl;->zzb(Ljava/lang/String;Landroid/content/ServiceConnection;Ljava/lang/String;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/common/internal/zzj;->zzadz:Lcom/google/android/gms/common/internal/zzj$zze;

    :cond_16
    return-void
.end method


# virtual methods
.method public disconnect()V
    .registers 5

    iget-object v0, p0, Lcom/google/android/gms/common/internal/zzj;->zzadE:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    iget-object v2, p0, Lcom/google/android/gms/common/internal/zzj;->zzady:Ljava/util/ArrayList;

    monitor-enter v2

    :try_start_8
    iget-object v0, p0, Lcom/google/android/gms/common/internal/zzj;->zzady:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v0, 0x0

    move v1, v0

    :goto_10
    if-ge v1, v3, :cond_21

    iget-object v0, p0, Lcom/google/android/gms/common/internal/zzj;->zzady:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/internal/zzj$zzc;

    invoke-virtual {v0}, Lcom/google/android/gms/common/internal/zzj$zzc;->zzoG()V

    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_10

    :cond_21
    iget-object v0, p0, Lcom/google/android/gms/common/internal/zzj;->zzady:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    monitor-exit v2
    :try_end_27
    .catchall {:try_start_8 .. :try_end_27} :catchall_2d

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/google/android/gms/common/internal/zzj;->zzb(ILandroid/os/IInterface;)V

    return-void

    :catchall_2d
    move-exception v0

    :try_start_2e
    monitor-exit v2
    :try_end_2f
    .catchall {:try_start_2e .. :try_end_2f} :catchall_2d

    throw v0
.end method

.method public dump(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .registers 9
    .param p1, "prefix"    # Ljava/lang/String;
    .param p2, "fd"    # Ljava/io/FileDescriptor;
    .param p3, "writer"    # Ljava/io/PrintWriter;
    .param p4, "args"    # [Ljava/lang/String;

    .prologue
    .local p0, "this":Lcom/google/android/gms/common/internal/zzj;, "Lcom/google/android/gms/common/internal/zzj<TT;>;"
    iget-object v1, p0, Lcom/google/android/gms/common/internal/zzj;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget v0, p0, Lcom/google/android/gms/common/internal/zzj;->zzadA:I

    iget-object v2, p0, Lcom/google/android/gms/common/internal/zzj;->zzadx:Landroid/os/IInterface;

    monitor-exit v1
    :try_end_8
    .catchall {:try_start_3 .. :try_end_8} :catchall_26

    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object v1

    const-string v3, "mConnectState="

    invoke-virtual {v1, v3}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    packed-switch v0, :pswitch_data_60

    const-string v0, "UNKNOWN"

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    :goto_19
    const-string v0, " mService="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    if-nez v2, :cond_41

    const-string v0, "null"

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    :goto_25
    return-void

    :catchall_26
    move-exception v0

    :try_start_27
    monitor-exit v1
    :try_end_28
    .catchall {:try_start_27 .. :try_end_28} :catchall_26

    throw v0

    :pswitch_29
    const-string v0, "CONNECTING"

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    goto :goto_19

    :pswitch_2f
    const-string v0, "CONNECTED"

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    goto :goto_19

    :pswitch_35
    const-string v0, "DISCONNECTING"

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    goto :goto_19

    :pswitch_3b
    const-string v0, "DISCONNECTED"

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    goto :goto_19

    :cond_41
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/zzj;->zzfB()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object v0

    const-string v1, "@"

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object v0

    invoke-interface {v2}, Landroid/os/IInterface;->asBinder()Landroid/os/IBinder;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto :goto_25

    nop

    :pswitch_data_60
    .packed-switch 0x1
        :pswitch_3b
        :pswitch_29
        :pswitch_2f
        :pswitch_35
    .end packed-switch
.end method

.method public final getContext()Landroid/content/Context;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/common/internal/zzj;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method public final getLooper()Landroid/os/Looper;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/common/internal/zzj;->zzYV:Landroid/os/Looper;

    return-object v0
.end method

.method public isConnected()Z
    .registers 4

    iget-object v1, p0, Lcom/google/android/gms/common/internal/zzj;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget v0, p0, Lcom/google/android/gms/common/internal/zzj;->zzadA:I

    const/4 v2, 0x3

    if-ne v0, v2, :cond_b

    const/4 v0, 0x1

    :goto_9
    monitor-exit v1

    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_9

    :catchall_d
    move-exception v0

    monitor-exit v1
    :try_end_f
    .catchall {:try_start_3 .. :try_end_f} :catchall_d

    throw v0
.end method

.method public isConnecting()Z
    .registers 4

    iget-object v1, p0, Lcom/google/android/gms/common/internal/zzj;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget v0, p0, Lcom/google/android/gms/common/internal/zzj;->zzadA:I

    const/4 v2, 0x2

    if-ne v0, v2, :cond_b

    const/4 v0, 0x1

    :goto_9
    monitor-exit v1

    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_9

    :catchall_d
    move-exception v0

    monitor-exit v1
    :try_end_f
    .catchall {:try_start_3 .. :try_end_f} :catchall_d

    throw v0
.end method

.method protected onConnectionFailed(Lcom/google/android/gms/common/ConnectionResult;)V
    .registers 2
    .param p1, "result"    # Lcom/google/android/gms/common/ConnectionResult;

    .prologue
    .local p0, "this":Lcom/google/android/gms/common/internal/zzj;, "Lcom/google/android/gms/common/internal/zzj<TT;>;"
    return-void
.end method

.method protected onConnectionSuspended(I)V
    .registers 2
    .param p1, "cause"    # I

    .prologue
    .local p0, "this":Lcom/google/android/gms/common/internal/zzj;, "Lcom/google/android/gms/common/internal/zzj<TT;>;"
    return-void
.end method

.method protected abstract zzV(Landroid/os/IBinder;)Landroid/os/IInterface;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/IBinder;",
            ")TT;"
        }
    .end annotation
.end method

.method protected zza(Ljava/util/Set;)Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Lcom/google/android/gms/common/api/Scope;",
            ">;)",
            "Ljava/util/Set",
            "<",
            "Lcom/google/android/gms/common/api/Scope;",
            ">;"
        }
    .end annotation

    return-object p1
.end method

.method protected zza(ILandroid/os/Bundle;I)V
    .registers 9

    iget-object v0, p0, Lcom/google/android/gms/common/internal/zzj;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/google/android/gms/common/internal/zzj;->mHandler:Landroid/os/Handler;

    const/4 v2, 0x5

    const/4 v3, -0x1

    new-instance v4, Lcom/google/android/gms/common/internal/zzj$zzi;

    invoke-direct {v4, p0, p1, p2}, Lcom/google/android/gms/common/internal/zzj$zzi;-><init>(Lcom/google/android/gms/common/internal/zzj;ILandroid/os/Bundle;)V

    invoke-virtual {v1, v2, p3, v3, v4}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method protected zza(ILandroid/os/IBinder;Landroid/os/Bundle;I)V
    .registers 10

    iget-object v0, p0, Lcom/google/android/gms/common/internal/zzj;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/google/android/gms/common/internal/zzj;->mHandler:Landroid/os/Handler;

    const/4 v2, 0x1

    const/4 v3, -0x1

    new-instance v4, Lcom/google/android/gms/common/internal/zzj$zzg;

    invoke-direct {v4, p0, p1, p2, p3}, Lcom/google/android/gms/common/internal/zzj$zzg;-><init>(Lcom/google/android/gms/common/internal/zzj;ILandroid/os/IBinder;Landroid/os/Bundle;)V

    invoke-virtual {v1, v2, p4, v3, v4}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method public zza(Lcom/google/android/gms/common/api/GoogleApiClient$zza;)V
    .registers 4

    const-string v0, "Connection progress callbacks cannot be null."

    invoke-static {p1, v0}, Lcom/google/android/gms/common/internal/zzx;->zzb(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/api/GoogleApiClient$zza;

    iput-object v0, p0, Lcom/google/android/gms/common/internal/zzj;->zzadw:Lcom/google/android/gms/common/api/GoogleApiClient$zza;

    const/4 v0, 0x2

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/google/android/gms/common/internal/zzj;->zzb(ILandroid/os/IInterface;)V

    return-void
.end method

.method public zza(Lcom/google/android/gms/common/internal/zzp;)V
    .registers 6

    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/zzj;->zzoB()Landroid/os/Bundle;

    move-result-object v1

    new-instance v2, Lcom/google/android/gms/common/internal/ValidateAccountRequest;

    iget-object v0, p0, Lcom/google/android/gms/common/internal/zzj;->zzZp:Ljava/util/Set;

    iget-object v3, p0, Lcom/google/android/gms/common/internal/zzj;->zzZp:Ljava/util/Set;

    invoke-interface {v3}, Ljava/util/Set;->size()I

    move-result v3

    new-array v3, v3, [Lcom/google/android/gms/common/api/Scope;

    invoke-interface {v0, v3}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/android/gms/common/api/Scope;

    iget-object v3, p0, Lcom/google/android/gms/common/internal/zzj;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, p1, v0, v3, v1}, Lcom/google/android/gms/common/internal/ValidateAccountRequest;-><init>(Lcom/google/android/gms/common/internal/zzp;[Lcom/google/android/gms/common/api/Scope;Ljava/lang/String;Landroid/os/Bundle;)V

    :try_start_1f
    iget-object v0, p0, Lcom/google/android/gms/common/internal/zzj;->zzadv:Lcom/google/android/gms/common/internal/zzs;

    new-instance v1, Lcom/google/android/gms/common/internal/zzj$zzd;

    iget-object v3, p0, Lcom/google/android/gms/common/internal/zzj;->zzadE:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v3

    invoke-direct {v1, p0, v3}, Lcom/google/android/gms/common/internal/zzj$zzd;-><init>(Lcom/google/android/gms/common/internal/zzj;I)V

    invoke-interface {v0, v1, v2}, Lcom/google/android/gms/common/internal/zzs;->zza(Lcom/google/android/gms/common/internal/zzr;Lcom/google/android/gms/common/internal/ValidateAccountRequest;)V
    :try_end_2f
    .catch Landroid/os/DeadObjectException; {:try_start_1f .. :try_end_2f} :catch_30
    .catch Landroid/os/RemoteException; {:try_start_1f .. :try_end_2f} :catch_3d

    :goto_2f
    return-void

    :catch_30
    move-exception v0

    const-string v0, "GmsClient"

    const-string v1, "service died"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/google/android/gms/common/internal/zzj;->zzbz(I)V

    goto :goto_2f

    :catch_3d
    move-exception v0

    const-string v1, "GmsClient"

    const-string v2, "Remote exception occurred"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2f
.end method

.method public zza(Lcom/google/android/gms/common/internal/zzp;Ljava/util/Set;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/internal/zzp;",
            "Ljava/util/Set",
            "<",
            "Lcom/google/android/gms/common/api/Scope;",
            ">;)V"
        }
    .end annotation

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/zzj;->zzli()Landroid/os/Bundle;

    move-result-object v0

    new-instance v1, Lcom/google/android/gms/common/internal/GetServiceRequest;

    iget v2, p0, Lcom/google/android/gms/common/internal/zzj;->zzadD:I

    invoke-direct {v1, v2}, Lcom/google/android/gms/common/internal/GetServiceRequest;-><init>(I)V

    iget-object v2, p0, Lcom/google/android/gms/common/internal/zzj;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/android/gms/common/internal/GetServiceRequest;->zzck(Ljava/lang/String;)Lcom/google/android/gms/common/internal/GetServiceRequest;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/google/android/gms/common/internal/GetServiceRequest;->zzg(Landroid/os/Bundle;)Lcom/google/android/gms/common/internal/GetServiceRequest;

    move-result-object v0

    if-eqz p2, :cond_1e

    invoke-virtual {v0, p2}, Lcom/google/android/gms/common/internal/GetServiceRequest;->zzd(Ljava/util/Collection;)Lcom/google/android/gms/common/internal/GetServiceRequest;

    :cond_1e
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/zzj;->zzlm()Z

    move-result v1

    if-eqz v1, :cond_40

    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/zzj;->zzog()Landroid/accounts/Account;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/common/internal/GetServiceRequest;->zzb(Landroid/accounts/Account;)Lcom/google/android/gms/common/internal/GetServiceRequest;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/google/android/gms/common/internal/GetServiceRequest;->zzc(Lcom/google/android/gms/common/internal/zzp;)Lcom/google/android/gms/common/internal/GetServiceRequest;

    :cond_2f
    :goto_2f
    iget-object v1, p0, Lcom/google/android/gms/common/internal/zzj;->zzadv:Lcom/google/android/gms/common/internal/zzs;

    new-instance v2, Lcom/google/android/gms/common/internal/zzj$zzd;

    iget-object v3, p0, Lcom/google/android/gms/common/internal/zzj;->zzadE:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v3

    invoke-direct {v2, p0, v3}, Lcom/google/android/gms/common/internal/zzj$zzd;-><init>(Lcom/google/android/gms/common/internal/zzj;I)V

    invoke-interface {v1, v2, v0}, Lcom/google/android/gms/common/internal/zzs;->zza(Lcom/google/android/gms/common/internal/zzr;Lcom/google/android/gms/common/internal/GetServiceRequest;)V

    :goto_3f
    return-void

    :cond_40
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/zzj;->zzoC()Z

    move-result v1

    if-eqz v1, :cond_2f

    iget-object v1, p0, Lcom/google/android/gms/common/internal/zzj;->zzOY:Landroid/accounts/Account;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/common/internal/GetServiceRequest;->zzb(Landroid/accounts/Account;)Lcom/google/android/gms/common/internal/GetServiceRequest;
    :try_end_4b
    .catch Landroid/os/DeadObjectException; {:try_start_0 .. :try_end_4b} :catch_4c
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_4b} :catch_59

    goto :goto_2f

    :catch_4c
    move-exception v0

    const-string v0, "GmsClient"

    const-string v1, "service died"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/google/android/gms/common/internal/zzj;->zzbz(I)V

    goto :goto_3f

    :catch_59
    move-exception v0

    const-string v1, "GmsClient"

    const-string v2, "Remote exception occurred"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_3f
.end method

.method protected zzbA(I)V
    .registers 7

    iget-object v0, p0, Lcom/google/android/gms/common/internal/zzj;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/google/android/gms/common/internal/zzj;->mHandler:Landroid/os/Handler;

    const/4 v2, 0x6

    const/4 v3, -0x1

    new-instance v4, Lcom/google/android/gms/common/internal/zzj$zzh;

    invoke-direct {v4, p0}, Lcom/google/android/gms/common/internal/zzj$zzh;-><init>(Lcom/google/android/gms/common/internal/zzj;)V

    invoke-virtual {v1, v2, p1, v3, v4}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method public zzbz(I)V
    .registers 6

    iget-object v0, p0, Lcom/google/android/gms/common/internal/zzj;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/google/android/gms/common/internal/zzj;->mHandler:Landroid/os/Handler;

    const/4 v2, 0x4

    iget-object v3, p0, Lcom/google/android/gms/common/internal/zzj;->zzadE:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v3

    invoke-virtual {v1, v2, v3, p1}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method protected zzc(ILandroid/os/IInterface;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITT;)V"
        }
    .end annotation

    return-void
.end method

.method protected abstract zzfA()Ljava/lang/String;
.end method

.method protected abstract zzfB()Ljava/lang/String;
.end method

.method protected zzli()Landroid/os/Bundle;
    .registers 2

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    return-object v0
.end method

.method public zzlm()Z
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public zzmw()Landroid/os/Bundle;
    .registers 2

    const/4 v0, 0x0

    return-object v0
.end method

.method public final zzoA()Landroid/os/IInterface;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/DeadObjectException;
        }
    .end annotation

    iget-object v1, p0, Lcom/google/android/gms/common/internal/zzj;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget v0, p0, Lcom/google/android/gms/common/internal/zzj;->zzadA:I

    const/4 v2, 0x4

    if-ne v0, v2, :cond_11

    new-instance v0, Landroid/os/DeadObjectException;

    invoke-direct {v0}, Landroid/os/DeadObjectException;-><init>()V

    throw v0

    :catchall_e
    move-exception v0

    monitor-exit v1
    :try_end_10
    .catchall {:try_start_3 .. :try_end_10} :catchall_e

    throw v0

    :cond_11
    :try_start_11
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/zzj;->zzoz()V

    iget-object v0, p0, Lcom/google/android/gms/common/internal/zzj;->zzadx:Landroid/os/IInterface;

    if-eqz v0, :cond_22

    const/4 v0, 0x1

    :goto_19
    const-string v2, "Client is connected but service is null"

    invoke-static {v0, v2}, Lcom/google/android/gms/common/internal/zzx;->zza(ZLjava/lang/Object;)V

    iget-object v0, p0, Lcom/google/android/gms/common/internal/zzj;->zzadx:Landroid/os/IInterface;

    monitor-exit v1
    :try_end_21
    .catchall {:try_start_11 .. :try_end_21} :catchall_e

    return-object v0

    :cond_22
    const/4 v0, 0x0

    goto :goto_19
.end method

.method protected zzoB()Landroid/os/Bundle;
    .registers 2

    const/4 v0, 0x0

    return-object v0
.end method

.method public zzoC()Z
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public final zzog()Landroid/accounts/Account;
    .registers 4

    iget-object v0, p0, Lcom/google/android/gms/common/internal/zzj;->zzOY:Landroid/accounts/Account;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/google/android/gms/common/internal/zzj;->zzOY:Landroid/accounts/Account;

    :goto_6
    return-object v0

    :cond_7
    new-instance v0, Landroid/accounts/Account;

    const-string v1, "<<default account>>"

    const-string v2, "com.google"

    invoke-direct {v0, v1, v2}, Landroid/accounts/Account;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_6
.end method

.method protected final zzot()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/common/internal/zzj;->zzZH:Lcom/google/android/gms/common/internal/zzf;

    invoke-virtual {v0}, Lcom/google/android/gms/common/internal/zzf;->zzom()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected zzou()V
    .registers 1

    return-void
.end method

.method public zzox()V
    .registers 6

    iget-object v0, p0, Lcom/google/android/gms/common/internal/zzj;->zzZi:Lcom/google/android/gms/common/GoogleApiAvailability;

    iget-object v1, p0, Lcom/google/android/gms/common/internal/zzj;->mContext:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/common/GoogleApiAvailability;->isGooglePlayServicesAvailable(Landroid/content/Context;)I

    move-result v0

    if-eqz v0, :cond_29

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-direct {p0, v1, v2}, Lcom/google/android/gms/common/internal/zzj;->zzb(ILandroid/os/IInterface;)V

    new-instance v1, Lcom/google/android/gms/common/internal/zzj$zzf;

    invoke-direct {v1, p0}, Lcom/google/android/gms/common/internal/zzj$zzf;-><init>(Lcom/google/android/gms/common/internal/zzj;)V

    iput-object v1, p0, Lcom/google/android/gms/common/internal/zzj;->zzadw:Lcom/google/android/gms/common/api/GoogleApiClient$zza;

    iget-object v1, p0, Lcom/google/android/gms/common/internal/zzj;->mHandler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/google/android/gms/common/internal/zzj;->mHandler:Landroid/os/Handler;

    const/4 v3, 0x3

    iget-object v4, p0, Lcom/google/android/gms/common/internal/zzj;->zzadE:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v4

    invoke-virtual {v2, v3, v4, v0}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :goto_28
    return-void

    :cond_29
    new-instance v0, Lcom/google/android/gms/common/internal/zzj$zzf;

    invoke-direct {v0, p0}, Lcom/google/android/gms/common/internal/zzj$zzf;-><init>(Lcom/google/android/gms/common/internal/zzj;)V

    invoke-virtual {p0, v0}, Lcom/google/android/gms/common/internal/zzj;->zza(Lcom/google/android/gms/common/api/GoogleApiClient$zza;)V

    goto :goto_28
.end method

.method protected final zzoz()V
    .registers 3

    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/zzj;->isConnected()Z

    move-result v0

    if-nez v0, :cond_e

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Not connected. Call connect() and wait for onConnected() to be called."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_e
    return-void
.end method
