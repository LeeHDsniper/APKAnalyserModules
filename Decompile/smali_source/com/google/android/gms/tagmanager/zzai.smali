.class Lcom/google/android/gms/tagmanager/zzai;
.super Lcom/google/android/gms/tagmanager/zzak;


# static fields
.field private static final ID:Ljava/lang/String;


# instance fields
.field private final zzaOU:Lcom/google/android/gms/tagmanager/zzcp;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-object v0, Lcom/google/android/gms/internal/zzad;->zzbv:Lcom/google/android/gms/internal/zzad;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzad;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/tagmanager/zzai;->ID:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/google/android/gms/tagmanager/zzcp;)V
    .registers 4

    sget-object v0, Lcom/google/android/gms/tagmanager/zzai;->ID:Ljava/lang/String;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lcom/google/android/gms/tagmanager/zzak;-><init>(Ljava/lang/String;[Ljava/lang/String;)V

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/zzai;->zzaOU:Lcom/google/android/gms/tagmanager/zzcp;

    return-void
.end method


# virtual methods
.method public zzG(Ljava/util/Map;)Lcom/google/android/gms/internal/zzag$zza;
    .registers 3
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

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzai;->zzaOU:Lcom/google/android/gms/tagmanager/zzcp;

    invoke-virtual {v0}, Lcom/google/android/gms/tagmanager/zzcp;->zzAF()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_d

    invoke-static {}, Lcom/google/android/gms/tagmanager/zzdf;->zzBg()Lcom/google/android/gms/internal/zzag$zza;

    move-result-object v0

    :goto_c
    return-object v0

    :cond_d
    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzdf;->zzK(Ljava/lang/Object;)Lcom/google/android/gms/internal/zzag$zza;

    move-result-object v0

    goto :goto_c
.end method

.method public zzzx()Z
    .registers 2

    const/4 v0, 0x0

    return v0
.end method
