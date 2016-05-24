.class public Lcom/google/android/gms/internal/zzhl;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzhs$zzb;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation


# instance fields
.field private mContext:Landroid/content/Context;

.field private zzFr:Z

.field private zzFs:Z

.field private final zzGY:Ljava/lang/String;

.field private final zzGZ:Lcom/google/android/gms/internal/zzhm;

.field private zzHa:Ljava/math/BigInteger;

.field private final zzHb:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Lcom/google/android/gms/internal/zzhk;",
            ">;"
        }
    .end annotation
.end field

.field private final zzHc:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/zzho;",
            ">;"
        }
    .end annotation
.end field

.field private zzHd:Z

.field private zzHe:I

.field private zzHf:Lcom/google/android/gms/internal/zzca;

.field private zzHg:Lcom/google/android/gms/internal/zzbk;

.field private final zzHh:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Ljava/lang/Thread;",
            ">;"
        }
    .end annotation
.end field

.field private zzHi:Ljava/lang/Boolean;

.field private zzHj:Ljava/lang/String;

.field private zzHk:Z

.field private zzou:Lcom/google/android/gms/internal/zzay;

.field private zzpa:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

.field private final zzpc:Ljava/lang/Object;

.field private zzpr:Z

.field private zzrP:Lcom/google/android/gms/internal/zzbj;

.field private zzrQ:Lcom/google/android/gms/internal/zzbi;

.field private final zzrR:Lcom/google/android/gms/internal/zzgj;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzhu;)V
    .registers 6

    const/4 v3, 0x1

    const/4 v2, 0x0

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzhl;->zzpc:Ljava/lang/Object;

    sget-object v0, Ljava/math/BigInteger;->ONE:Ljava/math/BigInteger;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzhl;->zzHa:Ljava/math/BigInteger;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzhl;->zzHb:Ljava/util/HashSet;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzhl;->zzHc:Ljava/util/HashMap;

    iput-boolean v2, p0, Lcom/google/android/gms/internal/zzhl;->zzHd:Z

    iput-boolean v3, p0, Lcom/google/android/gms/internal/zzhl;->zzFr:Z

    iput v2, p0, Lcom/google/android/gms/internal/zzhl;->zzHe:I

    iput-boolean v2, p0, Lcom/google/android/gms/internal/zzhl;->zzpr:Z

    iput-object v1, p0, Lcom/google/android/gms/internal/zzhl;->zzHf:Lcom/google/android/gms/internal/zzca;

    iput-boolean v3, p0, Lcom/google/android/gms/internal/zzhl;->zzFs:Z

    iput-object v1, p0, Lcom/google/android/gms/internal/zzhl;->zzrP:Lcom/google/android/gms/internal/zzbj;

    iput-object v1, p0, Lcom/google/android/gms/internal/zzhl;->zzHg:Lcom/google/android/gms/internal/zzbk;

    iput-object v1, p0, Lcom/google/android/gms/internal/zzhl;->zzrQ:Lcom/google/android/gms/internal/zzbi;

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzhl;->zzHh:Ljava/util/LinkedList;

    iput-object v1, p0, Lcom/google/android/gms/internal/zzhl;->zzrR:Lcom/google/android/gms/internal/zzgj;

    iput-object v1, p0, Lcom/google/android/gms/internal/zzhl;->zzHi:Ljava/lang/Boolean;

    iput-boolean v2, p0, Lcom/google/android/gms/internal/zzhl;->zzHk:Z

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzhu;->zzgs()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzhl;->zzGY:Ljava/lang/String;

    new-instance v0, Lcom/google/android/gms/internal/zzhm;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhl;->zzGY:Ljava/lang/String;

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/zzhm;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzhl;->zzGZ:Lcom/google/android/gms/internal/zzhm;

    return-void
.end method


# virtual methods
.method public getSessionId()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzhl;->zzGY:Ljava/lang/String;

    return-object v0
.end method

.method public zzA(Z)V
    .registers 4

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhl;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iput-boolean p1, p0, Lcom/google/android/gms/internal/zzhl;->zzFs:Z

    monitor-exit v1

    return-void

    :catchall_7
    move-exception v0

    monitor-exit v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v0
.end method

.method public zzB(Z)V
    .registers 4

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhl;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iput-boolean p1, p0, Lcom/google/android/gms/internal/zzhl;->zzHk:Z

    monitor-exit v1

    return-void

    :catchall_7
    move-exception v0

    monitor-exit v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v0
.end method

.method public zzF(Landroid/content/Context;)Lcom/google/android/gms/internal/zzbk;
    .registers 11

    const/4 v1, 0x0

    sget-object v0, Lcom/google/android/gms/internal/zzby;->zzuE:Lcom/google/android/gms/internal/zzbu;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzbu;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1b

    invoke-static {}, Lcom/google/android/gms/internal/zzlv;->zzpR()Z

    move-result v0

    if-eqz v0, :cond_1b

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzhl;->zzfZ()Z

    move-result v0

    if-eqz v0, :cond_1d

    :cond_1b
    move-object v0, v1

    :goto_1c
    return-object v0

    :cond_1d
    iget-object v2, p0, Lcom/google/android/gms/internal/zzhl;->zzpc:Ljava/lang/Object;

    monitor-enter v2

    :try_start_20
    iget-object v0, p0, Lcom/google/android/gms/internal/zzhl;->zzrP:Lcom/google/android/gms/internal/zzbj;

    if-nez v0, :cond_3a

    instance-of v0, p1, Landroid/app/Activity;

    if-nez v0, :cond_2b

    monitor-exit v2

    move-object v0, v1

    goto :goto_1c

    :cond_2b
    new-instance v1, Lcom/google/android/gms/internal/zzbj;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Application;

    check-cast p1, Landroid/app/Activity;

    invoke-direct {v1, v0, p1}, Lcom/google/android/gms/internal/zzbj;-><init>(Landroid/app/Application;Landroid/app/Activity;)V

    iput-object v1, p0, Lcom/google/android/gms/internal/zzhl;->zzrP:Lcom/google/android/gms/internal/zzbj;

    :cond_3a
    iget-object v0, p0, Lcom/google/android/gms/internal/zzhl;->zzrQ:Lcom/google/android/gms/internal/zzbi;

    if-nez v0, :cond_45

    new-instance v0, Lcom/google/android/gms/internal/zzbi;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzbi;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzhl;->zzrQ:Lcom/google/android/gms/internal/zzbi;

    :cond_45
    iget-object v0, p0, Lcom/google/android/gms/internal/zzhl;->zzHg:Lcom/google/android/gms/internal/zzbk;

    if-nez v0, :cond_5f

    new-instance v0, Lcom/google/android/gms/internal/zzbk;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhl;->zzrP:Lcom/google/android/gms/internal/zzbj;

    iget-object v3, p0, Lcom/google/android/gms/internal/zzhl;->zzrQ:Lcom/google/android/gms/internal/zzbi;

    new-instance v4, Lcom/google/android/gms/internal/zzgj;

    iget-object v5, p0, Lcom/google/android/gms/internal/zzhl;->mContext:Landroid/content/Context;

    iget-object v6, p0, Lcom/google/android/gms/internal/zzhl;->zzpa:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-direct {v4, v5, v6, v7, v8}, Lcom/google/android/gms/internal/zzgj;-><init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Ljava/lang/Thread$UncaughtExceptionHandler;Ljava/lang/Thread$UncaughtExceptionHandler;)V

    invoke-direct {v0, v1, v3, v4}, Lcom/google/android/gms/internal/zzbk;-><init>(Lcom/google/android/gms/internal/zzbj;Lcom/google/android/gms/internal/zzbi;Lcom/google/android/gms/internal/zzgj;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzhl;->zzHg:Lcom/google/android/gms/internal/zzbk;

    :cond_5f
    iget-object v0, p0, Lcom/google/android/gms/internal/zzhl;->zzHg:Lcom/google/android/gms/internal/zzbk;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzbk;->zzct()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzhl;->zzHg:Lcom/google/android/gms/internal/zzbk;

    monitor-exit v2

    goto :goto_1c

    :catchall_68
    move-exception v0

    monitor-exit v2
    :try_end_6a
    .catchall {:try_start_20 .. :try_end_6a} :catchall_68

    throw v0
.end method

.method public zza(Landroid/content/Context;Lcom/google/android/gms/internal/zzhn;Ljava/lang/String;)Landroid/os/Bundle;
    .registers 10

    iget-object v2, p0, Lcom/google/android/gms/internal/zzhl;->zzpc:Ljava/lang/Object;

    monitor-enter v2

    :try_start_3
    new-instance v3, Landroid/os/Bundle;

    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    const-string v0, "app"

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhl;->zzGZ:Lcom/google/android/gms/internal/zzhm;

    invoke-virtual {v1, p1, p3}, Lcom/google/android/gms/internal/zzhm;->zze(Landroid/content/Context;Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    invoke-virtual {v3, v0, v1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    new-instance v4, Landroid/os/Bundle;

    invoke-direct {v4}, Landroid/os/Bundle;-><init>()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzhl;->zzHc:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_22
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_41

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhl;->zzHc:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/zzho;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzho;->toBundle()Landroid/os/Bundle;

    move-result-object v1

    invoke-virtual {v4, v0, v1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    goto :goto_22

    :catchall_3e
    move-exception v0

    monitor-exit v2
    :try_end_40
    .catchall {:try_start_3 .. :try_end_40} :catchall_3e

    throw v0

    :cond_41
    :try_start_41
    const-string v0, "slots"

    invoke-virtual {v3, v0, v4}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzhl;->zzHb:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_51
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_65

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzhk;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzhk;->toBundle()Landroid/os/Bundle;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_51

    :cond_65
    const-string v0, "ads"

    invoke-virtual {v3, v0, v1}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzhl;->zzHb:Ljava/util/HashSet;

    invoke-interface {p2, v0}, Lcom/google/android/gms/internal/zzhn;->zza(Ljava/util/HashSet;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzhl;->zzHb:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->clear()V

    monitor-exit v2
    :try_end_75
    .catchall {:try_start_41 .. :try_end_75} :catchall_3e

    return-object v3
.end method

.method public zza(Landroid/content/Context;Z)Ljava/util/concurrent/Future;
    .registers 5

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhl;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzhl;->zzFr:Z

    if-eq p2, v0, :cond_f

    iput-boolean p2, p0, Lcom/google/android/gms/internal/zzhl;->zzFr:Z

    invoke-static {p1, p2}, Lcom/google/android/gms/internal/zzhs;->zza(Landroid/content/Context;Z)Ljava/util/concurrent/Future;

    move-result-object v0

    monitor-exit v1

    :goto_e
    return-object v0

    :cond_f
    const/4 v0, 0x0

    monitor-exit v1

    goto :goto_e

    :catchall_12
    move-exception v0

    monitor-exit v1
    :try_end_14
    .catchall {:try_start_3 .. :try_end_14} :catchall_12

    throw v0
.end method

.method public zza(Lcom/google/android/gms/internal/zzhk;)V
    .registers 4

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhl;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzhl;->zzHb:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    monitor-exit v1

    return-void

    :catchall_a
    move-exception v0

    monitor-exit v1
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_a

    throw v0
.end method

.method public zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzho;)V
    .registers 5

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhl;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzhl;->zzHc:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit v1

    return-void

    :catchall_a
    move-exception v0

    monitor-exit v1
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_a

    throw v0
.end method

.method public zza(Ljava/lang/Thread;)V
    .registers 4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzhl;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhl;->zzpa:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    invoke-static {v0, p1, v1}, Lcom/google/android/gms/internal/zzgj;->zza(Landroid/content/Context;Ljava/lang/Thread;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;)Lcom/google/android/gms/internal/zzgj;

    return-void
.end method

.method public zzb(Landroid/content/Context;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;)V
    .registers 11

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhl;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzhl;->zzpr:Z

    if-nez v0, :cond_57

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzhl;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzhl;->zzpa:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    invoke-static {p1, p0}, Lcom/google/android/gms/internal/zzhs;->zza(Landroid/content/Context;Lcom/google/android/gms/internal/zzhs$zzb;)Ljava/util/concurrent/Future;

    invoke-static {p1, p0}, Lcom/google/android/gms/internal/zzhs;->zzb(Landroid/content/Context;Lcom/google/android/gms/internal/zzhs$zzb;)Ljava/util/concurrent/Future;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzhl;->zza(Ljava/lang/Thread;)V

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbx()Lcom/google/android/gms/internal/zzhu;

    move-result-object v0

    iget-object v2, p2, Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;->zzIz:Ljava/lang/String;

    invoke-virtual {v0, p1, v2}, Lcom/google/android/gms/internal/zzhu;->zzf(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzhl;->zzHj:Ljava/lang/String;

    new-instance v2, Lcom/google/android/gms/internal/zzay;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    iget-object v4, p0, Lcom/google/android/gms/internal/zzhl;->zzpa:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    new-instance v5, Lcom/google/android/gms/internal/zzdv;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v6

    iget-object v7, p0, Lcom/google/android/gms/internal/zzhl;->zzpa:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    sget-object v0, Lcom/google/android/gms/internal/zzby;->zztW:Lcom/google/android/gms/internal/zzbu;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzbu;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-direct {v5, v6, v7, v0}, Lcom/google/android/gms/internal/zzdv;-><init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Ljava/lang/String;)V

    invoke-direct {v2, v3, v4, v5}, Lcom/google/android/gms/internal/zzay;-><init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Lcom/google/android/gms/internal/zzdv;)V

    iput-object v2, p0, Lcom/google/android/gms/internal/zzhl;->zzou:Lcom/google/android/gms/internal/zzay;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzhl;->zzgk()V

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbH()Lcom/google/android/gms/ads/internal/purchase/zzi;

    move-result-object v0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzhl;->mContext:Landroid/content/Context;

    invoke-virtual {v0, v2}, Lcom/google/android/gms/ads/internal/purchase/zzi;->zzy(Landroid/content/Context;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzhl;->zzpr:Z

    :cond_57
    monitor-exit v1

    return-void

    :catchall_59
    move-exception v0

    monitor-exit v1
    :try_end_5b
    .catchall {:try_start_3 .. :try_end_5b} :catchall_59

    throw v0
.end method

.method public zzb(Ljava/lang/Boolean;)V
    .registers 4

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhl;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iput-object p1, p0, Lcom/google/android/gms/internal/zzhl;->zzHi:Ljava/lang/Boolean;

    monitor-exit v1

    return-void

    :catchall_7
    move-exception v0

    monitor-exit v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v0
.end method

.method public zzb(Ljava/util/HashSet;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashSet",
            "<",
            "Lcom/google/android/gms/internal/zzhk;",
            ">;)V"
        }
    .end annotation

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhl;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzhl;->zzHb:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->addAll(Ljava/util/Collection;)Z

    monitor-exit v1

    return-void

    :catchall_a
    move-exception v0

    monitor-exit v1
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_a

    throw v0
.end method

.method public zzc(ILjava/lang/String;)Ljava/lang/String;
    .registers 4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzhl;->zzpa:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    iget-boolean v0, v0, Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;->zzIC:Z

    if-eqz v0, :cond_f

    iget-object v0, p0, Lcom/google/android/gms/internal/zzhl;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    :goto_c
    if-nez v0, :cond_16

    :goto_e
    return-object p2

    :cond_f
    iget-object v0, p0, Lcom/google/android/gms/internal/zzhl;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/google/android/gms/common/GooglePlayServicesUtil;->getRemoteResource(Landroid/content/Context;)Landroid/content/res/Resources;

    move-result-object v0

    goto :goto_c

    :cond_16
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p2

    goto :goto_e
.end method

.method public zzc(Ljava/lang/Throwable;Z)V
    .registers 7

    const/4 v3, 0x0

    new-instance v0, Lcom/google/android/gms/internal/zzgj;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhl;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzhl;->zzpa:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    invoke-direct {v0, v1, v2, v3, v3}, Lcom/google/android/gms/internal/zzgj;-><init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Ljava/lang/Thread$UncaughtExceptionHandler;Ljava/lang/Thread$UncaughtExceptionHandler;)V

    invoke-virtual {v0, p1, p2}, Lcom/google/android/gms/internal/zzgj;->zza(Ljava/lang/Throwable;Z)V

    return-void
.end method

.method public zzd(Landroid/os/Bundle;)V
    .registers 4

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhl;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    const-string v0, "use_https"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_25

    const-string v0, "use_https"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    :goto_11
    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzhl;->zzFr:Z

    const-string v0, "webview_cache_version"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_28

    const-string v0, "webview_cache_version"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    :goto_21
    iput v0, p0, Lcom/google/android/gms/internal/zzhl;->zzHe:I

    monitor-exit v1

    return-void

    :cond_25
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzhl;->zzFr:Z

    goto :goto_11

    :cond_28
    iget v0, p0, Lcom/google/android/gms/internal/zzhl;->zzHe:I

    goto :goto_21

    :catchall_2b
    move-exception v0

    monitor-exit v1
    :try_end_2d
    .catchall {:try_start_3 .. :try_end_2d} :catchall_2b

    throw v0
.end method

.method public zzfZ()Z
    .registers 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhl;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzhl;->zzFs:Z

    monitor-exit v1

    return v0

    :catchall_7
    move-exception v0

    monitor-exit v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v0
.end method

.method public zzga()Ljava/lang/String;
    .registers 5

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhl;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzhl;->zzHa:Ljava/math/BigInteger;

    invoke-virtual {v0}, Ljava/math/BigInteger;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzhl;->zzHa:Ljava/math/BigInteger;

    sget-object v3, Ljava/math/BigInteger;->ONE:Ljava/math/BigInteger;

    invoke-virtual {v2, v3}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v2

    iput-object v2, p0, Lcom/google/android/gms/internal/zzhl;->zzHa:Ljava/math/BigInteger;

    monitor-exit v1

    return-object v0

    :catchall_15
    move-exception v0

    monitor-exit v1
    :try_end_17
    .catchall {:try_start_3 .. :try_end_17} :catchall_15

    throw v0
.end method

.method public zzgb()Lcom/google/android/gms/internal/zzhm;
    .registers 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhl;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzhl;->zzGZ:Lcom/google/android/gms/internal/zzhm;

    monitor-exit v1

    return-object v0

    :catchall_7
    move-exception v0

    monitor-exit v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v0
.end method

.method public zzgc()Lcom/google/android/gms/internal/zzca;
    .registers 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhl;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzhl;->zzHf:Lcom/google/android/gms/internal/zzca;

    monitor-exit v1

    return-object v0

    :catchall_7
    move-exception v0

    monitor-exit v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v0
.end method

.method public zzgd()Z
    .registers 4

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhl;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzhl;->zzHd:Z

    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/google/android/gms/internal/zzhl;->zzHd:Z

    monitor-exit v1

    return v0

    :catchall_a
    move-exception v0

    monitor-exit v1
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_a

    throw v0
.end method

.method public zzge()Z
    .registers 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhl;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzhl;->zzFr:Z

    monitor-exit v1

    return v0

    :catchall_7
    move-exception v0

    monitor-exit v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v0
.end method

.method public zzgf()Ljava/lang/String;
    .registers 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhl;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzhl;->zzHj:Ljava/lang/String;

    monitor-exit v1

    return-object v0

    :catchall_7
    move-exception v0

    monitor-exit v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v0
.end method

.method public zzgg()Ljava/lang/Boolean;
    .registers 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhl;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzhl;->zzHi:Ljava/lang/Boolean;

    monitor-exit v1

    return-object v0

    :catchall_7
    move-exception v0

    monitor-exit v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v0
.end method

.method public zzgh()Lcom/google/android/gms/internal/zzay;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzhl;->zzou:Lcom/google/android/gms/internal/zzay;

    return-object v0
.end method

.method public zzgi()Z
    .registers 4

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhl;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget v2, p0, Lcom/google/android/gms/internal/zzhl;->zzHe:I

    sget-object v0, Lcom/google/android/gms/internal/zzby;->zzuS:Lcom/google/android/gms/internal/zzbu;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzbu;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ge v2, v0, :cond_2b

    sget-object v0, Lcom/google/android/gms/internal/zzby;->zzuS:Lcom/google/android/gms/internal/zzbu;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzbu;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/zzhl;->zzHe:I

    iget-object v0, p0, Lcom/google/android/gms/internal/zzhl;->mContext:Landroid/content/Context;

    iget v2, p0, Lcom/google/android/gms/internal/zzhl;->zzHe:I

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/zzhs;->zza(Landroid/content/Context;I)Ljava/util/concurrent/Future;

    const/4 v0, 0x1

    monitor-exit v1

    :goto_2a
    return v0

    :cond_2b
    const/4 v0, 0x0

    monitor-exit v1

    goto :goto_2a

    :catchall_2e
    move-exception v0

    monitor-exit v1
    :try_end_30
    .catchall {:try_start_3 .. :try_end_30} :catchall_2e

    throw v0
.end method

.method public zzgj()Z
    .registers 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhl;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzhl;->zzHk:Z

    monitor-exit v1

    return v0

    :catchall_7
    move-exception v0

    monitor-exit v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v0
.end method

.method zzgk()V
    .registers 4

    new-instance v0, Lcom/google/android/gms/internal/zzbz;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhl;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzhl;->zzpa:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;->zzIz:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/internal/zzbz;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    :try_start_b
    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbC()Lcom/google/android/gms/internal/zzcb;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/google/android/gms/internal/zzcb;->zza(Lcom/google/android/gms/internal/zzbz;)Lcom/google/android/gms/internal/zzca;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzhl;->zzHf:Lcom/google/android/gms/internal/zzca;
    :try_end_15
    .catch Ljava/lang/IllegalArgumentException; {:try_start_b .. :try_end_15} :catch_16

    :goto_15
    return-void

    :catch_16
    move-exception v0

    const-string v1, "Cannot initialize CSI reporter."

    invoke-static {v1, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_15
.end method
