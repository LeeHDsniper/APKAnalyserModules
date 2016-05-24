.class Lcom/google/android/gms/tagmanager/zzcc;
.super Lcom/google/android/gms/tagmanager/zzak;


# static fields
.field private static final ID:Ljava/lang/String;

.field private static final zzaRg:Ljava/lang/String;

.field private static final zzaRh:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-object v0, Lcom/google/android/gms/internal/zzad;->zzbB:Lcom/google/android/gms/internal/zzad;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzad;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/tagmanager/zzcc;->ID:Ljava/lang/String;

    sget-object v0, Lcom/google/android/gms/internal/zzae;->zzfP:Lcom/google/android/gms/internal/zzae;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzae;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/tagmanager/zzcc;->zzaRg:Ljava/lang/String;

    sget-object v0, Lcom/google/android/gms/internal/zzae;->zzfN:Lcom/google/android/gms/internal/zzae;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzae;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/tagmanager/zzcc;->zzaRh:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    sget-object v0, Lcom/google/android/gms/tagmanager/zzcc;->ID:Ljava/lang/String;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lcom/google/android/gms/tagmanager/zzak;-><init>(Ljava/lang/String;[Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public zzG(Ljava/util/Map;)Lcom/google/android/gms/internal/zzag$zza;
    .registers 11
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

    const-wide/16 v6, 0x0

    const-wide v2, 0x41dfffffffc00000L

    sget-object v0, Lcom/google/android/gms/tagmanager/zzcc;->zzaRg:Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzag$zza;

    sget-object v1, Lcom/google/android/gms/tagmanager/zzcc;->zzaRh:Ljava/lang/String;

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/zzag$zza;

    if-eqz v0, :cond_5c

    invoke-static {}, Lcom/google/android/gms/tagmanager/zzdf;->zzBg()Lcom/google/android/gms/internal/zzag$zza;

    move-result-object v4

    if-eq v0, v4, :cond_5c

    if-eqz v1, :cond_5c

    invoke-static {}, Lcom/google/android/gms/tagmanager/zzdf;->zzBg()Lcom/google/android/gms/internal/zzag$zza;

    move-result-object v4

    if-eq v1, v4, :cond_5c

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzdf;->zzh(Lcom/google/android/gms/internal/zzag$zza;)Lcom/google/android/gms/tagmanager/zzde;

    move-result-object v0

    invoke-static {v1}, Lcom/google/android/gms/tagmanager/zzdf;->zzh(Lcom/google/android/gms/internal/zzag$zza;)Lcom/google/android/gms/tagmanager/zzde;

    move-result-object v1

    invoke-static {}, Lcom/google/android/gms/tagmanager/zzdf;->zzBe()Lcom/google/android/gms/tagmanager/zzde;

    move-result-object v4

    if-eq v0, v4, :cond_5c

    invoke-static {}, Lcom/google/android/gms/tagmanager/zzdf;->zzBe()Lcom/google/android/gms/tagmanager/zzde;

    move-result-object v4

    if-eq v1, v4, :cond_5c

    invoke-virtual {v0}, Lcom/google/android/gms/tagmanager/zzde;->doubleValue()D

    move-result-wide v4

    invoke-virtual {v1}, Lcom/google/android/gms/tagmanager/zzde;->doubleValue()D

    move-result-wide v0

    cmpg-double v8, v4, v0

    if-gtz v8, :cond_5c

    move-wide v2, v4

    :goto_48
    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v4

    sub-double/2addr v0, v2

    mul-double/2addr v0, v4

    add-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->round(D)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzdf;->zzK(Ljava/lang/Object;)Lcom/google/android/gms/internal/zzag$zza;

    move-result-object v0

    return-object v0

    :cond_5c
    move-wide v0, v2

    move-wide v2, v6

    goto :goto_48
.end method

.method public zzzx()Z
    .registers 2

    const/4 v0, 0x0

    return v0
.end method
