.class Lcom/google/android/gms/tagmanager/zzx;
.super Lcom/google/android/gms/tagmanager/zzdd;


# static fields
.field private static final ID:Ljava/lang/String;

.field private static final VALUE:Ljava/lang/String;

.field private static final zzaPT:Ljava/lang/String;


# instance fields
.field private final zzaOT:Lcom/google/android/gms/tagmanager/DataLayer;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-object v0, Lcom/google/android/gms/internal/zzad;->zzbS:Lcom/google/android/gms/internal/zzad;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzad;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/tagmanager/zzx;->ID:Ljava/lang/String;

    sget-object v0, Lcom/google/android/gms/internal/zzae;->zzhF:Lcom/google/android/gms/internal/zzae;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzae;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/tagmanager/zzx;->VALUE:Ljava/lang/String;

    sget-object v0, Lcom/google/android/gms/internal/zzae;->zzdW:Lcom/google/android/gms/internal/zzae;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzae;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/tagmanager/zzx;->zzaPT:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/google/android/gms/tagmanager/DataLayer;)V
    .registers 6

    sget-object v0, Lcom/google/android/gms/tagmanager/zzx;->ID:Ljava/lang/String;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    sget-object v3, Lcom/google/android/gms/tagmanager/zzx;->VALUE:Ljava/lang/String;

    aput-object v3, v1, v2

    invoke-direct {p0, v0, v1}, Lcom/google/android/gms/tagmanager/zzdd;-><init>(Ljava/lang/String;[Ljava/lang/String;)V

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/zzx;->zzaOT:Lcom/google/android/gms/tagmanager/DataLayer;

    return-void
.end method

.method private zza(Lcom/google/android/gms/internal/zzag$zza;)V
    .registers 4

    if-eqz p1, :cond_8

    invoke-static {}, Lcom/google/android/gms/tagmanager/zzdf;->zzBa()Ljava/lang/Object;

    move-result-object v0

    if-ne p1, v0, :cond_9

    :cond_8
    :goto_8
    return-void

    :cond_9
    invoke-static {p1}, Lcom/google/android/gms/tagmanager/zzdf;->zzg(Lcom/google/android/gms/internal/zzag$zza;)Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lcom/google/android/gms/tagmanager/zzdf;->zzBf()Ljava/lang/String;

    move-result-object v1

    if-eq v0, v1, :cond_8

    iget-object v1, p0, Lcom/google/android/gms/tagmanager/zzx;->zzaOT:Lcom/google/android/gms/tagmanager/DataLayer;

    invoke-virtual {v1, v0}, Lcom/google/android/gms/tagmanager/DataLayer;->zzeC(Ljava/lang/String;)V

    goto :goto_8
.end method

.method private zzb(Lcom/google/android/gms/internal/zzag$zza;)V
    .registers 5

    if-eqz p1, :cond_8

    invoke-static {}, Lcom/google/android/gms/tagmanager/zzdf;->zzBa()Ljava/lang/Object;

    move-result-object v0

    if-ne p1, v0, :cond_9

    :cond_8
    return-void

    :cond_9
    invoke-static {p1}, Lcom/google/android/gms/tagmanager/zzdf;->zzl(Lcom/google/android/gms/internal/zzag$zza;)Ljava/lang/Object;

    move-result-object v0

    instance-of v1, v0, Ljava/util/List;

    if-eqz v1, :cond_8

    check-cast v0, Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_17
    :goto_17
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    instance-of v2, v0, Ljava/util/Map;

    if-eqz v2, :cond_17

    check-cast v0, Ljava/util/Map;

    iget-object v2, p0, Lcom/google/android/gms/tagmanager/zzx;->zzaOT:Lcom/google/android/gms/tagmanager/DataLayer;

    invoke-virtual {v2, v0}, Lcom/google/android/gms/tagmanager/DataLayer;->push(Ljava/util/Map;)V

    goto :goto_17
.end method


# virtual methods
.method public zzI(Ljava/util/Map;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/zzag$zza;",
            ">;)V"
        }
    .end annotation

    sget-object v0, Lcom/google/android/gms/tagmanager/zzx;->VALUE:Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzag$zza;

    invoke-direct {p0, v0}, Lcom/google/android/gms/tagmanager/zzx;->zzb(Lcom/google/android/gms/internal/zzag$zza;)V

    sget-object v0, Lcom/google/android/gms/tagmanager/zzx;->zzaPT:Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzag$zza;

    invoke-direct {p0, v0}, Lcom/google/android/gms/tagmanager/zzx;->zza(Lcom/google/android/gms/internal/zzag$zza;)V

    return-void
.end method
