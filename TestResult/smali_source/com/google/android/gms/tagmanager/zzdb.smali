.class Lcom/google/android/gms/tagmanager/zzdb;
.super Lcom/google/android/gms/tagmanager/zzak;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/tagmanager/zzdb$zza;
    }
.end annotation


# static fields
.field private static final ID:Ljava/lang/String;

.field private static final NAME:Ljava/lang/String;

.field private static final zzaSA:Ljava/lang/String;

.field private static final zzaSy:Ljava/lang/String;

.field private static final zzaSz:Ljava/lang/String;


# instance fields
.field private final mContext:Landroid/content/Context;

.field private mHandler:Landroid/os/Handler;

.field private zzaOT:Lcom/google/android/gms/tagmanager/DataLayer;

.field private zzaSB:Z

.field private zzaSC:Z

.field private final zzaSD:Landroid/os/HandlerThread;

.field private final zzaSE:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-object v0, Lcom/google/android/gms/internal/zzad;->zzcQ:Lcom/google/android/gms/internal/zzad;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzad;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/tagmanager/zzdb;->ID:Ljava/lang/String;

    sget-object v0, Lcom/google/android/gms/internal/zzae;->zzfR:Lcom/google/android/gms/internal/zzae;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzae;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/tagmanager/zzdb;->NAME:Ljava/lang/String;

    sget-object v0, Lcom/google/android/gms/internal/zzae;->zzfw:Lcom/google/android/gms/internal/zzae;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzae;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/tagmanager/zzdb;->zzaSy:Ljava/lang/String;

    sget-object v0, Lcom/google/android/gms/internal/zzae;->zzfE:Lcom/google/android/gms/internal/zzae;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzae;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/tagmanager/zzdb;->zzaSz:Ljava/lang/String;

    sget-object v0, Lcom/google/android/gms/internal/zzae;->zzhv:Lcom/google/android/gms/internal/zzae;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzae;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/tagmanager/zzdb;->zzaSA:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/tagmanager/DataLayer;)V
    .registers 7

    sget-object v0, Lcom/google/android/gms/tagmanager/zzdb;->ID:Ljava/lang/String;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    sget-object v3, Lcom/google/android/gms/tagmanager/zzdb;->zzaSy:Ljava/lang/String;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    sget-object v3, Lcom/google/android/gms/tagmanager/zzdb;->NAME:Ljava/lang/String;

    aput-object v3, v1, v2

    invoke-direct {p0, v0, v1}, Lcom/google/android/gms/tagmanager/zzak;-><init>(Ljava/lang/String;[Ljava/lang/String;)V

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/zzdb;->zzaSE:Ljava/util/Set;

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/zzdb;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/google/android/gms/tagmanager/zzdb;->zzaOT:Lcom/google/android/gms/tagmanager/DataLayer;

    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "Google GTM SDK Timer"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;I)V

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/zzdb;->zzaSD:Landroid/os/HandlerThread;

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzdb;->zzaSD:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    new-instance v0, Landroid/os/Handler;

    iget-object v1, p0, Lcom/google/android/gms/tagmanager/zzdb;->zzaSD:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/zzdb;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/tagmanager/zzdb;)Ljava/util/Set;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzdb;->zzaSE:Ljava/util/Set;

    return-object v0
.end method

.method static synthetic zzb(Lcom/google/android/gms/tagmanager/zzdb;)Lcom/google/android/gms/tagmanager/DataLayer;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzdb;->zzaOT:Lcom/google/android/gms/tagmanager/DataLayer;

    return-object v0
.end method

.method static synthetic zzc(Lcom/google/android/gms/tagmanager/zzdb;)Landroid/os/Handler;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzdb;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic zzd(Lcom/google/android/gms/tagmanager/zzdb;)Z
    .registers 2

    iget-boolean v0, p0, Lcom/google/android/gms/tagmanager/zzdb;->zzaSC:Z

    return v0
.end method

.method static synthetic zze(Lcom/google/android/gms/tagmanager/zzdb;)Z
    .registers 2

    iget-boolean v0, p0, Lcom/google/android/gms/tagmanager/zzdb;->zzaSB:Z

    return v0
.end method

.method static synthetic zzf(Lcom/google/android/gms/tagmanager/zzdb;)Landroid/content/Context;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzdb;->mContext:Landroid/content/Context;

    return-object v0
.end method


# virtual methods
.method public zzG(Ljava/util/Map;)Lcom/google/android/gms/internal/zzag$zza;
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/zzag$zza;",
            ">;)",
            "Lcom/google/android/gms/internal/zzag$zza;"
        }
    .end annotation

    const-wide/16 v8, 0x0

    sget-object v0, Lcom/google/android/gms/tagmanager/zzdb;->NAME:Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzag$zza;

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzdf;->zzg(Lcom/google/android/gms/internal/zzag$zza;)Ljava/lang/String;

    move-result-object v2

    sget-object v0, Lcom/google/android/gms/tagmanager/zzdb;->zzaSA:Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzag$zza;

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzdf;->zzg(Lcom/google/android/gms/internal/zzag$zza;)Ljava/lang/String;

    move-result-object v3

    sget-object v0, Lcom/google/android/gms/tagmanager/zzdb;->zzaSy:Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzag$zza;

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzdf;->zzg(Lcom/google/android/gms/internal/zzag$zza;)Ljava/lang/String;

    move-result-object v1

    sget-object v0, Lcom/google/android/gms/tagmanager/zzdb;->zzaSz:Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzag$zza;

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzdf;->zzg(Lcom/google/android/gms/internal/zzag$zza;)Ljava/lang/String;

    move-result-object v0

    :try_start_32
    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_35
    .catch Ljava/lang/NumberFormatException; {:try_start_32 .. :try_end_35} :catch_73

    move-result-wide v4

    :goto_36
    :try_start_36
    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_39
    .catch Ljava/lang/NumberFormatException; {:try_start_36 .. :try_end_39} :catch_76

    move-result-wide v6

    :goto_3a
    cmp-long v0, v4, v8

    if-lez v0, :cond_6e

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_6e

    if-eqz v3, :cond_4c

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_4e

    :cond_4c
    const-string v3, "0"

    :cond_4e
    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzdb;->zzaSE:Ljava/util/Set;

    invoke-interface {v0, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6e

    const-string v0, "0"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_63

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzdb;->zzaSE:Ljava/util/Set;

    invoke-interface {v0, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    :cond_63
    iget-object v8, p0, Lcom/google/android/gms/tagmanager/zzdb;->mHandler:Landroid/os/Handler;

    new-instance v0, Lcom/google/android/gms/tagmanager/zzdb$zza;

    move-object v1, p0

    invoke-direct/range {v0 .. v7}, Lcom/google/android/gms/tagmanager/zzdb$zza;-><init>(Lcom/google/android/gms/tagmanager/zzdb;Ljava/lang/String;Ljava/lang/String;JJ)V

    invoke-virtual {v8, v0, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_6e
    invoke-static {}, Lcom/google/android/gms/tagmanager/zzdf;->zzBg()Lcom/google/android/gms/internal/zzag$zza;

    move-result-object v0

    return-object v0

    :catch_73
    move-exception v1

    move-wide v4, v8

    goto :goto_36

    :catch_76
    move-exception v0

    move-wide v6, v8

    goto :goto_3a
.end method

.method public zzzx()Z
    .registers 2

    const/4 v0, 0x0

    return v0
.end method
